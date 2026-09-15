pipeline {
    agent any

    environment {
        // 宿主机目录（容器内已挂载，路径保持一致）
        DEPLOY_ROOT = '/opt/coursera-jars'
        DATA_DIR = '/data/coursera'
        
        // 容器内实际路径（注意：Maven 挂载后路径为 /usr/local/maven）
        JAVA_HOME = '/usr/local/java/jdk1.8.0_202'
        MAVEN_HOME = '/usr/local/maven'
        PATH = "${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${env.PATH}"
        
        // 基础镜像
        BASE_IMAGE = 'openjdk:8-jre-alpine'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "拉取代码..."
                checkout scm
            }
        }

        stage('Build Parent & Modules') {
            steps {
                script {
                    // 先构建除 service_exam 外的所有模块
                    sh """
                        mvn clean package -DskipTests -U
                    """
                }
            }
        }

        stage('Build service_exam') {
            steps {
                script {
                    // 单独构建 service_exam 单体应用
                    dir('service/service_exam') {
                        sh """
                            mvn clean package -DskipTests
                        """
                    }
                }
            }
        }

        stage('Deploy Services') {
            steps {
                script {
                    // 确保部署目录存在（/data/coursera 已挂载）
                    sh "mkdir -p ${DEPLOY_ROOT} ${DATA_DIR}"

                    def services = [
                        [name: 'canal',          jar: 'canal/target/canal-0.0.1-SNAPSHOT.jar',                     port: 10000, needDataDir: false],
                        [name: 'service_auth',   jar: 'service/service_auth/target/service_auth-0.0.1-SNAPSHOT.jar',      port: 8000,  needDataDir: false],
                        [name: 'service_cms',    jar: 'service/service_cms/target/service_cms-0.0.1-SNAPSHOT.jar',        port: 8100,  needDataDir: false],
                        [name: 'service_edu',    jar: 'service/service_edu/target/service_edu-0.0.1-SNAPSHOT.jar',        port: 8010,  needDataDir: false],
                        [name: 'service_message',jar: 'service/service_message/target/service_message-0.0.1-SNAPSHOT.jar', port: 9000,  needDataDir: false],
                        [name: 'service_order',  jar: 'service/service_order/target/service_order-0.0.1-SNAPSHOT.jar',      port: 8110,  needDataDir: false],
                        [name: 'service_search', jar: 'service/service_search/target/service_search-0.0.1-SNAPSHOT.jar',    port: 8180,  needDataDir: false],
                        [name: 'service_sms',    jar: 'service/service_sms/target/service_sms-0.0.1-SNAPSHOT.jar',          port: 8130,  needDataDir: false],
                        [name: 'service_statistics', jar: 'service/service_statistics/target/service_statistics-0.0.1-SNAPSHOT.jar', port: 8140, needDataDir: false],
                        [name: 'service_ucenter',jar: 'service/service_ucenter/target/service_ucenter-0.0.1-SNAPSHOT.jar',   port: 8160,  needDataDir: false],
                        [name: 'gateway',        jar: 'gateway/target/gateway-0.0.1-SNAPSHOT.jar',                       port: 8500,  needDataDir: false],
                        [name: 'service_exam',   jar: 'service/service_exam/target/service_exam-0.0.1.jar',               port: 8170,  needDataDir: true],
                        [name: 'service_oss',    jar: 'service/service_oss/target/service_oss-0.0.1-SNAPSHOT.jar',        port: 8120,  needDataDir: true],
                        [name: 'service_vod',    jar: 'service/service_vod/target/service_vod-0.0.1-SNAPSHOT.jar',        port: 8150,  needDataDir: true]
                    ]

                    for (svc in services) {
                        def name = svc.name
                        def jarPath = svc.jar
                        def port = svc.port
                        def needData = svc.needDataDir
                        def deployDir = "${DEPLOY_ROOT}/${name}"
                        def jarFileName = jarPath.split('/')[-1]

                        echo "开始部署 ${name} (端口: ${port})..."

                        // 1. 创建服务专属目录并复制 jar
                        sh "mkdir -p ${deployDir}"
                        sh "cp ${jarPath} ${deployDir}/"

                        // 2. 停止并移除旧容器
                        sh """
                            docker stop ${name} || true
                            docker rm ${name} || true
                        """

                        // 3. 构建 docker run 命令
                        def dockerRun = "docker run -d --name ${name} --network host --restart always"
                        dockerRun += " -v ${deployDir}:/app"
                        
                        // 如果需要读写 /data/coursera，则挂载并设置工作目录
                        if (needData) {
                            dockerRun += " -v ${DATA_DIR}:${DATA_DIR}"
                            dockerRun += " -w ${DATA_DIR}"
                        } else {
                            dockerRun += " -w /app"
                        }

                        dockerRun += " ${BASE_IMAGE}"
                        dockerRun += " java -jar /app/${jarFileName} --server.port=${port}"

                        // 4. 启动容器
                        sh dockerRun
                        echo "${name} 部署完成！"
                    }
                }
            }
        }
    }

    post {
        always {
            echo "部署流程结束，请在宿主机执行 'docker ps' 查看运行状态。"
        }
    }
}