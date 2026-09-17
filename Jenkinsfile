pipeline {
    agent any

    options {
        timeout(time: 60, unit: 'MINUTES')
    }

    environment {
        // 宿主机目录（容器内已挂载，路径保持一致）
        DEPLOY_ROOT = '/opt/coursera-jars'
        DATA_DIR    = '/data/coursera'

        // 容器内实际路径
        JAVA_HOME  = '/usr/local/java/jdk1.8.0_202'
        MAVEN_HOME = '/usr/local/maven'
        PATH       = "${JAVA_HOME}/bin:${MAVEN_HOME}/bin:${env.PATH}"

        // 基础镜像
        BASE_IMAGE = 'openjdk:8-jre-alpine'

        // 默认 JVM 参数（服务可单独覆盖）
        DEFAULT_JVM_OPTS = '-Xms128m -Xmx256m -XX:MaxMetaspaceSize=128m -XX:MaxDirectMemorySize=64m -XX:+UseParallelGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/app/heapdump.hprof -Duser.timezone=Asia/Shanghai -Dfile.encoding=UTF-8'

        // 默认容器内存限制：memory + swap 总量 = 512m 内存 + 256m swap
        DEFAULT_MEM_LIMIT = '512m'
        DEFAULT_MEM_SWAP  = '768m'
    }

    stages {
        stage('Checkout') {
            steps {
                echo "开始强制浅克隆拉取代码（SSH协议）..."
                checkout([
                    $class: 'GitSCM',
                    branches: [[name: '*/master']],
                    userRemoteConfigs: [[
                        url: 'git@github.com:JCXYOZH/coursera-serve.git',
                        credentialsId: 'github-ssh-key'
                    ]],
                    extensions: [
                        [$class: 'CloneOption', depth: 1, shallow: true, noTags: true],
                        [$class: 'CleanBeforeCheckout']
                    ]
                ])
            }
        }

        stage('Build Parent & Modules') {
            steps {
                script {
                    sh """
                        mvn clean package -DskipTests -U
                    """
                }
            }
        }

        stage('Build service_exam') {
            steps {
                script {
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
                    // 确保部署目录存在
                    sh "mkdir -p ${DEPLOY_ROOT} ${DATA_DIR}"

                    def services = [
                        [name: 'canal',              jar: 'canal/target/canal-0.0.1-SNAPSHOT.jar',                                 port: 10000, needDataDir: false],
                        [name: 'service_auth',       jar: 'service/service_auth/target/service_auth-0.0.1-SNAPSHOT.jar',            port: 8000,  needDataDir: false],
                        [name: 'service_cms',        jar: 'service/service_cms/target/service_cms-0.0.1-SNAPSHOT.jar',              port: 8100,  needDataDir: false],
                        [name: 'service_edu',        jar: 'service/service_edu/target/service_edu-0.0.1-SNAPSHOT.jar',              port: 8010,  needDataDir: false],
                        [name: 'service_message',    jar: 'service/service_message/target/service_message-0.0.1-SNAPSHOT.jar',      port: 9000,  needDataDir: false],
                        [name: 'service_order',      jar: 'service/service_order/target/service_order-0.0.1-SNAPSHOT.jar',          port: 8110,  needDataDir: false],
                        [name: 'service_search',     jar: 'service/service_search/target/service_search-0.0.1-SNAPSHOT.jar',        port: 8180,  needDataDir: false,
                            jvmOpts: '-Xms192m -Xmx384m -XX:MaxMetaspaceSize=160m -XX:MaxDirectMemorySize=96m -XX:+UseParallelGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/app/heapdump.hprof -Duser.timezone=Asia/Shanghai -Dfile.encoding=UTF-8',
                            mem: '640m', memSwap: '960m'],
                        [name: 'service_sms',        jar: 'service/service_sms/target/service_sms-0.0.1-SNAPSHOT.jar',              port: 8130,  needDataDir: false],
                        [name: 'service_statistics', jar: 'service/service_statistics/target/service_statistics-0.0.1-SNAPSHOT.jar',port: 8140,  needDataDir: false],
                        [name: 'service_ucenter',    jar: 'service/service_ucenter/target/service_ucenter-0.0.1-SNAPSHOT.jar',      port: 8160,  needDataDir: false],
                        [name: 'gateway',            jar: 'gateway/target/gateway-0.0.1-SNAPSHOT.jar',                              port: 8500,  needDataDir: false],
                        [name: 'service_exam',       jar: 'service/service_exam/target/service_exam-0.0.1.jar',                     port: 8170,  needDataDir: true],
                        [name: 'service_oss',        jar: 'service/service_oss/target/service_oss-0.0.1-SNAPSHOT.jar',              port: 8120,  needDataDir: true],
                        [name: 'service_vod',        jar: 'service/service_vod/target/service_vod-0.0.1-SNAPSHOT.jar',              port: 8150,  needDataDir: true,
                            jvmOpts: '-Xms192m -Xmx384m -XX:MaxMetaspaceSize=160m -XX:MaxDirectMemorySize=96m -XX:+UseParallelGC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/app/heapdump.hprof -Duser.timezone=Asia/Shanghai -Dfile.encoding=UTF-8',
                            mem: '640m', memSwap: '960m']
                    ]

                    for (svc in services) {
                        def name        = svc.name
                        def jarPath     = svc.jar
                        def port        = svc.port
                        def needData    = svc.needDataDir
                        def deployDir   = "${DEPLOY_ROOT}/${name}"
                        def jarFileName = jarPath.split('/')[-1]

                        def jvmOpts  = svc.jvmOpts  ?: env.DEFAULT_JVM_OPTS
                        def memLimit = svc.mem      ?: env.DEFAULT_MEM_LIMIT
                        def memSwap  = svc.memSwap  ?: env.DEFAULT_MEM_SWAP

                        echo "开始部署 ${name} (端口: ${port}, 容器内存: ${memLimit}, swap: ${memSwap})..."

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
                        dockerRun += " --memory=${memLimit} --memory-swap=${memSwap}"
                        dockerRun += " -v ${deployDir}:/app"

                        if (needData) {
                            dockerRun += " -v ${DATA_DIR}:${DATA_DIR}"
                            dockerRun += " -w ${DATA_DIR}"
                        } else {
                            dockerRun += " -w /app"
                        }

                        dockerRun += " ${BASE_IMAGE}"
                        // 关键：用 sh -c "exec java ..." 让 java 成为 PID 1，能优雅退出
                        dockerRun += " sh -c \"exec java ${jvmOpts} -jar /app/${jarFileName} --server.port=${port}\""

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
            echo "部署流程结束。执行以下命令查看："
            echo "  docker ps --format 'table {{.Names}}\\t{{.Status}}\\t{{.Size}}'"
            echo "  docker stats --no-stream"
            echo "  free -h"
        }
    }
}