/*
 Navicat Premium Dump SQL

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : 47.120.68.25:3306
 Source Schema         : coursera

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 14/09/2026 21:49:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for app_version
-- ----------------------------
DROP TABLE IF EXISTS `app_version`;
CREATE TABLE `app_version`  (
  `id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '主键',
  `version_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '版本名称，如 1.0.0',
  `version_code` int NULL DEFAULT NULL COMMENT '版本号，可用于比较大小',
  `download_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '下载地址',
  `update_content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '更新内容',
  `force_update` tinyint(1) NULL DEFAULT 0 COMMENT '是否强制更新（1是，0否）',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `is_deleted` tinyint(1) NULL DEFAULT 0 COMMENT '逻辑删除',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = 'APP版本管理表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of app_version
-- ----------------------------
INSERT INTO `app_version` VALUES ('1', '1.0.0', 100, 'http://47.120.68.25:8500/apk/coursera_1.0.0.apk', '修复测试版已知问题，提升系统稳定性', 1, '2026-02-28 23:56:56', '2026-02-28 23:56:56', 0);

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission`  (
  `id` bigint NOT NULL DEFAULT 0 COMMENT '权限id',
  `pid` bigint NOT NULL DEFAULT 0 COMMENT '所属父权限id',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '名称',
  `type` tinyint NOT NULL DEFAULT 0 COMMENT '类型(0:菜单,1:按钮)',
  `permission_value` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '权限值',
  `path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '访问路径',
  `component` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '组件路径',
  `redirect` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '重定向地址',
  `icon` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '图标',
  `hidden` tinyint(1) NULL DEFAULT 0 COMMENT '是否隐藏路由1（true）隐藏，0（false）不隐藏',
  `sort` int NULL DEFAULT 0 COMMENT '菜单排序',
  `is_enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用（1：启用，0：禁止）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_pid`(`pid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES (1, 0, '全部数据', 0, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, '2019-11-15 17:13:06', '2019-11-15 17:13:06');
INSERT INTO `auth_permission` VALUES (1095350299365969922, 1, '科目管理', 1, NULL, '/subject', 'Layout', '/subject/list', 'el-icon-notebook-1', 0, 3, 1, '2019-11-15 22:38:15', '2022-07-30 10:06:32');
INSERT INTO `auth_permission` VALUES (1095350831744782337, 1, '课程管理', 1, NULL, '/course', 'Layout', '/course/list', 'el-icon-s-platform', 0, 4, 1, '2019-11-15 22:40:21', '2022-07-30 10:06:21');
INSERT INTO `auth_permission` VALUES (1195349439240048642, 1, '讲师管理', 1, NULL, '/teacher', 'Layout', '/teacher/list', 'el-icon-s-custom', 0, 2, 1, '2022-07-27 09:55:59', '2022-07-30 10:06:06');
INSERT INTO `auth_permission` VALUES (1195349699995734017, 1195349439240048642, '讲师列表', 1, NULL, 'list', '/edu/teacher/list', NULL, 'el-icon-tickets', 0, 0, 1, '2022-07-27 09:55:59', '2022-07-27 09:55:59');
INSERT INTO `auth_permission` VALUES (1195349810561781761, 1195349439240048642, '添加讲师', 1, NULL, 'save', '/edu/teacher/save', NULL, 'el-icon-plus', 0, 1, 1, '2022-07-27 10:07:42', '2022-07-28 13:03:41');
INSERT INTO `auth_permission` VALUES (1195350117270261762, 1195349699995734017, '讲师修改', 2, 'teacher.update', 'edit/:id', '/edu/teacher/save', NULL, NULL, 1, 0, 1, '2022-07-27 10:10:29', '2022-07-27 11:10:51');
INSERT INTO `auth_permission` VALUES (1195350188359520258, 1195349699995734017, '讲师删除', 2, 'teacher.delete', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 10:08:04', '2022-07-27 11:10:56');
INSERT INTO `auth_permission` VALUES (1195350500512206850, 1095350299365969922, '科目管理', 1, NULL, 'list', '/edu/subject/list', NULL, 'el-icon-notebook-1', 0, 0, 1, '2022-07-27 10:13:51', '2022-07-27 10:13:51');
INSERT INTO `auth_permission` VALUES (1195350687590748161, 1195350500512206850, '添加顶级科目', 2, 'subject.addTopSubject', '', '', NULL, NULL, 1, 1, 1, '2019-11-15 22:39:47', '2022-07-27 10:21:51');
INSERT INTO `auth_permission` VALUES (1195350919074385921, 1095350831744782337, '课程列表', 1, NULL, 'list', '/edu/course/list', NULL, 'el-icon-tickets', 0, 0, 1, '2019-11-15 22:40:42', '2022-07-27 10:20:51');
INSERT INTO `auth_permission` VALUES (1195351020463296513, 1095350831744782337, '添加课程', 1, NULL, 'courseSave', '/edu/course/info', NULL, 'el-icon-info', 0, 1, 1, '2019-11-15 22:41:06', '2022-07-27 10:20:34');
INSERT INTO `auth_permission` VALUES (1195351159672246274, 1195350919074385921, '课程发布', 2, 'course.publish', 'publish/:id', '/edu/course/publish', NULL, NULL, 1, 3, 1, '2019-11-15 22:41:40', '2022-07-27 10:25:58');
INSERT INTO `auth_permission` VALUES (1195351326706208770, 1195350919074385921, '课程信息编辑', 2, 'course.updateBasic', 'info/:id', '/edu/course/info', NULL, NULL, 1, 1, 1, '2019-11-15 22:42:19', '2022-07-27 10:25:50');
INSERT INTO `auth_permission` VALUES (1195351566221938690, 1195350919074385921, '课程大纲编辑', 2, 'chapter.updateChapter', 'chapter/:id', '/edu/course/chapter', NULL, NULL, 1, 2, 1, '2019-11-15 22:43:17', '2022-07-27 10:25:54');
INSERT INTO `auth_permission` VALUES (1195352547621965825, 1, 'banner管理', 1, NULL, '/banner', 'Layout', '/banner/list', 'el-icon-picture', 0, 8, 1, '2019-11-15 22:47:11', '2022-07-30 10:06:11');
INSERT INTO `auth_permission` VALUES (1195354076890370050, 1, '订单管理', 1, NULL, '/order', 'Layout', '/order/have', 'el-icon-phone', 0, 9, 1, '2019-11-15 22:53:15', '2022-07-30 10:06:08');
INSERT INTO `auth_permission` VALUES (1195354153482555393, 1195354076890370050, '已支付', 1, NULL, 'have', '/order/have', NULL, 'el-icon-s-goods', 0, 0, 1, '2019-11-15 22:53:33', '2022-07-27 10:40:25');
INSERT INTO `auth_permission` VALUES (1195354315093282817, 1195354153482555393, '已支付查询', 2, 'order.haveQuery', '', '', NULL, NULL, 1, 0, 1, '2019-11-15 22:54:12', '2022-07-27 10:41:48');
INSERT INTO `auth_permission` VALUES (1295351862889254913, 1, '数据统计', 1, NULL, '/statistics', 'Layout', '/statistics/chart', 'el-icon-pie-chart', 0, 7, 1, '2019-11-15 22:44:27', '2022-07-30 10:06:13');
INSERT INTO `auth_permission` VALUES (1552105569295273985, 1, '权限管理', 1, NULL, '/auth', 'Layout', '/auth/user/list', 'el-icon-view', 0, 1, 1, '2022-07-27 09:36:19', '2022-07-30 10:06:02');
INSERT INTO `auth_permission` VALUES (1552106542772260866, 1552105569295273985, '用户管理', 1, NULL, 'user/list', '/auth/user/list', NULL, 'el-icon-coordinate', 0, 0, 1, '2022-07-27 09:40:11', '2022-07-28 10:58:08');
INSERT INTO `auth_permission` VALUES (1552107666724098050, 1552105569295273985, '角色管理', 1, NULL, 'role/list', '/auth/role/list', NULL, 'el-icon-s-check', 0, 1, 1, '2022-07-27 09:44:39', '2022-07-27 10:53:59');
INSERT INTO `auth_permission` VALUES (1552107881950613506, 1552105569295273985, '菜单管理', 1, NULL, 'menu/list', '/auth/menu/list', NULL, 'el-icon-menu', 0, 2, 1, '2022-07-27 09:45:30', '2022-07-28 10:58:12');
INSERT INTO `auth_permission` VALUES (1552115228722958337, 1195350500512206850, '添加子科目', 2, 'subject.addChildSubject', '', '', NULL, NULL, 1, 2, 1, '2022-07-27 10:14:42', '2022-07-27 10:21:54');
INSERT INTO `auth_permission` VALUES (1552115810363871234, 1195350500512206850, '修改科目', 2, 'subject.update', '', '', NULL, NULL, 1, 3, 1, '2022-07-27 10:17:01', '2022-07-27 10:22:00');
INSERT INTO `auth_permission` VALUES (1552116130569621505, 1195350500512206850, '删除科目', 2, 'subject.delete', '', '', NULL, NULL, 1, 4, 1, '2022-07-27 10:18:17', '2022-07-27 10:22:05');
INSERT INTO `auth_permission` VALUES (1552117011172134914, 1195350500512206850, '科目查询', 2, 'subject.query', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 10:21:47', '2022-07-27 10:21:47');
INSERT INTO `auth_permission` VALUES (1552117569593380865, 1195350919074385921, '课程查询', 2, 'course.query', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 10:24:00', '2022-07-27 10:24:00');
INSERT INTO `auth_permission` VALUES (1552118302266986497, 1, '用户管理', 1, NULL, '/member', 'Layout', '/member/list', 'el-icon-user', 0, 5, 1, '2022-07-27 10:26:55', '2022-07-30 10:06:18');
INSERT INTO `auth_permission` VALUES (1552118455799484417, 1552118302266986497, '用户列表', 1, NULL, 'list', '/ucenter/member/list', '', 'el-icon-user', 0, 0, 1, '2022-07-27 10:27:31', '2022-07-27 10:27:31');
INSERT INTO `auth_permission` VALUES (1552118565908353025, 1552118455799484417, '用户查询', 2, 'member.query', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 10:27:58', '2022-07-27 10:27:58');
INSERT INTO `auth_permission` VALUES (1552118698767126529, 1552118455799484417, '用户禁启用', 2, 'member.endisable', '', '', NULL, NULL, 1, 1, 1, '2022-07-27 10:28:29', '2022-07-27 10:39:01');
INSERT INTO `auth_permission` VALUES (1552119010651377665, 1, '评论管理', 1, NULL, '/comment', 'Layout', '/comment/list', 'el-icon-chat-dot-round', 0, 6, 1, '2022-07-27 10:29:44', '2022-07-30 10:06:16');
INSERT INTO `auth_permission` VALUES (1552119253216366593, 1552119010651377665, '评论列表', 1, NULL, 'list', '/edu/comment/list', '', 'el-icon-tickets', 0, 0, 1, '2022-07-27 10:30:42', '2022-07-27 10:30:42');
INSERT INTO `auth_permission` VALUES (1552119309122244609, 1552119253216366593, '评论查询', 2, 'comment.query', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 10:30:55', '2022-07-27 10:30:55');
INSERT INTO `auth_permission` VALUES (1552119375572602881, 1552119253216366593, '评论删除', 2, 'comment.delete', '', '', NULL, NULL, 1, 1, 1, '2022-07-27 10:31:11', '2022-07-27 10:31:11');
INSERT INTO `auth_permission` VALUES (1552119865739939842, 1295351862889254913, '数据统计', 1, NULL, 'chart', '/statistics/daily/chart', '', 'el-icon-pie-chart', 0, 0, 1, '2022-07-27 10:33:08', '2022-07-27 10:33:08');
INSERT INTO `auth_permission` VALUES (1552120362748186626, 1195352547621965825, 'banner列表', 1, NULL, 'list', '/cms/banner/list', '', 'el-icon-tickets', 0, 0, 1, '2022-07-27 10:35:06', '2022-07-27 10:35:06');
INSERT INTO `auth_permission` VALUES (1552120500229083138, 1195352547621965825, '添加banner', 1, NULL, 'save', '/cms/banner/save', '', 'el-icon-circle-plus-outline', 0, 1, 1, '2022-07-27 10:35:39', '2022-07-27 10:35:39');
INSERT INTO `auth_permission` VALUES (1552120580319318018, 1552120500229083138, '添加banner', 2, 'banner.add', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 10:35:58', '2022-07-27 10:35:58');
INSERT INTO `auth_permission` VALUES (1552120637546401793, 1552120362748186626, 'banner查询', 2, 'banner.query', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 10:36:12', '2022-07-27 10:36:12');
INSERT INTO `auth_permission` VALUES (1552120764914831362, 1552120362748186626, 'banner修改', 2, 'banner.edit', 'edit/:id', '/cms/banner/save', NULL, NULL, 1, 1, 1, '2022-07-27 10:36:42', '2022-07-27 10:36:42');
INSERT INTO `auth_permission` VALUES (1552120843109240833, 1552120362748186626, 'banner删除', 2, 'banner.delete', '', '', NULL, NULL, 1, 3, 1, '2022-07-27 10:37:01', '2022-07-27 10:38:34');
INSERT INTO `auth_permission` VALUES (1552121108243779585, 1552120362748186626, 'banner启禁用', 2, 'banner.endisable', '', '', NULL, NULL, 1, 2, 1, '2022-07-27 10:38:04', '2022-07-27 10:38:31');
INSERT INTO `auth_permission` VALUES (1552121830221910018, 1195354076890370050, '未支付', 1, NULL, 'not', '/order/not', '', 'el-icon-goods', 0, 1, 1, '2022-07-27 10:40:56', '2022-07-27 10:40:56');
INSERT INTO `auth_permission` VALUES (1552122003710906369, 1552121830221910018, '未支付查询', 2, 'order.notQuery', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 10:41:37', '2022-07-27 10:41:37');
INSERT INTO `auth_permission` VALUES (1552127189862887425, 1552107881950613506, '菜单添加', 2, 'menuPermission.add', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 11:02:14', '2022-07-27 11:02:14');
INSERT INTO `auth_permission` VALUES (1552127268241846274, 1552107881950613506, '菜单修改', 2, 'menuPermission.update', '', '', NULL, NULL, 1, 1, 1, '2022-07-27 11:02:33', '2022-07-27 11:02:38');
INSERT INTO `auth_permission` VALUES (1552127352056623105, 1552107881950613506, '菜单删除', 2, 'menu.delete', '', '', NULL, NULL, 1, 4, 1, '2022-07-27 11:02:53', '2022-07-27 11:03:31');
INSERT INTO `auth_permission` VALUES (1552127408507760641, 1552107881950613506, '按钮权限添加', 2, 'buttonPermission.add', '', '', NULL, NULL, 1, 2, 1, '2022-07-27 11:03:06', '2022-07-27 11:03:39');
INSERT INTO `auth_permission` VALUES (1552127491701780481, 1552107881950613506, '按钮权限修改', 2, 'buttonPermission.update', '', '', NULL, NULL, 1, 3, 1, '2022-07-27 11:03:26', '2022-07-27 11:03:26');
INSERT INTO `auth_permission` VALUES (1552127662758080514, 1552107666724098050, '角色查询', 2, 'role.query', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 11:04:07', '2022-07-27 11:04:07');
INSERT INTO `auth_permission` VALUES (1552128051196768258, 1552107666724098050, '角色修改', 2, 'role.update', 'role/edit/:id', '/auth/fole/form', NULL, NULL, 1, 2, 1, '2022-07-27 11:05:39', '2022-07-27 11:06:38');
INSERT INTO `auth_permission` VALUES (1552128263273361410, 1552107666724098050, '角色添加', 2, 'role.add', 'role/add', '/auth/role/form', NULL, NULL, 1, 1, 1, '2022-07-27 11:06:30', '2022-07-27 11:06:30');
INSERT INTO `auth_permission` VALUES (1552128424296886274, 1552107666724098050, '角色删除', 2, 'role.delete', '', '', NULL, NULL, 1, 3, 1, '2022-07-27 11:07:08', '2022-07-27 11:07:08');
INSERT INTO `auth_permission` VALUES (1552128623962533890, 1552106542772260866, '用户添加', 2, 'user.add', '', '', NULL, NULL, 1, 1, 1, '2022-07-27 11:07:56', '2022-07-27 21:17:11');
INSERT INTO `auth_permission` VALUES (1552128803453579265, 1552106542772260866, '用户修改', 2, 'user.update', '', '', NULL, NULL, 1, 2, 1, '2022-07-27 11:08:39', '2022-07-27 21:17:17');
INSERT INTO `auth_permission` VALUES (1552128908076298241, 1552106542772260866, '用户删除', 2, 'user.delete', '', '', NULL, NULL, 1, 3, 1, '2022-07-27 11:09:04', '2022-07-27 11:09:04');
INSERT INTO `auth_permission` VALUES (1552128995976327169, 1552106542772260866, '用户查询', 2, 'user.query', '', '', NULL, NULL, 1, 0, 1, '2022-07-27 11:09:24', '2022-07-27 11:09:24');
INSERT INTO `auth_permission` VALUES (1552129230840573954, 1552106542772260866, '角色分配', 2, 'user.assignRole', '', '', NULL, NULL, 1, 4, 1, '2022-07-27 11:10:20', '2022-07-27 21:17:21');
INSERT INTO `auth_permission` VALUES (1553200173847519234, 1, '仪表盘', 1, NULL, '/', 'Layout', '/dashboard', '', 0, 0, 1, '2022-07-30 10:05:53', '2022-07-30 10:07:15');
INSERT INTO `auth_permission` VALUES (1553200478379155457, 1553200173847519234, '仪表盘', 1, NULL, 'dashboard', '/dashboard/index', '', 'dashboard', 0, 0, 1, '2022-07-30 10:07:06', '2022-07-30 10:07:06');
INSERT INTO `auth_permission` VALUES (1553942062053785601, 1195350500512206850, '导出学科列表', 2, 'subject.export', '', '', NULL, NULL, 1, 5, 1, '2022-08-01 11:13:53', '2022-08-01 11:13:53');
INSERT INTO `auth_permission` VALUES (1553943312572940289, 1552106542772260866, '用户禁启用', 2, 'user.enableOrDisable', '', '', NULL, NULL, 1, 5, 1, '2022-08-01 11:18:51', '2022-08-01 11:18:51');
INSERT INTO `auth_permission` VALUES (1558748412663320577, 1, '学习记录', 1, NULL, '/study', 'Layout', '/study/record', 'el-icon-time', 0, 10, 1, '2022-08-14 17:32:36', '2022-08-14 17:32:36');
INSERT INTO `auth_permission` VALUES (1558748676275326977, 1558748412663320577, '学习记录', 1, NULL, 'record', '/study/list', '', 'el-icon-time', 0, 0, 1, '2022-08-14 17:33:39', '2022-08-14 17:33:39');

-- ----------------------------
-- Table structure for auth_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_role`;
CREATE TABLE `auth_role`  (
  `id` bigint NOT NULL DEFAULT 0 COMMENT '角色id',
  `role_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL DEFAULT '' COMMENT '角色名称',
  `remark` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL COMMENT '备注',
  `is_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用（1：启用，0：禁止）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_role
-- ----------------------------
INSERT INTO `auth_role` VALUES (1, '普通管理员', NULL, 1, '2022-07-27 10:29:17', '2022-07-30 10:00:17');
INSERT INTO `auth_role` VALUES (1193757683205607426, '课程管理员', '课程管理的角色', 1, '2022-07-27 10:29:17', '2022-07-30 10:00:22');
INSERT INTO `auth_role` VALUES (1196300996034977794, '师资运营管理员', NULL, 1, '2022-07-27 10:29:17', '2022-07-30 10:00:24');
INSERT INTO `auth_role` VALUES (1543234745457025026, 'CMS管理', NULL, 1, '2022-07-27 10:29:17', '2022-07-30 10:09:35');
INSERT INTO `auth_role` VALUES (1544508753213128705, '系统管理员', NULL, 1, '2022-07-27 10:29:17', '2022-07-30 10:28:27');

-- ----------------------------
-- Table structure for auth_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_role_permission`;
CREATE TABLE `auth_role_permission`  (
  `id` bigint NOT NULL DEFAULT 0 COMMENT '主键id',
  `role_id` bigint NOT NULL DEFAULT 0 COMMENT '角色id',
  `permission_id` bigint NOT NULL DEFAULT 0 COMMENT '权限id',
  `is_enable` tinyint(1) NULL DEFAULT 1 COMMENT '是否启用（1：启用，0：禁止）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_permission_id`(`permission_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '角色权限' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_role_permission
-- ----------------------------
INSERT INTO `auth_role_permission` VALUES (1552251960722206722, 1543234745457025026, 1, 1, '2022-07-27 19:18:02', '2022-07-30 10:09:35');
INSERT INTO `auth_role_permission` VALUES (1552251960734789634, 1543234745457025026, 1195352547621965825, 1, '2022-07-27 19:18:02', '2022-07-30 10:09:35');
INSERT INTO `auth_role_permission` VALUES (1552251960734789635, 1543234745457025026, 1552120362748186626, 1, '2022-07-27 19:18:02', '2022-07-30 10:09:35');
INSERT INTO `auth_role_permission` VALUES (1552251960734789636, 1543234745457025026, 1552120637546401793, 1, '2022-07-27 19:18:02', '2022-07-30 10:09:35');
INSERT INTO `auth_role_permission` VALUES (1552251960734789637, 1543234745457025026, 1552120764914831362, 1, '2022-07-27 19:18:02', '2022-07-30 10:09:35');
INSERT INTO `auth_role_permission` VALUES (1552251960734789638, 1543234745457025026, 1552120843109240833, 1, '2022-07-27 19:18:02', '2022-07-30 10:09:35');
INSERT INTO `auth_role_permission` VALUES (1552251960734789639, 1543234745457025026, 1552120500229083138, 1, '2022-07-27 19:18:02', '2022-07-30 10:09:35');
INSERT INTO `auth_role_permission` VALUES (1552251960734789640, 1543234745457025026, 1552120580319318018, 1, '2022-07-27 19:18:02', '2022-07-30 10:09:35');
INSERT INTO `auth_role_permission` VALUES (1552280424145813506, 1196300996034977794, 1, 1, '2022-07-27 21:11:08', '2022-07-30 10:00:24');
INSERT INTO `auth_role_permission` VALUES (1552280424145813507, 1196300996034977794, 1195349439240048642, 1, '2022-07-27 21:11:08', '2022-07-30 10:00:24');
INSERT INTO `auth_role_permission` VALUES (1552280424145813508, 1196300996034977794, 1195349699995734017, 1, '2022-07-27 21:11:08', '2022-07-30 10:00:24');
INSERT INTO `auth_role_permission` VALUES (1552280424145813509, 1196300996034977794, 1195350117270261762, 1, '2022-07-27 21:11:08', '2022-07-30 10:00:24');
INSERT INTO `auth_role_permission` VALUES (1552280424145813510, 1196300996034977794, 1195350188359520258, 1, '2022-07-27 21:11:08', '2022-07-30 10:00:24');
INSERT INTO `auth_role_permission` VALUES (1552280424145813511, 1196300996034977794, 1195349810561781761, 1, '2022-07-27 21:11:08', '2022-07-30 10:00:24');
INSERT INTO `auth_role_permission` VALUES (1552280497546133505, 1, 1, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133506, 1, 1195349439240048642, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133507, 1, 1195349699995734017, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133508, 1, 1195350117270261762, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133509, 1, 1195350188359520258, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133510, 1, 1195349810561781761, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133511, 1, 1095350299365969922, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133512, 1, 1195350500512206850, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133513, 1, 1552117011172134914, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133514, 1, 1195350687590748161, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133515, 1, 1552115228722958337, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133516, 1, 1552115810363871234, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133517, 1, 1552116130569621505, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133518, 1, 1095350831744782337, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133519, 1, 1195350919074385921, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133520, 1, 1552117569593380865, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133521, 1, 1195351326706208770, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133522, 1, 1195351566221938690, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133523, 1, 1195351159672246274, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133524, 1, 1195351020463296513, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133525, 1, 1552118302266986497, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133526, 1, 1552118455799484417, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133527, 1, 1552118565908353025, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133528, 1, 1552118698767126529, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133529, 1, 1552119010651377665, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133530, 1, 1552119253216366593, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133531, 1, 1552119309122244609, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133532, 1, 1552119375572602881, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133533, 1, 1295351862889254913, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133534, 1, 1552119865739939842, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133535, 1, 1195352547621965825, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133536, 1, 1552120362748186626, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133537, 1, 1552120637546401793, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133538, 1, 1552120764914831362, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133539, 1, 1552121108243779585, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133540, 1, 1552120843109240833, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133541, 1, 1552120500229083138, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133542, 1, 1552120580319318018, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133543, 1, 1195354076890370050, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133544, 1, 1195354153482555393, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133545, 1, 1195354315093282817, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133546, 1, 1552121830221910018, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1552280497546133547, 1, 1552122003710906369, 1, '2022-07-27 21:11:25', '2022-07-30 10:00:17');
INSERT INTO `auth_role_permission` VALUES (1553943850156937217, 1193757683205607426, 1, 1, '2022-08-01 11:20:59', '2022-08-01 11:20:59');
INSERT INTO `auth_role_permission` VALUES (1553943850156937218, 1193757683205607426, 1552105569295273985, 1, '2022-08-01 11:20:59', '2022-08-01 11:20:59');
INSERT INTO `auth_role_permission` VALUES (1553943850156937219, 1193757683205607426, 1552106542772260866, 1, '2022-08-01 11:20:59', '2022-08-01 11:20:59');
INSERT INTO `auth_role_permission` VALUES (1553943850156937220, 1193757683205607426, 1552128995976327169, 1, '2022-08-01 11:20:59', '2022-08-01 11:20:59');
INSERT INTO `auth_role_permission` VALUES (1553943850156937221, 1193757683205607426, 1552128623962533890, 1, '2022-08-01 11:20:59', '2022-08-01 11:20:59');
INSERT INTO `auth_role_permission` VALUES (1553943850156937222, 1193757683205607426, 1552128803453579265, 1, '2022-08-01 11:20:59', '2022-08-01 11:20:59');
INSERT INTO `auth_role_permission` VALUES (1553943850156937223, 1193757683205607426, 1552128908076298241, 1, '2022-08-01 11:20:59', '2022-08-01 11:20:59');
INSERT INTO `auth_role_permission` VALUES (1553943850156937224, 1193757683205607426, 1552129230840573954, 1, '2022-08-01 11:20:59', '2022-08-01 11:20:59');
INSERT INTO `auth_role_permission` VALUES (1553943850156937225, 1193757683205607426, 1553943312572940289, 1, '2022-08-01 11:20:59', '2022-08-01 11:20:59');
INSERT INTO `auth_role_permission` VALUES (1555181022981718018, 1544508753213128705, 1, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718019, 1544508753213128705, 1552105569295273985, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718020, 1544508753213128705, 1552106542772260866, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718021, 1544508753213128705, 1552107881950613506, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718022, 1544508753213128705, 1553200173847519234, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718023, 1544508753213128705, 1553200478379155457, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718024, 1544508753213128705, 1552128995976327169, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718025, 1544508753213128705, 1552128623962533890, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718026, 1544508753213128705, 1552128803453579265, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718027, 1544508753213128705, 1552129230840573954, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718028, 1544508753213128705, 1552107666724098050, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718029, 1544508753213128705, 1552127662758080514, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718030, 1544508753213128705, 1552128263273361410, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718031, 1544508753213128705, 1552128051196768258, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718032, 1544508753213128705, 1552128424296886274, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718033, 1544508753213128705, 1552127189862887425, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718034, 1544508753213128705, 1552127268241846274, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718035, 1544508753213128705, 1552127408507760641, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');
INSERT INTO `auth_role_permission` VALUES (1555181022981718036, 1544508753213128705, 1552127491701780481, 1, '2022-08-04 21:17:04', '2022-08-04 21:17:04');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user`  (
  `id` bigint NOT NULL DEFAULT 0 COMMENT '后台管理用户id',
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '密码',
  `is_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用（1：启用，0：禁止）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_username`(`username` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user
-- ----------------------------
INSERT INTO `auth_user` VALUES (1, 'admin', '$2a$10$ezlrlPHY3UrPgyTTd9RiNunZmpIBZRzW/ddTbNxxKoGP.LfomqAq.', 1, '2019-11-01 10:39:47', '2022-07-04 20:07:09');
INSERT INTO `auth_user` VALUES (2, 'mulrole', '$2a$10$2QoSOuQfNFrzqe48NzTCpuni8LzyZRcVKMJc5t0KKfJV4u5pMHr4S', 1, '2019-11-01 16:36:07', '2022-07-27 21:44:26');
INSERT INTO `auth_user` VALUES (1543891383046131713, 'test1', '$2a$10$qTZrMJdrZovY5v/vXYTAeuYjskDH4lqZWRE1R0DJReIhKd7oB68cO', 1, '2022-07-04 17:36:04', '2022-07-06 10:30:25');
INSERT INTO `auth_user` VALUES (1544509242046676993, 'sys', '$2a$10$8POw/Nb.EG69AdReKjMkBemZfUpg32lK7mZT.fXbL5EN21vtxZVR.', 1, '2022-07-06 10:31:14', '2022-07-06 10:33:12');
INSERT INTO `auth_user` VALUES (1552517678151880706, '测试', '$2a$10$ffejyBQ2xr3JHnFjk/qJRO1bJ6KF1KQwjaRfSOnm4MdFWjQTn2ffW', 0, '2022-07-28 12:53:54', '2022-07-30 10:33:42');
INSERT INTO `auth_user` VALUES (1553947923857833986, 'test', '$2a$10$8POw/Nb.EG69AdReKjMkBemZfUpg32lK7mZT.fXbL5EN21vtxZVR.', 1, '2022-08-01 11:37:11', '2022-08-01 11:37:11');

-- ----------------------------
-- Table structure for auth_user_role
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_role`;
CREATE TABLE `auth_user_role`  (
  `id` bigint NOT NULL DEFAULT 0 COMMENT '主键id',
  `role_id` bigint NOT NULL DEFAULT 0 COMMENT '角色id',
  `user_id` bigint NOT NULL DEFAULT 0 COMMENT '用户id',
  `is_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用（1：启用，0：禁止）',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_role_id`(`role_id` ASC) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of auth_user_role
-- ----------------------------
INSERT INTO `auth_user_role` VALUES (1544509072462577665, 1196300996034977794, 1543891383046131713, 1, '2022-07-06 10:30:33', '2022-07-06 10:30:33');
INSERT INTO `auth_user_role` VALUES (1552290425946046466, 1543234745457025026, 2, 1, '2022-07-27 21:50:52', '2022-07-27 21:50:52');
INSERT INTO `auth_user_role` VALUES (1552290426000572417, 1, 2, 1, '2022-07-27 21:50:52', '2022-07-27 21:50:52');
INSERT INTO `auth_user_role` VALUES (1553193510235107329, 1544508753213128705, 1552517678151880706, 0, '2022-07-30 09:39:24', '2022-07-30 10:33:42');
INSERT INTO `auth_user_role` VALUES (1553944422901731329, 1544508753213128705, 1544509242046676993, 1, '2022-08-01 11:23:16', '2022-08-01 11:23:16');

-- ----------------------------
-- Table structure for cms_banner
-- ----------------------------
DROP TABLE IF EXISTS `cms_banner`;
CREATE TABLE `cms_banner`  (
  `id` bigint NOT NULL DEFAULT 0 COMMENT '主键id',
  `title` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '标题',
  `image_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '图片地址',
  `link_url` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '链接地址',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_enable` tinyint UNSIGNED NOT NULL DEFAULT 1 COMMENT '是否启用 1（true）已启用，  0（false）已禁用',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_name`(`title` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '首页banner表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of cms_banner
-- ----------------------------
INSERT INTO `cms_banner` VALUES (1194607458461216769, 'Banner3', 'image/2026/02/26/c9c8918b787e4316a43f456bf64d9ffc.jpg', 'https://6311b4bc.r16.vip.cpolar.cn', 1, 1, '2019-11-13 21:26:27', '2026-03-05 00:38:54');
INSERT INTO `cms_banner` VALUES (1544149959601827842, 'Banners1', 'image/2026/03/05/86e1327b66a440d9bdb83cd475156904.jpg', 'https://6311b4bc.r16.vip.cpolar.cn', 3, 1, '2022-07-05 10:43:34', '2026-03-05 00:13:03');
INSERT INTO `cms_banner` VALUES (1983863063889756162, '4', 'image/2026/03/04/ca212827b2da4a8ca7c580a70c3d1339.jpg', 'https://6311b4bc.r16.vip.cpolar.cn', 4, 1, '2025-10-30 19:46:27', '2026-03-04 23:10:34');
INSERT INTO `cms_banner` VALUES (2025542304538308610, '2', 'image/2026/03/04/fe0ec418588c4e5b8d1f77fa8eeed65e.webp', 'https://6311b4bc.r16.vip.cpolar.cn', 0, 1, '2026-02-22 20:04:53', '2026-03-04 23:52:05');
INSERT INTO `cms_banner` VALUES (2025587374381608961, '5', 'image/2026/03/05/c2260268937446faaa9bdff0d1efbac1.png', 'https://6311b4bc.r16.vip.cpolar.cn', 0, 1, '2026-02-22 23:03:58', '2026-03-05 00:36:22');

-- ----------------------------
-- Table structure for cms_notice
-- ----------------------------
DROP TABLE IF EXISTS `cms_notice`;
CREATE TABLE `cms_notice`  (
  `id` bigint NOT NULL COMMENT '公告ID',
  `title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '公告标题',
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '公告内容',
  `status` tinyint NOT NULL DEFAULT 1 COMMENT '状态 0未发布 1已发布',
  `is_deleted` tinyint NULL DEFAULT 0 COMMENT '逻辑删除 1已删除 0未删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '系统公告' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of cms_notice
-- ----------------------------
INSERT INTO `cms_notice` VALUES (1, 'test', '测试', 1, 0, '2026-07-28 19:16:00', '2026-07-28 22:16:07');
INSERT INTO `cms_notice` VALUES (2, 'demo', 'demoTest', 1, 0, '2026-07-28 21:53:08', '2026-07-28 21:59:16');

-- ----------------------------
-- Table structure for edu_chapter
-- ----------------------------
DROP TABLE IF EXISTS `edu_chapter`;
CREATE TABLE `edu_chapter`  (
  `id` bigint NOT NULL COMMENT '章节ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '章节名称',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '显示排序',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_chapter
-- ----------------------------
INSERT INTO `edu_chapter` VALUES (2025585979117019138, 2025585730432540673, '名词词法', 1, '2026-02-22 22:58:26', '2026-03-05 01:17:42');
INSERT INTO `edu_chapter` VALUES (2029246263329652737, 2029245760411631618, '支付功能测试', 1, '2026-03-05 01:23:05', '2026-03-05 01:53:20');
INSERT INTO `edu_chapter` VALUES (2029516446224973826, 2029516298644193281, '马克思哲学原理', 1, '2026-03-05 19:16:42', '2026-03-05 19:16:42');
INSERT INTO `edu_chapter` VALUES (2046890400237322242, 2046890290522718210, '函数', 1, '2026-04-22 17:54:35', '2026-04-22 17:54:35');
INSERT INTO `edu_chapter` VALUES (2046957467179253762, 2046957172130938881, '计算机的发展历史', 1, '2026-04-22 22:21:05', '2026-04-22 22:21:05');
INSERT INTO `edu_chapter` VALUES (2077610974118445057, 2077610754055897089, '生理学', 1, '2026-07-16 12:27:11', '2026-07-16 12:27:11');
INSERT INTO `edu_chapter` VALUES (2077614682277445634, 2077614647150149633, '人体解剖学', 1, '2026-07-16 12:41:55', '2026-07-16 12:42:02');
INSERT INTO `edu_chapter` VALUES (2077618815881478145, 2077618770159370241, '经济学基础', 1, '2026-07-16 12:58:21', '2026-07-16 12:58:21');
INSERT INTO `edu_chapter` VALUES (2077655305986539521, 2077655238940590081, '管理学原理', 1, '2026-07-16 15:23:21', '2026-07-16 15:23:21');
INSERT INTO `edu_chapter` VALUES (2077662331638677505, 2077662261291810818, '化工原理', 1, '2026-07-16 15:51:16', '2026-07-16 15:51:16');
INSERT INTO `edu_chapter` VALUES (2077665194913857537, 2077665159044169729, '工程力学', 1, '2026-07-16 16:02:38', '2026-07-16 16:02:38');
INSERT INTO `edu_chapter` VALUES (2077669506545123330, 2077669445333450753, '教育心理学', 1, '2026-07-16 16:19:46', '2026-07-16 16:19:46');
INSERT INTO `edu_chapter` VALUES (2077672453358256130, 2077672348563570689, '动物医学', 1, '2026-07-16 16:31:29', '2026-07-16 16:31:29');
INSERT INTO `edu_chapter` VALUES (2077675634909806594, 2077675588562747394, '鱼类学', 1, '2026-07-16 16:44:07', '2026-07-16 16:44:07');
INSERT INTO `edu_chapter` VALUES (2077714430812520450, 2077714398742872066, '植物学', 1, '2026-07-16 19:18:17', '2026-07-16 19:18:17');
INSERT INTO `edu_chapter` VALUES (2077716910145306626, 2077716876708315138, '园林花卉学', 1, '2026-07-16 19:28:08', '2026-07-16 19:28:08');
INSERT INTO `edu_chapter` VALUES (2077719534240301057, 2077719437561593858, '解剖生理学', 1, '2026-07-16 19:38:34', '2026-07-16 19:38:34');
INSERT INTO `edu_chapter` VALUES (2077722342788202497, 2077722082103820289, '体育专业综合', 1, '2026-07-16 19:49:43', '2026-07-16 19:49:43');
INSERT INTO `edu_chapter` VALUES (2077724320029245442, 2077724241729978369, '文史基础', 1, '2026-07-16 19:57:35', '2026-07-16 19:57:35');
INSERT INTO `edu_chapter` VALUES (2077726384121741314, 2077726348398854145, '新媒体概论', 1, '2026-07-16 20:05:47', '2026-07-16 20:05:47');
INSERT INTO `edu_chapter` VALUES (2077746836948942849, 2077746806020145153, '法理学', 1, '2026-07-16 21:27:03', '2026-07-16 21:27:03');
INSERT INTO `edu_chapter` VALUES (2077749853970530306, 2077749795514515457, '中国近现代史纲要', 1, '2026-07-16 21:39:03', '2026-07-16 21:39:03');
INSERT INTO `edu_chapter` VALUES (2077753307086487553, 2077752654473756674, '艺术概论', 1, '2026-07-16 21:52:46', '2026-07-16 21:52:46');

-- ----------------------------
-- Table structure for edu_comment
-- ----------------------------
DROP TABLE IF EXISTS `edu_comment`;
CREATE TABLE `edu_comment`  (
  `id` bigint NOT NULL COMMENT '评论id',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `member_id` bigint NOT NULL COMMENT '会员id',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员头像',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '评论内容',
  `star` tinyint NULL DEFAULT 5 COMMENT '评论星级',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id` ASC) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '评论' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_comment
-- ----------------------------
INSERT INTO `edu_comment` VALUES (1543977997285986305, 1542350261626863618, 1543964673588637698, '你痴', 'https://img.51miz.com/Element/00/88/08/84/72f298b9_E880884_d0f63115.png', '课程评论', 5, 0, '2025-07-04 23:20:15', '2025-07-04 23:20:15');

-- ----------------------------
-- Table structure for edu_course
-- ----------------------------
DROP TABLE IF EXISTS `edu_course`;
CREATE TABLE `edu_course`  (
  `id` bigint NOT NULL COMMENT '课程ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程标题',
  `teacher_id` bigint NOT NULL COMMENT '课程讲师ID',
  `cover` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '课程封面图片路径',
  `description` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL,
  `subject_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '具体学科下的课程类别',
  `type_id` char(19) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '课程专业ID',
  `price` decimal(10, 2) UNSIGNED NOT NULL DEFAULT 0.00 COMMENT '课程销售价格，设置为0则可免费观看',
  `lesson_num` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '总课时',
  `sale_count` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '销售数量',
  `view_count` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '浏览数量',
  `version` bigint UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '课程状态 0未发布 1已发布',
  `is_deleted` tinyint NULL DEFAULT NULL COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_title`(`title` ASC) USING BTREE,
  INDEX `idx_subject_id`(`type_id` ASC) USING BTREE,
  INDEX `idx_teacher_id`(`teacher_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_course
-- ----------------------------
INSERT INTO `edu_course` VALUES (2025585730432540673, '大学英语', 2025536880044941313, 'image/2026/03/05/d99c61046d4e4c7bb168f66501684bf8.png', '<p>专升本英语河北公共课课程</p>', '2025539126535135233', '2025539176237637634', 0.00, 76, 0, 36, 1, 1, 0, '2026-02-22 22:57:26', '2026-07-15 19:35:43');
INSERT INTO `edu_course` VALUES (2029245760411631618, '支付测试', 2029210279116374017, 'image/2026/03/05/8e40b9e78aa24edfa87bd4a75a79e2f1.jpg', '<p>微信扫码支付功能测试</p>', '2025539126535135233', '2025539176237637634', 0.01, 5, 0, 23, 1, 1, 0, '2026-03-05 01:21:06', '2026-03-05 01:57:02');
INSERT INTO `edu_course` VALUES (2029516298644193281, '大学政治', 2029210279116374017, 'image/2026/03/05/48da5d1b0cff4876895c9dfb69dba277.png', '<p>专升本政治河北公共课程</p>', '2029235591539687425', '2029235691242487810', 0.00, 5, 0, 16, 1, 1, 0, '2026-03-05 19:16:07', '2026-04-22 00:06:34');
INSERT INTO `edu_course` VALUES (2046890290522718210, '大学数学', 2046889071838330881, 'image/2026/04/22/47ab87b39d344e27b72a0a4ce7ad6f7a.png', '<p>专升本数学全国通用课程</p>', '2046889416069054466', '2046889472566329345', 0.00, 48, 0, 20, 1, 1, 0, '2026-04-22 17:54:09', '2026-07-15 22:43:04');
INSERT INTO `edu_course` VALUES (2046957172130938881, '信息技术', 2046955607940759553, 'image/2026/04/22/95b9171ea4304df9b94c14f0e4e36cc6.png', '<p>专升本信息全国通用课程</p>', '2046955719584743425', '2046956023256547329', 0.00, 56, 0, 33, 1, 1, 0, '2026-04-22 22:19:55', '2026-07-15 23:32:37');
INSERT INTO `edu_course` VALUES (2077610754055897089, '生理学', 2077609233205460994, 'image/2026/07/16/d74a895041554117893a503be7a92c2f.png', '<p>专升本生理全国通用课程</p>', '2077607127530635265', '2077607305364930562', 0.00, 8, 0, 42, 1, 1, 0, '2026-07-16 12:26:19', '2026-07-16 12:29:43');
INSERT INTO `edu_course` VALUES (2077614647150149633, '人体解剖', 2077613493460697089, 'image/2026/07/16/9bcd38840ec540b1a645ae926bbd7776.jpg', '<p>专升本解剖全国通用课程</p>', '2077612160313753601', '2077612273127948289', 0.00, 10, 0, 11, 1, 1, 0, '2026-07-16 12:41:47', '2026-07-16 12:47:48');
INSERT INTO `edu_course` VALUES (2077618770159370241, '经济基础', 2077618387420741634, 'image/2026/07/16/08524128d59c4ca1b82c3984802d13a3.jpg', '<p>专升本经济全国通用课程</p>', '2077616641399095297', '2077616904126103553', 0.00, 2, 0, 31, 1, 1, 0, '2026-07-16 12:58:10', '2026-07-16 12:59:12');
INSERT INTO `edu_course` VALUES (2077655238940590081, '管理原理', 2077654500239769601, 'image/2026/07/16/38fce2d55c494146b0480b04aeada377.jpg', '<p>专升本管理全国通用课程</p>', '2077652508893282305', '2077652609481080834', 0.00, 13, 0, 40, 1, 1, 0, '2026-07-16 15:23:05', '2026-07-16 15:33:45');
INSERT INTO `edu_course` VALUES (2077662261291810818, '化工原理', 2077661843971145729, 'image/2026/07/16/abdfd934ca874e5a98ef5b3eaa3e7cde.jpg', '<p>专升本化工全国通用课程</p>', '2077660057264750593', '2077660219651424257', 0.00, 2, 0, 39, 1, 1, 0, '2026-07-16 15:50:59', '2026-07-16 15:52:15');
INSERT INTO `edu_course` VALUES (2077665159044169729, '工程力学', 2077664483748642818, 'image/2026/07/16/6f1b0e122ca649aeb5685c3fc04d5e24.jpg', '<p>专升本力学全国通用课程</p>', '2077662906346405889', '2077662985547448322', 0.00, 25, 0, 22, 1, 1, 0, '2026-07-16 16:02:30', '2026-07-16 16:09:49');
INSERT INTO `edu_course` VALUES (2077669445333450753, '教育心理', 2077668729118294018, 'image/2026/07/16/706a488be77d4e0c99a95fa10ef6981b.jpg', '<p>专升本教育全国通用课程</p>', '2077667210029465602', '2077668030796038146', 0.00, 6, 0, 10, 1, 1, 0, '2026-07-16 16:19:32', '2026-07-16 16:21:31');
INSERT INTO `edu_course` VALUES (2077672348563570689, '动物医学', 2077671611750187010, 'image/2026/07/16/5dd103f99be3444d80abd78ee9a58809.png', '<p>专升本生化全国通用课程</p>', '2077670240644792321', '2077670397943775233', 0.00, 2, 0, 21, 1, 1, 0, '2026-07-16 16:31:04', '2026-07-16 16:32:53');
INSERT INTO `edu_course` VALUES (2077675588562747394, '鱼类学', 2077674654839373825, 'image/2026/07/16/b1a690098ccf4881b10634434a140d55.jpg', '<p>专升本鱼类全国通用课程</p>', '2077673401874939905', '2077673526869393410', 0.00, 13, 0, 26, 1, 1, 0, '2026-07-16 16:43:56', '2026-07-16 17:14:09');
INSERT INTO `edu_course` VALUES (2077714398742872066, '植物学', 2077714172921544705, 'image/2026/07/16/540e84ab83944d71a0f09981109ff91f.jpg', '<p>专升本植物全国通用课程</p>', '2077713050337050625', '2077713112320475138', 0.00, 1, 0, 28, 1, 1, 0, '2026-07-16 19:18:09', '2026-07-16 19:18:43');
INSERT INTO `edu_course` VALUES (2077716876708315138, '园林花卉', 2077716220987604994, 'image/2026/07/16/fa59e8a08808453799152e7987606f56.jpg', '<p>专升本花卉全国通用课程</p>', '2077714895222636546', '2077715555401891841', 0.00, 1, 0, 10, 1, 1, 0, '2026-07-16 19:28:00', '2026-07-16 19:28:43');
INSERT INTO `edu_course` VALUES (2077719437561593858, '解剖生理', 2077674654839373825, 'image/2026/07/16/3d9d67cc05da43f3b4853b28c348837d.jpg', '<p>专升本剖理全国通用课程</p>', '2077718220835946497', '2077718415053193218', 0.00, 1, 0, 12, 1, 1, 0, '2026-07-16 19:38:11', '2026-07-16 19:43:24');
INSERT INTO `edu_course` VALUES (2077722082103820289, '体育综合', 2077721714330468354, 'image/2026/07/16/c28d488c877f4f12b77022475a436b6f.jpg', '<p>专升本体育全国通用课程</p>', '2077720950107308033', '2077721053282992130', 0.00, 1, 0, 19, 1, 1, 0, '2026-07-16 19:48:41', '2026-07-16 19:50:44');
INSERT INTO `edu_course` VALUES (2077724241729978369, '文史基础', 2077723876087332866, 'image/2026/07/16/21eaa370dc1f4280b2932b17ced73c69.png', '<p>专升本文史全国通用课程</p>', '2077722851087515649', '2077722898797723650', 0.00, 2, 0, 37, 1, 1, 0, '2026-07-16 19:57:16', '2026-07-16 19:58:12');
INSERT INTO `edu_course` VALUES (2077726348398854145, '新媒体概论', 2077723876087332866, 'image/2026/07/16/c17c5624ff9b44db92bf39f7f561a105.jpg', '<p>专升本媒体全国通用课程</p>', '2077725184223641601', '2077725304302370818', 0.00, 5, 0, 27, 1, 1, 0, '2026-07-16 20:05:38', '2026-07-16 20:07:08');
INSERT INTO `edu_course` VALUES (2077746806020145153, '法理学', 2077746487576002561, 'image/2026/07/16/3990182b8c9b42839d5a356f0d615c63.png', '<p>专升本法理全国通用课程</p>', '2077745683645366273', '2077745725731012610', 0.00, 2, 0, 14, 1, 1, 0, '2026-07-16 21:26:56', '2026-07-16 21:28:35');
INSERT INTO `edu_course` VALUES (2077749795514515457, '近现代史', 2077748838332399617, 'image/2026/07/16/e9cd41e4f32844f3aed95ec8923df025.jpg', '<p>专升本现史全国通用课程</p>', '2029235591539687425', '2077748117776138241', 0.00, 5, 0, 12, 1, 1, 0, '2026-07-16 21:38:49', '2026-07-16 21:42:01');
INSERT INTO `edu_course` VALUES (2077752654473756674, '艺术概论', 2077752206807302146, 'image/2026/07/16/e8d0b805409245d09a9b4ef9d7bfc91d.jpg', '<p>专升本艺术全国通用课程</p>', '2077751091659309058', '2077751158092890113', 0.00, 1, 0, 13, 1, 1, 0, '2026-07-16 21:50:10', '2026-07-16 21:53:28');
INSERT INTO `edu_course` VALUES (2077752654473756675, '外语专业综合', 2077752206807302146, 'image/2026/07/16/e8d0b805409245d09a9b4ef9d7bfc91d.jpg', '<p>专升本外语全国通用课程</p>', '2077751091659309058', '2077751158092890113', 0.00, 0, 0, 0, 1, 1, 1, '2026-07-27 20:37:00', '2026-07-27 20:38:04');

-- ----------------------------
-- Table structure for edu_course_collect
-- ----------------------------
DROP TABLE IF EXISTS `edu_course_collect`;
CREATE TABLE `edu_course_collect`  (
  `id` bigint NOT NULL COMMENT '收藏ID',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `member_id` bigint NOT NULL COMMENT '会员id',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `collectId`(`course_id` ASC, `member_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程收藏' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_course_collect
-- ----------------------------
INSERT INTO `edu_course_collect` VALUES (1248893747837421532, 1542078687770427394, 1545034536738373633, '2022-08-08 10:34:09', '2022-08-08 10:34:09');
INSERT INTO `edu_course_collect` VALUES (1556485217366089729, 18, 1545034536738373633, '2022-08-08 11:39:29', '2022-08-08 11:39:29');
INSERT INTO `edu_course_collect` VALUES (1557183610790879234, 15, 1545034536738373633, '2022-08-10 09:54:39', '2022-08-10 09:54:39');

-- ----------------------------
-- Table structure for edu_subject
-- ----------------------------
DROP TABLE IF EXISTS `edu_subject`;
CREATE TABLE `edu_subject`  (
  `id` bigint NOT NULL COMMENT '课程类别ID',
  `pid` bigint NOT NULL DEFAULT 0 COMMENT '父课程ID',
  `title` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '类别名称',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_parent_id`(`pid` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程科目' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_subject
-- ----------------------------
INSERT INTO `edu_subject` VALUES (2025539126535135233, 0, '大学英语', 0, '2026-02-22 19:52:15', '2026-02-22 19:52:15');
INSERT INTO `edu_subject` VALUES (2025539176237637634, 2025539126535135233, '专升本英语', 0, '2026-02-22 19:52:27', '2026-02-22 19:52:27');
INSERT INTO `edu_subject` VALUES (2029235591539687425, 0, '大学政治', 0, '2026-03-05 00:40:41', '2026-03-05 00:40:41');
INSERT INTO `edu_subject` VALUES (2029235691242487810, 2029235591539687425, '专升本政治', 0, '2026-03-05 00:41:05', '2026-03-05 00:41:05');
INSERT INTO `edu_subject` VALUES (2046889416069054466, 0, '大学数字', 0, '2026-04-22 17:50:41', '2026-04-22 17:50:41');
INSERT INTO `edu_subject` VALUES (2046889472566329345, 2046889416069054466, '专升本数学', 0, '2026-04-22 17:50:54', '2026-04-22 17:50:54');
INSERT INTO `edu_subject` VALUES (2046955719584743425, 0, '信息技术', 0, '2026-04-22 22:14:09', '2026-04-22 22:14:09');
INSERT INTO `edu_subject` VALUES (2046956023256547329, 2046955719584743425, '信息技术概论', 0, '2026-04-22 22:15:21', '2026-04-22 22:15:21');
INSERT INTO `edu_subject` VALUES (2077607127530635265, 0, '生理学', 0, '2026-07-16 12:11:54', '2026-07-16 12:11:54');
INSERT INTO `edu_subject` VALUES (2077607305364930562, 2077607127530635265, '专升本生理', 0, '2026-07-16 12:12:36', '2026-07-16 12:12:36');
INSERT INTO `edu_subject` VALUES (2077612160313753601, 0, '人体解剖', 0, '2026-07-16 12:31:54', '2026-07-16 12:31:54');
INSERT INTO `edu_subject` VALUES (2077612273127948289, 2077612160313753601, '专升本解剖', 0, '2026-07-16 12:32:21', '2026-07-16 12:32:21');
INSERT INTO `edu_subject` VALUES (2077616641399095297, 0, '经济基础', 0, '2026-07-16 12:49:42', '2026-07-16 12:49:42');
INSERT INTO `edu_subject` VALUES (2077616904126103553, 2077616641399095297, '专升本经济', 0, '2026-07-16 12:50:45', '2026-07-16 12:50:45');
INSERT INTO `edu_subject` VALUES (2077652508893282305, 0, '管理原理', 0, '2026-07-16 15:12:14', '2026-07-16 15:12:14');
INSERT INTO `edu_subject` VALUES (2077652609481080834, 2077652508893282305, '专升本管理', 0, '2026-07-16 15:12:38', '2026-07-16 15:12:38');
INSERT INTO `edu_subject` VALUES (2077660057264750593, 0, '化工原理', 0, '2026-07-16 15:42:13', '2026-07-16 15:42:13');
INSERT INTO `edu_subject` VALUES (2077660219651424257, 2077660057264750593, '专升本化工', 0, '2026-07-16 15:42:52', '2026-07-16 15:42:52');
INSERT INTO `edu_subject` VALUES (2077662906346405889, 0, '工程力学', 0, '2026-07-16 15:53:33', '2026-07-16 15:53:33');
INSERT INTO `edu_subject` VALUES (2077662985547448322, 2077662906346405889, '专升本力学', 0, '2026-07-16 15:53:52', '2026-07-16 15:53:52');
INSERT INTO `edu_subject` VALUES (2077667210029465602, 0, '教育心理', 0, '2026-07-16 16:10:39', '2026-07-16 16:10:39');
INSERT INTO `edu_subject` VALUES (2077668030796038146, 2077667210029465602, '专升本教育', 0, '2026-07-16 16:13:54', '2026-07-16 16:14:41');
INSERT INTO `edu_subject` VALUES (2077670240644792321, 0, '动物医学', 0, '2026-07-16 16:22:41', '2026-07-16 16:22:41');
INSERT INTO `edu_subject` VALUES (2077670397943775233, 2077670240644792321, '动物生物化学', 0, '2026-07-16 16:23:19', '2026-07-16 16:23:19');
INSERT INTO `edu_subject` VALUES (2077673401874939905, 0, '鱼类学', 0, '2026-07-16 16:35:15', '2026-07-16 16:35:15');
INSERT INTO `edu_subject` VALUES (2077673526869393410, 2077673401874939905, '专升本鱼类', 0, '2026-07-16 16:35:45', '2026-07-16 16:35:45');
INSERT INTO `edu_subject` VALUES (2077713050337050625, 0, '植物学', 0, '2026-07-16 19:12:48', '2026-07-16 19:12:48');
INSERT INTO `edu_subject` VALUES (2077713112320475138, 2077713050337050625, '专升本植物', 0, '2026-07-16 19:13:03', '2026-07-16 19:13:03');
INSERT INTO `edu_subject` VALUES (2077714895222636546, 0, '园林花卉', 0, '2026-07-16 19:20:08', '2026-07-16 19:20:08');
INSERT INTO `edu_subject` VALUES (2077715555401891841, 2077714895222636546, '专升本花卉', 0, '2026-07-16 19:22:45', '2026-07-16 19:22:45');
INSERT INTO `edu_subject` VALUES (2077718220835946497, 0, '解剖生理', 0, '2026-07-16 19:33:21', '2026-07-16 19:33:21');
INSERT INTO `edu_subject` VALUES (2077718415053193218, 2077718220835946497, '专升本剖理', 0, '2026-07-16 19:34:07', '2026-07-16 19:34:07');
INSERT INTO `edu_subject` VALUES (2077720950107308033, 0, '体育综合', 0, '2026-07-16 19:44:11', '2026-07-16 19:44:11');
INSERT INTO `edu_subject` VALUES (2077721053282992130, 2077720950107308033, '专升本体育', 0, '2026-07-16 19:44:36', '2026-07-16 19:44:36');
INSERT INTO `edu_subject` VALUES (2077722851087515649, 0, '文史基础', 0, '2026-07-16 19:51:45', '2026-07-16 19:51:45');
INSERT INTO `edu_subject` VALUES (2077722898797723650, 2077722851087515649, '专升本文史', 0, '2026-07-16 19:51:56', '2026-07-16 19:51:56');
INSERT INTO `edu_subject` VALUES (2077725184223641601, 0, '新媒体概论', 0, '2026-07-16 20:01:01', '2026-07-16 20:01:01');
INSERT INTO `edu_subject` VALUES (2077725304302370818, 2077725184223641601, '专升本新媒体', 0, '2026-07-16 20:01:29', '2026-07-16 20:01:29');
INSERT INTO `edu_subject` VALUES (2077745683645366273, 0, '法理学', 0, '2026-07-16 21:22:28', '2026-07-16 21:22:28');
INSERT INTO `edu_subject` VALUES (2077745725731012610, 2077745683645366273, '专升本法理', 0, '2026-07-16 21:22:38', '2026-07-16 21:22:38');
INSERT INTO `edu_subject` VALUES (2077748117776138241, 2029235591539687425, '中国近现代史', 0, '2026-07-16 21:32:09', '2026-07-16 21:32:09');
INSERT INTO `edu_subject` VALUES (2077751091659309058, 0, '艺术概论', 0, '2026-07-16 21:43:58', '2026-07-16 21:43:58');
INSERT INTO `edu_subject` VALUES (2077751158092890113, 2077751091659309058, '专升本艺术', 0, '2026-07-16 21:44:14', '2026-07-16 21:44:14');

-- ----------------------------
-- Table structure for edu_teacher
-- ----------------------------
DROP TABLE IF EXISTS `edu_teacher`;
CREATE TABLE `edu_teacher`  (
  `id` bigint NOT NULL COMMENT '讲师ID',
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '讲师姓名',
  `career` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师资历,一句话说明讲师',
  `intro` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL DEFAULT '' COMMENT '讲师简介',
  `level` int UNSIGNED NOT NULL COMMENT '头衔 1高级讲师 2首席讲师',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师头像',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '讲师' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of edu_teacher
-- ----------------------------
INSERT INTO `edu_teacher` VALUES (2025536880044941313, '伊米', '英语老师', '专升本英语课程高级讲师', 1, 'image/2026/03/04/0122999be60a49609ad3226cf7a8bc76.png', 0, 0, '2026-02-22 19:43:20', '2026-03-04 12:17:27');
INSERT INTO `edu_teacher` VALUES (2029210279116374017, '拜课', '政治老师', '专升本政治课程高级讲师', 1, 'image/2026/03/04/47e93ef7fa1a49eb88386dd8c786d2ae.png', 0, 0, '2026-03-04 23:00:06', '2026-03-04 23:00:06');
INSERT INTO `edu_teacher` VALUES (2046889071838330881, '杰哥', '数学老师', '专升本数学课程高级讲师', 1, 'image/2026/04/22/419e2ebfbe0143d5bee85c808f7259d2.png', 0, 0, '2026-04-22 17:49:19', '2026-04-22 17:49:19');
INSERT INTO `edu_teacher` VALUES (2046955607940759553, '升哥', '信息老师', '专升本信息课程高级讲师', 1, 'image/2026/04/22/93cf4429f56f4970b4a4ee52811241a3.png', 0, 0, '2026-04-22 22:13:42', '2026-04-22 22:13:42');
INSERT INTO `edu_teacher` VALUES (2077609233205460994, '学立升', '生理老师', '专升本生理课程高级讲师', 1, 'image/2026/07/16/97c6602ea5d34a679a4244efe33db54d.png', 0, 0, '2026-07-16 12:20:16', '2026-07-16 12:20:16');
INSERT INTO `edu_teacher` VALUES (2077613493460697089, '圆圆', '解剖老师', '专升本解剖课程高级讲师', 1, 'image/2026/07/16/d4a6fa5ac39c4da39e0273351ea37fb6.png', 0, 0, '2026-07-16 12:37:12', '2026-07-16 12:37:12');
INSERT INTO `edu_teacher` VALUES (2077618387420741634, '乐智', '经济老师', '专升本经济课程高级讲师', 1, 'image/2026/07/16/d2548d69339f4daf8d5a479cdc48e5e9.png', 0, 0, '2026-07-16 12:56:39', '2026-07-16 12:56:39');
INSERT INTO `edu_teacher` VALUES (2077654500239769601, '李老师', '管理老师', '专升本管理课程高级讲师', 1, 'image/2026/07/16/4ea87cf242c24dac8c5c16b784f5931e.png', 0, 0, '2026-07-16 15:20:08', '2026-07-16 15:20:08');
INSERT INTO `edu_teacher` VALUES (2077661843971145729, '张老师', '化工老师', '专升本化工课程高级讲师', 1, 'image/2026/07/16/edfbeb1b6f78438c9696b5bdd29bc412.png', 0, 0, '2026-07-16 15:49:19', '2026-07-16 15:49:19');
INSERT INTO `edu_teacher` VALUES (2077664483748642818, '沐良', '力学老师', '专升本力学课程高级讲师', 1, 'image/2026/07/16/2de151005f3d4c4f84eaf9c4ebace8c5.png', 0, 0, '2026-07-16 15:59:49', '2026-07-16 15:59:49');
INSERT INTO `edu_teacher` VALUES (2077668729118294018, '迷小佳', '教育老师', '专升本教育课程高级讲师', 1, 'image/2026/07/16/c15deff156a24f8f9d64412e32195f88.png', 0, 0, '2026-07-16 16:16:41', '2026-07-16 16:16:41');
INSERT INTO `edu_teacher` VALUES (2077671611750187010, '静老师', '生化老师', '专升本生化课程首席讲师', 2, 'image/2026/07/16/51bb5eaa1eb144fd83f099ee38583593.png', 0, 0, '2026-07-16 16:28:08', '2026-07-16 16:28:08');
INSERT INTO `edu_teacher` VALUES (2077674654839373825, '小刚子', '鱼类老师', '专升本鱼类课程高级讲师', 1, 'image/2026/07/16/6891b6f04e37403bb0b8ddd1cde17275.png', 0, 0, '2026-07-16 16:40:14', '2026-07-16 16:40:14');
INSERT INTO `edu_teacher` VALUES (2077714172921544705, '春天', '植物老师', '专升本植物课程首席讲师', 2, 'image/2026/07/16/f98407f8be364c11a74db02adfd6d5ce.png', 0, 0, '2026-07-16 19:17:16', '2026-07-16 19:17:16');
INSERT INTO `edu_teacher` VALUES (2077716220987604994, '洛必达', '花卉老师', '专升本花卉课程首席讲师', 2, 'image/2026/07/16/be68b3db76b34160824b118d50658364.png', 0, 0, '2026-07-16 19:25:24', '2026-07-16 19:26:04');
INSERT INTO `edu_teacher` VALUES (2077721714330468354, '果子', '体育老师', '专升本体育课程高级讲师', 1, 'image/2026/07/16/19182e6dffbf45678a82b6a974941ed3.png', 0, 0, '2026-07-16 19:47:14', '2026-07-16 19:47:14');
INSERT INTO `edu_teacher` VALUES (2077723876087332866, '上岸鱼', '媒体老师', '专升本媒体课程高级讲师', 1, 'image/2026/07/16/7e2fda72fe2c4537ace4e32031a85e5d.png', 0, 0, '2026-07-16 19:55:49', '2026-07-16 19:55:49');
INSERT INTO `edu_teacher` VALUES (2077746487576002561, '张姗姗', '法理老师', '专升本法理课程高级讲师', 1, 'image/2026/07/16/24b3a4a7420d4a5ca562e647264da0c4.png', 0, 0, '2026-07-16 21:25:40', '2026-07-16 21:25:40');
INSERT INTO `edu_teacher` VALUES (2077748838332399617, '兔子', '现史老师', '专升本现史课程高级讲师', 1, 'image/2026/07/16/79919334c37b47e9b73ce605a973fd6c.png', 0, 0, '2026-07-16 21:35:00', '2026-07-16 21:35:00');
INSERT INTO `edu_teacher` VALUES (2077752206807302146, '小罗', '艺术老师', '专升本艺术课程高级讲师', 1, 'image/2026/07/16/e5de8f20043e46779a2919e32dd12d79.png', 0, 0, '2026-07-16 21:48:24', '2026-07-16 21:48:24');

-- ----------------------------
-- Table structure for edu_video
-- ----------------------------
DROP TABLE IF EXISTS `edu_video`;
CREATE TABLE `edu_video`  (
  `id` bigint NOT NULL COMMENT '视频ID',
  `course_id` bigint NOT NULL COMMENT '课程ID',
  `chapter_id` bigint NOT NULL COMMENT '章节ID',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '小节(视频)名称',
  `video_source_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `video_original_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '原始文件名称',
  `sort` int UNSIGNED NOT NULL DEFAULT 0 COMMENT '排序字段',
  `play_count` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '播放次数',
  `is_free` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '是否可以试听：0收费 1免费',
  `duration` float NOT NULL DEFAULT 0 COMMENT '视频时长（秒）',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '0未上传 1转码中  2正常',
  `size` bigint UNSIGNED NOT NULL DEFAULT 0 COMMENT '视频源文件大小（字节）',
  `version` bigint UNSIGNED NOT NULL DEFAULT 1 COMMENT '乐观锁',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_course_id`(`course_id` ASC) USING BTREE,
  INDEX `idx_chapter_id`(`chapter_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '课程视频' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of edu_video
-- ----------------------------
INSERT INTO `edu_video` VALUES (2025586254829592578, 2025585730432540673, 2025585979117019138, '名词词法（1）', 'video/2026/03/05/408db116148249c0b77fd939077a1dc9.mp4', '01-001-词法名词(1).mp4', 1, 0, 1, 0, 0, 0, 1, '2026-02-22 22:59:31', '2026-03-05 00:55:45');
INSERT INTO `edu_video` VALUES (2029240158155276290, 2025585730432540673, 2025585979117019138, '名词词法（2）', 'video/2026/03/05/23f260c4b8d143f2b9229350fece54f3.mp4', '01-002-词法名词(2).mp4', 2, 0, 1, 0, 0, 0, 1, '2026-03-05 00:58:50', '2026-03-05 00:58:50');
INSERT INTO `edu_video` VALUES (2029240693113585666, 2025585730432540673, 2025585979117019138, '名词词法（3）', 'video/2026/03/05/d5893e6e6a104694b09f6d90baecd0ed.mp4', '01-003-词法名词(3).mp4', 3, 0, 1, 0, 0, 0, 1, '2026-03-05 01:00:57', '2026-03-05 01:00:57');
INSERT INTO `edu_video` VALUES (2029241949026615298, 2025585730432540673, 2025585979117019138, '名词词法（4）', 'video/2026/03/05/53b83f5fd0f746f4b70f33864a58bea2.mp4', '01-004-词法名词练习.mp4', 4, 0, 1, 0, 0, 0, 1, '2026-03-05 01:05:57', '2026-03-05 01:05:57');
INSERT INTO `edu_video` VALUES (2029244632076746754, 2025585730432540673, 2025585979117019138, '冠词词法（1）', NULL, '02-005-词法冠词(1).mp4', 5, 0, 1, 0, 0, 0, 1, '2026-03-05 01:16:36', '2026-03-05 01:16:36');
INSERT INTO `edu_video` VALUES (2029254754282864642, 2029245760411631618, 2029246263329652737, '扫码支付', 'video/2026/03/05/244c6994b2db49e2b227f09630ef7198.mp4', '检测U盘是否扩容.mp4', 1, 0, 0, 0, 0, 0, 1, '2026-03-05 01:56:50', '2026-03-05 01:56:50');
INSERT INTO `edu_video` VALUES (2029516608469041153, 2029516298644193281, 2029516446224973826, '哲学和哲学的基本问题', 'video/2026/03/05/da621b9ef5ab4317960b7f4676d082a6.mp4', '01-001-哲学和哲学的基本问题.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-03-05 19:17:21', '2026-03-05 19:17:21');
INSERT INTO `edu_video` VALUES (2029516840279834626, 2029516298644193281, 2029516446224973826, '什么是哲学？哲学的基本概念', 'video/2026/03/05/d57d7f24f70542ae94017f34be49d2fb.mp4', '01-002-哲学的基本概念.mp4', 2, 0, 1, 0, 0, 0, 1, '2026-03-05 19:18:16', '2026-03-05 19:18:16');
INSERT INTO `edu_video` VALUES (2046552079044804610, 2029516298644193281, 2029516446224973826, '哲学的基本问题和内容', 'video/2026/04/21/038016402bb04becb15368974fc34229.mp4', '01-003-哲学的基本问题和内容.mp4', 3, 0, 1, 0, 0, 0, 1, '2026-04-21 19:30:13', '2026-04-21 20:07:05');
INSERT INTO `edu_video` VALUES (2046553712982065153, 2029516298644193281, 2029516446224973826, '唯物主义', 'video/2026/04/21/3b52586c8fc8476a99aa8077933caa35.mp4', '01-004-唯物主义.mp4', 4, 0, 1, 0, 0, 0, 1, '2026-04-21 19:36:43', '2026-04-21 20:23:35');
INSERT INTO `edu_video` VALUES (2046566851765174274, 2029516298644193281, 2029516446224973826, '唯心主义', 'video/2026/04/21/44308da097144894aad23e1f16b0efac.mp4', '01-005-唯心主义.mp4', 5, 0, 1, 0, 0, 0, 1, '2026-04-21 20:28:55', '2026-04-21 20:28:55');
INSERT INTO `edu_video` VALUES (2046571629274562561, 2029516298644193281, 2029516446224973826, '辩证法与形而上学', 'video/2026/04/21/2bca461227df4b91a942352ed71777e0.mp4', '01-006-辩证法与形而上学.mp4', 6, 0, 1, 0, 0, 0, 1, '2026-04-21 20:47:55', '2026-04-21 20:47:55');
INSERT INTO `edu_video` VALUES (2046572347469430785, 2029516298644193281, 2029516446224973826, '哲学的党性问题', 'video/2026/04/21/feac4b5447454aa584aa403a0f2c9976.mp4', '01-007-哲学的党性问题.mp4', 7, 0, 1, 0, 0, 0, 1, '2026-04-21 20:50:46', '2026-04-21 20:50:46');
INSERT INTO `edu_video` VALUES (2046573401665798145, 2029516298644193281, 2029516446224973826, '科学主义与人本主义', 'video/2026/04/21/9d3edb1f32f0446a9bcc6e0423998722.mp4', '01-008-科学主义与人本主义.mp4', 8, 0, 1, 0, 0, 0, 1, '2026-04-21 20:54:57', '2026-04-21 20:54:57');
INSERT INTO `edu_video` VALUES (2046574459561541634, 2029516298644193281, 2029516446224973826, '马克思主义哲学的产生和基本特征', 'video/2026/04/21/2fa4e62a51ee45fb8319d6dcd8475a0d.mp4', '01-009-马克思主义哲学的产生和基本特征.mp4', 9, 0, 1, 0, 0, 0, 1, '2026-04-21 20:59:09', '2026-04-21 20:59:09');
INSERT INTO `edu_video` VALUES (2046575348129038337, 2029516298644193281, 2029516446224973826, '实践的观点是马克思主义哲学的核心观点', 'video/2026/04/21/fa009bc281264efcbee8714b65187987.mp4', '01-010-实践的观点是马克思主义哲学的核心观点.mp4', 10, 0, 1, 0, 0, 0, 1, '2026-04-21 21:02:41', '2026-04-21 21:02:41');
INSERT INTO `edu_video` VALUES (2046575748567629826, 2029516298644193281, 2029516446224973826, '马克思主义哲学的基本特征', 'video/2026/04/21/2808cea3f0a944da9372670b8dfd6e77.mp4', '01-011-马克思主义哲学的基本特征.mp4', 11, 0, 1, 0, 0, 0, 1, '2026-04-21 21:04:17', '2026-04-21 21:04:17');
INSERT INTO `edu_video` VALUES (2046577471143116801, 2029516298644193281, 2029516446224973826, '马克思主义哲学产生的历史意义', 'video/2026/04/21/26dcedf919f94106898a59e74e4b0223.mp4', '01-012-马克思主义哲学产生的历史意义.mp4', 12, 0, 1, 0, 0, 0, 1, '2026-04-21 21:11:07', '2026-04-21 21:11:07');
INSERT INTO `edu_video` VALUES (2046582618267156482, 2029516298644193281, 2029516446224973826, '生产方式是社会发展的决定力量', 'video/2026/04/21/e2cf7d67e9334d78880edbe84b72f660.mp4', '01-019-生产方式是社会发展的决定力量.mp4', 19, 0, 1, 0, 0, 0, 1, '2026-04-21 21:31:35', '2026-04-21 21:31:35');
INSERT INTO `edu_video` VALUES (2046584426922344449, 2029516298644193281, 2029516446224973826, '哲学史上的伟大变革', 'video/2026/04/21/a485461865dd4b45a8f704fe1e9b04dc.mp4', '01-013-哲学史上的伟大变革.mp4', 13, 0, 1, 0, 0, 0, 1, '2026-04-21 21:38:46', '2026-04-21 21:38:46');
INSERT INTO `edu_video` VALUES (2046586810633388034, 2029516298644193281, 2029516446224973826, '马克思主义的理论品质', 'video/2026/04/21/61d1bb007dbe431a81970bb808852668.mp4', '01-014-马克思主义的理论品质.mp4', 14, 0, 1, 0, 0, 0, 1, '2026-04-21 21:48:14', '2026-04-21 21:48:14');
INSERT INTO `edu_video` VALUES (2046591675564654593, 2029516298644193281, 2029516446224973826, '马克思主义哲学的中国化', 'video/2026/04/21/4c5a6d55070a49fe99f653286e939bd2.mp4', '01-015-马克思主义哲学的中国化.mp4', 15, 0, 1, 0, 0, 0, 1, '2026-04-21 22:07:34', '2026-04-21 22:07:34');
INSERT INTO `edu_video` VALUES (2046592547036168193, 2029516298644193281, 2029516446224973826, '当堂小测', 'video/2026/04/21/695e5e853ec947dd866f004e2645900e.mp4', '01-016-当堂小测.mp4', 16, 0, 1, 0, 0, 0, 1, '2026-04-21 22:11:02', '2026-04-21 22:11:02');
INSERT INTO `edu_video` VALUES (2046599095225516033, 2029516298644193281, 2029516446224973826, '学习马克思主义哲学的意义', 'video/2026/04/21/eaeb6a22087742de95345ab531db8fea.mp4', '01-017-学习马克思主义哲学的意义.mp4', 17, 0, 1, 0, 0, 0, 1, '2026-04-21 22:37:03', '2026-04-21 22:37:03');
INSERT INTO `edu_video` VALUES (2046600434361925634, 2029516298644193281, 2029516446224973826, '人类社会物质性的表现', 'video/2026/04/21/53a23dbdf76e4f75af7f2fc4bba05713.mp4', '01-018-人类社会物质性的表现.mp4', 18, 0, 1, 0, 0, 0, 1, '2026-04-21 22:42:22', '2026-04-21 22:42:22');
INSERT INTO `edu_video` VALUES (2046603243715133441, 2029516298644193281, 2029516446224973826, '意识产生漫长过程的三个决定性环节', 'video/2026/04/21/7092edb43c394a05aeff9f7db7299ba3.mp4', '01-020-意识产生漫长过程的三个决定性环节.mp4', 20, 0, 1, 0, 0, 0, 1, '2026-04-21 22:53:32', '2026-04-21 22:53:32');
INSERT INTO `edu_video` VALUES (2046607408700948481, 2029516298644193281, 2029516446224973826, '意识的产生是社会的产物', 'video/2026/04/21/fb5be5cc6fe6479886498833a7b90b2b.mp4', '01-021-意识的产生是社会的产物.mp4', 21, 0, 1, 0, 0, 0, 1, '2026-04-21 23:10:05', '2026-04-21 23:10:05');
INSERT INTO `edu_video` VALUES (2046610902992388098, 2029516298644193281, 2029516446224973826, '第一信号系统和第二信号系统', 'video/2026/04/21/366c472de33f4b9c9bbc9d460cebf07f.mp4', '01-022-第一信号系统和第二信号系统.mp4', 22, 0, 1, 0, 0, 0, 1, '2026-04-21 23:23:58', '2026-04-21 23:23:58');
INSERT INTO `edu_video` VALUES (2046617165943898114, 2029516298644193281, 2029516446224973826, '意识的本质', NULL, '01-023-意识的本质.mp4', 23, 0, 1, 0, 0, 0, 1, '2026-04-21 23:48:51', '2026-04-21 23:48:51');
INSERT INTO `edu_video` VALUES (2046618967015784450, 2029516298644193281, 2029516446224973826, '意识的特征', 'video/2026/04/21/f9a05d9f338e4defb8bd36b9a6a1966d.mp4', '01-024-意识的特征.mp4', 24, 0, 1, 0, 0, 0, 1, '2026-04-21 23:56:01', '2026-04-21 23:56:01');
INSERT INTO `edu_video` VALUES (2046620091269611521, 2029516298644193281, 2029516446224973826, '意识主观性的表现', 'video/2026/04/22/081fd28403af4b15a3cddf15e18c745d.mp4', '01-025-意识主观性的表现.mp4', 25, 0, 1, 0, 0, 0, 1, '2026-04-22 00:00:29', '2026-04-22 00:00:29');
INSERT INTO `edu_video` VALUES (2046620379065974786, 2029516298644193281, 2029516446224973826, '意识的客观性', 'video/2026/04/22/1d458ffea23a411db5c638ac3fa50784.mp4', '01-026-意识的客观性.mp4', 26, 0, 1, 0, 0, 0, 1, '2026-04-22 00:01:37', '2026-04-22 00:01:37');
INSERT INTO `edu_video` VALUES (2046620745144827905, 2029516298644193281, 2029516446224973826, '意识的能动作用', 'video/2026/04/22/4d2549d1344e4dec84f36cbf5f7ee066.mp4', '01-027-意识的能动作用.mp4', 27, 0, 1, 0, 0, 0, 1, '2026-04-22 00:03:05', '2026-04-22 00:03:05');
INSERT INTO `edu_video` VALUES (2046621525071462402, 2029516298644193281, 2029516446224973826, '意识能动性的表现', 'video/2026/04/22/243b17ed8d9244aab436b7b51046a8e2.mp4', '01-028-意识能动性的表现.mp4', 28, 0, 1, 0, 0, 0, 1, '2026-04-22 00:06:11', '2026-04-22 00:06:11');
INSERT INTO `edu_video` VALUES (2046834004997275650, 2025585730432540673, 2025585979117019138, '冠词词法（2）', 'video/2026/04/22/8f81cf1b1c414aa891fee529ba98ce4e.mp4', '02-006-词法冠词(2).mp4', 6, 0, 1, 0, 0, 0, 1, '2026-04-22 14:10:30', '2026-04-22 14:10:30');
INSERT INTO `edu_video` VALUES (2046891077898436609, 2046890290522718210, 2046890400237322242, '函数概念', 'video/2026/04/22/b9db684d13484dac843a2663b240fc02.mp4', '01-001-函数概念.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-04-22 17:57:17', '2026-04-22 17:57:17');
INSERT INTO `edu_video` VALUES (2046897158594854914, 2025585730432540673, 2025585979117019138, '冠词词法（3）', 'video/2026/04/22/f034fc3aa6d24579a90334b011e46139.mp4', '02-007-词法冠词(3).mp4', 7, 0, 1, 0, 0, 0, 1, '2026-04-22 18:21:27', '2026-04-22 18:21:27');
INSERT INTO `edu_video` VALUES (2046902758833750018, 2025585730432540673, 2025585979117019138, '代词词法(1)', 'video/2026/04/22/cef75978c4d74d069fc3ae610c784022.mp4', '03-008-词法代词(1).mp4', 8, 0, 1, 0, 0, 0, 1, '2026-04-22 18:43:42', '2026-04-22 18:43:42');
INSERT INTO `edu_video` VALUES (2046908735876333569, 2025585730432540673, 2025585979117019138, '代词词法(2)', 'video/2026/04/22/ddc52fbb95ef4885ab0288163b4e7d7c.mp4', '03-009-词法代词(2).mp4', 9, 0, 1, 0, 0, 0, 1, '2026-04-22 19:07:27', '2026-04-22 19:07:27');
INSERT INTO `edu_video` VALUES (2046912069475598337, 2025585730432540673, 2025585979117019138, '代词词法(3)', 'video/2026/04/22/d79e2b2fa82e4579b1715b7097ecc336.mp4', '03-010-词法代词(3).mp4', 10, 0, 1, 0, 0, 0, 1, '2026-04-22 19:20:42', '2026-04-22 19:20:42');
INSERT INTO `edu_video` VALUES (2046921049086197761, 2025585730432540673, 2025585979117019138, '数词词法(1)', 'video/2026/04/22/8f2c54ebd3b04146829c51b87576f874.mp4', '04-011-词法数词.mp4', 11, 0, 1, 0, 0, 0, 1, '2026-04-22 19:56:23', '2026-04-22 19:56:23');
INSERT INTO `edu_video` VALUES (2046926351474982913, 2025585730432540673, 2025585979117019138, '数词词法(2)', 'video/2026/04/22/918659c8613345a48f8a98d9803ba8fe.mp4', '04-012-词法数词(2).mp4', 12, 0, 1, 0, 0, 0, 1, '2026-04-22 20:17:27', '2026-04-22 20:17:27');
INSERT INTO `edu_video` VALUES (2046928711668563969, 2025585730432540673, 2025585979117019138, '数词词法(3)', 'video/2026/04/22/485ca1f595f7438891bf6972009a6702.mp4', '04-013-词法数词(3).mp4', 13, 0, 1, 0, 0, 0, 1, '2026-04-22 20:26:50', '2026-04-22 20:26:50');
INSERT INTO `edu_video` VALUES (2046950534242205698, 2046890290522718210, 2046890400237322242, '求解具体函数定义域', 'video/2026/04/22/eda9c8ffb2ff4340a83525b2848f7e5c.mp4', '01-002-求解具体函数定义域.mp4', 2, 0, 1, 0, 0, 0, 1, '2026-04-22 21:53:33', '2026-04-22 21:53:33');
INSERT INTO `edu_video` VALUES (2046952257392312322, 2046890290522718210, 2046890400237322242, '求解抽象函数定义域', 'video/2026/04/22/7ee8be0710bd44df83b3dce562e653eb.mp4', '01-003-求解抽象函数定义域.mp4', 3, 0, 1, 0, 0, 0, 1, '2026-04-22 22:00:23', '2026-04-22 22:00:23');
INSERT INTO `edu_video` VALUES (2046954625668317186, 2046890290522718210, 2046890400237322242, '求解函数表达式', 'video/2026/04/22/5bb4219212ce416fa8c3bcfe4ba01a55.mp4', '01-004-求解函数表达式.mp4', 4, 0, 1, 0, 0, 0, 1, '2026-04-22 22:09:48', '2026-04-22 22:09:48');
INSERT INTO `edu_video` VALUES (2046955229878779906, 2046890290522718210, 2046890400237322242, '反函数概念', 'video/2026/04/22/b469e85f46834e8babcc693d78f27a0b.mp4', '01-005-反函数概念.mp4', 5, 0, 1, 0, 0, 0, 1, '2026-04-22 22:12:12', '2026-04-22 22:12:12');
INSERT INTO `edu_video` VALUES (2046961481203679234, 2046957172130938881, 2046957467179253762, '计算机的发展历史(1)', 'video/2026/04/22/0e8fd4f2a6fa4c5bac9da5e4bd91f7ee.mp4', '01-001-计算机的发展历史(1).mp4', 1, 0, 1, 0, 0, 0, 1, '2026-04-22 22:37:02', '2026-04-22 22:37:02');
INSERT INTO `edu_video` VALUES (2046964926358847489, 2046957172130938881, 2046957467179253762, '计算机的发展历史(2)', 'video/2026/04/22/3f58a2d19ab84107b81efdec16c1e359.mp4', '01-002-计算机的发展历史(2).mp4', 2, 0, 1, 0, 0, 0, 1, '2026-04-22 22:50:44', '2026-04-22 22:50:44');
INSERT INTO `edu_video` VALUES (2046966893927825410, 2046957172130938881, 2046957467179253762, '计算机的特点和分类', 'video/2026/04/22/e3501d192bb34ed4a04389358b78762a.mp4', '01-003-计算机的特点和分类.mp4', 3, 0, 1, 0, 0, 0, 1, '2026-04-22 22:58:33', '2026-04-22 22:58:33');
INSERT INTO `edu_video` VALUES (2046970399690686466, 2046957172130938881, 2046957467179253762, '计算机的应用', 'video/2026/04/22/06b779b977fc459bab5cea3f4a6ccbbe.mp4', '01-004-计算机的应用.mp4', 4, 0, 1, 0, 0, 0, 1, '2026-04-22 23:12:29', '2026-04-22 23:12:29');
INSERT INTO `edu_video` VALUES (2054826186492416002, 2046890290522718210, 2046890400237322242, '常见的基本初等函数', 'video/2026/05/14/faf4cf89a389428db67166fcb1ad667c.mp4', '01-006-常见的基本初等函数.mp4', 6, 0, 1, 0, 0, 0, 1, '2026-05-14 15:28:34', '2026-05-14 15:28:34');
INSERT INTO `edu_video` VALUES (2054832132069330946, 2046890290522718210, 2046890400237322242, '复合函数及其分解', 'video/2026/05/14/7defc3fffc3a4cc4a93670d6a7c04249.mp4', '01-007-复合函数及其分解.mp4', 7, 0, 1, 0, 0, 0, 1, '2026-05-14 15:52:12', '2026-05-14 15:52:12');
INSERT INTO `edu_video` VALUES (2054836474709086210, 2046890290522718210, 2046890400237322242, '函数奇偶性', 'video/2026/05/14/037220f486a64a93a76d399038777214.mp4', '01-008-函数奇偶性.mp4', 8, 0, 1, 0, 0, 0, 1, '2026-05-14 16:09:27', '2026-05-14 16:09:27');
INSERT INTO `edu_video` VALUES (2054838433381945346, 2046890290522718210, 2046890400237322242, '函数性质2', 'video/2026/05/14/2f9b8825ed4f4c878b9ae61d611e4cb5.mp4', '01-009-函数性质2.mp4', 9, 0, 1, 0, 0, 0, 1, '2026-05-14 16:17:14', '2026-05-14 16:17:14');
INSERT INTO `edu_video` VALUES (2054838890003238913, 2046890290522718210, 2046890400237322242, '极限概念', 'video/2026/05/14/7a276ee15b574a7ba3e6fa81926665b7.mp4', '01-010-极限概念.mp4', 10, 0, 1, 0, 0, 0, 1, '2026-05-14 16:19:03', '2026-05-14 16:19:03');
INSERT INTO `edu_video` VALUES (2054847206595039233, 2046890290522718210, 2046890400237322242, '极限及其四则运算', 'video/2026/05/14/bc7735f5faf2411795c0096b28ad895b.mp4', '01-011-极限及其四则运算.mp4', 11, 0, 1, 0, 0, 0, 1, '2026-05-14 16:52:06', '2026-05-14 16:52:06');
INSERT INTO `edu_video` VALUES (2054853189639671809, 2046890290522718210, 2046890400237322242, '函数极限计算小知识', 'video/2026/05/14/5623ed4c230b468993816a6b2b4fa75d.mp4', '01-012-函数极限计算小知识.mp4', 12, 0, 1, 0, 0, 0, 1, '2026-05-14 17:15:52', '2026-05-14 17:15:52');
INSERT INTO `edu_video` VALUES (2054865080223076353, 2046890290522718210, 2046890400237322242, '无穷比无穷极限计算', 'video/2026/05/14/5cbf16e0807c4bf592fa7752f9cb5004.mp4', '01-013-无穷比无穷极限计算.mp4', 13, 0, 1, 0, 0, 0, 1, '2026-05-14 18:03:07', '2026-05-14 18:03:07');
INSERT INTO `edu_video` VALUES (2054870802159702017, 2046890290522718210, 2046890400237322242, '零比零函数极限计算', 'video/2026/05/14/99f6799caf49429ca2fbad42dc9914c1.mp4', '01-014-零比零函数极限计算.mp4', 14, 0, 1, 0, 0, 0, 1, '2026-05-14 18:25:52', '2026-05-14 18:25:52');
INSERT INTO `edu_video` VALUES (2054871521923239938, 2046890290522718210, 2046890400237322242, '0×有界=0', 'video/2026/05/14/364f5b7467fb4f0baa290e202a11b1bd.mp4', '01-015-0×有界=0.mp4', 15, 0, 1, 0, 0, 0, 1, '2026-05-14 18:28:43', '2026-05-14 18:28:43');
INSERT INTO `edu_video` VALUES (2054874068557828098, 2046890290522718210, 2046890400237322242, '洛必达法则', 'video/2026/05/14/0d74f82d8aba480193ab4d8c26ae4082.mp4', '01-016-洛必达法则.mp4', 16, 0, 1, 0, 0, 0, 1, '2026-05-14 18:38:50', '2026-05-14 18:38:50');
INSERT INTO `edu_video` VALUES (2054875139158118401, 2046890290522718210, 2046890400237322242, '0×∞型极限计算', 'video/2026/05/14/376f760dc91548cfa9fd2f70302decdc.mp4', '01-017-0×∞型极限计算.mp4', 17, 0, 1, 0, 0, 0, 1, '2026-05-14 18:43:06', '2026-05-14 18:43:06');
INSERT INTO `edu_video` VALUES (2054877157847273474, 2046890290522718210, 2046890400237322242, '∞—∞极限计算', 'video/2026/05/14/a6b90725caba4788b3470645dd6aabe2.mp4', '01-018-∞—∞极限计算.mp4', 18, 0, 1, 0, 0, 0, 1, '2026-05-14 18:51:07', '2026-05-14 18:51:07');
INSERT INTO `edu_video` VALUES (2054879301774151681, 2046890290522718210, 2046890400237322242, 'U^v型极限计算', 'video/2026/05/14/380fdf3048d74c238d0baa1493409f06.mp4', '01-019-U^v型极限计算.mp4', 19, 0, 1, 0, 0, 0, 1, '2026-05-14 18:59:38', '2026-05-14 18:59:38');
INSERT INTO `edu_video` VALUES (2054879809750503425, 2046890290522718210, 2046890400237322242, '函数极限计算小结', 'video/2026/05/14/636b440037514aa49d4df7772cb85576.mp4', '01-020-函数极限计算小结.mp4', 20, 0, 1, 0, 0, 0, 1, '2026-05-14 19:01:39', '2026-05-14 19:01:39');
INSERT INTO `edu_video` VALUES (2054881916264189953, 2046890290522718210, 2046890400237322242, '函数的左右极限常考图像', 'video/2026/05/14/ac9ea30e1a1f4872a50cd177b7b4557b.mp4', '01-021-函数的左右极限常考图像.mp4', 21, 0, 1, 0, 0, 0, 1, '2026-05-14 19:10:01', '2026-05-14 19:10:01');
INSERT INTO `edu_video` VALUES (2054893934065029121, 2046890290522718210, 2046890400237322242, '左右极限的计算', 'video/2026/05/14/515a03b6473048ffbbbe6e4881a43642.mp4', '01-022-左右极限的计算.mp4', 22, 0, 1, 0, 0, 0, 1, '2026-05-14 19:57:47', '2026-05-14 19:57:47');
INSERT INTO `edu_video` VALUES (2054909993463648257, 2046890290522718210, 2046890400237322242, '三明治定理', 'video/2026/05/14/5bfb38f3ac1b4d22b781c1f7126b1177.mp4', '01-023-三明治定理.mp4', 23, 0, 1, 0, 0, 0, 1, '2026-05-14 21:01:35', '2026-05-14 21:17:36');
INSERT INTO `edu_video` VALUES (2054921685719388162, 2046890290522718210, 2046890400237322242, '连续', 'video/2026/05/14/c9aeb24984c34ed68f36ae9d6b547988.mp4', '01-024-连续.mp4', 24, 0, 1, 0, 0, 0, 1, '2026-05-14 21:48:03', '2026-05-14 21:48:03');
INSERT INTO `edu_video` VALUES (2054927889547988994, 2046890290522718210, 2046890400237322242, '函数间断点及其类型', 'video/2026/05/14/33851d1cb37940d883335f27f18df6bb.mp4', '01-025-函数间断点及其类型.mp4', 25, 0, 1, 0, 0, 0, 1, '2026-05-14 22:12:42', '2026-05-14 22:12:42');
INSERT INTO `edu_video` VALUES (2054933975973826561, 2046890290522718210, 2046890400237322242, '无穷小量的比较', 'video/2026/05/14/577bb3e895c74424a524687951e08780.mp4', '01-026-无穷小量的比较.mp4', 26, 0, 1, 0, 0, 0, 1, '2026-05-14 22:36:53', '2026-05-14 22:36:53');
INSERT INTO `edu_video` VALUES (2054938111666622466, 2046890290522718210, 2046890400237322242, '利用极限求曲线渐近线', 'video/2026/05/14/fe3251af3eb7452d83d4f63efe1c67d7.mp4', '01-027-利用极限求曲线渐近线.mp4', 27, 0, 1, 0, 0, 0, 1, '2026-05-14 22:53:19', '2026-05-14 22:53:19');
INSERT INTO `edu_video` VALUES (2077353256782692353, 2025585730432540673, 2025585979117019138, '形容词词法(1)', 'video/2026/07/15/3770def551b54ef59dbcc644a99743c0.mp4', '05-014-词法形容词(1).mp4', 14, 0, 1, 0, 0, 0, 1, '2026-07-15 19:23:06', '2026-07-15 19:23:06');
INSERT INTO `edu_video` VALUES (2077353354807771137, 2025585730432540673, 2025585979117019138, '形容词词法(2)', 'video/2026/07/15/ef5f7ab7ebda467b9c483dd625d4182a.mp4', '05-015-词法形容词(2).mp4', 15, 0, 1, 0, 0, 0, 1, '2026-07-15 19:23:30', '2026-07-15 19:23:30');
INSERT INTO `edu_video` VALUES (2077353495346315266, 2025585730432540673, 2025585979117019138, '形容词词法(3)', 'video/2026/07/15/4b9ad26d823444d6bb7f8f71d280d9f9.mp4', '05-016-词法形容词(3).mp4', 16, 0, 1, 0, 0, 0, 1, '2026-07-15 19:24:03', '2026-07-15 19:24:03');
INSERT INTO `edu_video` VALUES (2077353741161889793, 2025585730432540673, 2025585979117019138, '形容词词法(4)', 'video/2026/07/15/aaf44bad344449c3b092de01babaa308.mp4', '05-017-词法形容词(4).mp4', 17, 0, 1, 0, 0, 0, 1, '2026-07-15 19:25:02', '2026-07-15 19:25:02');
INSERT INTO `edu_video` VALUES (2077354130191974402, 2025585730432540673, 2025585979117019138, '副词词法(1)', 'video/2026/07/15/44278de2d1654f70a1888c130299315f.mp4', '06-018-词法副词(1).mp4', 18, 0, 1, 0, 0, 0, 1, '2026-07-15 19:26:35', '2026-07-15 19:26:35');
INSERT INTO `edu_video` VALUES (2077354324300169217, 2025585730432540673, 2025585979117019138, '副词词法(2)', 'video/2026/07/15/168637217519495cafd236e3174a40ce.mp4', '06-019-词法副词(2).mp4', 19, 0, 1, 0, 0, 0, 1, '2026-07-15 19:27:21', '2026-07-15 19:27:21');
INSERT INTO `edu_video` VALUES (2077354552105402370, 2025585730432540673, 2025585979117019138, '副词词法(3)', 'video/2026/07/15/137ccfce940a4755a34518aada0e192b.mp4', '06-020-词法副词(3).mp4', 20, 0, 1, 0, 0, 0, 1, '2026-07-15 19:28:15', '2026-07-15 19:28:15');
INSERT INTO `edu_video` VALUES (2077354638810054658, 2025585730432540673, 2025585979117019138, '副词词法(3)', 'video/2026/07/15/137ccfce940a4755a34518aada0e192b.mp4', '06-020-词法副词(3).mp4', 20, 0, 1, 0, 0, 0, 1, '2026-07-15 19:28:36', '2026-07-15 19:28:36');
INSERT INTO `edu_video` VALUES (2077354891898552321, 2025585730432540673, 2025585979117019138, '连词词法(1)', 'video/2026/07/15/c15e9fe8afdc4321961dfbf707e55943.mp4', '07-021-词法连词(1).mp4', 21, 0, 1, 0, 0, 0, 1, '2026-07-15 19:29:36', '2026-07-15 19:29:36');
INSERT INTO `edu_video` VALUES (2077354985620275202, 2025585730432540673, 2025585979117019138, '连词词法(2)', 'video/2026/07/15/fa858f1bcbf04e68b39fbae8680c39b9.mp4', '07-022-词法连词(2).mp4', 22, 0, 1, 0, 0, 0, 1, '2026-07-15 19:29:59', '2026-07-15 19:29:59');
INSERT INTO `edu_video` VALUES (2077355076175298561, 2025585730432540673, 2025585979117019138, '连词词法(3)', 'video/2026/07/15/4a97f983ff524efc949ef6f0e5df9477.mp4', '07-023-词法连词(3).mp4', 23, 0, 1, 0, 0, 0, 1, '2026-07-15 19:30:20', '2026-07-15 19:30:20');
INSERT INTO `edu_video` VALUES (2077355276268765186, 2025585730432540673, 2025585979117019138, '介词词法(1)', 'video/2026/07/15/48bfb45dc8394096bd48b43b851b1f55.mp4', '08-024-词法介词(1).mp4', 24, 0, 1, 0, 0, 0, 1, '2026-07-15 19:31:08', '2026-07-15 19:31:08');
INSERT INTO `edu_video` VALUES (2077355479977721857, 2025585730432540673, 2025585979117019138, '介词词法(2)', 'video/2026/07/15/df55cb6cc34249408f854b17e18cd50c.mp4', '08-025-词法介词(2).mp4', 25, 0, 1, 0, 0, 0, 1, '2026-07-15 19:31:56', '2026-07-15 19:31:56');
INSERT INTO `edu_video` VALUES (2077355571136724993, 2025585730432540673, 2025585979117019138, '介词词法(3)', 'video/2026/07/15/d24f0d9d960f45e3863f1af40ea4dd4a.mp4', '08-026-词法介词(3).mp4', 26, 0, 1, 0, 0, 0, 1, '2026-07-15 19:32:18', '2026-07-15 19:32:18');
INSERT INTO `edu_video` VALUES (2077355699276906497, 2025585730432540673, 2025585979117019138, '介词词法(4)', 'video/2026/07/15/9433bd23718a4e39a85524704e4f8cfe.mp4', '08-027-词法介词(4).mp4', 27, 0, 1, 0, 0, 0, 1, '2026-07-15 19:32:49', '2026-07-15 19:32:49');
INSERT INTO `edu_video` VALUES (2077355793371922434, 2025585730432540673, 2025585979117019138, '介词词法(5)', 'video/2026/07/15/2d755a72154b48ae972edc5d3cc6f9a7.mp4', '08-028-词法介词(5).mp4', 28, 0, 1, 0, 0, 0, 1, '2026-07-15 19:33:11', '2026-07-15 19:33:11');
INSERT INTO `edu_video` VALUES (2077355954366087170, 2025585730432540673, 2025585979117019138, '动词词法(1)', 'video/2026/07/15/a2aea19b8c23456f9cda50c63cf0f236.mp4', '09-029-词法动词(1).mp4', 29, 0, 1, 0, 0, 0, 1, '2026-07-15 19:33:50', '2026-07-15 19:33:50');
INSERT INTO `edu_video` VALUES (2077356088583815170, 2025585730432540673, 2025585979117019138, '动词词法(2)', 'video/2026/07/15/a7621923b89a4098bcd992a08cb23633.mp4', '09-030-词法动词(2).mp4', 30, 0, 1, 0, 0, 0, 1, '2026-07-15 19:34:22', '2026-07-15 19:34:22');
INSERT INTO `edu_video` VALUES (2077356171798806530, 2025585730432540673, 2025585979117019138, '动词词法(3)', 'video/2026/07/15/60f8a6ac621e47f2b89c6898e3f15a67.mp4', '09-031-词法动词(3).mp4', 31, 0, 1, 0, 0, 0, 1, '2026-07-15 19:34:41', '2026-07-15 19:34:41');
INSERT INTO `edu_video` VALUES (2077356246251896834, 2025585730432540673, 2025585979117019138, '动词词法(4)', 'video/2026/07/15/bfc8270249ea49148b6b2daa8eea8bd2.mp4', '09-032-词法动词(4).mp4', 32, 0, 1, 0, 0, 0, 1, '2026-07-15 19:34:59', '2026-07-15 19:34:59');
INSERT INTO `edu_video` VALUES (2077356329626271745, 2025585730432540673, 2025585979117019138, '动词词法(5)', 'video/2026/07/15/e020cd9d88f3452fb60a3a7cc988a7cd.mp4', '09-033-词法动词(5).mp4', 33, 0, 1, 0, 0, 0, 1, '2026-07-15 19:35:19', '2026-07-15 19:35:19');
INSERT INTO `edu_video` VALUES (2077356406453338113, 2025585730432540673, 2025585979117019138, '动词词法(6)', 'video/2026/07/15/b6b90bfaed324a2e8440eceb68fc7675.mp4', '09-034-词法动词(6).mp4', 6, 0, 1, 0, 0, 0, 1, '2026-07-15 19:35:37', '2026-07-15 19:35:37');
INSERT INTO `edu_video` VALUES (2077356871404519425, 2046890290522718210, 2046890400237322242, '导数由来', 'video/2026/07/15/28b72b9716204211aef38ba7034c43e0.mp4', '02-028-导数由来.mp4', 28, 0, 1, 0, 0, 0, 1, '2026-07-15 19:37:28', '2026-07-15 19:37:28');
INSERT INTO `edu_video` VALUES (2077357151240093697, 2046890290522718210, 2046890400237322242, '导数的定义(1)', 'video/2026/07/15/ea6782808c8d4d85b36617309360e2b8.mp4', '02-029-导数的定义1.mp4', 29, 0, 1, 0, 0, 0, 1, '2026-07-15 19:38:35', '2026-07-15 19:38:35');
INSERT INTO `edu_video` VALUES (2077357233150656513, 2046890290522718210, 2046890400237322242, '导数的定义(2)', 'video/2026/07/15/f33e88ee846641b08f4ebc07f3f84b79.mp4', '02-030-导数的定义2.mp4', 30, 0, 1, 0, 0, 0, 1, '2026-07-15 19:38:54', '2026-07-15 19:38:54');
INSERT INTO `edu_video` VALUES (2077357335143546881, 2046890290522718210, 2046890400237322242, '左右导数及其相关结论', 'video/2026/07/15/17e3bcec63ca45e98e1b8fcb9af2d85d.mp4', '02-031-左右导数及其相关结论.mp4', 31, 0, 1, 0, 0, 0, 1, '2026-07-15 19:39:19', '2026-07-15 19:39:19');
INSERT INTO `edu_video` VALUES (2077357597014917122, 2046890290522718210, 2046890400237322242, '不可导的情况', 'video/2026/07/15/1de0e672452e48a89ef117d9b9064be0.mp4', '02-032-不可导的情况.mp4', 32, 0, 1, 0, 0, 0, 1, '2026-07-15 19:40:21', '2026-07-15 19:40:21');
INSERT INTO `edu_video` VALUES (2077357698705817601, 2046890290522718210, 2046890400237322242, '各大类函数求导公式', 'video/2026/07/15/d6b2ac60b42144c59b7619991f2395f9.mp4', '02-033-各大类函数求导公式.mp4', 33, 0, 1, 0, 0, 0, 1, '2026-07-15 19:40:45', '2026-07-15 19:40:45');
INSERT INTO `edu_video` VALUES (2077357763268739074, 2046890290522718210, 2046890400237322242, '各大类函数求导公式', 'video/2026/07/15/d6b2ac60b42144c59b7619991f2395f9.mp4', '02-033-各大类函数求导公式.mp4', 33, 0, 1, 0, 0, 0, 1, '2026-07-15 19:41:01', '2026-07-15 19:41:01');
INSERT INTO `edu_video` VALUES (2077357859628679170, 2046890290522718210, 2046890400237322242, '导数的四则、复合运算法则', 'video/2026/07/15/64c89b76cd22483eac49cb07d8952049.mp4', '02-034-导数的四则、复合运算法则.mp4', 34, 0, 1, 0, 0, 0, 1, '2026-07-15 19:41:24', '2026-07-15 19:41:24');
INSERT INTO `edu_video` VALUES (2077357933310017538, 2046890290522718210, 2046890400237322242, '初等函数求导', 'video/2026/07/15/84c3b314f253441f844132bd7e4423db.mp4', '02-035-初等函数求导.mp4', 35, 0, 1, 0, 0, 0, 1, '2026-07-15 19:41:41', '2026-07-15 19:41:41');
INSERT INTO `edu_video` VALUES (2077358021344264193, 2046890290522718210, 2046890400237322242, '复合函数求导', 'video/2026/07/15/98dc80384ba5414fbff7a8c89a61cf57.mp4', '02-036-复合函数求导.mp4', 36, 0, 1, 0, 0, 0, 1, '2026-07-15 19:42:02', '2026-07-15 19:42:02');
INSERT INTO `edu_video` VALUES (2077358130052235266, 2046890290522718210, 2046890400237322242, '复合函数难题讲解', 'video/2026/07/15/9b4fa0354182429b8e9c54097f9e65b7.mp4', '02-037-复合函数难题讲解.mp4', 37, 0, 1, 0, 0, 0, 1, '2026-07-15 19:42:28', '2026-07-15 19:42:28');
INSERT INTO `edu_video` VALUES (2077358278161498114, 2046890290522718210, 2046890400237322242, '分段函数求导', 'video/2026/07/15/71f0654f54424d6fbfc8364a36d29353.mp4', '02-038-分段函数求导.mp4', 38, 0, 1, 0, 0, 0, 1, '2026-07-15 19:43:04', '2026-07-15 19:43:04');
INSERT INTO `edu_video` VALUES (2077358361602981890, 2046890290522718210, 2046890400237322242, '隐函数求导', 'video/2026/07/15/309a14b1dc9346dca883fd2b1292868d.mp4', '02-039-隐函数求导.mp4', 39, 0, 1, 0, 0, 0, 1, '2026-07-15 19:43:24', '2026-07-15 19:43:24');
INSERT INTO `edu_video` VALUES (2077358477747453953, 2046890290522718210, 2046890400237322242, '参数方程求导', 'video/2026/07/15/b9af1ad0c40a43328b815c31ac6a4aca.mp4', '02-040-参数方程求导.mp4', 40, 0, 1, 0, 0, 0, 1, '2026-07-15 19:43:51', '2026-07-15 19:43:51');
INSERT INTO `edu_video` VALUES (2077358557648945154, 2046890290522718210, 2046890400237322242, '幂指函数求导', 'video/2026/07/15/215da0e39a214ccd8757e219342cf671.mp4', '02-041-幂指函数求导.mp4', 41, 0, 1, 0, 0, 0, 1, '2026-07-15 19:44:10', '2026-07-15 19:44:10');
INSERT INTO `edu_video` VALUES (2077358639232352257, 2046890290522718210, 2046890400237322242, '变限积分求导', 'video/2026/07/15/32baea17ee9449f29268834777496535.mp4', '02-042-变限积分求导.mp4', 42, 0, 1, 0, 0, 0, 1, '2026-07-15 19:44:30', '2026-07-15 19:44:30');
INSERT INTO `edu_video` VALUES (2077358719901401090, 2046890290522718210, 2046890400237322242, '高阶导数', 'video/2026/07/15/0383e22944a54f6aa52544c68cf636fa.mp4', '02-043-高阶导数.mp4', 43, 0, 1, 0, 0, 0, 1, '2026-07-15 19:44:49', '2026-07-15 19:44:49');
INSERT INTO `edu_video` VALUES (2077358853259296770, 2046890290522718210, 2046890400237322242, '函数的微分', 'video/2026/07/15/1367e5c07fc84a35ae1205799c936f01.mp4', '02-044-函数的微分.mp4', 44, 0, 1, 0, 0, 0, 1, '2026-07-15 19:45:21', '2026-07-15 19:45:21');
INSERT INTO `edu_video` VALUES (2077358970611728385, 2046890290522718210, 2046890400237322242, '导数的几何应用', 'video/2026/07/15/7ca0528b302d4d3eaede97748995436d.mp4', '02-045-导数的几何应用.mp4', 45, 0, 1, 0, 0, 0, 1, '2026-07-15 19:45:49', '2026-07-15 19:45:49');
INSERT INTO `edu_video` VALUES (2077359060206256129, 2046890290522718210, 2046890400237322242, '一阶导确定函数单调性', 'video/2026/07/15/4909bcb6c64146d1b4e70f5fd965eb1c.mp4', '02-046-一阶导确定函数单调性.mp4', 46, 0, 1, 0, 0, 0, 1, '2026-07-15 19:46:10', '2026-07-15 19:46:10');
INSERT INTO `edu_video` VALUES (2077359140158078977, 2046890290522718210, 2046890400237322242, '函数的极值', 'video/2026/07/15/8380c2d9d5a941a99bce34e665dd8e3e.mp4', '02-047-函数的极值.mp4', 47, 0, 1, 0, 0, 0, 1, '2026-07-15 19:46:29', '2026-07-15 19:46:29');
INSERT INTO `edu_video` VALUES (2077359220038598657, 2046890290522718210, 2046890400237322242, '极值点和驻点的关系', 'video/2026/07/15/3e20d7abbb1b4a898440a1ed5ed42695.mp4', '02-048-极值点和驻点的关系.mp4', 48, 0, 1, 0, 0, 0, 1, '2026-07-15 19:46:48', '2026-07-15 19:46:48');
INSERT INTO `edu_video` VALUES (2077359298333671426, 2046890290522718210, 2046890400237322242, '函数的最值', 'video/2026/07/15/b81299873830492cb73c76f00a096499.mp4', '02-049-函数的最值.mp4', 49, 0, 1, 0, 0, 0, 1, '2026-07-15 19:47:07', '2026-07-15 19:47:07');
INSERT INTO `edu_video` VALUES (2077359385487114242, 2046890290522718210, 2046890400237322242, '函数的凹凸性和拐点', 'video/2026/07/15/44a3614f4bbb4cccbe7f63d3f1e66e98.mp4', '02-050-函数的凹凸性和拐点.mp4', 50, 0, 1, 0, 0, 0, 1, '2026-07-15 19:47:28', '2026-07-15 19:47:28');
INSERT INTO `edu_video` VALUES (2077359471659089922, 2046890290522718210, 2046890400237322242, '不定积分概念和性质', 'video/2026/07/15/d8e70efa1b2f41e0bc09d65bb1b5d30c.mp4', '03-051-不定积分概念和性质.mp4', 51, 0, 1, 0, 0, 0, 1, '2026-07-15 19:47:48', '2026-07-15 19:47:48');
INSERT INTO `edu_video` VALUES (2077359552282001410, 2046890290522718210, 2046890400237322242, '原函数习题', 'video/2026/07/15/b8b085a9808f491db00d01ba13fc918e.mp4', '03-052-原函数习题.mp4', 52, 0, 1, 0, 0, 0, 1, '2026-07-15 19:48:07', '2026-07-15 19:48:07');
INSERT INTO `edu_video` VALUES (2077359631533375489, 2046890290522718210, 2046890400237322242, '不定积分性质习题', 'video/2026/07/15/23d46205969f408189e83dd42bd61c4e.mp4', '03-053-不定积分性质习题.mp4', 53, 0, 1, 0, 0, 0, 1, '2026-07-15 19:48:26', '2026-07-15 19:48:26');
INSERT INTO `edu_video` VALUES (2077359774609473537, 2046890290522718210, 2046890400237322242, '直接积分法习题(1)', 'video/2026/07/15/682fc2b4891148d38639d03ab786d9b5.mp4', '03-054-直接积分法习题1.mp4', 54, 0, 1, 0, 0, 0, 1, '2026-07-15 19:49:00', '2026-07-15 19:49:00');
INSERT INTO `edu_video` VALUES (2077359846797639681, 2046890290522718210, 2046890400237322242, '直接积分法习题(2)', 'video/2026/07/15/94946f5fc5c34e318fe78dfb1e456561.mp4', '03-055-直接积分法习题2.mp4', 55, 0, 1, 0, 0, 0, 1, '2026-07-15 19:49:18', '2026-07-15 19:49:18');
INSERT INTO `edu_video` VALUES (2077359999755517954, 2046890290522718210, 2046890400237322242, '直接积分法习题(3)', 'video/2026/07/15/063230b3f1a14ed9af43f2cee4831b0f.mp4', '03-056-直接积分法习题3.mp4', 56, 0, 1, 0, 0, 0, 1, '2026-07-15 19:49:54', '2026-07-15 19:49:54');
INSERT INTO `edu_video` VALUES (2077360132253581313, 2046890290522718210, 2046890400237322242, '凑微分法(1)', 'video/2026/07/15/5b1036062b02450bb4af72e02176c52f.mp4', '03-057-凑微分法1.mp4', 57, 0, 1, 0, 0, 0, 1, '2026-07-15 19:50:26', '2026-07-15 19:50:26');
INSERT INTO `edu_video` VALUES (2077360253863231490, 2046890290522718210, 2046890400237322242, '凑微分法(2)', 'video/2026/07/15/7c7728e722b44c7ba7c22471f8309712.mp4', '03-058-凑微分法2.mp4', 58, 0, 1, 0, 0, 0, 1, '2026-07-15 19:50:55', '2026-07-15 19:50:55');
INSERT INTO `edu_video` VALUES (2077360364039208961, 2046890290522718210, 2046890400237322242, '凑微分法(3)', 'video/2026/07/15/0f178435ce7d4658b6ca86d122d2eefd.mp4', '03-059-凑微分法3.mp4', 59, 0, 1, 0, 0, 0, 1, '2026-07-15 19:51:21', '2026-07-15 19:51:21');
INSERT INTO `edu_video` VALUES (2077360455852523522, 2046890290522718210, 2046890400237322242, '凑微分法(4)', 'video/2026/07/15/39fe6c8b55fe4882b9aa86fa25e73cc2.mp4', '03-060-凑微分法4.mp4', 60, 0, 1, 0, 0, 0, 1, '2026-07-15 19:51:43', '2026-07-15 19:51:43');
INSERT INTO `edu_video` VALUES (2077360536429297666, 2046890290522718210, 2046890400237322242, '无理根式换元法', 'video/2026/07/15/ff26f1604ec446bb80cec359403f515f.mp4', '03-061-无理根式换元法.mp4', 61, 0, 1, 0, 0, 0, 1, '2026-07-15 19:52:02', '2026-07-15 19:52:02');
INSERT INTO `edu_video` VALUES (2077360614531432450, 2046890290522718210, 2046890400237322242, '三角代换', 'video/2026/07/15/3543549611734863b8effb3bcc651a40.mp4', '03-062-三角代换.mp4', 62, 0, 1, 0, 0, 0, 1, '2026-07-15 19:52:21', '2026-07-15 19:52:21');
INSERT INTO `edu_video` VALUES (2077360709263982593, 2046890290522718210, 2046890400237322242, '分部积分法', 'video/2026/07/15/24d93aa4870240a5aa7d07f3985e8663.mp4', '03-063-分部积分法.mp4', 63, 0, 1, 0, 0, 0, 1, '2026-07-15 19:52:43', '2026-07-15 19:52:43');
INSERT INTO `edu_video` VALUES (2077360817200201730, 2046890290522718210, 2046890400237322242, '定积分概念', 'video/2026/07/15/461e84310dcd409fa6e1db2711a5ca93.mp4', '03-064-定积分概念.mp4', 64, 0, 1, 0, 0, 0, 1, '2026-07-15 19:53:09', '2026-07-15 19:53:09');
INSERT INTO `edu_video` VALUES (2077360924972843010, 2046890290522718210, 2046890400237322242, '定积分几何意义', 'video/2026/07/15/00a4bd8de2f749ec857533ba34be8899.mp4', '03-065-定积分几何意义.mp4', 65, 0, 1, 0, 0, 0, 1, '2026-07-15 19:53:35', '2026-07-15 19:53:35');
INSERT INTO `edu_video` VALUES (2077361006300397569, 2046890290522718210, 2046890400237322242, '定积分比较大小', 'video/2026/07/15/528bb6c8cadb49c1beb9c5d23ab6d820.mp4', '03-066-定积分比较大小.mp4', 66, 0, 1, 0, 0, 0, 1, '2026-07-15 19:53:54', '2026-07-15 19:53:54');
INSERT INTO `edu_video` VALUES (2077361101745979393, 2046890290522718210, 2046890400237322242, '定积分性质', 'video/2026/07/15/debd6f5433b241eeb05349531332bc7d.mp4', '03-067-定积分性质.mp4', 67, 0, 1, 0, 0, 0, 1, '2026-07-15 19:54:17', '2026-07-15 19:54:17');
INSERT INTO `edu_video` VALUES (2077361160260714497, 2046890290522718210, 2046890400237322242, '定积分性质', 'video/2026/07/15/debd6f5433b241eeb05349531332bc7d.mp4', '03-067-定积分性质.mp4', 67, 0, 1, 0, 0, 0, 1, '2026-07-15 19:54:31', '2026-07-15 19:54:31');
INSERT INTO `edu_video` VALUES (2077361248357875713, 2046890290522718210, 2046890400237322242, '定积分的计算公式', 'video/2026/07/15/103a07195c4a464381a9f5caa150b487.mp4', '03-068-定积分的计算公式.mp4', 68, 0, 1, 0, 0, 0, 1, '2026-07-15 19:54:52', '2026-07-15 19:54:52');
INSERT INTO `edu_video` VALUES (2077361329379246081, 2046890290522718210, 2046890400237322242, '定积分的运算技巧', 'video/2026/07/15/7f0cf50ef9a84064acadc3c6cd7bf20b.mp4', '03-069-定积分的运算技巧.mp4', 69, 0, 1, 0, 0, 0, 1, '2026-07-15 19:55:11', '2026-07-15 19:55:11');
INSERT INTO `edu_video` VALUES (2077361398639788033, 2046890290522718210, 2046890400237322242, '定积分偶倍奇零例题', 'video/2026/07/15/d6cfc5bb40cc456e9ea92f7f16a5c698.mp4', '03-070-定积分偶倍奇零例题.mp4', 70, 0, 1, 0, 0, 0, 1, '2026-07-15 19:55:28', '2026-07-15 19:55:28');
INSERT INTO `edu_video` VALUES (2077361478587416578, 2046890290522718210, 2046890400237322242, '定积分点火公式', 'video/2026/07/15/af1f0ea79b9b49e4a0be1a77436ff52a.mp4', '03-071-定积分点火公式.mp4', 71, 0, 1, 0, 0, 0, 1, '2026-07-15 19:55:47', '2026-07-15 19:55:47');
INSERT INTO `edu_video` VALUES (2077361514658430978, 2046890290522718210, 2046890400237322242, '定积分点火公式', 'video/2026/07/15/af1f0ea79b9b49e4a0be1a77436ff52a.mp4', '03-071-定积分点火公式.mp4', 71, 0, 1, 0, 0, 0, 1, '2026-07-15 19:55:55', '2026-07-15 19:55:55');
INSERT INTO `edu_video` VALUES (2077361601673461762, 2046890290522718210, 2046890400237322242, '定积分求圆面积', 'video/2026/07/15/24989ec270a848c6921e064e7fcf8001.mp4', '03-072-定积分求圆面积.mp4', 72, 0, 1, 0, 0, 0, 1, '2026-07-15 19:56:16', '2026-07-15 19:56:16');
INSERT INTO `edu_video` VALUES (2077361706203906049, 2046890290522718210, 2046890400237322242, '定积分的换元法', 'video/2026/07/15/397ac0f9e89141e39c0b46735a512237.mp4', '03-073-定积分的换元法.mp4', 73, 0, 1, 0, 0, 0, 1, '2026-07-15 19:56:41', '2026-07-15 19:56:41');
INSERT INTO `edu_video` VALUES (2077361783894999042, 2046890290522718210, 2046890400237322242, '分段函数定积分', 'video/2026/07/15/373ae16067e74ec1bf2ad69c6848aea1.mp4', '03-074-分段函数定积分.mp4', 74, 0, 1, 0, 0, 0, 1, '2026-07-15 19:56:59', '2026-07-15 19:56:59');
INSERT INTO `edu_video` VALUES (2077361885934026754, 2046890290522718210, 2046890400237322242, '定积分的等式证明', 'video/2026/07/15/2d359ed55ae6474786dd57d86d5a8858.mp4', '03-075-定积分的等式证明.mp4', 75, 0, 1, 0, 0, 0, 1, '2026-07-15 19:57:24', '2026-07-15 19:57:24');
INSERT INTO `edu_video` VALUES (2077362001399021569, 2046890290522718210, 2046890400237322242, '定积分等式证明例题(1)', 'video/2026/07/15/f1a9e0f5899d491197ae8e2ad2ca9682.mp4', '03-076-定积分等式证明例题1.mp4', 76, 0, 1, 0, 0, 0, 1, '2026-07-15 19:57:51', '2026-07-15 19:57:51');
INSERT INTO `edu_video` VALUES (2077362107582021633, 2046890290522718210, 2046890400237322242, '定积分等式证明例题(2)', 'video/2026/07/15/5d62110e9d0245c9828098aa7c1a2e8e.mp4', '03-077-定积分等式证明例题2.mp4', 77, 0, 1, 0, 0, 0, 1, '2026-07-15 19:58:17', '2026-07-15 19:58:17');
INSERT INTO `edu_video` VALUES (2077362209394556929, 2046890290522718210, 2046890400237322242, '定积分等式证明例题(3)', 'video/2026/07/15/60bfcc80e4aa4658b29fe46e617d302c.mp4', '03-078-定积分等式证明例题3.mp4', 78, 0, 1, 0, 0, 0, 1, '2026-07-15 19:58:41', '2026-07-15 19:58:41');
INSERT INTO `edu_video` VALUES (2077362289975525377, 2046890290522718210, 2046890400237322242, '定积分的几何应用', 'video/2026/07/15/b71f94599fe64f7a8ea6b3ab9af644b7.mp4', '03-079-定积分的几何应用.mp4', 79, 0, 1, 0, 0, 0, 1, '2026-07-15 19:59:00', '2026-07-15 19:59:00');
INSERT INTO `edu_video` VALUES (2077362378500505601, 2046890290522718210, 2046890400237322242, '定积分几何应用例题', 'video/2026/07/15/2ac77b72d19a4d0b9ba4486ea7431f03.mp4', '03-080-定积分几何应用例题.mp4', 80, 0, 1, 0, 0, 0, 1, '2026-07-15 19:59:21', '2026-07-15 19:59:21');
INSERT INTO `edu_video` VALUES (2077362449333911553, 2046890290522718210, 2046890400237322242, '定积分求旋转体体积', 'video/2026/07/15/fc17dfe14362436c8aa527eb3b34818a.mp4', '03-081-定积分求旋转体体积.mp4', 81, 0, 1, 0, 0, 0, 1, '2026-07-15 19:59:38', '2026-07-15 19:59:38');
INSERT INTO `edu_video` VALUES (2077362543454093314, 2046890290522718210, 2046890400237322242, '二重积分概念与性质', 'video/2026/07/15/e2f1f4050b73470fa89b27627f16a661.mp4', '03-082-二重积分概念与性质.mp4', 82, 0, 1, 0, 0, 0, 1, '2026-07-15 20:00:01', '2026-07-15 20:00:01');
INSERT INTO `edu_video` VALUES (2077362665835495426, 2046890290522718210, 2046890400237322242, '二重积分性质考点', 'video/2026/07/15/7c71a8d3f30b4efe88a864afcd688256.mp4', '03-083-二重积分性质考点1.mp4', 83, 0, 1, 0, 0, 0, 1, '2026-07-15 20:00:30', '2026-07-15 20:00:30');
INSERT INTO `edu_video` VALUES (2077378214107840514, 2046890290522718210, 2046890400237322242, '二重积分比较大小', 'video/2026/07/15/13469732823e46f7b65ad2c5c2e9f1f6.mp4', '03-084-二重积分比较大小.mp4', 84, 0, 1, 0, 0, 0, 1, '2026-07-15 21:02:17', '2026-07-15 21:02:17');
INSERT INTO `edu_video` VALUES (2077378315123458050, 2046890290522718210, 2046890400237322242, '估值定理', 'video/2026/07/15/6e3d241d131a4ed0ae0d90da34912875.mp4', '03-085-估值定理.mp4', 85, 0, 1, 0, 0, 0, 1, '2026-07-15 21:02:41', '2026-07-15 21:02:41');
INSERT INTO `edu_video` VALUES (2077378404017537026, 2046890290522718210, 2046890400237322242, '二重积分直角坐标系下的计算', 'video/2026/07/15/3dcf3861e19e434b8cc954359250b1b9.mp4', '03-086-二重积分直角坐标系下的计算.mp4', 86, 0, 1, 0, 0, 0, 1, '2026-07-15 21:03:02', '2026-07-15 21:03:02');
INSERT INTO `edu_video` VALUES (2077378489140936706, 2046890290522718210, 2046890400237322242, '二重积分直角坐标系下计算例题', 'video/2026/07/15/a7b2c1fc280d474eb7394a2736d0fa24.mp4', '03-087-二重积分直角坐标系下计算例题.mp4', 87, 0, 1, 0, 0, 0, 1, '2026-07-15 21:03:22', '2026-07-15 21:03:22');
INSERT INTO `edu_video` VALUES (2077378574734098434, 2046890290522718210, 2046890400237322242, '超越积分顺序选择', 'video/2026/07/15/eb4e8fe7953f472b93295436ef5546e8.mp4', '03-088-超越积分顺序选择.mp4', 88, 0, 1, 0, 0, 0, 1, '2026-07-15 21:03:43', '2026-07-15 21:03:43');
INSERT INTO `edu_video` VALUES (2077378649694699522, 2046890290522718210, 2046890400237322242, '交换积分次序', 'video/2026/07/15/582371f44c354c8a93453effae922396.mp4', '03-089-交换积分次序.mp4', 89, 0, 1, 0, 0, 0, 1, '2026-07-15 21:04:01', '2026-07-15 21:04:01');
INSERT INTO `edu_video` VALUES (2077378745421299714, 2046890290522718210, 2046890400237322242, '极坐标系下二重积分计算', 'video/2026/07/15/2106a7fc8c8d4e8693d4df3a2fc1a682.mp4', '03-090-极坐标系下二重积分计算.mp4', 90, 0, 1, 0, 0, 0, 1, '2026-07-15 21:04:23', '2026-07-15 21:04:23');
INSERT INTO `edu_video` VALUES (2077378827562549249, 2046890290522718210, 2046890400237322242, '二重积分对称性', 'video/2026/07/15/156fbcc485094f1f867e975f4b53ac48.mp4', '03-091-二重积分对称性.mp4', 91, 0, 1, 0, 0, 0, 1, '2026-07-15 21:04:43', '2026-07-15 21:04:43');
INSERT INTO `edu_video` VALUES (2077378914132983809, 2046890290522718210, 2046890400237322242, '向量的概念', 'video/2026/07/15/e554768df44943e49f05e3ebb23ed537.mp4', '04-092-向量的概念.mp4', 92, 0, 1, 0, 0, 0, 1, '2026-07-15 21:05:04', '2026-07-15 21:05:04');
INSERT INTO `edu_video` VALUES (2077378994583928834, 2046890290522718210, 2046890400237322242, '加油', 'video/2026/07/15/24f01f6dfd4444adb405f9cb2c9351c4.mp4', '04-093-加油.mp4', 93, 0, 1, 0, 0, 0, 1, '2026-07-15 21:05:23', '2026-07-15 21:05:23');
INSERT INTO `edu_video` VALUES (2077379119096037378, 2046890290522718210, 2046890400237322242, '向量概念例题', 'video/2026/07/15/28c8f03c1414425f8f5010766e82c04a.mp4', '04-094-向量概念例题.mp4', 94, 0, 1, 0, 0, 0, 1, '2026-07-15 21:05:52', '2026-07-15 21:05:52');
INSERT INTO `edu_video` VALUES (2077379201472167938, 2046890290522718210, 2046890400237322242, '空间直角坐标系介绍', 'video/2026/07/15/e66e0ce2b91e49e4b4927d3e81aee9fa.mp4', '04-095-空间直角坐标系介绍.mp4', 95, 0, 1, 0, 0, 0, 1, '2026-07-15 21:06:12', '2026-07-15 21:06:12');
INSERT INTO `edu_video` VALUES (2077379284242563074, 2046890290522718210, 2046890400237322242, '向量的运算法则', 'video/2026/07/15/59b73752c6d74d4c94f146dc366b0f18.mp4', '04-096-向量的运算法则.mp4', 96, 0, 1, 0, 0, 0, 1, '2026-07-15 21:06:32', '2026-07-15 21:06:32');
INSERT INTO `edu_video` VALUES (2077379362231451649, 2046890290522718210, 2046890400237322242, '向量的点乘相关考点', 'video/2026/07/15/654ee665c21646b0b7fc382b56260a48.mp4', '04-097-向量的点乘相关考点.mp4', 97, 0, 1, 0, 0, 0, 1, '2026-07-15 21:06:50', '2026-07-15 21:06:50');
INSERT INTO `edu_video` VALUES (2077379458146795521, 2046890290522718210, 2046890400237322242, '向量叉乘运算方法', 'video/2026/07/15/c4e8412bc3b7413cb77832d9e014de14.mp4', '04-098-向量叉乘运算方法.mp4', 98, 0, 1, 0, 0, 0, 1, '2026-07-15 21:07:13', '2026-07-15 21:07:13');
INSERT INTO `edu_video` VALUES (2077379569924997121, 2046890290522718210, 2046890400237322242, '叉乘的几何意义', 'video/2026/07/15/0513ebd63cce439c9f63ed6f21b8028e.mp4', '04-099-叉乘的几何意义.mp4', 99, 0, 1, 0, 0, 0, 1, '2026-07-15 21:07:40', '2026-07-15 21:07:40');
INSERT INTO `edu_video` VALUES (2077379650665349121, 2046890290522718210, 2046890400237322242, '向量间的位置关系', 'video/2026/07/15/e9359356cc494779b01395debbe15061.mp4', '04-100-向量间的位置关系.mp4', 100, 0, 1, 0, 0, 0, 1, '2026-07-15 21:07:59', '2026-07-15 21:07:59');
INSERT INTO `edu_video` VALUES (2077379736535334913, 2046890290522718210, 2046890400237322242, '空间平面方程', 'video/2026/07/15/77a91015a1574512a2f1ef76c6df44fc.mp4', '04-101-空间平面方程.mp4', 101, 0, 1, 0, 0, 0, 1, '2026-07-15 21:08:20', '2026-07-15 21:08:20');
INSERT INTO `edu_video` VALUES (2077379840373719042, 2046890290522718210, 2046890400237322242, '空间平面位置关系', 'video/2026/07/15/f58edd765da441ae907f10bf018aab39.mp4', '04-102-空间平面位置关系.mp4', 102, 0, 1, 0, 0, 0, 1, '2026-07-15 21:08:44', '2026-07-15 21:08:44');
INSERT INTO `edu_video` VALUES (2077379946049208321, 2046890290522718210, 2046890400237322242, '平面位置关系例题', 'video/2026/07/15/bf49b36c1ae1418f8510b90070cda182.mp4', '04-103-平面位置关系例题.mp4', 103, 0, 1, 0, 0, 0, 1, '2026-07-15 21:09:10', '2026-07-15 21:09:10');
INSERT INTO `edu_video` VALUES (2077380044292390913, 2046890290522718210, 2046890400237322242, '求平面方程的例题', 'video/2026/07/15/857c89e7474044bdb5320a37bb35a704.mp4', '04-104-求平面方程的例题.mp4', 104, 0, 1, 0, 0, 0, 1, '2026-07-15 21:09:33', '2026-07-15 21:09:33');
INSERT INTO `edu_video` VALUES (2077380120066686978, 2046890290522718210, 2046890400237322242, '平面的夹角和点到直线的距离', 'video/2026/07/15/d60030b4593d4231834656ca6d97ef44.mp4', '04-105-平面的夹角和点到直线的距离.mp4', 105, 0, 1, 0, 0, 0, 1, '2026-07-15 21:09:51', '2026-07-15 21:09:51');
INSERT INTO `edu_video` VALUES (2077380217538117633, 2046890290522718210, 2046890400237322242, '过坐标轴的平面', 'video/2026/07/15/f45090068a82495da3b64f60230a3aee.mp4', '04-106-过坐标轴的平面.mp4', 106, 0, 1, 0, 0, 0, 1, '2026-07-15 21:10:14', '2026-07-15 21:10:14');
INSERT INTO `edu_video` VALUES (2077380294415515650, 2046890290522718210, 2046890400237322242, '空间的直线方程', 'video/2026/07/15/69134ca19cab48b995fc72d11bf93428.mp4', '04-107-空间的直线方程.mp4', 107, 0, 1, 0, 0, 0, 1, '2026-07-15 21:10:33', '2026-07-15 21:10:33');
INSERT INTO `edu_video` VALUES (2077380366909865986, 2046890290522718210, 2046890400237322242, '线与线的位置关系', 'video/2026/07/15/1fa65e44645c4ab79d5048a7ccdab69f.mp4', '04-108-线与线的位置关系.mp4', 108, 0, 1, 0, 0, 0, 1, '2026-07-15 21:10:50', '2026-07-15 21:10:50');
INSERT INTO `edu_video` VALUES (2077380451848716290, 2046890290522718210, 2046890400237322242, '线与平面的位置关系', 'video/2026/07/15/9bbfe9df1c2c483cb4d5eab6e048aabc.mp4', '04-109-线与平面的位置关系.mp4', 109, 0, 1, 0, 0, 0, 1, '2026-07-15 21:11:10', '2026-07-15 21:11:10');
INSERT INTO `edu_video` VALUES (2077380538461093890, 2046890290522718210, 2046890400237322242, '例题', 'video/2026/07/15/470bd366ebae4362b9d17d5a841a5903.mp4', '04-110-例题.mp4', 110, 0, 1, 0, 0, 0, 1, '2026-07-15 21:11:31', '2026-07-15 21:11:31');
INSERT INTO `edu_video` VALUES (2077380632790990850, 2046890290522718210, 2046890400237322242, '直线与直线的夹角', 'video/2026/07/15/65096238b92a40108f9414d207d45683.mp4', '04-111-直线与直线的夹角.mp4', 111, 0, 1, 0, 0, 0, 1, '2026-07-15 21:11:53', '2026-07-15 21:11:53');
INSERT INTO `edu_video` VALUES (2077380710918291457, 2046890290522718210, 2046890400237322242, '多元函数概念', 'video/2026/07/15/47d22f0d1d784843a21f2c3873614307.mp4', '05-112-多元函数概念.mp4', 112, 0, 1, 0, 0, 0, 1, '2026-07-15 21:12:12', '2026-07-15 21:12:12');
INSERT INTO `edu_video` VALUES (2077380783320367106, 2046890290522718210, 2046890400237322242, '二元函数对应法则', 'video/2026/07/15/d56931b3374c4fbc90f0958c275994c6.mp4', '05-113-二元函数对应法则.mp4', 113, 0, 1, 0, 0, 0, 1, '2026-07-15 21:12:29', '2026-07-15 21:12:29');
INSERT INTO `edu_video` VALUES (2077380862152310786, 2046890290522718210, 2046890400237322242, '二元函数极限', 'video/2026/07/15/6bc26e7f15fe4b1da0f581ed19a22032.mp4', '05-114-二元函数极限.mp4', 114, 0, 1, 0, 0, 0, 1, '2026-07-15 21:12:48', '2026-07-15 21:12:48');
INSERT INTO `edu_video` VALUES (2077380957065216001, 2046890290522718210, 2046890400237322242, '一阶偏导概念', 'video/2026/07/15/0a54e5f96224468f83872187ca28a667.mp4', '05-115-一阶偏导概念.mp4', 115, 0, 1, 0, 0, 0, 1, '2026-07-15 21:13:11', '2026-07-15 21:13:11');
INSERT INTO `edu_video` VALUES (2077381038153695234, 2046890290522718210, 2046890400237322242, '一阶偏导习题', 'video/2026/07/15/fa39ad95690944bba40f251d7b882d07.mp4', '05-116- 一阶偏导习题.mp4', 116, 0, 1, 0, 0, 0, 1, '2026-07-15 21:13:30', '2026-07-15 21:13:30');
INSERT INTO `edu_video` VALUES (2077381119829377026, 2046890290522718210, 2046890400237322242, '全微分', 'video/2026/07/15/6aeef14cf49e4a9085e9c56679b7e63e.mp4', '05-117-全微分.mp4', 117, 0, 1, 0, 0, 0, 1, '2026-07-15 21:13:50', '2026-07-15 21:13:50');
INSERT INTO `edu_video` VALUES (2077381192814460930, 2046890290522718210, 2046890400237322242, '可微与偏导的关系', 'video/2026/07/15/a1634104ff6d41568e90d8e550c736db.mp4', '05-118-可微与偏导的关系.mp4', 118, 0, 1, 0, 0, 0, 1, '2026-07-15 21:14:07', '2026-07-15 21:14:07');
INSERT INTO `edu_video` VALUES (2077381287748337665, 2046890290522718210, 2046890400237322242, '可微的本质', 'video/2026/07/15/066c2f2a5e3f49bf863ba6cbc40fe723.mp4', '05-119-可微的本质.mp4', 119, 0, 1, 0, 0, 0, 1, '2026-07-15 21:14:30', '2026-07-15 21:14:30');
INSERT INTO `edu_video` VALUES (2077381364667678721, 2046890290522718210, 2046890400237322242, '二阶偏导', 'video/2026/07/15/e8994ac397914c95b060b82cf8cf3da9.mp4', '05-120-二阶偏导.mp4', 120, 0, 1, 0, 0, 0, 1, '2026-07-15 21:14:48', '2026-07-15 21:14:48');
INSERT INTO `edu_video` VALUES (2077381439162712065, 2046890290522718210, 2046890400237322242, '二元隐函数一阶偏导', 'video/2026/07/15/81dc183949654c2297dd5b959e360a95.mp4', '05-121-二元隐函数一阶偏导.mp4', 121, 0, 1, 0, 0, 0, 1, '2026-07-15 21:15:06', '2026-07-15 21:15:06');
INSERT INTO `edu_video` VALUES (2077381556141850626, 2046890290522718210, 2046890400237322242, '二元隐函数二阶偏导', 'video/2026/07/15/1b2625d500064565a1b125d6847f8022.mp4', '05-122-二元隐函数二阶偏导.mp4', 122, 0, 1, 0, 0, 0, 1, '2026-07-15 21:15:34', '2026-07-15 21:15:34');
INSERT INTO `edu_video` VALUES (2077381623930191874, 2046890290522718210, 2046890400237322242, '链式法则介绍', 'video/2026/07/15/83fc11dfc3a1408fa0685553fee81653.mp4', '05-123-链式法则介绍.mp4', 123, 0, 1, 0, 0, 0, 1, '2026-07-15 21:15:50', '2026-07-15 21:15:50');
INSERT INTO `edu_video` VALUES (2077381701453512705, 2046890290522718210, 2046890400237322242, '具体复合函数求导', 'video/2026/07/15/846a56c60c664a90ba49909d34fa2ffe.mp4', '05-124-具体复合函数求导.mp4', 124, 0, 1, 0, 0, 0, 1, '2026-07-15 21:16:08', '2026-07-15 21:16:08');
INSERT INTO `edu_video` VALUES (2077381764670062593, 2046890290522718210, 2046890400237322242, '抽象复合函数求导', 'video/2026/07/15/9db45dac1dae4cefb0aaa19d102b4537.mp4', '05-125-抽象复合函数求导.mp4', 125, 0, 1, 0, 0, 0, 1, '2026-07-15 21:16:23', '2026-07-15 21:16:23');
INSERT INTO `edu_video` VALUES (2077381853782245377, 2046890290522718210, 2046890400237322242, '关于隐函数求导的一个易错题', 'video/2026/07/15/329adcb6a22a4173820faa728baba26c.mp4', '05-126-关于隐函数求导的一个易错题.mp4', 126, 0, 1, 0, 0, 0, 1, '2026-07-15 21:16:44', '2026-07-15 21:16:44');
INSERT INTO `edu_video` VALUES (2077381947994701825, 2046890290522718210, 2046890400237322242, '多元微分学几何应用——求空间曲', 'video/2026/07/15/eb75d57b650740d1a1cc4f1fb788a262.mp4', '05-127-多元微分学几何应用——求空间曲.mp4', 127, 0, 1, 0, 0, 0, 1, '2026-07-15 21:17:07', '2026-07-15 21:17:07');
INSERT INTO `edu_video` VALUES (2077382043717107713, 2046890290522718210, 2046890400237322242, '求空间曲', 'video/2026/07/15/68355e1e5fc647c5a1ba3d08d69cd6af.mp4', '05-128-求空间曲.mp4', 128, 0, 1, 0, 0, 0, 1, '2026-07-15 21:17:30', '2026-07-15 21:17:30');
INSERT INTO `edu_video` VALUES (2077382148440489986, 2046890290522718210, 2046890400237322242, '无条件极值', 'video/2026/07/15/b48f9df720744b358f26de9c782b14b1.mp4', '05-129-无条件极值.mp4', 129, 0, 1, 0, 0, 0, 1, '2026-07-15 21:17:55', '2026-07-15 21:17:55');
INSERT INTO `edu_video` VALUES (2077382224592273409, 2046890290522718210, 2046890400237322242, '条件极值', 'video/2026/07/15/20e8d4f387474c2ca5c1dd8c6ef64618.mp4', '05-130-条件极值.mp4', 130, 0, 1, 0, 0, 0, 1, '2026-07-15 21:18:13', '2026-07-15 21:18:13');
INSERT INTO `edu_video` VALUES (2077382312790097921, 2046890290522718210, 2046890400237322242, '条件极值习题', 'video/2026/07/15/47b64e5c486d414b9754edd53a0c0cbf.mp4', '05-131-条件极值习题.mp4', 131, 0, 1, 0, 0, 0, 1, '2026-07-15 21:18:34', '2026-07-15 21:18:34');
INSERT INTO `edu_video` VALUES (2077382405974949890, 2046890290522718210, 2046890400237322242, '曲线积分概念', 'video/2026/07/15/a59bf7d27cdc467fa1657bfe2cbc0f28.mp4', '05-132-曲线积分概念.mp4', 132, 0, 1, 0, 0, 0, 1, '2026-07-15 21:18:56', '2026-07-15 21:18:56');
INSERT INTO `edu_video` VALUES (2077382487394779138, 2046890290522718210, 2046890400237322242, '直接代入法', 'video/2026/07/15/c530d069dbc64114942de84b86b5c505.mp4', '05-133-直接代入法.mp4', 133, 0, 1, 0, 0, 0, 1, '2026-07-15 21:19:16', '2026-07-15 21:19:16');
INSERT INTO `edu_video` VALUES (2077382558697947138, 2046890290522718210, 2046890400237322242, '格林公式', 'video/2026/07/15/9df7a5ee0f594259898401f13acedf48.mp4', '05-134-格林公式.mp4', 134, 0, 1, 0, 0, 0, 1, '2026-07-15 21:19:33', '2026-07-15 21:19:33');
INSERT INTO `edu_video` VALUES (2077382633499164673, 2046890290522718210, 2046890400237322242, '积分与路径无关', 'video/2026/07/15/ffd107266ea5442f8f76907e94866d7b.mp4', '05-135-积分与路径无关.mp4', 135, 0, 1, 0, 0, 0, 1, '2026-07-15 21:19:50', '2026-07-15 21:19:50');
INSERT INTO `edu_video` VALUES (2077382741057896449, 2046890290522718210, 2046890400237322242, '微分方程的基本概念', 'video/2026/07/15/d84c4b773d70478cb31dc205a525d63b.mp4', '06-136-微分方程的基本概念.mp4', 136, 0, 1, 0, 0, 0, 1, '2026-07-15 21:20:16', '2026-07-15 21:20:16');
INSERT INTO `edu_video` VALUES (2077382869181300738, 2046890290522718210, 2046890400237322242, '阶数识别', 'video/2026/07/15/007b8dff94a64391a45ef6198a4c885a.mp4', '06-137-阶数识别.mp4', 137, 0, 1, 0, 0, 0, 1, '2026-07-15 21:20:47', '2026-07-15 21:20:47');
INSERT INTO `edu_video` VALUES (2077382948730470402, 2046890290522718210, 2046890400237322242, '线性微分方程识别', 'video/2026/07/15/ee43f6270a6346daade46b6189430dc1.mp4', '06-138-线性微分方程识别.mp4', 138, 0, 1, 0, 0, 0, 1, '2026-07-15 21:21:06', '2026-07-15 21:21:06');
INSERT INTO `edu_video` VALUES (2077383028309000194, 2046890290522718210, 2046890400237322242, '齐次方程的识别', 'video/2026/07/15/033b55acc9d94f2d87cd3d6a8351b0b9.mp4', '06-139-齐次方程的识别.mp4', 139, 0, 1, 0, 0, 0, 1, '2026-07-15 21:21:25', '2026-07-15 21:21:25');
INSERT INTO `edu_video` VALUES (2077383101361192961, 2046890290522718210, 2046890400237322242, '解的类型判断', 'video/2026/07/15/ca15e11536e24f40a5ef10db3c67317d.mp4', '06-140-解的类型判断.mp4', 140, 0, 1, 0, 0, 0, 1, '2026-07-15 21:21:42', '2026-07-15 21:21:42');
INSERT INTO `edu_video` VALUES (2077383190444015618, 2046890290522718210, 2046890400237322242, '直接积分法', 'video/2026/07/15/c71e95edc20946af909f759086b9cc1a.mp4', '06-141-直接积分法.mp4', 141, 0, 1, 0, 0, 0, 1, '2026-07-15 21:22:03', '2026-07-15 21:22:03');
INSERT INTO `edu_video` VALUES (2077383274799857665, 2046890290522718210, 2046890400237322242, '可分离变量微分方程的求解', 'video/2026/07/15/fb78824aba624e9a8d4cc38c927d9c5d.mp4', '06-142-可分离变量微分方程的求解.mp4', 142, 0, 1, 0, 0, 0, 1, '2026-07-15 21:22:23', '2026-07-15 21:22:23');
INSERT INTO `edu_video` VALUES (2077383360992804865, 2046890290522718210, 2046890400237322242, '一阶齐次微分方程的求解', 'video/2026/07/15/63911e0deeaf449599e6676bbcf137e6.mp4', '06-143-一阶齐次微分方程的求解.mp4', 143, 0, 1, 0, 0, 0, 1, '2026-07-15 21:22:44', '2026-07-15 21:22:44');
INSERT INTO `edu_video` VALUES (2077383434867081217, 2046890290522718210, 2046890400237322242, '一阶线性微分方程', 'video/2026/07/15/f52cb141ff1d4abc918c64e8ba4930d9.mp4', '06-144-一阶线性微分方程.mp4', 144, 0, 1, 0, 0, 0, 1, '2026-07-15 21:23:01', '2026-07-15 21:23:01');
INSERT INTO `edu_video` VALUES (2077383574608707585, 2046890290522718210, 2046890400237322242, '二阶齐次微分方程概念', 'video/2026/07/15/ed9a8a0a2d11454b8efc50adc808619b.mp4', '06-145-二阶齐次微分方程概念.mp4', 145, 0, 1, 0, 0, 0, 1, '2026-07-15 21:23:35', '2026-07-15 21:23:35');
INSERT INTO `edu_video` VALUES (2077383666816286722, 2046890290522718210, 2046890400237322242, '二阶齐次微分方程例题', 'video/2026/07/15/865db8b0e2424d55baaa9d62c2c51215.mp4', '06-146-二阶齐次微分方程例题.mp4', 146, 0, 1, 0, 0, 0, 1, '2026-07-15 21:23:57', '2026-07-15 21:23:57');
INSERT INTO `edu_video` VALUES (2077383743618187265, 2046890290522718210, 2046890400237322242, '例题', 'video/2026/07/15/f386fd151ffa44999ded94edc81156c5.mp4', '06-147-例题.mp4', 147, 0, 1, 0, 0, 0, 1, '2026-07-15 21:24:15', '2026-07-15 21:24:15');
INSERT INTO `edu_video` VALUES (2077383854771437570, 2046890290522718210, 2046890400237322242, '二阶非齐次线性微分方程', 'video/2026/07/15/b98e6a453a7a4da9981b40873546c32a.mp4', '06-148-二阶非齐次线性微分方程.mp4', 148, 0, 1, 0, 0, 0, 1, '2026-07-15 21:24:42', '2026-07-15 21:24:42');
INSERT INTO `edu_video` VALUES (2077383941455118338, 2046890290522718210, 2046890400237322242, '特解一般形式', 'video/2026/07/15/04f9f6b37cd34fb99d160440713720dc.mp4', '06-149-特解一般形式.mp4', 149, 0, 1, 0, 0, 0, 1, '2026-07-15 21:25:02', '2026-07-15 21:25:02');
INSERT INTO `edu_video` VALUES (2077384028654698498, 2046890290522718210, 2046890400237322242, '方程组解的结构', 'video/2026/07/15/d60126a59440451e922fa5af5b0b7f9b.mp4', '06-150-方程组解的结构.mp4', 150, 0, 1, 0, 0, 0, 1, '2026-07-15 21:25:23', '2026-07-15 21:25:23');
INSERT INTO `edu_video` VALUES (2077384113186701313, 2046890290522718210, 2046890400237322242, '非齐次方程的求解', 'video/2026/07/15/dab35c3dc73646bb8b64d1a7b8c368c0.mp4', '06-151-非齐次方程的求解.mp4', 151, 0, 1, 0, 0, 0, 1, '2026-07-15 21:25:43', '2026-07-15 21:25:43');
INSERT INTO `edu_video` VALUES (2077384279964811266, 2046890290522718210, 2046890400237322242, 'n阶常系数方程求解', 'video/2026/07/15/814f6b01ee484dc7b254ee87b2135c82.mp4', '06-152-n阶常系数方程求解.mp4', 152, 0, 1, 0, 0, 0, 1, '2026-07-15 21:26:23', '2026-07-15 21:26:23');
INSERT INTO `edu_video` VALUES (2077384379067826177, 2046890290522718210, 2046890400237322242, '无穷级数概念', 'video/2026/07/15/e5f71c9bbebc4e96a619d013de667902.mp4', '07-153-无穷级数概念.mp4', 153, 0, 1, 0, 0, 0, 1, '2026-07-15 21:26:47', '2026-07-15 21:26:47');
INSERT INTO `edu_video` VALUES (2077384457975267329, 2046890290522718210, 2046890400237322242, '收敛级数性质和条件', 'video/2026/07/15/b95b5b55167f4f3db26e0372a18bec5c.mp4', '07-154-收敛级数性质和条件.mp4', 154, 0, 1, 0, 0, 0, 1, '2026-07-15 21:27:05', '2026-07-15 21:27:05');
INSERT INTO `edu_video` VALUES (2077401662334992385, 2046890290522718210, 2046890400237322242, '等比级数判敛法则', 'video/2026/07/15/705bd9688da84266864a91e0c2e88497.mp4', '07-155-等比级数判敛法则.mp4', 155, 0, 1, 0, 0, 0, 1, '2026-07-15 22:35:27', '2026-07-15 22:35:27');
INSERT INTO `edu_video` VALUES (2077401811744489473, 2046890290522718210, 2046890400237322242, 'p级数判敛准则', 'video/2026/07/15/19be832e311345b094e21f4a1f86c86e.mp4', '07-156-p级数判敛准则.mp4', 156, 0, 1, 0, 0, 0, 1, '2026-07-15 22:36:03', '2026-07-15 22:36:03');
INSERT INTO `edu_video` VALUES (2077401911204020226, 2046890290522718210, 2046890400237322242, '正项级数比值判别法', 'video/2026/07/15/11eff9f3aada4fb4803684403abc78bc.mp4', '07-157-正项级数比值判别法.mp4', 157, 0, 1, 0, 0, 0, 1, '2026-07-15 22:36:27', '2026-07-15 22:36:27');
INSERT INTO `edu_video` VALUES (2077402003365462018, 2046890290522718210, 2046890400237322242, '正项级数比较判别法理论基础', 'video/2026/07/15/1a646ff75dbd4178854bdb2be4635cbe.mp4', '07-158-正项级数比较判别法理论基础.mp4', 158, 0, 1, 0, 0, 0, 1, '2026-07-15 22:36:49', '2026-07-15 22:36:49');
INSERT INTO `edu_video` VALUES (2077402089046704129, 2046890290522718210, 2046890400237322242, '极限比较判别法', 'video/2026/07/15/5e949de456c2471aab8ab60d63185e80.mp4', '07-159-极限比较判别法.mp4', 159, 0, 1, 0, 0, 0, 1, '2026-07-15 22:37:09', '2026-07-15 22:37:09');
INSERT INTO `edu_video` VALUES (2077402174660837377, 2046890290522718210, 2046890400237322242, '比较判别法', 'video/2026/07/15/a079331e12c44acc9d9106141df0b43e.mp4', '07-160-比较判别法.mp4', 160, 0, 1, 0, 0, 0, 1, '2026-07-15 22:37:29', '2026-07-15 22:37:29');
INSERT INTO `edu_video` VALUES (2077402252607782913, 2046890290522718210, 2046890400237322242, '正项级数判敛思路及放缩思想', 'video/2026/07/15/fef219f06c8e41cb80d3adad7c83d5e3.mp4', '07-161-正项级数判敛思路及放缩思想.mp4', 161, 0, 1, 0, 0, 0, 1, '2026-07-15 22:37:48', '2026-07-15 22:37:48');
INSERT INTO `edu_video` VALUES (2077402333952114689, 2046890290522718210, 2046890400237322242, '交错级数及注意事项', 'video/2026/07/15/5f035d73096d480daaebd8df6c6a5fc4.mp4', '07-162-交错级数及注意事项.mp4', 162, 0, 1, 0, 0, 0, 1, '2026-07-15 22:38:07', '2026-07-15 22:38:07');
INSERT INTO `edu_video` VALUES (2077402415975923713, 2046890290522718210, 2046890400237322242, '交错级数习题', 'video/2026/07/15/9da25d1aaea044dabfb5ec403eb11ccb.mp4', '07-163-交错级数习题.mp4', 163, 0, 1, 0, 0, 0, 1, '2026-07-15 22:38:27', '2026-07-15 22:38:27');
INSERT INTO `edu_video` VALUES (2077402488541577217, 2046890290522718210, 2046890400237322242, '任意项级数的绝对收敛与条件收敛', 'video/2026/07/15/235752d78bcb4483b91d12214e4a5244.mp4', '07-164-任意项级数的绝对收敛与条件收敛.mp4', 164, 0, 1, 0, 0, 0, 1, '2026-07-15 22:38:44', '2026-07-15 22:38:44');
INSERT INTO `edu_video` VALUES (2077402585216090113, 2046890290522718210, 2046890400237322242, '绝对收敛与条件收敛例题', 'video/2026/07/15/b5d0807dc7154d16becbcc59714b86d6.mp4', '07-165-绝对收敛与条件收敛例题.mp4', 165, 0, 1, 0, 0, 0, 1, '2026-07-15 22:39:07', '2026-07-15 22:39:07');
INSERT INTO `edu_video` VALUES (2077402676010188801, 2046890290522718210, 2046890400237322242, '幂级数及其相关概念', 'video/2026/07/15/0d7c801c5ec94412ab02093756336d6d.mp4', '07-166-幂级数及其相关概念.mp4', 166, 0, 1, 0, 0, 0, 1, '2026-07-15 22:39:29', '2026-07-15 22:39:29');
INSERT INTO `edu_video` VALUES (2077402744310235138, 2046890290522718210, 2046890400237322242, '求解收敛区间的相关方法', 'video/2026/07/15/c9595cb5fd0b423bb9d2048b6c5e6813.mp4', '07-167-求解收敛区间的相关方法.mp4', 167, 0, 1, 0, 0, 0, 1, '2026-07-15 22:39:45', '2026-07-15 22:39:45');
INSERT INTO `edu_video` VALUES (2077402818058682370, 2046890290522718210, 2046890400237322242, '具体型幂级数求收敛区间', 'video/2026/07/15/532ef591ac7848b0beed4f6e61e527b0.mp4', '07-168-具体型幂级数求收敛区间.mp4', 168, 0, 1, 0, 0, 0, 1, '2026-07-15 22:40:03', '2026-07-15 22:40:03');
INSERT INTO `edu_video` VALUES (2077402924010995713, 2046890290522718210, 2046890400237322242, '抽象型幂级数求收敛区间', 'video/2026/07/15/b74e1159aa664d7187ebd988ce602584.mp4', '07-169-抽象型幂级数求收敛区间.mp4', 169, 0, 1, 0, 0, 0, 1, '2026-07-15 22:40:28', '2026-07-15 22:40:28');
INSERT INTO `edu_video` VALUES (2077404223909691393, 2046957172130938881, 2046957467179253762, '数制及常见数制', 'video/2026/07/15/8feaf244a8644e448d28e1d24ed8b811.mp4', '01-005-数制及常见数制.mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-15 22:45:38', '2026-07-15 22:45:38');
INSERT INTO `edu_video` VALUES (2077404294512410625, 2046957172130938881, 2046957467179253762, '非十进制转十进制', 'video/2026/07/15/3668ed7f05604f328d9693d56917de9e.mp4', '01-006-非十进制转十进制.mp4', 6, 0, 1, 0, 0, 0, 1, '2026-07-15 22:45:55', '2026-07-15 22:45:55');
INSERT INTO `edu_video` VALUES (2077404358244859906, 2046957172130938881, 2046957467179253762, '十进制转非十进制', 'video/2026/07/15/6b926d02973f41a1aa91f2fc7ddf3ed1.mp4', '01-007-十进制转非十进制.mp4', 7, 0, 1, 0, 0, 0, 1, '2026-07-15 22:46:10', '2026-07-15 22:46:10');
INSERT INTO `edu_video` VALUES (2077404459239505921, 2046957172130938881, 2046957467179253762, '二、八、十六进制互转', 'video/2026/07/15/2f3560c5601b4139a0ef25145004dc85.mp4', '01-008-二、八、十六进制互转.mp4', 8, 0, 1, 0, 0, 0, 1, '2026-07-15 22:46:34', '2026-07-15 22:46:34');
INSERT INTO `edu_video` VALUES (2077404521013215233, 2046957172130938881, 2046957467179253762, '二进制数的运算', 'video/2026/07/15/d24a027be75a433094306e7ad791b60a.mp4', '01-009-二进制数的运算.mp4', 9, 0, 1, 0, 0, 0, 1, '2026-07-15 22:46:49', '2026-07-15 22:46:49');
INSERT INTO `edu_video` VALUES (2077404601237667841, 2046957172130938881, 2046957467179253762, '计算机信息单位与内存空间计算', 'video/2026/07/15/80a3825d175d4d4f93c75a378213bcdf.mp4', '01-010-计算机信息单位与内存空间计算.mp4', 10, 0, 1, 0, 0, 0, 1, '2026-07-15 22:47:08', '2026-07-15 22:47:08');
INSERT INTO `edu_video` VALUES (2077404674411495426, 2046957172130938881, 2046957467179253762, '原码反', 'video/2026/07/15/1b56589724f94fde9cf8325f12589a3d.mp4', '01-011-原码反.mp4', 11, 0, 1, 0, 0, 0, 1, '2026-07-15 22:47:25', '2026-07-15 22:47:25');
INSERT INTO `edu_video` VALUES (2077404738420768769, 2046957172130938881, 2046957467179253762, '浮点数', 'video/2026/07/15/d67c46ada5e84535b3b56c43e3cbfc6f.mp4', '01-012-浮点数.mp4', 12, 0, 1, 0, 0, 0, 1, '2026-07-15 22:47:41', '2026-07-15 22:47:41');
INSERT INTO `edu_video` VALUES (2077404849293000705, 2046957172130938881, 2046957467179253762, 'ASCII码', 'video/2026/07/15/5885adc07aa84dd1ba4986ea1b28352e.mp4', '01-013-ASCII码.mp4', 13, 0, 1, 0, 0, 0, 1, '2026-07-15 22:48:07', '2026-07-15 22:48:07');
INSERT INTO `edu_video` VALUES (2077404937188835330, 2046957172130938881, 2046957467179253762, '国标码区位码', 'video/2026/07/15/45c24b0ee3164403a76dc4362ea9e296.mp4', '01-014-国标码区位码.mp4', 14, 0, 1, 0, 0, 0, 1, '2026-07-15 22:48:28', '2026-07-15 22:48:28');
INSERT INTO `edu_video` VALUES (2077405006654898178, 2046957172130938881, 2046957467179253762, '字形码UTF-8', 'video/2026/07/15/d6d15665ec7148d4b90c7d4217d169a0.mp4', '01-015-字形码UTF-8.mp4', 15, 0, 1, 0, 0, 0, 1, '2026-07-15 22:48:45', '2026-07-15 22:48:45');
INSERT INTO `edu_video` VALUES (2077405077446361090, 2046957172130938881, 2046957467179253762, '计算机系统组成', 'video/2026/07/15/8f712909457b4b71abe0aee85cd0bcb8.mp4', '02-016-计算机系统组成.mp4', 16, 0, 1, 0, 0, 0, 1, '2026-07-15 22:49:01', '2026-07-15 22:49:01');
INSERT INTO `edu_video` VALUES (2077405156207001601, 2046957172130938881, 2046957467179253762, '计算机硬件和软件系统', 'video/2026/07/15/09f401aba4ff4ca889b61eaf9c337702.mp4', '02-017-计算机硬件和软件系统.mp4', 17, 0, 1, 0, 0, 0, 1, '2026-07-15 22:49:20', '2026-07-15 22:49:20');
INSERT INTO `edu_video` VALUES (2077405219402579969, 2046957172130938881, 2046957467179253762, '微机的分类和性能指标', 'video/2026/07/15/cd00fa74a4784a9283ced0f06da00571.mp4', '02-018-微机的分类和性能指标.mp4', 18, 0, 1, 0, 0, 0, 1, '2026-07-15 22:49:35', '2026-07-15 22:49:35');
INSERT INTO `edu_video` VALUES (2077405289237741569, 2046957172130938881, 2046957467179253762, '微机常见硬件设备', 'video/2026/07/15/48160fa796ab4ed0a4e523e679f92021.mp4', '02-019-微机常见硬件设备.mp4', 19, 0, 1, 0, 0, 0, 1, '2026-07-15 22:49:52', '2026-07-15 22:49:52');
INSERT INTO `edu_video` VALUES (2077405359542665217, 2046957172130938881, 2046957467179253762, '主板、总线和微机组装', 'video/2026/07/15/4fa38f16797545be9bd038098492231a.mp4', '02-020-主板、总线和微机组装.mp4', 20, 0, 1, 0, 0, 0, 1, '2026-07-15 22:50:09', '2026-07-15 22:50:09');
INSERT INTO `edu_video` VALUES (2077405443571351553, 2046957172130938881, 2046957467179253762, '操作系统概述', 'video/2026/07/15/b2780992f6d349a0b4011da4feea0479.mp4', '03-021-操作系统概述.mp4', 21, 0, 1, 0, 0, 0, 1, '2026-07-15 22:50:29', '2026-07-15 22:50:29');
INSERT INTO `edu_video` VALUES (2077405512638955521, 2046957172130938881, 2046957467179253762, '桌面、图标、任务', 'video/2026/07/15/31a7f82aced3403da42196868e9a24b0.mp4', '03-022-桌面、图标、任务.mp4', 22, 0, 1, 0, 0, 0, 1, '2026-07-15 22:50:45', '2026-07-15 22:50:45');
INSERT INTO `edu_video` VALUES (2077405602539667457, 2046957172130938881, 2046957467179253762, '窗口、对话框', 'video/2026/07/15/480c85742c14452283c87a48bed9920a.mp4', '03-023-窗口、对话框.mp4', 23, 0, 1, 0, 0, 0, 1, '2026-07-15 22:51:07', '2026-07-15 22:51:07');
INSERT INTO `edu_video` VALUES (2077405667438133249, 2046957172130938881, 2046957467179253762, '文件及文件夹的操作', 'video/2026/07/15/e885a70e97ec41b8832be43472c68320.mp4', '03-024-文件及文件夹的操作.mp4', 24, 0, 1, 0, 0, 0, 1, '2026-07-15 22:51:22', '2026-07-15 22:51:22');
INSERT INTO `edu_video` VALUES (2077405774392885250, 2046957172130938881, 2046957467179253762, '资源管理器、剪贴板、回收站', 'video/2026/07/15/52c501fc2e28499aa231cf827ec417ff.mp4', '03-025-资源管理器、剪贴板、回收站.mp4', 25, 0, 1, 0, 0, 0, 1, '2026-07-15 22:51:48', '2026-07-15 22:51:48');
INSERT INTO `edu_video` VALUES (2077405911785701378, 2046957172130938881, 2046957467179253762, '任务管理器、控制面板、实用工具(1)', 'video/2026/07/15/69a8c624c2494ee4aa2fa80d7333ac50.mp4', '03-026-任务管理器、控制面板、实用工具(1).mp4', 26, 0, 1, 0, 0, 0, 1, '2026-07-15 22:52:20', '2026-07-15 22:52:20');
INSERT INTO `edu_video` VALUES (2077405984116473857, 2046957172130938881, 2046957467179253762, '任务管理器、控制面板、实用工具(2)', 'video/2026/07/15/76e0c6cfe7ff424fa7bbc152dcd7c377.mp4', '03-027-任务管理器、控制面板、实用工具(2).mp4', 27, 0, 1, 0, 0, 0, 1, '2026-07-15 22:52:38', '2026-07-15 22:52:38');
INSERT INTO `edu_video` VALUES (2077406069378285569, 2046957172130938881, 2046957467179253762, '视图窗口', 'video/2026/07/15/a68e8f9029d44fa7b14cbd8261bbf6fd.mp4', '04-028-视图窗口.mp4', 28, 0, 1, 0, 0, 0, 1, '2026-07-15 22:52:58', '2026-07-15 22:52:58');
INSERT INTO `edu_video` VALUES (2077406327122460674, 2046957172130938881, 2046957467179253762, '文档操作', 'video/2026/07/15/041bbb1e610a43998d95f89644cfe9a4.mp4', '04-029-文档操作.mp4', 29, 0, 1, 0, 0, 0, 1, '2026-07-15 22:53:59', '2026-07-15 22:53:59');
INSERT INTO `edu_video` VALUES (2077406423503372290, 2046957172130938881, 2046957467179253762, '查找替换', 'video/2026/07/15/7e7945231e6747adbfe5b55c9db5a9dc.mp4', '04-030-查找替换.mp4', 30, 0, 1, 0, 0, 0, 1, '2026-07-15 22:54:22', '2026-07-15 22:54:22');
INSERT INTO `edu_video` VALUES (2077406510417739777, 2046957172130938881, 2046957467179253762, '字符格式', 'video/2026/07/15/8e3433c0ab9e4f09871dfcd16066c6cc.mp4', '04-031-字符格式.mp4', 31, 0, 1, 0, 0, 0, 1, '2026-07-15 22:54:43', '2026-07-15 22:54:43');
INSERT INTO `edu_video` VALUES (2077406601601908737, 2046957172130938881, 2046957467179253762, '段落格式(1)', 'video/2026/07/15/4e87ac8b640e4a7a8d769d2427eff0da.mp4', '04-032-段落格式(1).mp4', 32, 0, 1, 0, 0, 0, 1, '2026-07-15 22:55:05', '2026-07-15 22:55:05');
INSERT INTO `edu_video` VALUES (2077406680295440385, 2046957172130938881, 2046957467179253762, '段落格式(2)', 'video/2026/07/15/96ff4453d9214754ac048b1b339e462c.mp4', '04-033-段落格式(2).mp4', 33, 0, 1, 0, 0, 0, 1, '2026-07-15 22:55:24', '2026-07-15 22:55:24');
INSERT INTO `edu_video` VALUES (2077406766278672385, 2046957172130938881, 2046957467179253762, '页面布局(1)', 'video/2026/07/15/902ff622052d47419fd3384dfc03b7ad.mp4', '04-034-页面布局(1).mp4', 34, 0, 1, 0, 0, 0, 1, '2026-07-15 22:55:44', '2026-07-15 22:55:44');
INSERT INTO `edu_video` VALUES (2077406833437868034, 2046957172130938881, 2046957467179253762, '页面布局(2)', 'video/2026/07/15/59635726801045e0903dd5cbbe96926e.mp4', '04-035-页面布局(2).mp4', 35, 0, 1, 0, 0, 0, 1, '2026-07-15 22:56:00', '2026-07-15 22:56:00');
INSERT INTO `edu_video` VALUES (2077406903038148610, 2046957172130938881, 2046957467179253762, '格式刷、样式、模板', 'video/2026/07/15/35c2cc59ca9f4ae9922ef42a62e77f60.mp4', '04-036-格式刷、样式、模板.mp4', 36, 0, 1, 0, 0, 0, 1, '2026-07-15 22:56:17', '2026-07-15 22:56:17');
INSERT INTO `edu_video` VALUES (2077406993500897282, 2046957172130938881, 2046957467179253762, '表格创建和编辑', 'video/2026/07/15/79f353a036ad4a5ba3daa51af67b8d21.mp4', '04-037-表格创建和编辑.mp4', 37, 0, 1, 0, 0, 0, 1, '2026-07-15 22:56:38', '2026-07-15 22:56:38');
INSERT INTO `edu_video` VALUES (2077407072773242881, 2046957172130938881, 2046957467179253762, '表格格式化、排序和计算', 'video/2026/07/15/6902e930b0934f91a1a5fc1c23c1e6eb.mp4', '04-038-表格格式化、排序和计算.mp4', 38, 0, 1, 0, 0, 0, 1, '2026-07-15 22:56:57', '2026-07-15 22:56:57');
INSERT INTO `edu_video` VALUES (2077407159226236930, 2046957172130938881, 2046957467179253762, '图片与图形', 'video/2026/07/15/a03af448477e4091b2d30ee0ea0343a2.mp4', '04-039-图片与图形.mp4', 39, 0, 1, 0, 0, 0, 1, '2026-07-15 22:57:18', '2026-07-15 22:57:18');
INSERT INTO `edu_video` VALUES (2077407256324374529, 2046957172130938881, 2046957467179253762, '形状与SmartArt', 'video/2026/07/15/7999f4abb7444b6cb064443b48425cbb.mp4', '04-040-形状与SmartArt.mp4', 40, 0, 1, 0, 0, 0, 1, '2026-07-15 22:57:41', '2026-07-15 22:57:41');
INSERT INTO `edu_video` VALUES (2077407346015371265, 2046957172130938881, 2046957467179253762, '文本框、艺术字', 'video/2026/07/15/2ffdef31edf14a04b49f74e25e38a31a.mp4', '04-041-文本框、艺术字.mp4', 41, 0, 1, 0, 0, 0, 1, '2026-07-15 22:58:02', '2026-07-15 22:58:02');
INSERT INTO `edu_video` VALUES (2077407424381747201, 2046957172130938881, 2046957467179253762, '图、文、表格混排', 'video/2026/07/15/a90c08dcd54c43a79898c50b33d3c5ff.mp4', '04-042-图、文、表格混排.mp4', 42, 0, 1, 0, 0, 0, 1, '2026-07-15 22:58:21', '2026-07-15 22:58:21');
INSERT INTO `edu_video` VALUES (2077407519034605570, 2046957172130938881, 2046957467179253762, '目录制作、脚注尾注', 'video/2026/07/15/4e068ae943ca409b8092d557c13d64dc.mp4', '04-043-目录制作、脚注尾注.mp4', 43, 0, 1, 0, 0, 0, 1, '2026-07-15 22:58:44', '2026-07-15 22:58:44');
INSERT INTO `edu_video` VALUES (2077407609098895362, 2046957172130938881, 2046957467179253762, '文档保护、审阅与修订', 'video/2026/07/15/734c2a985b3d49ffa728a97607021935.mp4', '04-044-文档保护、审阅与修订.mp4', 44, 0, 1, 0, 0, 0, 1, '2026-07-15 22:59:05', '2026-07-15 22:59:05');
INSERT INTO `edu_video` VALUES (2077407687112949761, 2046957172130938881, 2046957467179253762, '邮件合并、打印预览', 'video/2026/07/15/d82357299af04822a183a8ad2644f317.mp4', '04-045-邮件合并、打印预览.mp4', 45, 0, 1, 0, 0, 0, 1, '2026-07-15 22:59:24', '2026-07-15 22:59:24');
INSERT INTO `edu_video` VALUES (2077407768323063810, 2046957172130938881, 2046957467179253762, '窗口及核心概念', 'video/2026/07/15/978e660af3ed487dbdc983ebbf181434.mp4', '05-046-窗口及核心概念.mp4', 46, 0, 1, 0, 0, 0, 1, '2026-07-15 22:59:43', '2026-07-15 22:59:43');
INSERT INTO `edu_video` VALUES (2077407849742893058, 2046957172130938881, 2046957467179253762, '工作簿、工作表、单元格', 'video/2026/07/15/0dfefce8f826492ea2c23c7f62cb4f17.mp4', '05-047-工作簿、工作表、单元格.mp4', 47, 0, 1, 0, 0, 0, 1, '2026-07-15 23:00:02', '2026-07-15 23:00:02');
INSERT INTO `edu_video` VALUES (2077407945092005890, 2046957172130938881, 2046957467179253762, '选择性粘贴、行列操作', 'video/2026/07/15/cf44f71acc1343c49d66f96e5d0f7430.mp4', '05-048-选择性粘贴、行列操作.mp4', 48, 0, 1, 0, 0, 0, 1, '2026-07-15 23:00:25', '2026-07-15 23:00:25');
INSERT INTO `edu_video` VALUES (2077408053095333889, 2046957172130938881, 2046957467179253762, '拆分、冻结、重排窗口', 'video/2026/07/15/4bd56faa997b467290737fbd092ce1b7.mp4', '05-049-拆分、冻结、重排窗口.mp4', 49, 0, 1, 0, 0, 0, 1, '2026-07-15 23:00:51', '2026-07-15 23:00:51');
INSERT INTO `edu_video` VALUES (2077408140437520385, 2046957172130938881, 2046957467179253762, '字符、数值、日期', 'video/2026/07/15/d3ad9e2702b14c81bf972a721b77fe46.mp4', '05-050-字符、数值、日期.mp4', 50, 0, 1, 0, 0, 0, 1, '2026-07-15 23:01:12', '2026-07-15 23:01:12');
INSERT INTO `edu_video` VALUES (2077408216308285441, 2046957172130938881, 2046957467179253762, '填充柄、序列、快速填充', 'video/2026/07/15/5e06aa6a12e645cba02dac9c1c83da55.mp4', '05-051-填充柄、序列、快速填充.mp4', 51, 0, 1, 0, 0, 0, 1, '2026-07-15 23:01:30', '2026-07-15 23:01:30');
INSERT INTO `edu_video` VALUES (2077408298415980545, 2046957172130938881, 2046957467179253762, '文本导入、数据有效性、批注', 'video/2026/07/15/2f0b1dfd5f0b404eab1e9da617cda043.mp4', '05-052-文本导入、数据有效性、批注.mp4', 52, 0, 1, 0, 0, 0, 1, '2026-07-15 23:01:49', '2026-07-15 23:01:49');
INSERT INTO `edu_video` VALUES (2077408428640731137, 2046957172130938881, 2046957467179253762, '设置单元格格式、行高列宽', 'video/2026/07/15/5151ab136da14e6e8e4f1b44a10633fb.mp4', '05-053-设置单元格格式、行高列宽.mp4', 53, 0, 1, 0, 0, 0, 1, '2026-07-15 23:02:20', '2026-07-15 23:02:20');
INSERT INTO `edu_video` VALUES (2077408507653029889, 2046957172130938881, 2046957467179253762, '条件格式、套用表格样式', 'video/2026/07/15/3c9e0fdf0b004e549d95abb792de76ec.mp4', '05-054-条件格式、套用表格样式.mp4', 54, 0, 1, 0, 0, 0, 1, '2026-07-15 23:02:39', '2026-07-15 23:02:39');
INSERT INTO `edu_video` VALUES (2077408583527989250, 2046957172130938881, 2046957467179253762, '运算符', 'video/2026/07/15/df9bdd845adf4229bbf22d3f668b6ced.mp4', '05-055-运算符.mp4', 55, 0, 1, 0, 0, 0, 1, '2026-07-15 23:02:57', '2026-07-15 23:02:57');
INSERT INTO `edu_video` VALUES (2077408665413386242, 2046957172130938881, 2046957467179253762, '单元格引用的分类', 'video/2026/07/15/27430168c3b148ae966c17a79347532d.mp4', '05-056-单元格引用的分类.mp4', 56, 0, 1, 0, 0, 0, 1, '2026-07-15 23:03:17', '2026-07-15 23:03:17');
INSERT INTO `edu_video` VALUES (2077408760741527553, 2046957172130938881, 2046957467179253762, '公式的复制与移动', 'video/2026/07/15/3c3bbc07253d478aa3e6912cbad3667d.mp4', '05-057-公式的复制与移动.mp4', 57, 0, 1, 0, 0, 0, 1, '2026-07-15 23:03:40', '2026-07-15 23:03:40');
INSERT INTO `edu_video` VALUES (2077408874482663425, 2046957172130938881, 2046957467179253762, '公式的复制与移动(2)', 'video/2026/07/15/f268d47ba18b45cd9ee537cff32efd44.mp4', '05-058-公式的复制与移动(2).mp4', 58, 0, 1, 0, 0, 0, 1, '2026-07-15 23:04:07', '2026-07-15 23:04:07');
INSERT INTO `edu_video` VALUES (2077408994116796418, 2046957172130938881, 2046957467179253762, 'SUM、AVERAGE、ROUND', 'video/2026/07/15/31f457c662ba47babf4b89c2843d8532.mp4', '05-059-SUM、AVERAGE、ROUND.mp4', 59, 0, 1, 0, 0, 0, 1, '2026-07-15 23:04:35', '2026-07-15 23:04:35');
INSERT INTO `edu_video` VALUES (2077409068263702530, 2046957172130938881, 2046957467179253762, 'MAX、MIN、COUNT', 'video/2026/07/15/f87a080b331a4de2a750d23bd975b54d.mp4', '05-060-MAX、MIN、COUNT.mp4', 60, 0, 1, 0, 0, 0, 1, '2026-07-15 23:04:53', '2026-07-15 23:04:53');
INSERT INTO `edu_video` VALUES (2077409164640419841, 2046957172130938881, 2046957467179253762, 'UMIF、AVERAGEIF', 'video/2026/07/15/e713b8fbd7a9489095f002801dd9e4ac.mp4', '05-061-UMIF、AVERAGEIF.mp4', 61, 0, 1, 0, 0, 0, 1, '2026-07-15 23:05:16', '2026-07-15 23:05:16');
INSERT INTO `edu_video` VALUES (2077409244822929410, 2046957172130938881, 2046957467179253762, 'IF、AND、OR', 'video/2026/07/15/8382992937e44af0bc40d9738e98e68e.mp4', '05-062-IF、AND、OR.mp4', 62, 0, 1, 0, 0, 0, 1, '2026-07-15 23:05:35', '2026-07-15 23:05:35');
INSERT INTO `edu_video` VALUES (2077409332257390594, 2046957172130938881, 2046957467179253762, 'VLOOKUP、文本、日期时间', 'video/2026/07/15/7c7ec01f093448a393cdaec3e547b1bc.mp4', '05-063-VLOOKUP、文本、日期时间.mp4', 63, 0, 1, 0, 0, 0, 1, '2026-07-15 23:05:56', '2026-07-15 23:05:56');
INSERT INTO `edu_video` VALUES (2077409426977357825, 2046957172130938881, 2046957467179253762, '常见错误代码', 'video/2026/07/15/08eda7dc6d0d4969bbf4ac6cc6e7fa6d.mp4', '05-064-常见错误代码.mp4', 64, 0, 1, 0, 0, 0, 1, '2026-07-15 23:06:18', '2026-07-15 23:06:18');
INSERT INTO `edu_video` VALUES (2077409497672351746, 2046957172130938881, 2046957467179253762, '图表类型', 'video/2026/07/15/e612f609f26343e687144584647fbb85.mp4', '05-065-图表类型.mp4', 65, 0, 1, 0, 0, 0, 1, '2026-07-15 23:06:35', '2026-07-15 23:06:35');
INSERT INTO `edu_video` VALUES (2077409572452597762, 2046957172130938881, 2046957467179253762, '图表设置、迷你图设', 'video/2026/07/15/5ab7a040ae224e34bd46be4ac00c7542.mp4', '05-066-图表设置、迷你图设.mp4', 66, 0, 1, 0, 0, 0, 1, '2026-07-15 23:06:53', '2026-07-15 23:06:53');
INSERT INTO `edu_video` VALUES (2077409659044003841, 2046957172130938881, 2046957467179253762, '数据清单、排序', 'video/2026/07/15/c44655d2674a48c1a9a1e2fcf9e38e16.mp4', '05-067-数据清单、排序.mp4', 67, 0, 1, 0, 0, 0, 1, '2026-07-15 23:07:14', '2026-07-15 23:07:14');
INSERT INTO `edu_video` VALUES (2077409742774894593, 2046957172130938881, 2046957467179253762, '分类汇总', 'video/2026/07/15/060692ece8cc47dda473f3800237ae7c.mp4', '05-068-分类汇总.mp4', 68, 0, 1, 0, 0, 0, 1, '2026-07-15 23:07:34', '2026-07-15 23:07:34');
INSERT INTO `edu_video` VALUES (2077409856276955138, 2046957172130938881, 2046957467179253762, '数据透视表、合并', 'video/2026/07/15/ad905224c9b34e719fd6d7f53ebf316c.mp4', '05-069-数据透视表、合并.mp4', 69, 0, 1, 0, 0, 0, 1, '2026-07-15 23:08:01', '2026-07-15 23:08:01');
INSERT INTO `edu_video` VALUES (2077409930239311874, 2046957172130938881, 2046957467179253762, '保护、页面设置', 'video/2026/07/15/f16325f2e03c470a9d455cbabc1b70ed.mp4', '05-070-保护、页面设置.mp4', 70, 0, 1, 0, 0, 0, 1, '2026-07-15 23:08:18', '2026-07-15 23:08:18');
INSERT INTO `edu_video` VALUES (2077410004503658498, 2046957172130938881, 2046957467179253762, '打印设置、宏', 'video/2026/07/15/0d02919684cd4a9cb97b944b2252053d.mp4', '05-071-打印设置、宏.mp4', 71, 0, 1, 0, 0, 0, 1, '2026-07-15 23:08:36', '2026-07-15 23:08:36');
INSERT INTO `edu_video` VALUES (2077410082467381249, 2046957172130938881, 2046957467179253762, 'PPT基础知识', 'video/2026/07/15/38b860a9f7bd4235904ff4197371a5e5.mp4', '06-072-PPT基础知识.mp4', 72, 0, 1, 0, 0, 0, 1, '2026-07-15 23:08:55', '2026-07-15 23:08:55');
INSERT INTO `edu_video` VALUES (2077410188008652802, 2046957172130938881, 2046957467179253762, '插入文本、图片、音视频', 'video/2026/07/15/56967ba2366342278592db4c1298f94e.mp4', '06-073-插入文本、图片、音视频.mp4', 73, 0, 1, 0, 0, 0, 1, '2026-07-15 23:09:20', '2026-07-15 23:09:20');
INSERT INTO `edu_video` VALUES (2077410269403316226, 2046957172130938881, 2046957467179253762, '超链接与动作', 'video/2026/07/15/ee36f1839852484390ade3a8886fb35c.mp4', '06-074-超链接与动作.mp4', 74, 0, 1, 0, 0, 0, 1, '2026-07-15 23:09:39', '2026-07-15 23:09:39');
INSERT INTO `edu_video` VALUES (2077410361350848513, 2046957172130938881, 2046957467179253762, '主题、背景、页面设置', 'video/2026/07/15/bf83db4069c1494e90b3eeac850fe3f4.mp4', '06-075-主题、背景、页面设置.mp4', 75, 0, 1, 0, 0, 0, 1, '2026-07-15 23:10:01', '2026-07-15 23:10:01');
INSERT INTO `edu_video` VALUES (2077410444284821505, 2046957172130938881, 2046957467179253762, '母版、模板、版式', 'video/2026/07/15/2639884b1fac452595ffd86860462c26.mp4', '06-076-母版、模板、版式.mp4', 76, 0, 1, 0, 0, 0, 1, '2026-07-15 23:10:21', '2026-07-15 23:10:21');
INSERT INTO `edu_video` VALUES (2077410516196163586, 2046957172130938881, 2046957467179253762, '对象动画', 'video/2026/07/15/56a05df411904e42bafe3c83dd0d07a6.mp4', '06-077-对象动画.mp4', 77, 0, 1, 0, 0, 0, 1, '2026-07-15 23:10:38', '2026-07-15 23:10:38');
INSERT INTO `edu_video` VALUES (2077410599457292290, 2046957172130938881, 2046957467179253762, '幻灯片切换、幻灯片', 'video/2026/07/15/c34e68843b3a4f658a13f4fb1c8d783b.mp4', '06-078-幻灯片切换、幻灯片.mp4', 78, 0, 1, 0, 0, 0, 1, '2026-07-15 23:10:58', '2026-07-15 23:10:58');
INSERT INTO `edu_video` VALUES (2077410686065475585, 2046957172130938881, 2046957467179253762, '共享、打包、保护与打印设置', 'video/2026/07/15/fbcff033231f4792867f92b451c95d5f.mp4', '06-079-共享、打包、保护与打印设置.mp4', 79, 0, 1, 0, 0, 0, 1, '2026-07-15 23:11:19', '2026-07-15 23:11:19');
INSERT INTO `edu_video` VALUES (2077410766088601602, 2046957172130938881, 2046957467179253762, '多媒体基础概念', 'video/2026/07/15/5c88c8fc28364c71bf7bbd5117f6c4c7.mp4', '07-080-多媒体基础概念.mp4', 80, 0, 1, 0, 0, 0, 1, '2026-07-15 23:11:38', '2026-07-15 23:11:38');
INSERT INTO `edu_video` VALUES (2077410851702734850, 2046957172130938881, 2046957467179253762, '音频的数字化', 'video/2026/07/15/8428b5d818b54c3ba9d68b7246161339.mp4', '07-081-音频的数字化.mp4', 81, 0, 1, 0, 0, 0, 1, '2026-07-15 23:11:58', '2026-07-15 23:11:58');
INSERT INTO `edu_video` VALUES (2077411768015552513, 2046957172130938881, 2046957467179253762, '图像的数字化', 'video/2026/07/15/2312aa6afc1547c7aeb89e15e015f9db.mp4', '07-082-图像的数字化.mp4', 82, 0, 1, 0, 0, 0, 1, '2026-07-15 23:15:37', '2026-07-15 23:15:37');
INSERT INTO `edu_video` VALUES (2077412265191571457, 2046957172130938881, 2046957467179253762, '视频的数字化及多媒体文件格式', 'video/2026/07/15/22bda2dca7414764bb6b54872ff44085.mp4', '07-083-视频的数字化及多媒体文件格式.mp4', 83, 0, 1, 0, 0, 0, 1, '2026-07-15 23:17:35', '2026-07-15 23:17:35');
INSERT INTO `edu_video` VALUES (2077412356564484098, 2046957172130938881, 2046957467179253762, '流媒体及数字媒体技术', 'video/2026/07/15/9fa5a475902a4a9fb4c8e3c4c871ae12.mp4', '07-084-流媒体及数字媒体技术.mp4', 84, 0, 1, 0, 0, 0, 1, '2026-07-15 23:17:57', '2026-07-15 23:17:57');
INSERT INTO `edu_video` VALUES (2077412457626238977, 2046957172130938881, 2046957467179253762, '网络的定义、组成、功能和分类', 'video/2026/07/15/b4e53b323b054286817ec30fa02b9df9.mp4', '08-085-网络的定义、组成、功能和分类.mp4', 85, 0, 1, 0, 0, 0, 1, '2026-07-15 23:18:21', '2026-07-15 23:18:21');
INSERT INTO `edu_video` VALUES (2077412563117178881, 2046957172130938881, 2046957467179253762, '网络的性能指标和发展阶段', 'video/2026/07/15/94c14f6ab6d84274a6f83efa8d0a4842.mp4', '08-086-网络的性能指标和发展阶段.mp4', 86, 0, 1, 0, 0, 0, 1, '2026-07-15 23:18:46', '2026-07-15 23:18:46');
INSERT INTO `edu_video` VALUES (2077412657371578369, 2046957172130938881, 2046957467179253762, 'OSI参考模型和TCP、IP体系结构', 'video/2026/07/15/e1336340904f47f1bb453094ac291d4a.mp4', '08-087-OSI参考模型和TCP、IP体系结构.mp4', 87, 0, 1, 0, 0, 0, 1, '2026-07-15 23:19:09', '2026-07-15 23:19:09');
INSERT INTO `edu_video` VALUES (2077412737415675905, 2046957172130938881, 2046957467179253762, '常用网络协议', 'video/2026/07/15/652d7a62a60640a9a1ef3e624dc32381.mp4', '08-088-常用网络协议.mp4', 88, 0, 1, 0, 0, 0, 1, '2026-07-15 23:19:28', '2026-07-15 23:19:28');
INSERT INTO `edu_video` VALUES (2077412844676612098, 2046957172130938881, 2046957467179253762, '网卡、交换机、路由', 'video/2026/07/15/c9fb3bda573d445a9d89d423739a5f45.mp4', '08-089-网卡、交换机、路由.mp4', 89, 0, 1, 0, 0, 0, 1, '2026-07-15 23:19:53', '2026-07-15 23:19:53');
INSERT INTO `edu_video` VALUES (2077412928864681986, 2046957172130938881, 2046957467179253762, 'IP地址及分类', 'video/2026/07/15/0f95043abff741d6b4806ac66fc39c55.mp4', '08-090-IP地址及分类.mp4', 90, 0, 1, 0, 0, 0, 1, '2026-07-15 23:20:13', '2026-07-15 23:20:13');
INSERT INTO `edu_video` VALUES (2077413026784903170, 2046957172130938881, 2046957467179253762, '子网掩码', 'video/2026/07/15/c7a09a7699c844bc9239f518603b1404.mp4', '08-091-子网掩码.mp4', 91, 0, 1, 0, 0, 0, 1, '2026-07-15 23:20:37', '2026-07-15 23:20:37');
INSERT INTO `edu_video` VALUES (2077413116824027137, 2046957172130938881, 2046957467179253762, '求网络地址、广播地址、同一子网', 'video/2026/07/15/1c9bb5bd200744d1ac6de5d998565c2c.mp4', '08-092-求网络地址、广播地址、同一子网.mp4', 92, 0, 1, 0, 0, 0, 1, '2026-07-15 23:20:58', '2026-07-15 23:20:58');
INSERT INTO `edu_video` VALUES (2077413197425967105, 2046957172130938881, 2046957467179253762, '子网划分', 'video/2026/07/15/8e3bb87983e749ef8284581dd8fda391.mp4', '08-093-子网划分.mp4', 93, 0, 1, 0, 0, 0, 1, '2026-07-15 23:21:17', '2026-07-15 23:21:17');
INSERT INTO `edu_video` VALUES (2077413279684657154, 2046957172130938881, 2046957467179253762, '域名系统DNS、URL', 'video/2026/07/15/7e19e603716b4bad9b99410990d3bb35.mp4', '08-094-域名系统DNS、URL.mp4', 94, 0, 1, 0, 0, 0, 1, '2026-07-15 23:21:37', '2026-07-15 23:21:37');
INSERT INTO `edu_video` VALUES (2077413381908234241, 2046957172130938881, 2046957467179253762, 'WWW、电子邮件、浏览器', 'video/2026/07/15/eaba414adfd74252a1178ea3e1232c38.mp4', '08-095-WWW、电子邮件、浏览器.mp4', 95, 0, 1, 0, 0, 0, 1, '2026-07-15 23:22:01', '2026-07-15 23:22:01');
INSERT INTO `edu_video` VALUES (2077413462304653313, 2046957172130938881, 2046957467179253762, '信息检索', 'video/2026/07/15/12ba1b5d7a6c49fea64619c02b1c2522.mp4', '08-096-信息检索.mp4', 96, 0, 1, 0, 0, 0, 1, '2026-07-15 23:22:21', '2026-07-15 23:22:21');
INSERT INTO `edu_video` VALUES (2077413545934880769, 2046957172130938881, 2046957467179253762, '信息安全术语、加密技术', 'video/2026/07/15/ebc9336afd8c4f75b532891e0831717b.mp4', '09-097-信息安全术语、加密技术.mp4', 97, 0, 1, 0, 0, 0, 1, '2026-07-15 23:22:40', '2026-07-15 23:22:40');
INSERT INTO `edu_video` VALUES (2077413622736781313, 2046957172130938881, 2046957467179253762, '防火墙、网络攻击防范', 'video/2026/07/15/3ad90be17f7341f593f43e358b4946a8.mp4', '09-098-防火墙、网络攻击防范.mp4', 98, 0, 1, 0, 0, 0, 1, '2026-07-15 23:22:59', '2026-07-15 23:22:59');
INSERT INTO `edu_video` VALUES (2077413717997813761, 2046957172130938881, 2046957467179253762, '计算机病毒及个人防护', 'video/2026/07/15/0b4b3c13e5b04be3aec796b4e6bdef63.mp4', '09-099-计算机病毒及个人防护.mp4', 99, 0, 1, 0, 0, 0, 1, '2026-07-15 23:23:22', '2026-07-15 23:23:22');
INSERT INTO `edu_video` VALUES (2077413808271818754, 2046957172130938881, 2046957467179253762, '辨别虚假信息的方法', 'video/2026/07/15/facc31957df640cda01e70f412df8960.mp4', '09-100-辨别虚假信息的方法.mp4', 100, 0, 1, 0, 0, 0, 1, '2026-07-15 23:23:43', '2026-07-15 23:23:43');
INSERT INTO `edu_video` VALUES (2077413879738564609, 2046957172130938881, 2046957467179253762, '云计算', 'video/2026/07/15/453bb24594774f4d833b8ddacc45bc99.mp4', '10-101-云计算.mp4', 101, 0, 1, 0, 0, 0, 1, '2026-07-15 23:24:00', '2026-07-15 23:24:00');
INSERT INTO `edu_video` VALUES (2077413955588358145, 2046957172130938881, 2046957467179253762, '大数据', 'video/2026/07/15/cd800bbfff884cdb9abf11e484049e1c.mp4', '10-102-大数据.mp4', 102, 0, 1, 0, 0, 0, 1, '2026-07-15 23:24:18', '2026-07-15 23:24:18');
INSERT INTO `edu_video` VALUES (2077414030947418113, 2046957172130938881, 2046957467179253762, '物联网', 'video/2026/07/15/fc3dfa3a7e3c47de97b680114e99d761.mp4', '10-103-物联网.mp4', 103, 0, 1, 0, 0, 0, 1, '2026-07-15 23:24:36', '2026-07-15 23:24:36');
INSERT INTO `edu_video` VALUES (2077414109502537729, 2046957172130938881, 2046957467179253762, '人工智能', 'video/2026/07/15/d1237c4b94cc42ee91eeda6f3b3ba6ed.mp4', '10-104-人工智能.mp4', 104, 0, 1, 0, 0, 0, 1, '2026-07-15 23:24:55', '2026-07-15 23:24:55');
INSERT INTO `edu_video` VALUES (2077414184391835649, 2046957172130938881, 2046957467179253762, '区块链、5G、现代通信技术', 'video/2026/07/15/26e19bddca854accb3330c20cf297aef.mp4', '10-105-区块链、5G、现代通信技术.mp4', 105, 0, 1, 0, 0, 0, 1, '2026-07-15 23:25:13', '2026-07-15 23:25:13');
INSERT INTO `edu_video` VALUES (2077414271708856322, 2046957172130938881, 2046957467179253762, '虚拟现实、元宇宙、量子信息', 'video/2026/07/15/ef88df06a610415bbdfa7ae71af80ebc.mp4', '10-106-虚拟现实、元宇宙、量子信息.mp4', 106, 0, 1, 0, 0, 0, 1, '2026-07-15 23:25:34', '2026-07-15 23:25:34');
INSERT INTO `edu_video` VALUES (2077414353476812802, 2046957172130938881, 2046957467179253762, '计算思维', 'video/2026/07/15/fac7ec46886f4daa85b0ad846bdd9d88.mp4', '11-107-计算思维.mp4', 107, 0, 1, 0, 0, 0, 1, '2026-07-15 23:25:53', '2026-07-15 23:25:53');
INSERT INTO `edu_video` VALUES (2077414436524032001, 2046957172130938881, 2046957467179253762, '算法概念、特征、复杂', 'video/2026/07/15/141b875568d34a10b2881bdd462639e7.mp4', '11-108-算法概念、特征、复杂.mp4', 108, 0, 1, 0, 0, 0, 1, '2026-07-15 23:26:13', '2026-07-15 23:26:13');
INSERT INTO `edu_video` VALUES (2077414547698253826, 2046957172130938881, 2046957467179253762, '累加、累乘、顺序查找、二分查找、冒泡排序、选择排序', 'video/2026/07/15/df867502eb1e4754b607ac97000a6acc.mp4', '11-109-累加、累乘、顺序查找、二分查找、冒泡排序、选择排序.mp4', 109, 0, 1, 0, 0, 0, 1, '2026-07-15 23:26:39', '2026-07-15 23:26:39');
INSERT INTO `edu_video` VALUES (2077414634407100417, 2046957172130938881, 2046957467179253762, '常用算法设计策略', 'video/2026/07/15/5904d970de334fa7a0f8cba1f08ac9ad.mp4', '11-110-常用算法设计策略.mp4', 110, 0, 1, 0, 0, 0, 1, '2026-07-15 23:27:00', '2026-07-15 23:27:00');
INSERT INTO `edu_video` VALUES (2077414724773380097, 2046957172130938881, 2046957467179253762, '流程图(1)', 'video/2026/07/15/9852a6d1349746f1abdb9a6bd4549b4b.mp4', '11-111-流程图(1).mp4', 111, 0, 1, 0, 0, 0, 1, '2026-07-15 23:27:22', '2026-07-15 23:27:22');
INSERT INTO `edu_video` VALUES (2077414810156826626, 2046957172130938881, 2046957467179253762, '流程图(2)', 'video/2026/07/15/81967eb3c4b148b581c8c2572931f784.mp4', '11-112-流程图(2).mp4', 112, 0, 1, 0, 0, 0, 1, '2026-07-15 23:27:42', '2026-07-15 23:27:42');
INSERT INTO `edu_video` VALUES (2077414877169221633, 2046957172130938881, 2046957467179253762, '流程图(3)', 'video/2026/07/15/59e166e6804c4af9bc102b0f1d125e47.mp4', '11-113-流程图(3).mp4', 113, 0, 1, 0, 0, 0, 1, '2026-07-15 23:27:58', '2026-07-15 23:27:58');
INSERT INTO `edu_video` VALUES (2077414972732243970, 2046957172130938881, 2046957467179253762, '流程图(4)', 'video/2026/07/15/16f9f930f7fd451b954b70f18c48a5f4.mp4', '11-114-流程图(4).mp4', 114, 0, 1, 0, 0, 0, 1, '2026-07-15 23:28:21', '2026-07-15 23:28:21');
INSERT INTO `edu_video` VALUES (2077415051446747138, 2046957172130938881, 2046957467179253762, '流程图(5)', 'video/2026/07/15/8c0b079d64e84771bbebcfa29ec2ddc0.mp4', '11-115-流程图(5).mp4', 115, 0, 1, 0, 0, 0, 1, '2026-07-15 23:28:39', '2026-07-15 23:28:39');
INSERT INTO `edu_video` VALUES (2077415117511229442, 2046957172130938881, 2046957467179253762, '流程图(6)', 'video/2026/07/15/753beffba6394bca950a74e39785b968.mp4', '11-116-流程图(6).mp4', 116, 0, 1, 0, 0, 0, 1, '2026-07-15 23:28:55', '2026-07-15 23:28:55');
INSERT INTO `edu_video` VALUES (2077415183806398465, 2046957172130938881, 2046957467179253762, '流程图(7)', 'video/2026/07/15/24813d22025e4dcf990c6b18bcb24d88.mp4', '11-117-流程图(7).mp4', 117, 0, 1, 0, 0, 0, 1, '2026-07-15 23:29:11', '2026-07-15 23:29:11');
INSERT INTO `edu_video` VALUES (2077415254920822785, 2046957172130938881, 2046957467179253762, '程序语言的发展', 'video/2026/07/15/cc7328e6403a429fab8cfa3e6fd7b0d7.mp4', '11-118-程序语言的发展.mp4', 118, 0, 1, 0, 0, 0, 1, '2026-07-15 23:29:28', '2026-07-15 23:29:28');
INSERT INTO `edu_video` VALUES (2077415319097868289, 2046957172130938881, 2046957467179253762, '程序语言的分类、结构、面向对象程序设计', 'video/2026/07/15/0d6337765eaa4a7387f30058f6294c3c.mp4', '11-119-程序语言的分类、结构、面向对象程序设计.mp4', 119, 0, 1, 0, 0, 0, 1, '2026-07-15 23:29:43', '2026-07-15 23:29:43');
INSERT INTO `edu_video` VALUES (2077415380896743426, 2046957172130938881, 2046957467179253762, '数据结构(1)', 'video/2026/07/15/f97deed1f03d423aa8f31692bdaad1ce.mp4', '11-120-数据结构(1).mp4', 120, 0, 1, 0, 0, 0, 1, '2026-07-15 23:29:58', '2026-07-15 23:29:58');
INSERT INTO `edu_video` VALUES (2077415441319886849, 2046957172130938881, 2046957467179253762, '数据结构(2)', 'video/2026/07/15/244f6110fd4948b8bdaec847baa73653.mp4', '11-121-数据结构(2).mp4', 121, 0, 1, 0, 0, 0, 1, '2026-07-15 23:30:12', '2026-07-15 23:30:12');
INSERT INTO `edu_video` VALUES (2077415511570284545, 2046957172130938881, 2046957467179253762, '数据结构(3)', 'video/2026/07/15/bb530dc09cc2491c8d5cbb509ad63f33.mp4', '11-122-数据结构(3).mp4', 122, 0, 1, 0, 0, 0, 1, '2026-07-15 23:30:29', '2026-07-15 23:30:29');
INSERT INTO `edu_video` VALUES (2077415640947785730, 2046957172130938881, 2046957467179253762, '数据库基本概念及组成', 'video/2026/07/15/801f146d164b4560a5951d186a8dd746.mp4', '12-123-数据库基本概念及组成.mp4', 123, 0, 1, 0, 0, 0, 1, '2026-07-15 23:31:00', '2026-07-15 23:31:00');
INSERT INTO `edu_video` VALUES (2077415713253392386, 2046957172130938881, 2046957467179253762, '数据模型', 'video/2026/07/15/a9a43510094b4846b07e8cf4dee6cc8f.mp4', '12-124-数据模型.mp4', 124, 0, 1, 0, 0, 0, 1, '2026-07-15 23:31:17', '2026-07-15 23:31:17');
INSERT INTO `edu_video` VALUES (2077415793020665857, 2046957172130938881, 2046957467179253762, 'E-R图', 'video/2026/07/15/5719c7242e374239aa13fb0ee580355c.mp4', '12-125-E-R图.mp4', 125, 0, 1, 0, 0, 0, 1, '2026-07-15 23:31:36', '2026-07-15 23:31:36');
INSERT INTO `edu_video` VALUES (2077611209729277954, 2077610754055897089, 2077610974118445057, '绪论', 'video/2026/07/16/c46b9e39a0414899bc5b3387b9c13443.mp4', '01-001-绪论.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 12:28:07', '2026-07-16 12:28:07');
INSERT INTO `edu_video` VALUES (2077611325546594305, 2077610754055897089, 2077610974118445057, '细胞生理(1)', 'video/2026/07/16/0f78bf08d63946628182f1331be7ce95.mp4', '02-002-细胞生理(1).mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 12:28:35', '2026-07-16 12:28:35');
INSERT INTO `edu_video` VALUES (2077611386481442817, 2077610754055897089, 2077610974118445057, '细胞生理(2)', 'video/2026/07/16/b2a54b24f6fb46be8fecd57237d5dafb.mp4', '02-003-细胞生理(2).mp4', 3, 0, 1, 0, 0, 0, 1, '2026-07-16 12:28:49', '2026-07-16 12:28:49');
INSERT INTO `edu_video` VALUES (2077611516790079490, 2077610754055897089, 2077610974118445057, '血液生理', 'video/2026/07/16/aa0965f28ba24875985186b35e028985.mp4', '03-004-血液生理.mp4', 4, 0, 1, 0, 0, 0, 1, '2026-07-16 12:29:20', '2026-07-16 12:29:20');
INSERT INTO `edu_video` VALUES (2077611584343539714, 2077610754055897089, 2077610974118445057, '循环生理', 'video/2026/07/16/e680ce65eb50442ba09e820f2cb2e9ab.mp4', '04-005-循环生理.mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-16 12:29:37', '2026-07-16 12:29:37');
INSERT INTO `edu_video` VALUES (2077614820156801025, 2077614647150149633, 2077614682277445634, '概述', 'video/2026/07/16/297e2465680548ec837a5987bd1a134d.mp4', '01-001-概述.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 12:42:28', '2026-07-16 12:42:28');
INSERT INTO `edu_video` VALUES (2077614887685095426, 2077614647150149633, 2077614682277445634, '骨学总论', 'video/2026/07/16/a0d6ddbb8eb44aaaa567506d7b487641.mp4', '02-002-骨学总论.mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 12:42:44', '2026-07-16 12:42:44');
INSERT INTO `edu_video` VALUES (2077614947831414785, 2077614647150149633, 2077614682277445634, '躯干骨', 'video/2026/07/16/ac922238d5054f739570456beb4b9bcc.mp4', '02-003-躯干骨.mp4', 3, 0, 1, 0, 0, 0, 1, '2026-07-16 12:42:58', '2026-07-16 12:42:58');
INSERT INTO `edu_video` VALUES (2077615017154871297, 2077614647150149633, 2077614682277445634, '颅骨', 'video/2026/07/16/745220c4ccb841f5aa677bc88274c104.mp4', '02-004-颅骨.mp4', 4, 0, 1, 0, 0, 0, 1, '2026-07-16 12:43:15', '2026-07-16 12:43:15');
INSERT INTO `edu_video` VALUES (2077615075225010178, 2077614647150149633, 2077614682277445634, '颅的整体观', 'video/2026/07/16/2d5b6c7f9afb4199904ed552ff3062e8.mp4', '02-005-颅的整体观.mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-16 12:43:29', '2026-07-16 12:43:29');
INSERT INTO `edu_video` VALUES (2077615137556561921, 2077614647150149633, 2077614682277445634, '上肢骨', 'video/2026/07/16/8d12d09cd09148bba88316246966caa2.mp4', '02-006-上肢骨.mp4', 6, 0, 1, 0, 0, 0, 1, '2026-07-16 12:43:44', '2026-07-16 12:43:44');
INSERT INTO `edu_video` VALUES (2077615200613728258, 2077614647150149633, 2077614682277445634, '下肢骨', 'video/2026/07/16/d6bf920cba894c3da8308a26bc3d84e6.mp4', '02-007-下肢骨.mp4', 7, 0, 1, 0, 0, 0, 1, '2026-07-16 12:43:59', '2026-07-16 12:43:59');
INSERT INTO `edu_video` VALUES (2077615382977871873, 2077614647150149633, 2077614682277445634, '关节学总论', 'video/2026/07/16/488d9413529b412ab9e910e999e2d266.mp4', '03-008-关节学总论.mp4', 8, 0, 1, 0, 0, 0, 1, '2026-07-16 12:44:42', '2026-07-16 12:44:42');
INSERT INTO `edu_video` VALUES (2077615447503044609, 2077614647150149633, 2077614682277445634, '上肢骨的连结', 'video/2026/07/16/174a5d7975674525babd5cdecb126717.mp4', '03-009-上肢骨的连结.mp4', 9, 0, 1, 0, 0, 0, 1, '2026-07-16 12:44:58', '2026-07-16 12:44:58');
INSERT INTO `edu_video` VALUES (2077615510627319809, 2077614647150149633, 2077614682277445634, '下肢骨的连结', 'video/2026/07/16/f01c11b9305d4dfdabbe542cdf19ee3f.mp4', '03-010-下肢骨的连结.mp4', 10, 0, 1, 0, 0, 0, 1, '2026-07-16 12:45:13', '2026-07-16 12:45:13');
INSERT INTO `edu_video` VALUES (2077615574292660226, 2077614647150149633, 2077614682277445634, '中轴骨的连结', 'video/2026/07/16/ab014cd42d494fbf9dee61771b61788c.mp4', '03-011-中轴骨的连结.mp4', 11, 0, 1, 0, 0, 0, 1, '2026-07-16 12:45:28', '2026-07-16 12:45:28');
INSERT INTO `edu_video` VALUES (2077615647462293506, 2077614647150149633, 2077614682277445634, '肌学总论', 'video/2026/07/16/3337c22467824933b972b92e50020f23.mp4', '04-012-肌学总论.mp4', 12, 0, 1, 0, 0, 0, 1, '2026-07-16 12:45:45', '2026-07-16 12:45:45');
INSERT INTO `edu_video` VALUES (2077615709839982593, 2077614647150149633, 2077614682277445634, '头肌', 'video/2026/07/16/d6cb471513fc40d4bd85992415d0aac6.mp4', '04-013-头肌.mp4', 13, 0, 1, 0, 0, 0, 1, '2026-07-16 12:46:00', '2026-07-16 12:46:00');
INSERT INTO `edu_video` VALUES (2077615778534293506, 2077614647150149633, 2077614682277445634, '颈肌', 'video/2026/07/16/395ccba7ac324f80bbe2f257201aad3d.mp4', '04-014-颈肌.mp4', 14, 0, 1, 0, 0, 0, 1, '2026-07-16 12:46:17', '2026-07-16 12:46:17');
INSERT INTO `edu_video` VALUES (2077615859488555009, 2077614647150149633, 2077614682277445634, '躯干肌(1)', 'video/2026/07/16/bfe117ba133147ab94070e3d19f30479.mp4', '04-015-躯干肌(1).mp4', 15, 0, 1, 0, 0, 0, 1, '2026-07-16 12:46:36', '2026-07-16 12:46:36');
INSERT INTO `edu_video` VALUES (2077615944473542658, 2077614647150149633, 2077614682277445634, '躯干肌(2)', 'video/2026/07/16/d376643b8b3847d49c9364e5a5e42f5e.mp4', '04-016-躯干肌(2).mp4', 16, 0, 1, 0, 0, 0, 1, '2026-07-16 12:46:56', '2026-07-16 12:46:56');
INSERT INTO `edu_video` VALUES (2077616013327237121, 2077614647150149633, 2077614682277445634, '上肢肌(1)', 'video/2026/07/16/149fb18bc68b40df94f935e7b6283973.mp4', '04-017-上肢肌(1).mp4', 17, 0, 1, 0, 0, 0, 1, '2026-07-16 12:47:12', '2026-07-16 12:47:12');
INSERT INTO `edu_video` VALUES (2077616071355432961, 2077614647150149633, 2077614682277445634, '上肢肌(2)', 'video/2026/07/16/3d2d563f2a41407ab64d3834c6aa4d60.mp4', '04-018-上肢肌(2).mp4', 18, 0, 1, 0, 0, 0, 1, '2026-07-16 12:47:26', '2026-07-16 12:47:26');
INSERT INTO `edu_video` VALUES (2077616137604464641, 2077614647150149633, 2077614682277445634, '下肢肌', 'video/2026/07/16/a24dc3be7f46400aba166c08080a5cd1.mp4', '04-019-下肢肌.mp4', 19, 0, 1, 0, 0, 0, 1, '2026-07-16 12:47:42', '2026-07-16 12:47:42');
INSERT INTO `edu_video` VALUES (2077619013093457922, 2077618770159370241, 2077618815881478145, '经济学基础', 'video/2026/07/16/312ddf785a6c46e9ab5f7b6097c00990.mp4', '01-001-经济学基础.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 12:59:08', '2026-07-16 12:59:08');
INSERT INTO `edu_video` VALUES (2077656005755830274, 2077655238940590081, 2077655305986539521, '管理导论(1)', 'video/2026/07/16/46984383e62f4b5db1c1ba92bd434f42.mp4', '01-001-管理导论(1).mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 15:26:07', '2026-07-16 15:26:07');
INSERT INTO `edu_video` VALUES (2077656161179959297, 2077655238940590081, 2077655305986539521, '管理导论(2)', 'video/2026/07/16/0150b85ca6f24f5cb984c0bcc03a16c2.mp4', '01-002-管理导论(2).mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 15:26:44', '2026-07-16 15:26:44');
INSERT INTO `edu_video` VALUES (2077656377308250114, 2077655238940590081, 2077655305986539521, '管理导论(3)', 'video/2026/07/16/d95936a4ecf14ece819e6d9b71af59ff.mp4', '01-003-管理导论(3).mp4', 3, 0, 1, 0, 0, 0, 1, '2026-07-16 15:27:36', '2026-07-16 15:27:36');
INSERT INTO `edu_video` VALUES (2077656451526459394, 2077655238940590081, 2077655305986539521, '管理导论(4)', 'video/2026/07/16/aa68daee62604d8e8ebf8974471f74ef.mp4', '01-004-管理导论(4).mp4', 4, 0, 1, 0, 0, 0, 1, '2026-07-16 15:27:54', '2026-07-16 15:27:54');
INSERT INTO `edu_video` VALUES (2077656535437705218, 2077655238940590081, 2077655305986539521, '管理导论(5)', 'video/2026/07/16/02e6167ae163468286d83d143e451667.mp4', '01-005-管理导论(5).mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-16 15:28:14', '2026-07-16 15:28:14');
INSERT INTO `edu_video` VALUES (2077656591851094018, 2077655238940590081, 2077655305986539521, '管理学', 'video/2026/07/16/ec006c5b751c424eb194a8be6bd64fd4.mp4', '01-006-管理学.mp4', 6, 0, 1, 0, 0, 0, 1, '2026-07-16 15:28:27', '2026-07-16 15:28:27');
INSERT INTO `edu_video` VALUES (2077656650386800641, 2077655238940590081, 2077655305986539521, '管理理论的历史演变(1)', 'video/2026/07/16/d53bc56da310404cbfc4d9a79cb1525f.mp4', '02-007-管理理论的历史演变(1).mp4', 7, 0, 1, 0, 0, 0, 1, '2026-07-16 15:28:41', '2026-07-16 15:28:41');
INSERT INTO `edu_video` VALUES (2077656706523365377, 2077655238940590081, 2077655305986539521, '管理理论的历史演变(2)', 'video/2026/07/16/fd8b12a0309440f89eb9c6b942a3fb87.mp4', '02-008-管理理论的历史演变(2).mp4', 8, 0, 1, 0, 0, 0, 1, '2026-07-16 15:28:54', '2026-07-16 15:28:54');
INSERT INTO `edu_video` VALUES (2077656800014401537, 2077655238940590081, 2077655305986539521, '管理理论的历史演变(3)', 'video/2026/07/16/029f5df5723c46e0aad68b3c69adf2bb.mp4', '02-009-管理理论的历史演变(3).mp4', 9, 0, 1, 0, 0, 0, 1, '2026-07-16 15:29:17', '2026-07-16 15:29:17');
INSERT INTO `edu_video` VALUES (2077656902917455874, 2077655238940590081, 2077655305986539521, '管理理论的历史演变(4)', 'video/2026/07/16/05c013e410ba40719f82df2dc191b695.mp4', '02-010-管理理论的历史演变(4).mp4', 10, 0, 1, 0, 0, 0, 1, '2026-07-16 15:29:41', '2026-07-16 15:29:41');
INSERT INTO `edu_video` VALUES (2077656976087089154, 2077655238940590081, 2077655305986539521, '管理理论的历史演变(5)', 'video/2026/07/16/ea8636e0561d475d9af709d4b934a305.mp4', '02-011-管理理论的历史演变(5).mp4', 11, 0, 1, 0, 0, 0, 1, '2026-07-16 15:29:59', '2026-07-16 15:29:59');
INSERT INTO `edu_video` VALUES (2077657030634012673, 2077655238940590081, 2077655305986539521, '管理理论的历史演变(6)', 'video/2026/07/16/f29ad38f33ba4e01adfb77b8969207ea.mp4', '02-012-管理理论的历史演变(6).mp4', 12, 0, 1, 0, 0, 0, 1, '2026-07-16 15:30:12', '2026-07-16 15:30:12');
INSERT INTO `edu_video` VALUES (2077657086166597633, 2077655238940590081, 2077655305986539521, '管理理论的历史演变(7)', 'video/2026/07/16/dfd35bb8d9ef4e07b634fd9386f0bccc.mp4', '02-013-管理理论的历史演变(7).mp4', 13, 0, 1, 0, 0, 0, 1, '2026-07-16 15:30:25', '2026-07-16 15:30:25');
INSERT INTO `edu_video` VALUES (2077657152180748289, 2077655238940590081, 2077655305986539521, '管理理论的历史演变(8)', 'video/2026/07/16/96f4507699264b45a66a67daeaebd813.mp4', '02-014-管理理论的历史演变(8).mp4', 14, 0, 1, 0, 0, 0, 1, '2026-07-16 15:30:41', '2026-07-16 15:30:41');
INSERT INTO `edu_video` VALUES (2077657227866963969, 2077655238940590081, 2077655305986539521, '管理道德与企业社会责任(1)', 'video/2026/07/16/23373132b9af4f51aa7d6df64f3c99be.mp4', '03-015-管理道德与企业社会责任(1).mp4', 15, 0, 1, 0, 0, 0, 1, '2026-07-16 15:30:59', '2026-07-16 15:30:59');
INSERT INTO `edu_video` VALUES (2077657290525671425, 2077655238940590081, 2077655305986539521, '管理道德与企业社会责任(2)', 'video/2026/07/16/b9acaa636d5843739818a0b0c30948f8.mp4', '03-016-管理道德与企业社会责任(2).mp4', 16, 0, 1, 0, 0, 0, 1, '2026-07-16 15:31:14', '2026-07-16 15:31:14');
INSERT INTO `edu_video` VALUES (2077657354841128961, 2077655238940590081, 2077655305986539521, '管理道德与企业社会责任(3)', 'video/2026/07/16/415ce2dfae294ebfae7404e9fa930768.mp4', '03-017-管理道德与企业社会责任(3).mp4', 17, 0, 1, 0, 0, 0, 1, '2026-07-16 15:31:29', '2026-07-16 15:31:29');
INSERT INTO `edu_video` VALUES (2077657410415656961, 2077655238940590081, 2077655305986539521, '管理道德与企业社会责任(4)', 'video/2026/07/16/a7a8d6406a03434f9fec9616a8e22b1d.mp4', '03-018-管理道德与企业社会责任(4).mp4', 18, 0, 1, 0, 0, 0, 1, '2026-07-16 15:31:42', '2026-07-16 15:31:42');
INSERT INTO `edu_video` VALUES (2077657502786813954, 2077655238940590081, 2077655305986539521, '决策概述(1)', 'video/2026/07/16/66d833efc7cc4adfac9552140d1fce62.mp4', '04-019-决策概述(1).mp4', 19, 0, 1, 0, 0, 0, 1, '2026-07-16 15:32:04', '2026-07-16 15:32:04');
INSERT INTO `edu_video` VALUES (2077657561062473729, 2077655238940590081, 2077655305986539521, '决策概述(2)', 'video/2026/07/16/39e76a9fae8e4c979c20e9c0cdc5e4ee.mp4', '04-020-决策概述(2).mp4', 20, 0, 1, 0, 0, 0, 1, '2026-07-16 15:32:18', '2026-07-16 15:32:18');
INSERT INTO `edu_video` VALUES (2077657618876760066, 2077655238940590081, 2077655305986539521, '决策概述(3)', 'video/2026/07/16/ace3ffc5befc4698aaf7641496f360ba.mp4', '04-021-决策概述(3).mp4', 21, 0, 1, 0, 0, 0, 1, '2026-07-16 15:32:32', '2026-07-16 15:32:32');
INSERT INTO `edu_video` VALUES (2077657709964460033, 2077655238940590081, 2077655305986539521, '环境分析与理性决策(1)', 'video/2026/07/16/0985fafdd9984cb18480aec3b013528f.mp4', '05-022-环境分析与理性决策(1).mp4', 22, 0, 1, 0, 0, 0, 1, '2026-07-16 15:32:54', '2026-07-16 15:32:54');
INSERT INTO `edu_video` VALUES (2077657769481633794, 2077655238940590081, 2077655305986539521, '环境分析与理性决策(2)', 'video/2026/07/16/206e7816d69f4cf6a38e669069b6e952.mp4', '05-023-环境分析与理性决策(2).mp4', 23, 0, 1, 0, 0, 0, 1, '2026-07-16 15:33:08', '2026-07-16 15:33:08');
INSERT INTO `edu_video` VALUES (2077657831834157058, 2077655238940590081, 2077655305986539521, '环境分析与理性决策(3)', 'video/2026/07/16/84f3dee15039428c941de85fc276cc85.mp4', '05-024-环境分析与理性决策(3).mp4', 24, 0, 1, 0, 0, 0, 1, '2026-07-16 15:33:23', '2026-07-16 15:33:23');
INSERT INTO `edu_video` VALUES (2077657900788514817, 2077655238940590081, 2077655305986539521, '环境分析与理性决策(4)', 'video/2026/07/16/e13f665924ff415b9d2521ccd98542a0.mp4', '05-025-环境分析与理性决策(4).mp4', 25, 0, 1, 0, 0, 0, 1, '2026-07-16 15:33:39', '2026-07-16 15:33:39');
INSERT INTO `edu_video` VALUES (2077662488237211649, 2077662261291810818, 2077662331638677505, '化工原理(1)', 'video/2026/07/16/0eb4af26f03844408fdd96e7f0c80333.mp4', '01-001-化工原理(1).mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 15:51:53', '2026-07-16 15:51:53');
INSERT INTO `edu_video` VALUES (2077662563659186178, 2077662261291810818, 2077662331638677505, '化工原理(2)', 'video/2026/07/16/b3f909526d2941cc88e3da1f5c43f93b.mp4', '01-002-化工原理(2).mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 15:52:11', '2026-07-16 15:52:11');
INSERT INTO `edu_video` VALUES (2077665283904405506, 2077665159044169729, 2077665194913857537, '导学', 'video/2026/07/16/d54de9478f924ecbbc4f2c6ef52279df.mp4', '01-001-导学.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 16:03:00', '2026-07-16 16:03:00');
INSERT INTO `edu_video` VALUES (2077665347817209857, 2077665159044169729, 2077665194913857537, '静力学的基本概念', 'video/2026/07/16/ccf1645f8a3346a5bb004a13d3b2657c.mp4', '01-002-静力学的基本概念.mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 16:03:15', '2026-07-16 16:03:15');
INSERT INTO `edu_video` VALUES (2077665407401492481, 2077665159044169729, 2077665194913857537, '静力学公理', 'video/2026/07/16/b12cf7da5fb54edd8a113f3cd2215716.mp4', '01-003-静力学公理.mp4', 3, 0, 1, 0, 0, 0, 1, '2026-07-16 16:03:29', '2026-07-16 16:03:29');
INSERT INTO `edu_video` VALUES (2077665473839267842, 2077665159044169729, 2077665194913857537, '约束和约束力(1)', 'video/2026/07/16/c05152d102e340c89cc6a8b13417f0fb.mp4', '01-004-约束和约束力(1).mp4', 4, 0, 1, 0, 0, 0, 1, '2026-07-16 16:03:45', '2026-07-16 16:03:45');
INSERT INTO `edu_video` VALUES (2077665536497975297, 2077665159044169729, 2077665194913857537, '约束和约束力(2)', 'video/2026/07/16/5e68a46118b54e0db43cee07fb315b3e.mp4', '01-005-约束和约束力(2).mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-16 16:04:00', '2026-07-16 16:04:00');
INSERT INTO `edu_video` VALUES (2077665602210136066, 2077665159044169729, 2077665194913857537, '物体的受力分析和受力图(1)', 'video/2026/07/16/40ec26a09b324d07a1f8eb9fa32d5848.mp4', '01-006-物体的受力分析和受力图(1).mp4', 6, 0, 1, 0, 0, 0, 1, '2026-07-16 16:04:15', '2026-07-16 16:04:15');
INSERT INTO `edu_video` VALUES (2077665657998573570, 2077665159044169729, 2077665194913857537, '物体的受力分析和受力图(2)', 'video/2026/07/16/e95d9548fae948f09b1b071170c8882d.mp4', '01-007-物体的受力分析和受力图(2).mp4', 7, 0, 1, 0, 0, 0, 1, '2026-07-16 16:04:29', '2026-07-16 16:04:29');
INSERT INTO `edu_video` VALUES (2077665721756188673, 2077665159044169729, 2077665194913857537, '物体的受力分析和受力图(3)', 'video/2026/07/16/966c48e916e94224aae2659b6c58db4a.mp4', '01-008-物体的受力分析和受力图(3).mp4', 8, 0, 1, 0, 0, 0, 1, '2026-07-16 16:04:44', '2026-07-16 16:04:44');
INSERT INTO `edu_video` VALUES (2077665776978395137, 2077665159044169729, 2077665194913857537, '物体的受力分析和受力图(4)', 'video/2026/07/16/a375e455c5d645dfaf9f9447ea17b7e2.mp4', '01-009-物体的受力分析和受力图(4).mp4', 9, 0, 1, 0, 0, 0, 1, '2026-07-16 16:04:57', '2026-07-16 16:04:57');
INSERT INTO `edu_video` VALUES (2077665843974012929, 2077665159044169729, 2077665194913857537, '物体的受力分析和受力图(5)', 'video/2026/07/16/b98b7fd145c64179849b30efb0473d93.mp4', '01-010-物体的受力分析和受力图(5).mp4', 10, 0, 1, 0, 0, 0, 1, '2026-07-16 16:05:13', '2026-07-16 16:05:13');
INSERT INTO `edu_video` VALUES (2077665902065123330, 2077665159044169729, 2077665194913857537, '物体的受力分析和受力图(6)', 'video/2026/07/16/18b329246ebf43abbc0dfc5c128a4854.mp4', '01-011-物体的受力分析和受力图(6).mp4', 11, 0, 1, 0, 0, 0, 1, '2026-07-16 16:05:27', '2026-07-16 16:05:27');
INSERT INTO `edu_video` VALUES (2077666132802174978, 2077665159044169729, 2077665194913857537, '静力学讲评(1)', 'video/2026/07/16/36e8483a90ac43ec9508812b219aafc2.mp4', '01-012-静力学讲评(1).mp4', 12, 0, 1, 0, 0, 0, 1, '2026-07-16 16:06:22', '2026-07-16 16:06:22');
INSERT INTO `edu_video` VALUES (2077666200800231426, 2077665159044169729, 2077665194913857537, '静力学讲评(2)', 'video/2026/07/16/e4c073d7cefc493a871812ccd61a2829.mp4', '01-013-静力学讲评(2).mp4', 13, 0, 1, 0, 0, 0, 1, '2026-07-16 16:06:38', '2026-07-16 16:06:38');
INSERT INTO `edu_video` VALUES (2077666265417678850, 2077665159044169729, 2077665194913857537, '静力学讲评(3)', 'video/2026/07/16/22be574dc97f414b8753f52b171e30a7.mp4', '01-014-静力学讲评(3).mp4', 14, 0, 1, 0, 0, 0, 1, '2026-07-16 16:06:54', '2026-07-16 16:06:54');
INSERT INTO `edu_video` VALUES (2077666344178319361, 2077665159044169729, 2077665194913857537, '平面汇交力系合成与平衡(1)', 'video/2026/07/16/ddfab750f7664b4fa21fdb0ee7d3f144.mp4', '02-015-平面汇交力系合成与平衡(1).mp4', 15, 0, 1, 0, 0, 0, 1, '2026-07-16 16:07:12', '2026-07-16 16:07:12');
INSERT INTO `edu_video` VALUES (2077666400965001218, 2077665159044169729, 2077665194913857537, '平面汇交力系合成与平衡(2)', 'video/2026/07/16/8a968bae663e4f47956f1ee6371924b4.mp4', '02-016-平面汇交力系合成与平衡(2).mp4', 16, 0, 1, 0, 0, 0, 1, '2026-07-16 16:07:26', '2026-07-16 16:07:26');
INSERT INTO `edu_video` VALUES (2077666466186428417, 2077665159044169729, 2077665194913857537, '平面汇交力系解析法(1)', 'video/2026/07/16/42d1e1eca8e546769e84eff2f239fb9f.mp4', '02-017-平面汇交力系解析法(1).mp4', 17, 0, 1, 0, 0, 0, 1, '2026-07-16 16:07:41', '2026-07-16 16:07:41');
INSERT INTO `edu_video` VALUES (2077666535606353921, 2077665159044169729, 2077665194913857537, '平面汇交力系解析法(2)', 'video/2026/07/16/bea5552e19254c969ebc915064113fec.mp4', '02-018-平面汇交力系解析法(2).mp4', 18, 0, 1, 0, 0, 0, 1, '2026-07-16 16:07:58', '2026-07-16 16:07:58');
INSERT INTO `edu_video` VALUES (2077666604862701570, 2077665159044169729, 2077665194913857537, '平面汇交力系平衡方程(1)', 'video/2026/07/16/32972551b9d242abb8bf631d13500bf5.mp4', '02-019-平面汇交力系平衡方程(1).mp4', 19, 0, 1, 0, 0, 0, 1, '2026-07-16 16:08:14', '2026-07-16 16:08:14');
INSERT INTO `edu_video` VALUES (2077666663113195522, 2077665159044169729, 2077665194913857537, '平面汇交力系平衡方程(2)', 'video/2026/07/16/ad4b06c669a24cd6b7fca3657254b8c3.mp4', '02-020-平面汇交力系平衡方程(2).mp4', 20, 0, 1, 0, 0, 0, 1, '2026-07-16 16:08:28', '2026-07-16 16:08:28');
INSERT INTO `edu_video` VALUES (2077666729504833538, 2077665159044169729, 2077665194913857537, '平面汇交力系平衡方程(3)', 'video/2026/07/16/a2b7f7102f864b24b07e6c4b29528bfe.mp4', '02-021-平面汇交力系平衡方程(3).mp4', 21, 0, 1, 0, 0, 0, 1, '2026-07-16 16:08:44', '2026-07-16 16:08:44');
INSERT INTO `edu_video` VALUES (2077666789785370626, 2077665159044169729, 2077665194913857537, '力对点之矩', 'video/2026/07/16/ae8805ca10ee49c6a6dd15dde65e6c1e.mp4', '02-022-力对点之矩.mp4', 22, 0, 1, 0, 0, 0, 1, '2026-07-16 16:08:59', '2026-07-16 16:08:59');
INSERT INTO `edu_video` VALUES (2077666846249091073, 2077665159044169729, 2077665194913857537, '合力矩定理与力矩的解析表达式', 'video/2026/07/16/5c581250f7264239a533256a4ccf06c5.mp4', '02-023-合力矩定理与力矩的解析表达式.mp4', 23, 0, 1, 0, 0, 0, 1, '2026-07-16 16:09:12', '2026-07-16 16:09:12');
INSERT INTO `edu_video` VALUES (2077666904436670466, 2077665159044169729, 2077665194913857537, '黄金右手之判断力矩正负号', 'video/2026/07/16/65bc4c1b42714a6aa472bc6015125d6e.mp4', '02-024-黄金右手之判断力矩正负号.mp4', 24, 0, 1, 0, 0, 0, 1, '2026-07-16 16:09:26', '2026-07-16 16:09:26');
INSERT INTO `edu_video` VALUES (2077666962267734017, 2077665159044169729, 2077665194913857537, '力矩习题讲解', 'video/2026/07/16/4aac89e40b774064ad13ef91a9835140.mp4', '02-025-力矩习题讲解.mp4', 25, 0, 1, 0, 0, 0, 1, '2026-07-16 16:09:40', '2026-07-16 16:09:40');
INSERT INTO `edu_video` VALUES (2077669595149795330, 2077669445333450753, 2077669506545123330, '教育心理学(1)', 'video/2026/07/16/dc4ff57a889949b08e4d6e423f1b0cd3.mp4', '01-001-教育心理学(1).mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 16:20:07', '2026-07-16 16:20:07');
INSERT INTO `edu_video` VALUES (2077669662699061250, 2077669445333450753, 2077669506545123330, '教育心理学(2)', 'video/2026/07/16/fd4723b84df4403da00d720728122edf.mp4', '01-002-教育心理学(2).mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 16:20:23', '2026-07-16 16:20:23');
INSERT INTO `edu_video` VALUES (2077669718604939266, 2077669445333450753, 2077669506545123330, '教育心理学(3)', 'video/2026/07/16/5ce30fd16601483aa60257c4376939e4.mp4', '01-003-教育心理学(3).mp4', 3, 0, 1, 0, 0, 0, 1, '2026-07-16 16:20:37', '2026-07-16 16:20:37');
INSERT INTO `edu_video` VALUES (2077669766348701697, 2077669445333450753, 2077669506545123330, '教育心理学(4)', 'video/2026/07/16/f79cab92d2f742ae91727a9085f96c32.mp4', '01-004-教育心理学(4).mp4', 4, 0, 1, 0, 0, 0, 1, '2026-07-16 16:20:48', '2026-07-16 16:20:48');
INSERT INTO `edu_video` VALUES (2077669820593635330, 2077669445333450753, 2077669506545123330, '教育心理学(5)', 'video/2026/07/16/75b3f6240bf14b85a732c1b43031a06d.mp4', '01-005-教育心理学(5).mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-16 16:21:01', '2026-07-16 16:21:01');
INSERT INTO `edu_video` VALUES (2077669890294579201, 2077669445333450753, 2077669506545123330, '教育心理学(6)', 'video/2026/07/16/4746c64b991b4786aeff99852e4fb111.mp4', '01-006-教育心理学(6).mp4', 6, 0, 1, 0, 0, 0, 1, '2026-07-16 16:21:18', '2026-07-16 16:21:18');
INSERT INTO `edu_video` VALUES (2077672748503040002, 2077672348563570689, 2077672453358256130, '动物医学', 'video/2026/07/16/447f2fd21372414c82a9cd9e5fa2500f.mp4', '动物医学.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 16:32:39', '2026-07-16 16:32:39');
INSERT INTO `edu_video` VALUES (2077675808348471297, 2077675588562747394, 2077675634909806594, '课程介绍', 'video/2026/07/16/6ac29587ee224e31a24181a9bdc1f581.mp4', '01-001-课程介绍.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 16:44:49', '2026-07-16 16:44:49');
INSERT INTO `edu_video` VALUES (2077675893631254530, 2077675588562747394, 2077675634909806594, '鱼类主要经济养殖品种(1)', 'video/2026/07/16/22d5f8cac85342ad9b4e842948391354.mp4', '01-002-鱼类主要经济养殖品种(1).mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 16:45:09', '2026-07-16 16:45:09');
INSERT INTO `edu_video` VALUES (2077675952682860545, 2077675588562747394, 2077675634909806594, '鱼类主要经济养殖品种(2)', 'video/2026/07/16/72616e89396745888feafd2c9e3ab4e2.mp4', '01-003-鱼类主要经济养殖品种(2).mp4', 3, 0, 1, 0, 0, 0, 1, '2026-07-16 16:45:23', '2026-07-16 16:45:23');
INSERT INTO `edu_video` VALUES (2077676019586203650, 2077675588562747394, 2077675634909806594, '鱼类的定义和鱼类学研究的主要内容', 'video/2026/07/16/78772456ce4d449a8d59d4e814544b16.mp4', '01-004-鱼类的定义和鱼类学研究的主要内容.mp4', 4, 0, 1, 0, 0, 0, 1, '2026-07-16 16:45:39', '2026-07-16 16:45:39');
INSERT INTO `edu_video` VALUES (2077676067468378114, 2077675588562747394, 2077675634909806594, '鱼类在脊椎动物中的地位及鱼类的经济意义', 'video/2026/07/16/b32d93dcf08845c58cbaf5f4c33e30d0.mp4', '01-005-鱼类在脊椎动物中的地位及鱼类的经济意义.mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-16 16:45:51', '2026-07-16 16:45:51');
INSERT INTO `edu_video` VALUES (2077676097390542849, 2077675588562747394, 2077675634909806594, '鱼类在脊椎动物中的地位及鱼类的经济意义', 'video/2026/07/16/b32d93dcf08845c58cbaf5f4c33e30d0.mp4', '01-005-鱼类在脊椎动物中的地位及鱼类的经济意义.mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-16 16:45:58', '2026-07-16 16:45:58');
INSERT INTO `edu_video` VALUES (2077676157067100162, 2077675588562747394, 2077675634909806594, '鱼体的外部分区', 'video/2026/07/16/f77cdd9fa6bd44febfb9d92dccdc7d08.mp4', '01-006-鱼体的外部分区.mp4', 6, 0, 1, 0, 0, 0, 1, '2026-07-16 16:46:12', '2026-07-16 16:46:12');
INSERT INTO `edu_video` VALUES (2077676203934253057, 2077675588562747394, 2077675634909806594, '鱼类的体型', 'video/2026/07/16/8e3659a49dd846c8b4254bd6b41e8d37.mp4', '01-007-鱼类的体型.mp4', 7, 0, 1, 0, 0, 0, 1, '2026-07-16 16:46:23', '2026-07-16 16:46:23');
INSERT INTO `edu_video` VALUES (2077676258267267073, 2077675588562747394, 2077675634909806594, '鱼类的头部器官', 'video/2026/07/16/d266aa9e44bf4a77831f69f7bea472a3.mp4', '01-008-鱼类的头部器官.mp4', 8, 0, 1, 0, 0, 0, 1, '2026-07-16 16:46:36', '2026-07-16 16:46:36');
INSERT INTO `edu_video` VALUES (2077676314055704578, 2077675588562747394, 2077675634909806594, '鱼类的鳍', 'video/2026/07/16/03b1cdfabc294f47a4a236ffa9853679.mp4', '01-009-鱼类的鳍.mp4', 9, 0, 1, 0, 0, 0, 1, '2026-07-16 16:46:49', '2026-07-16 16:46:49');
INSERT INTO `edu_video` VALUES (2077676364525764610, 2077675588562747394, 2077675634909806594, '皮肤机能及基本构造', 'video/2026/07/16/62d3a40c4d9f410fa629cf59b50df254.mp4', '01-010-皮肤机能及基本构造.mp4', 10, 0, 1, 0, 0, 0, 1, '2026-07-16 16:47:01', '2026-07-16 16:47:01');
INSERT INTO `edu_video` VALUES (2077676411829125122, 2077675588562747394, 2077675634909806594, '鱼类的鳞片', 'video/2026/07/16/547b3dfe2444446aa0293abc78926dfe.mp4', '01-011-鱼类的鳞片.mp4', 11, 0, 1, 0, 0, 0, 1, '2026-07-16 16:47:13', '2026-07-16 16:47:13');
INSERT INTO `edu_video` VALUES (2077676477239296001, 2077675588562747394, 2077675634909806594, '色素细胞与发光器', 'video/2026/07/16/a2c0feacdccb46679746d0d56f180806.mp4', '01-012-色素细胞与发光器.mp4', 12, 0, 1, 0, 0, 0, 1, '2026-07-16 16:47:28', '2026-07-16 16:47:28');
INSERT INTO `edu_video` VALUES (2077676528552411137, 2077675588562747394, 2077675634909806594, '机能和组成', 'video/2026/07/16/3ee88da0e4eb4a968c64e1fd1dc974fa.mp4', '01-013-机能和组成.mp4', 13, 0, 1, 0, 0, 0, 1, '2026-07-16 16:47:40', '2026-07-16 16:47:40');
INSERT INTO `edu_video` VALUES (2077676589134938113, 2077675588562747394, 2077675634909806594, '中轴骨胳', 'video/2026/07/16/7e8321aa2774476f81f00879a87346a5.mp4', '01-014-中轴骨胳.mp4', 14, 0, 1, 0, 0, 0, 1, '2026-07-16 16:47:55', '2026-07-16 16:47:55');
INSERT INTO `edu_video` VALUES (2077676644923375618, 2077675588562747394, 2077675634909806594, '附肢骨胳', 'video/2026/07/16/82b2f60df84d4bfa9fd9980be4d88608.mp4', '01-015-附肢骨胳.mp4', 15, 0, 1, 0, 0, 0, 1, '2026-07-16 16:48:08', '2026-07-16 16:48:08');
INSERT INTO `edu_video` VALUES (2077676704809648129, 2077675588562747394, 2077675634909806594, '肌肉的机能和结构', 'video/2026/07/16/018ed8f070c64949a5b47c786614471b.mp4', '01-016-肌肉的机能和结构.mp4', 16, 0, 1, 0, 0, 0, 1, '2026-07-16 16:48:22', '2026-07-16 16:48:22');
INSERT INTO `edu_video` VALUES (2077676766067458050, 2077675588562747394, 2077675634909806594, '骨胳肌的分类和命名', 'video/2026/07/16/399e3ef1d6ec4f3b987ccf3896befcf3.mp4', '01-017-骨胳肌的分类和命名.mp4', 17, 0, 1, 0, 0, 0, 1, '2026-07-16 16:48:37', '2026-07-16 16:48:37');
INSERT INTO `edu_video` VALUES (2077676873844293633, 2077675588562747394, 2077675634909806594, '鱼类肌肉的大致结构', 'video/2026/07/16/6b5fe91646f4432d8f15129068699e74.mp4', '01-018-鱼类肌肉的大致结构.mp4', 18, 0, 1, 0, 0, 0, 1, '2026-07-16 16:49:03', '2026-07-16 16:49:03');
INSERT INTO `edu_video` VALUES (2077676932681990146, 2077675588562747394, 2077675634909806594, '发电器官', 'video/2026/07/16/729b57b5b80a43a3ad9e40157056ee28.mp4', '01-019-发电器官.mp4', 19, 0, 1, 0, 0, 0, 1, '2026-07-16 16:49:17', '2026-07-16 16:49:17');
INSERT INTO `edu_video` VALUES (2077677009718771713, 2077675588562747394, 2077675634909806594, '消化管(1)', 'video/2026/07/16/0b02c675a24442f79abdeda566ddbf2b.mp4', '01-020-消化管(1).mp4', 20, 0, 1, 0, 0, 0, 1, '2026-07-16 16:49:35', '2026-07-16 16:49:35');
INSERT INTO `edu_video` VALUES (2077677066253795329, 2077675588562747394, 2077675634909806594, '消化管(2)', 'video/2026/07/16/32282992ab35462598574d34eea2324a.mp4', '01-021-消化管(2).mp4', 21, 0, 1, 0, 0, 0, 1, '2026-07-16 16:49:49', '2026-07-16 16:49:49');
INSERT INTO `edu_video` VALUES (2077677132452495361, 2077675588562747394, 2077675634909806594, '消化腺', 'video/2026/07/16/c765b8be3d7c4a6c853976a17f767177.mp4', '01-022-消化腺.mp4', 22, 0, 1, 0, 0, 0, 1, '2026-07-16 16:50:04', '2026-07-16 16:50:04');
INSERT INTO `edu_video` VALUES (2077677200496689153, 2077675588562747394, 2077675634909806594, '鳃', 'video/2026/07/16/2d70d4c932594caead6ed4220a619501.mp4', '01-023-鳃.mp4', 23, 0, 1, 0, 0, 0, 1, '2026-07-16 16:50:21', '2026-07-16 16:50:21');
INSERT INTO `edu_video` VALUES (2077677263574827010, 2077675588562747394, 2077675634909806594, '辅助呼吸器官', 'video/2026/07/16/8f9cf7d807ba40bda3c1c2df95f2144e.mp4', '01-024-辅助呼吸器官.mp4', 24, 0, 1, 0, 0, 0, 1, '2026-07-16 16:50:36', '2026-07-16 16:50:36');
INSERT INTO `edu_video` VALUES (2077677323524014081, 2077675588562747394, 2077675634909806594, '鳔', 'video/2026/07/16/9dcea52202b74c22bae30466051588f7.mp4', '01-025-鳔.mp4', 25, 0, 1, 0, 0, 0, 1, '2026-07-16 16:50:50', '2026-07-16 16:50:50');
INSERT INTO `edu_video` VALUES (2077677401663897602, 2077675588562747394, 2077675634909806594, '机能与组成', 'video/2026/07/16/03eb6813ef4d4d7d95a84584c577729a.mp4', '01-026-机能与组成.mp4', 26, 0, 1, 0, 0, 0, 1, '2026-07-16 16:51:09', '2026-07-16 16:51:09');
INSERT INTO `edu_video` VALUES (2077677521646157826, 2077675588562747394, 2077675634909806594, '血管系统', 'video/2026/07/16/fcd339c7894345b58616c93cfa414f54.mp4', '01-027-血管系统.mp4', 27, 0, 1, 0, 0, 0, 1, '2026-07-16 16:51:37', '2026-07-16 16:51:37');
INSERT INTO `edu_video` VALUES (2077677597445619713, 2077675588562747394, 2077675634909806594, '淋巴系统', 'video/2026/07/16/3fe9550490194cb5bc3cc212b3d86ff4.mp4', '01-028-淋巴系统.mp4', 28, 0, 1, 0, 0, 0, 1, '2026-07-16 16:51:55', '2026-07-16 16:51:55');
INSERT INTO `edu_video` VALUES (2077677701518884866, 2077675588562747394, 2077675634909806594, '泌尿系统', 'video/2026/07/16/7b61a626690247b0be6b923837e17603.mp4', '01-029-泌尿系统.mp4', 29, 0, 1, 0, 0, 0, 1, '2026-07-16 16:52:20', '2026-07-16 16:52:20');
INSERT INTO `edu_video` VALUES (2077677755021426690, 2077675588562747394, 2077675634909806594, '生殖系统(1)', 'video/2026/07/16/ceeffed04282435ab8f980e301d0e967.mp4', '01-030-生殖系统.mp4', 30, 0, 1, 0, 0, 0, 1, '2026-07-16 16:52:33', '2026-07-16 16:53:17');
INSERT INTO `edu_video` VALUES (2077677868569624578, 2077675588562747394, 2077675634909806594, '生殖系统(2)', 'video/2026/07/16/fd428b5acf1b44feb87065b9495ea2ad.mp4', '01-031-生殖系统(2).mp4', 31, 0, 1, 0, 0, 0, 1, '2026-07-16 16:53:00', '2026-07-16 16:53:22');
INSERT INTO `edu_video` VALUES (2077678135688069121, 2077675588562747394, 2077675634909806594, '机能和基本构造', 'video/2026/07/16/d1ee282d556e4c6888b0e082bfcec030.mp4', '01-032-机能和基本构造.mp4', 32, 0, 1, 0, 0, 0, 1, '2026-07-16 16:54:04', '2026-07-16 16:54:04');
INSERT INTO `edu_video` VALUES (2077678193686904834, 2077675588562747394, 2077675634909806594, '中枢神经系统', 'video/2026/07/16/812db58211384f818368b5861d4ecea1.mp4', '01-033-中枢神经系统.mp4', 33, 0, 1, 0, 0, 0, 1, '2026-07-16 16:54:17', '2026-07-16 16:54:17');
INSERT INTO `edu_video` VALUES (2077678266969784322, 2077675588562747394, 2077675634909806594, '外周神经系统', 'video/2026/07/16/172cbffbb79146a58ac7ec05f7560e46.mp4', '01-034-外周神经系统.mp4', 34, 0, 1, 0, 0, 0, 1, '2026-07-16 16:54:35', '2026-07-16 16:54:35');
INSERT INTO `edu_video` VALUES (2077678337178238977, 2077675588562747394, 2077675634909806594, '植物性神经系统', 'video/2026/07/16/675d570c3add4216b2b36d904c7e3433.mp4', '01-035-植物性神经系统.mp4', 35, 0, 1, 0, 0, 0, 1, '2026-07-16 16:54:52', '2026-07-16 16:54:52');
INSERT INTO `edu_video` VALUES (2077678419365625858, 2077675588562747394, 2077675634909806594, '皮肤感觉器官', 'video/2026/07/16/952f740bde9a4d04953178eacc406794.mp4', '01-036-皮肤感觉器官.mp4', 36, 0, 1, 0, 0, 0, 1, '2026-07-16 16:55:11', '2026-07-16 16:55:11');
INSERT INTO `edu_video` VALUES (2077678487757946881, 2077675588562747394, 2077675634909806594, '听觉器官、视觉器官、嗅觉器官、味觉', 'video/2026/07/16/0a56a96aaab44fc2b4bc985a1d671bf5.mp4', '01-037-听觉器官、视觉器官、嗅觉器官、味觉.mp4', 37, 0, 1, 0, 0, 0, 1, '2026-07-16 16:55:28', '2026-07-16 16:55:28');
INSERT INTO `edu_video` VALUES (2077678555848278017, 2077675588562747394, 2077675634909806594, '内分泌的机能和特点', 'video/2026/07/16/074425a728aa40018e54d6e48ab39808.mp4', '01-038-内分泌的机能和特点.mp4', 38, 0, 1, 0, 0, 0, 1, '2026-07-16 16:55:44', '2026-07-16 16:55:44');
INSERT INTO `edu_video` VALUES (2077678613104721921, 2077675588562747394, 2077675634909806594, '脑垂体', 'video/2026/07/16/71efc0186dac4c7aa413a9469fc72b32.mp4', '01-039-脑垂体.mp4', 39, 0, 1, 0, 0, 0, 1, '2026-07-16 16:55:57', '2026-07-16 16:55:57');
INSERT INTO `edu_video` VALUES (2077678677713780738, 2077675588562747394, 2077675634909806594, '甲状腺、肾上腺、胰岛、性腺', 'video/2026/07/16/790775f59e7548c8ab4705186e65f72f.mp4', '01-040-甲状腺、肾上腺、胰岛、性腺.mp4', 40, 0, 1, 0, 0, 0, 1, '2026-07-16 16:56:13', '2026-07-16 16:56:13');
INSERT INTO `edu_video` VALUES (2077678746856882178, 2077675588562747394, 2077675634909806594, '基本概念(1)', 'video/2026/07/16/2e33fba059b34c4382f58cc8a911b17d.mp4', '02-041-基本概念(1).mp4', 41, 0, 1, 0, 0, 0, 1, '2026-07-16 16:56:29', '2026-07-16 16:56:29');
INSERT INTO `edu_video` VALUES (2077678810308313089, 2077675588562747394, 2077675634909806594, '基本概念(2)', 'video/2026/07/16/9286ebd533874491ab4008eab654fc00.mp4', '02-042-基本概念(2).mp4', 42, 0, 1, 0, 0, 0, 1, '2026-07-16 16:56:44', '2026-07-16 16:56:44');
INSERT INTO `edu_video` VALUES (2077678906030718978, 2077675588562747394, 2077675634909806594, '拉斯系统', 'video/2026/07/16/af2e0062584e4e4c9d61c0ed487a1bb3.mp4', '02-043-拉斯系统.mp4', 43, 0, 1, 0, 0, 0, 1, '2026-07-16 16:57:07', '2026-07-16 16:57:07');
INSERT INTO `edu_video` VALUES (2077679177876144130, 2077675588562747394, 2077675634909806594, '检索表', 'video/2026/07/16/a8a4f26f9f194648acc495879f6bb2af.mp4', '02-044-检索表.mp4', 44, 0, 1, 0, 0, 0, 1, '2026-07-16 16:58:12', '2026-07-16 16:58:12');
INSERT INTO `edu_video` VALUES (2077679263725158402, 2077675588562747394, 2077675634909806594, '圆口纲的分类与主要特征', 'video/2026/07/16/200479ce94e24113aa3ba8703df3c315.mp4', '02-045-圆口纲的分类与主要特征.mp4', 45, 0, 1, 0, 0, 0, 1, '2026-07-16 16:58:33', '2026-07-16 16:58:33');
INSERT INTO `edu_video` VALUES (2077679328015450113, 2077675588562747394, 2077675634909806594, '软骨鱼纲的分类与主要特征(1)', 'video/2026/07/16/ecef0e6d1ac7485cbbb1616944836d27.mp4', '02-046-软骨鱼纲的分类与主要特征.mp4', 46, 0, 1, 0, 0, 0, 1, '2026-07-16 16:58:48', '2026-07-16 16:59:27');
INSERT INTO `edu_video` VALUES (2077679401067642882, 2077675588562747394, 2077675634909806594, '软骨鱼纲的分类与主要特征(2)', 'video/2026/07/16/c834341325fc4bc1ac4d481b47dd2006.mp4', '02-047-软骨鱼纲的分类与主要特征(2).mp4', 47, 0, 1, 0, 0, 0, 1, '2026-07-16 16:59:05', '2026-07-16 16:59:05');
INSERT INTO `edu_video` VALUES (2077679606286548994, 2077675588562747394, 2077675634909806594, '硬骨鱼纲的主要特征和经济价值', 'video/2026/07/16/28b4634b5d7e4523ad9ede9ef998f118.mp4', '02-048-硬骨鱼纲的主要特征和经济价值.mp4', 48, 0, 1, 0, 0, 0, 1, '2026-07-16 16:59:54', '2026-07-16 16:59:54');
INSERT INTO `edu_video` VALUES (2077679771735064578, 2077675588562747394, 2077675634909806594, '内鼻孔亚纲的分类与主要特征', 'video/2026/07/16/7731dc4a17d54a5f8fa766958c0ace7a.mp4', '02-049-内鼻孔亚纲的分类与主要特征.mp4', 49, 0, 1, 0, 0, 0, 1, '2026-07-16 17:00:34', '2026-07-16 17:00:34');
INSERT INTO `edu_video` VALUES (2077679838709710850, 2077675588562747394, 2077675634909806594, '硬鳞总目的分类与主要特征', 'video/2026/07/16/d85d96953c1748b3a0551807ef6d099d.mp4', '02-050-硬鳞总目的分类与主要特征.mp4', 50, 0, 1, 0, 0, 0, 1, '2026-07-16 17:00:50', '2026-07-16 17:00:50');
INSERT INTO `edu_video` VALUES (2077679925875736577, 2077675588562747394, 2077675634909806594, '硬鳞总目的分类与主要特征', 'video/2026/07/16/d85d96953c1748b3a0551807ef6d099d.mp4', '02-050-硬鳞总目的分类与主要特征.mp4', 50, 0, 1, 0, 0, 0, 1, '2026-07-16 17:01:10', '2026-07-16 17:01:10');
INSERT INTO `edu_video` VALUES (2077680667407712257, 2077675588562747394, 2077675634909806594, '硬鳞总目的分类与主要特征(1)', 'video/2026/07/16/dfacbbbd30de4747bfd770615d5b768d.mp4', '02-051-硬鳞总目的分类与主要特征(1).mp4', 51, 0, 1, 0, 0, 0, 1, '2026-07-16 17:04:07', '2026-07-16 17:04:07');
INSERT INTO `edu_video` VALUES (2077680752090710017, 2077675588562747394, 2077675634909806594, '硬鳞总目的分类与主要特征(2)', 'video/2026/07/16/53188d97ce8841d19643aae455fe93e6.mp4', '02-052-硬鳞总目的分类与主要特征(2).mp4', 52, 0, 1, 0, 0, 0, 1, '2026-07-16 17:04:27', '2026-07-16 17:04:27');
INSERT INTO `edu_video` VALUES (2077680843664949249, 2077675588562747394, 2077675634909806594, '鳗鲡总目的分类与主要特征', 'video/2026/07/16/938ff5d67dd447eda95177c7e33ac35b.mp4', '02-053-鳗鲡总目的分类与主要特征.mp4', 53, 0, 1, 0, 0, 0, 1, '2026-07-16 17:04:49', '2026-07-16 17:04:49');
INSERT INTO `edu_video` VALUES (2077680911100968962, 2077675588562747394, 2077675634909806594, '鲤形总目', 'video/2026/07/16/5548d83dccab4a49be4b3beca65081d0.mp4', '02-054-鲤形总目.mp4', 54, 0, 1, 0, 0, 0, 1, '2026-07-16 17:05:05', '2026-07-16 17:05:05');
INSERT INTO `edu_video` VALUES (2077680998204080129, 2077675588562747394, 2077675634909806594, '银汉鱼总目', 'video/2026/07/16/5b5e5303ed8e4da283cc15c74453dece.mp4', '02-055-银汉鱼总目.mp4', 55, 0, 1, 0, 0, 0, 1, '2026-07-16 17:05:26', '2026-07-16 17:05:26');
INSERT INTO `edu_video` VALUES (2077681086523539457, 2077675588562747394, 2077675634909806594, '鲑鲈总目(1)', 'video/2026/07/16/a3cf60f91d2e4a97b2ac251bb42b3f37.mp4', '02-056-鲑鲈总目(1).mp4', 56, 0, 1, 0, 0, 0, 1, '2026-07-16 17:05:47', '2026-07-16 17:05:47');
INSERT INTO `edu_video` VALUES (2077681164260769794, 2077675588562747394, 2077675634909806594, '鲑鲈总目(2)', 'video/2026/07/16/9934da8042c4463bba0b048938218971.mp4', '02-057-鲑鲈总目(2).mp4', 57, 0, 1, 0, 0, 0, 1, '2026-07-16 17:06:06', '2026-07-16 17:06:06');
INSERT INTO `edu_video` VALUES (2077681264668213249, 2077675588562747394, 2077675634909806594, '鲑鲈总目(3)', 'video/2026/07/16/758ea9e372f2439dac51e31f30b07a5a.mp4', '02-058-鲑鲈总目(3).mp4', 58, 0, 1, 0, 0, 0, 1, '2026-07-16 17:06:30', '2026-07-16 17:06:30');
INSERT INTO `edu_video` VALUES (2077681394041520129, 2077675588562747394, 2077675634909806594, '鲑鲈总目(4)', 'video/2026/07/16/b1878a8bfb414a82811de595740ac01c.mp4', '02-059-鲑鲈总目(4).mp4', 59, 0, 1, 0, 0, 0, 1, '2026-07-16 17:07:00', '2026-07-16 17:07:00');
INSERT INTO `edu_video` VALUES (2077681487926820865, 2077675588562747394, 2077675634909806594, '鲑鲈总目(5)', 'video/2026/07/16/a9f4f086b4d048eca8a984e6166caa34.mp4', '02-060-鲑鲈总目(5).mp4', 60, 0, 1, 0, 0, 0, 1, '2026-07-16 17:07:23', '2026-07-16 17:07:23');
INSERT INTO `edu_video` VALUES (2077681550937849858, 2077675588562747394, 2077675634909806594, '鲑鲈总目(6)', 'video/2026/07/16/8cac05d814014048a6608e20e0900fdf.mp4', '02-061-鲑鲈总目(6).mp4', 61, 0, 1, 0, 0, 0, 1, '2026-07-16 17:07:38', '2026-07-16 17:07:38');
INSERT INTO `edu_video` VALUES (2077681611449073665, 2077675588562747394, 2077675634909806594, '鲑鲈总目(7)', 'video/2026/07/16/5ec3713dc0da4b5d9bbba02b8a3d683c.mp4', '02-062-鲑鲈总目(7).mp4', 62, 0, 1, 0, 0, 0, 1, '2026-07-16 17:07:52', '2026-07-16 17:07:52');
INSERT INTO `edu_video` VALUES (2077681706806575106, 2077675588562747394, 2077675634909806594, '蟾鱼总目', 'video/2026/07/16/21d800e3e2b64cdd9d245b4e9ed390a8.mp4', '02-063-蟾鱼总目.mp4', 63, 0, 1, 0, 0, 0, 1, '2026-07-16 17:08:15', '2026-07-16 17:08:15');
INSERT INTO `edu_video` VALUES (2077681831935246337, 2077675588562747394, 2077675634909806594, '鱼类生态学的定义和内容', 'video/2026/07/16/3341d39884b84fe4ad86d0956dddbe95.mp4', '03-064-鱼类生态学的定义和内容.mp4', 64, 0, 1, 0, 0, 0, 1, '2026-07-16 17:08:45', '2026-07-16 17:08:45');
INSERT INTO `edu_video` VALUES (2077681898909892609, 2077675588562747394, 2077675634909806594, '鱼类生活史及发育期的划分', 'video/2026/07/16/68dfa7568dfe48f08d289d39497af7e1.mp4', '03-065-鱼类生活史及发育期的划分.mp4', 65, 0, 1, 0, 0, 0, 1, '2026-07-16 17:09:01', '2026-07-16 17:09:01');
INSERT INTO `edu_video` VALUES (2077682049254719489, 2077675588562747394, 2077675634909806594, '鱼类的寿命', 'video/2026/07/16/73697d17981a4f64adae987f167f022a.mp4', '03-066-鱼类的寿命.mp4', 66, 0, 1, 0, 0, 0, 1, '2026-07-16 17:09:37', '2026-07-16 17:09:37');
INSERT INTO `edu_video` VALUES (2077682124123045889, 2077675588562747394, 2077675634909806594, '鱼类的年龄鉴定', 'video/2026/07/16/002889e26ed9429cabf4b195217edb92.mp4', '03-067-鱼类的年龄鉴定.mp4', 67, 0, 1, 0, 0, 0, 1, '2026-07-16 17:09:55', '2026-07-16 17:09:55');
INSERT INTO `edu_video` VALUES (2077682494278762498, 2077675588562747394, 2077675634909806594, '鱼类的生长', 'video/2026/07/16/75867ca6e293461aa92d080ff6378e7d.mp4', '03-068-鱼类的生长.mp4', 68, 0, 1, 0, 0, 0, 1, '2026-07-16 17:11:23', '2026-07-16 17:11:23');
INSERT INTO `edu_video` VALUES (2077682567054131202, 2077675588562747394, 2077675634909806594, '鱼类的营养类型', 'video/2026/07/16/c303f05d0c544ab88d79ceadc5be045e.mp4', '03-069-鱼类的营养类型.mp4', 69, 0, 1, 0, 0, 0, 1, '2026-07-16 17:11:40', '2026-07-16 17:11:40');
INSERT INTO `edu_video` VALUES (2077682630761414657, 2077675588562747394, 2077675634909806594, '鱼类的食谱', 'video/2026/07/16/dd6a7df266a642edb0a0cdda787d75ad.mp4', '03-070-鱼类的食谱.mp4', 70, 0, 1, 0, 0, 0, 1, '2026-07-16 17:11:55', '2026-07-16 17:11:55');
INSERT INTO `edu_video` VALUES (2077682690580578305, 2077675588562747394, 2077675634909806594, '摄食节律', 'video/2026/07/16/770e6acfe64743b7884bd1e82dfdc903.mp4', '03-071-摄食节律.mp4', 71, 0, 1, 0, 0, 0, 1, '2026-07-16 17:12:10', '2026-07-16 17:12:10');
INSERT INTO `edu_video` VALUES (2077682814664867841, 2077675588562747394, 2077675634909806594, '摄食强度', 'video/2026/07/16/1e16af5102174bd39d551c7cbf50d0a4.mp4', '03-072-摄食强度.mp4', 72, 0, 1, 0, 0, 0, 1, '2026-07-16 17:12:39', '2026-07-16 17:12:39');
INSERT INTO `edu_video` VALUES (2077682928565387266, 2077675588562747394, 2077675634909806594, '饵料系数', 'video/2026/07/16/568035ff09254b13ae22ec8ffb63302a.mp4', '03-073-饵料系数.mp4', 73, 0, 1, 0, 0, 0, 1, '2026-07-16 17:13:06', '2026-07-16 17:13:06');
INSERT INTO `edu_video` VALUES (2077682989663813634, 2077675588562747394, 2077675634909806594, '鱼类摄食器官的适应', 'video/2026/07/16/cf5d199288b744c58431c7df6aa81317.mp4', '03-074-鱼类摄食器官的适应.mp4', 74, 0, 1, 0, 0, 0, 1, '2026-07-16 17:13:21', '2026-07-16 17:13:21');
INSERT INTO `edu_video` VALUES (2077683070265753601, 2077675588562747394, 2077675634909806594, '鱼类性征与性腺发育', 'video/2026/07/16/30b7663a720a42b886d363c295fc3595.mp4', '03-075-鱼类性征与性腺发育.mp4', 75, 0, 1, 0, 0, 0, 1, '2026-07-16 17:13:40', '2026-07-16 17:13:40');
INSERT INTO `edu_video` VALUES (2077683141736693761, 2077675588562747394, 2077675634909806594, '鱼类的繁殖方式', 'video/2026/07/16/a85d68e2f76c4d9a9121a2a5a0696330.mp4', '03-076-鱼类的繁殖方式.mp4', 76, 0, 1, 0, 0, 0, 1, '2026-07-16 17:13:57', '2026-07-16 17:13:57');
INSERT INTO `edu_video` VALUES (2077714505471131650, 2077714398742872066, 2077714430812520450, '植物学', 'video/2026/07/16/3aa46a6d73d54aa9afc457136b3ccbc4.mp4', '01-001-植物学.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 19:18:35', '2026-07-16 19:18:35');
INSERT INTO `edu_video` VALUES (2077717025123762177, 2077716876708315138, 2077716910145306626, '园林花卉', 'video/2026/07/16/c474df79d2e6482e883c7eebb95f5cb3.mp4', '01-001-园林花卉学.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 19:28:36', '2026-07-16 19:28:36');
INSERT INTO `edu_video` VALUES (2077720671735545858, 2077719437561593858, 2077719534240301057, '解剖生理', 'video/2026/07/16/04495660538d4c77b77ccb3fca7e8fd6.mp4', '01-001-解剖生理学.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 19:43:05', '2026-07-16 19:43:05');
INSERT INTO `edu_video` VALUES (2077722573349093377, 2077722082103820289, 2077722342788202497, '体育综合', 'video/2026/07/16/ebcfe507ea9d4c59865e94b56850d4f9.mp4', '01-001-体育专业综合.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 19:50:38', '2026-07-16 19:50:38');
INSERT INTO `edu_video` VALUES (2077724452737024001, 2077724241729978369, 2077724320029245442, '文史', 'video/2026/07/16/32728fcb98e64aaf98c21bd07f59f152.mp4', '01-001-文史基础.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 19:58:06', '2026-07-16 19:58:06');
INSERT INTO `edu_video` VALUES (2077726487867850754, 2077726348398854145, 2077726384121741314, '新媒体概论(1)', 'video/2026/07/16/46ebdf6b97074fdb80fb4eff218af2ec.mp4', '01-001-新媒体概论(1).mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 20:06:12', '2026-07-16 20:06:12');
INSERT INTO `edu_video` VALUES (2077726540997099522, 2077726348398854145, 2077726384121741314, '新媒体概论(2)', 'video/2026/07/16/9262bb5c8ed74f60ba54cb183c6804e6.mp4', '01-002-新媒体概论(2).mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 20:06:24', '2026-07-16 20:06:24');
INSERT INTO `edu_video` VALUES (2077726597100109826, 2077726348398854145, 2077726384121741314, '新媒体概论(3)', 'video/2026/07/16/3699dc3b71de4fe1a2e9962cd5bf5653.mp4', '01-003-新媒体概论(3).mp4', 3, 0, 1, 0, 0, 0, 1, '2026-07-16 20:06:38', '2026-07-16 20:06:38');
INSERT INTO `edu_video` VALUES (2077726645951168514, 2077726348398854145, 2077726384121741314, '新媒体概论(4)', 'video/2026/07/16/c745a0a4501f40bc8630e94e87ba5cd9.mp4', '01-004-新媒体概论(4).mp4', 4, 0, 1, 0, 0, 0, 1, '2026-07-16 20:06:49', '2026-07-16 20:06:49');
INSERT INTO `edu_video` VALUES (2077726696895184897, 2077726348398854145, 2077726384121741314, '新媒体概论(5)', 'video/2026/07/16/a5ade0b86222432a9a3a9919bb33ebe0.mp4', '01-005-新媒体概论(5).mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-16 20:07:02', '2026-07-16 20:07:02');
INSERT INTO `edu_video` VALUES (2077747077706186754, 2077746806020145153, 2077746836948942849, '法理学(1)', 'video/2026/07/16/ea7069b218844941989d40f201c8035a.mp4', '01-001-法理学(1).mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 21:28:01', '2026-07-16 21:28:01');
INSERT INTO `edu_video` VALUES (2077747142642401282, 2077746806020145153, 2077746836948942849, '法理学(2)', 'video/2026/07/16/39625dc0b9e94f9fb014130b72209ff1.mp4', '01-002-法理学(2).mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 21:28:16', '2026-07-16 21:28:16');
INSERT INTO `edu_video` VALUES (2077747203203956738, 2077746806020145153, 2077746836948942849, '法理学(3)', 'video/2026/07/16/53eba9fe6b9c4a64b6906e7c68077a6e.mp4', '01-003-法理学(3).mp4', 3, 0, 1, 0, 0, 0, 1, '2026-07-16 21:28:31', '2026-07-16 21:28:31');
INSERT INTO `edu_video` VALUES (2077749990818086914, 2077749795514515457, 2077749853970530306, '进入近代后中华民族的磨难与抗争', 'video/2026/07/16/4df0ae5224a04a458ebbc3148e676c10.mp4', '01-001-进入近代后中华民族的磨难与抗争.mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 21:39:35', '2026-07-16 21:39:35');
INSERT INTO `edu_video` VALUES (2077750086725042177, 2077749795514515457, 2077749853970530306, '不同社会力量对国家出路的早期探索', 'video/2026/07/16/612315075e7c4d52814befc7a46751eb.mp4', '02-002-不同社会力量对国家出路的早期探索.mp4', 2, 0, 1, 0, 0, 0, 1, '2026-07-16 21:39:58', '2026-07-16 21:39:58');
INSERT INTO `edu_video` VALUES (2077750137996214274, 2077749795514515457, 2077749853970530306, '辛亥革命与君主专制制度的终结', 'video/2026/07/16/e93616137c454a6182c3ea4f92068ebe.mp4', '03-003-辛亥革命与君主专制制度的终结.mp4', 3, 0, 1, 0, 0, 0, 1, '2026-07-16 21:40:10', '2026-07-16 21:40:10');
INSERT INTO `edu_video` VALUES (2077750190982856706, 2077749795514515457, 2077749853970530306, '中国共产党成立和中国革命新局面', 'video/2026/07/16/33d8e88eb6bd449184d20fe3fd03c750.mp4', '04-004-中国共产党成立和中国革命新局面.mp4', 4, 0, 1, 0, 0, 0, 1, '2026-07-16 21:40:23', '2026-07-16 21:40:23');
INSERT INTO `edu_video` VALUES (2077750250894295042, 2077749795514515457, 2077749853970530306, '中国革命的新道路', 'video/2026/07/16/c69d72cfbd48485483b69778f0170e73.mp4', '05-005-中国革命的新道路.mp4', 5, 0, 1, 0, 0, 0, 1, '2026-07-16 21:40:37', '2026-07-16 21:40:37');
INSERT INTO `edu_video` VALUES (2077750303679610881, 2077749795514515457, 2077749853970530306, '中华民族的抗日战争', 'video/2026/07/16/f365f65ceafd492da41d8ceeb50b3ad1.mp4', '06-006-中华民族的抗日战争.mp4', 6, 0, 1, 0, 0, 0, 1, '2026-07-16 21:40:50', '2026-07-16 21:40:50');
INSERT INTO `edu_video` VALUES (2077750381270040578, 2077749795514515457, 2077749853970530306, '为建立新中国而奋斗', 'video/2026/07/16/104bddff0b774c97b7818e6cde1d2b32.mp4', '07-007-为建立新中国而奋斗.mp4', 7, 0, 1, 0, 0, 0, 1, '2026-07-16 21:41:08', '2026-07-16 21:41:08');
INSERT INTO `edu_video` VALUES (2077750442460741633, 2077749795514515457, 2077749853970530306, '中华人民共和国的成立与中国社会主义道路的探索', 'video/2026/07/16/768aa51ffcba4098987cfd4672055695.mp4', '08-008-中华人民共和国的成立与中国社会主义道路的探索.mp4', 8, 0, 1, 0, 0, 0, 1, '2026-07-16 21:41:23', '2026-07-16 21:41:23');
INSERT INTO `edu_video` VALUES (2077750518893543426, 2077749795514515457, 2077749853970530306, '改革开放与中国特色社会主义的开创和发展', 'video/2026/07/16/75245a0280fb4003bee37793a8beccf3.mp4', '09-009-改革开放与中国特色社会主义的开创和发展.mp4', 9, 0, 1, 0, 0, 0, 1, '2026-07-16 21:41:41', '2026-07-16 21:41:41');
INSERT INTO `edu_video` VALUES (2077750578687541250, 2077749795514515457, 2077749853970530306, '中国特色社会主义进入新时代', 'video/2026/07/16/ebe4ff1076ca4097972377967077f2c8.mp4', '10-010-中国特色社会主义进入新时代.mp4', 10, 0, 1, 0, 0, 0, 1, '2026-07-16 21:41:55', '2026-07-16 21:41:55');
INSERT INTO `edu_video` VALUES (2077753461529149442, 2077752654473756674, 2077753307086487553, '艺术概论(1)', 'video/2026/07/16/ecf5bb8772a74cc4901047583f9ff5f8.mp4', '01-001-艺术概论(1).mp4', 1, 0, 1, 0, 0, 0, 1, '2026-07-16 21:53:23', '2026-07-16 21:53:23');

-- ----------------------------
-- Table structure for pay_log
-- ----------------------------
DROP TABLE IF EXISTS `pay_log`;
CREATE TABLE `pay_log`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `order_no` bigint NOT NULL COMMENT '订单号',
  `pay_time` datetime NULL DEFAULT NULL COMMENT '支付完成时间',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '支付金额（分）',
  `transaction_id` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易流水号',
  `trade_state` char(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '交易状态',
  `pay_type` tinyint NOT NULL DEFAULT 0 COMMENT '支付类型（1：微信 2：支付宝）',
  `attr` text CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL COMMENT '其他属性',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_order_no`(`order_no` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '支付日志表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pay_log
-- ----------------------------
INSERT INTO `pay_log` VALUES (1194498446013001730, 1194498300579704832, '2025-11-13 14:13:17', 1.00, '4200000469201911130676624386', 'SUCCESS', 1, '{\"transaction_id\":\"4200000469201911130676624386\",\"nonce_str\":\"2Lc23ILl231It53M\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"5404850AA3ED0E844DE104651477F07A\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1194498300579704832\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191113141314\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2025-11-13 14:13:17', '2025-11-13 14:13:17');
INSERT INTO `pay_log` VALUES (1195253787449430017, 1195253049260314624, '2025-11-15 16:14:44', 1.00, '4200000454201911150981874895', 'SUCCESS', 1, '{\"transaction_id\":\"4200000454201911150981874895\",\"nonce_str\":\"MAM5UM4Xhv1lItvO\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"7DBDCAF4A078B30BB3EF073E6A238C20\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1195253049260314624\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191115161440\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2025-11-15 16:14:44', '2025-11-15 16:14:44');
INSERT INTO `pay_log` VALUES (1196264321397342210, 1196264005255872512, '2025-11-18 11:10:14', 1.00, '4200000453201911184025781554', 'SUCCESS', 1, '{\"transaction_id\":\"4200000453201911184025781554\",\"nonce_str\":\"D1dHexCLIFIxAAg2\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"CFT\",\"openid\":\"oNpSGwR-QGG5DaZtDkh2UZlsFDQE\",\"sign\":\"C9F5CA1EE49EA7891736D73BEB423962\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1473426802\",\"cash_fee\":\"1\",\"out_trade_no\":\"1196264005255872512\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx8397f8696b538317\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20191118111011\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2025-11-18 11:10:14', '2025-11-18 11:10:14');
INSERT INTO `pay_log` VALUES (1544232719079215106, 20220705161151271, '2026-02-05 16:12:25', 0.01, '4200001513202207058146868181', 'SUCCESS', 1, '{\"transaction_id\":\"4200001513202207058146868181\",\"nonce_str\":\"baj0cWBDokazqAVT\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuMouAUSmdA45hGqvn9yXoCc\",\"sign\":\"82C5BF65169DB5FF2F874031B59A4260\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20220705161151271\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20220705161223\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2026-02-05 16:12:25', '2026-02-05 16:12:25');
INSERT INTO `pay_log` VALUES (1544602166193360898, 20220706163854999, '2026-02-06 16:40:28', 0.01, '4200001509202207061156508023', 'SUCCESS', 1, '{\"transaction_id\":\"4200001509202207061156508023\",\"nonce_str\":\"Z6kemIKvr6WZwnCd\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuBnXMXFO7OGpfiGQXuGHk7g\",\"sign\":\"9449233D181D85805BAFDFF437B879A4\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20220706163854999\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20220706164027\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2026-02-06 16:40:28', '2026-02-06 16:40:28');
INSERT INTO `pay_log` VALUES (1545035119285338114, 20220707212017850, '2026-02-07 21:20:52', 0.01, '4200001461202207074952256298', 'SUCCESS', 1, '{\"transaction_id\":\"4200001461202207074952256298\",\"nonce_str\":\"VGeuo3BafcxavHOS\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuJ7a47w7We-9bjR-gcuakWI\",\"sign\":\"370CE25626EF0873413AD7AEDB9A4620\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20220707212017850\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20220707212049\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2026-02-07 21:20:52', '2026-02-07 21:20:52');
INSERT INTO `pay_log` VALUES (1552608303333363713, 20220728185000822, '2026-02-28 18:54:00', 0.01, '4200001547202207283295974035', 'SUCCESS', 1, '{\"transaction_id\":\"4200001547202207283295974035\",\"nonce_str\":\"OQqDKoOQBhitmvxO\",\"trade_state\":\"SUCCESS\",\"bank_type\":\"OTHERS\",\"openid\":\"oHwsHuJ7a47w7We-9bjR-gcuakWI\",\"sign\":\"48FC748F03552DB6BAFEA5BF777E8047\",\"return_msg\":\"OK\",\"fee_type\":\"CNY\",\"mch_id\":\"1558950191\",\"cash_fee\":\"1\",\"out_trade_no\":\"20220728185000822\",\"cash_fee_type\":\"CNY\",\"appid\":\"wx74862e0dfcf69954\",\"total_fee\":\"1\",\"trade_state_desc\":\"支付成功\",\"trade_type\":\"NATIVE\",\"result_code\":\"SUCCESS\",\"attach\":\"\",\"time_end\":\"20220728185358\",\"is_subscribe\":\"N\",\"return_code\":\"SUCCESS\"}', 0, '2026-02-28 18:54:00', '2026-02-28 18:54:00');

-- ----------------------------
-- Table structure for pay_order
-- ----------------------------
DROP TABLE IF EXISTS `pay_order`;
CREATE TABLE `pay_order`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `order_no` bigint NOT NULL COMMENT '订单号',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `member_id` bigint NOT NULL COMMENT '会员id',
  `course_title` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程名称',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '课程封面',
  `teacher_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '讲师名称',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员昵称',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '会员手机',
  `total_fee` decimal(10, 2) NULL DEFAULT 0.01 COMMENT '订单金额（分）',
  `pay_type` tinyint NULL DEFAULT NULL COMMENT '支付类型（1：微信 2：支付宝）',
  `status` tinyint NULL DEFAULT NULL COMMENT '订单状态（0：未支付 1：已支付）',
  `is_deleted` tinyint UNSIGNED NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `ux_order_no`(`order_no` ASC) USING BTREE,
  INDEX `idx_course_id`(`course_id` ASC) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '订单' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pay_order
-- ----------------------------
INSERT INTO `pay_order` VALUES (1943451149879967746, 20250711072356073, 18, 1, 'Java语言程序', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '陈璞花', '小三123', '13700000001', 0.01, 1, 0, 0, '2025-07-11 07:23:56', '2025-07-11 07:23:56');
INSERT INTO `pay_order` VALUES (2002009270321086465, 20251219213300928, 18, 1, 'Java语言程序', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '陈璞花', '小三123', '13700000001', 0.01, 1, 0, 0, '2025-12-19 21:33:00', '2025-12-19 21:33:00');
INSERT INTO `pay_order` VALUES (2026956236884918274, 20260226174320842, 2026206015846371330, 2025395129279934465, 'test', 'image/2026/02/24/b0836cd060bd4cfda1ca3a41cb0ad1d6.jpg', '何钦铭', 'JCXYOZH', '15770643487', 0.00, 1, 0, 0, '2026-02-26 17:43:21', '2026-02-26 17:43:21');
INSERT INTO `pay_order` VALUES (2026958470167248898, 20260226175213755, 2026206015846371330, 2025395129279934465, 'test', 'image/2026/02/26/2b62e22edad5456780091926b50367b5.png', '何钦铭', 'JCXYOZH', '15770643487', 0.00, 1, 0, 0, '2026-02-26 17:52:13', '2026-02-26 17:52:13');
INSERT INTO `pay_order` VALUES (2027290581466206209, 20260227155154754, 1192252213659774977, 2025395129279934465, 'JavaWeb', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '车万翔', 'JCXYOZH', '15770643487', 0.01, 1, 0, 0, '2026-02-27 15:51:55', '2026-02-27 15:51:55');
INSERT INTO `pay_order` VALUES (2027346761714618370, 20260227193508292, 18, 2025395129279934465, 'Java语言程序', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '陈璞花', 'JCXYOZH', '15770643487', 0.01, 1, 0, 0, '2026-02-27 19:35:09', '2026-02-27 19:35:09');
INSERT INTO `pay_order` VALUES (2027745770157494273, 20260228220039915, 18, 2025395129279934465, 'Java语言程序', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '陈璞花', 'JCXYOZH', '15770643487', 0.01, 1, 0, 0, '2026-02-28 22:00:40', '2026-02-28 22:00:40');
INSERT INTO `pay_order` VALUES (2027755064626106369, 20260228223735536, 18, 2025395129279934465, 'Java语言程序', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '陈璞花', 'JCXYOZH', '15770643487', 0.01, 1, 0, 0, '2026-02-28 22:37:36', '2026-02-28 22:37:36');
INSERT INTO `pay_order` VALUES (2028310354257887233, 20260302112407015, 2026206015846371330, 2024503386716000258, 'test', 'image/2026/02/26/2b62e22edad5456780091926b50367b5.png', '何钦铭', '小胡', '15270843079', 0.00, 1, 0, 0, '2026-03-02 11:24:07', '2026-03-02 11:24:07');
INSERT INTO `pay_order` VALUES (2028836631238934530, 20260303221521766, 1192252213659774977, 2025395129279934465, 'JavaWeb', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '车万翔', 'JCXYOZH', '15770643487', 0.01, 1, 0, 0, '2026-03-03 22:15:22', '2026-03-03 22:15:22');
INSERT INTO `pay_order` VALUES (2028856533949612034, 20260303233426454, 18, 2025395129279934465, 'Java语言程序', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '陈璞花', 'JCXYOZH', '15770643487', 0.01, 1, 0, 0, '2026-03-03 23:34:27', '2026-03-03 23:34:27');
INSERT INTO `pay_order` VALUES (2029254933585158146, 20260305015732628, 2029245760411631618, 2025395129279934465, '支付测试', 'image/2026/03/05/8e40b9e78aa24edfa87bd4a75a79e2f1.jpg', '拜课', 'JCXYOZH', '15770643487', 0.01, 1, 0, 0, '2026-03-05 01:57:33', '2026-03-05 01:57:33');
INSERT INTO `pay_order` VALUES (2051855909139361794, 20260506104545273, 2029245760411631618, 2029444408252669954, '支付测试', 'image/2026/03/05/8e40b9e78aa24edfa87bd4a75a79e2f1.jpg', '拜课', '林', '13395740108', 0.01, 1, 0, 0, '2026-05-06 10:45:45', '2026-05-06 10:45:45');
INSERT INTO `pay_order` VALUES (2054760344945762305, 20260514110656848, 2029245760411631618, 1, '支付测试', 'image/2026/03/05/8e40b9e78aa24edfa87bd4a75a79e2f1.jpg', '拜课', '小三123', '13700000001', 0.01, 1, 0, 0, '2026-05-14 11:06:56', '2026-05-14 11:06:56');
INSERT INTO `pay_order` VALUES (2081650461815414785, 20260727155839114, 2029245760411631618, 2025395129279934465, '支付测试', 'image/2026/03/05/8e40b9e78aa24edfa87bd4a75a79e2f1.jpg', '拜课', 'JCXYOZH', '15770643487', 0.01, 1, 0, 0, '2026-07-27 15:58:40', '2026-07-27 15:58:40');
INSERT INTO `pay_order` VALUES (2081745593571024898, 20260727221641161, 2029245760411631618, 2025395129279934465, '支付测试', 'image/2026/03/05/8e40b9e78aa24edfa87bd4a75a79e2f1.jpg', '拜课', 'JCXYOZH', '15770643487', 0.01, 1, 0, 0, '2026-07-27 22:16:41', '2026-07-27 22:16:41');

-- ----------------------------
-- Table structure for sms_verification_log
-- ----------------------------
DROP TABLE IF EXISTS `sms_verification_log`;
CREATE TABLE `sms_verification_log`  (
  `id` bigint NOT NULL AUTO_INCREMENT COMMENT '主键',
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '手机号',
  `code` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '验证码',
  `request_time` datetime NOT NULL COMMENT '请求时间',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `status` tinyint NULL DEFAULT 0 COMMENT '状态 0有效 1已使用',
  `created_at` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_phone`(`phone` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '短信验证码记录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sms_verification_log
-- ----------------------------
INSERT INTO `sms_verification_log` VALUES (1, '15270843079', '810062', '2026-02-19 02:43:57', '2026-02-20 02:43:57', 0, '2026-02-19 10:43:56', '2026-02-19 10:43:56');
INSERT INTO `sms_verification_log` VALUES (2, '15770643487', '077422', '2026-02-22 02:18:05', '2026-02-23 02:18:05', 0, '2026-02-22 10:18:04', '2026-02-22 10:18:04');
INSERT INTO `sms_verification_log` VALUES (3, '11111111111', '112714', '2026-02-28 14:27:50', '2026-03-01 14:27:50', 0, '2026-02-28 22:27:49', '2026-02-28 22:27:49');
INSERT INTO `sms_verification_log` VALUES (4, '15770643487', '814372', '2026-02-28 14:41:28', '2026-03-01 14:41:28', 0, '2026-02-28 22:41:25', '2026-02-28 22:41:25');
INSERT INTO `sms_verification_log` VALUES (5, '13395740108', '878693', '2026-03-05 06:30:03', '2026-03-06 06:30:03', 0, '2026-03-05 14:30:02', '2026-03-05 14:30:02');
INSERT INTO `sms_verification_log` VALUES (6, '15770643487', '783154', '2026-04-20 10:48:34', '2026-04-21 10:48:34', 0, '2026-04-20 18:48:33', '2026-04-20 18:48:33');
INSERT INTO `sms_verification_log` VALUES (7, '13395740108', '313185', '2026-04-20 12:04:03', '2026-04-21 12:04:03', 0, '2026-04-20 20:04:02', '2026-04-20 20:04:02');
INSERT INTO `sms_verification_log` VALUES (8, '13395740108', '662188', '2026-05-06 02:50:12', '2026-05-07 02:50:12', 0, '2026-05-06 10:50:12', '2026-05-06 10:50:12');
INSERT INTO `sms_verification_log` VALUES (9, '13230939623', '533041', '2026-05-15 12:22:49', '2026-05-16 12:22:49', 0, '2026-05-15 20:22:48', '2026-05-15 20:22:48');

-- ----------------------------
-- Table structure for statistics_daily
-- ----------------------------
DROP TABLE IF EXISTS `statistics_daily`;
CREATE TABLE `statistics_daily`  (
  `id` bigint NOT NULL COMMENT '主键id',
  `date_calculated` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL COMMENT '统计日期',
  `register_num` int NOT NULL DEFAULT 0 COMMENT '注册人数',
  `login_num` int NOT NULL DEFAULT 0 COMMENT '登录人数',
  `video_view_num` int NOT NULL DEFAULT 0 COMMENT '每日播放视频数',
  `course_num` int NOT NULL DEFAULT 0 COMMENT '每日新增课程数',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `statistics_day`(`date_calculated` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci COMMENT = '网站统计日数据' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of statistics_daily
-- ----------------------------
INSERT INTO `statistics_daily` VALUES (1165, '2018-01-01', 583, 26, 236, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1166, '2018-01-02', 583, 26, 236, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1167, '2018-01-03', 584, 26, 236, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1168, '2018-01-04', 584, 26, 237, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1169, '2018-01-05', 585, 26, 237, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1170, '2018-01-06', 585, 26, 237, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1171, '2018-01-07', 586, 26, 237, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1172, '2018-01-08', 586, 26, 237, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1173, '2018-01-09', 587, 26, 238, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1174, '2018-01-10', 587, 26, 238, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1175, '2018-01-11', 588, 27, 238, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1176, '2018-01-12', 588, 27, 238, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1177, '2018-01-13', 589, 27, 238, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1178, '2018-01-14', 589, 27, 239, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1179, '2018-01-15', 590, 27, 239, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1180, '2018-01-16', 590, 27, 239, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1181, '2018-01-17', 591, 27, 239, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1182, '2018-01-18', 591, 27, 239, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1183, '2018-01-19', 592, 27, 240, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1184, '2018-01-20', 592, 27, 240, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1185, '2018-01-21', 593, 27, 240, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1186, '2018-01-22', 593, 27, 240, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1187, '2018-01-23', 594, 27, 240, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1188, '2018-01-24', 594, 27, 241, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1189, '2018-01-25', 595, 27, 241, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1190, '2018-01-26', 595, 27, 241, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1191, '2018-01-27', 596, 27, 241, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1192, '2018-01-28', 596, 27, 241, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1193, '2018-01-29', 597, 27, 242, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1194, '2018-01-30', 597, 27, 242, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1195, '2018-01-31', 598, 27, 242, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1196, '2018-02-01', 598, 27, 242, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1197, '2018-02-02', 599, 27, 242, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1198, '2018-02-03', 599, 27, 243, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1199, '2018-02-04', 600, 27, 243, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1200, '2018-02-05', 600, 27, 243, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1201, '2018-02-06', 601, 27, 243, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1202, '2018-02-07', 601, 27, 243, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1203, '2018-02-08', 602, 27, 244, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1204, '2018-02-09', 602, 27, 244, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1205, '2018-02-10', 603, 27, 244, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1206, '2018-02-11', 603, 27, 244, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1207, '2018-02-12', 604, 27, 244, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1208, '2018-02-13', 604, 27, 245, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1209, '2018-02-14', 605, 27, 245, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1210, '2018-02-15', 605, 27, 245, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1211, '2018-02-16', 606, 27, 245, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1212, '2018-02-17', 606, 27, 245, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1213, '2018-02-18', 607, 27, 246, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1214, '2018-02-19', 607, 27, 246, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1215, '2018-02-20', 608, 27, 246, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1216, '2018-02-21', 608, 27, 246, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1217, '2018-02-22', 609, 27, 246, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1218, '2018-02-23', 609, 27, 247, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1219, '2018-02-24', 610, 27, 247, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1220, '2018-02-25', 610, 27, 247, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1221, '2018-02-26', 611, 27, 247, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1222, '2018-02-27', 611, 27, 247, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1223, '2018-02-28', 612, 27, 248, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1224, '2018-03-01', 612, 27, 248, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1225, '2018-03-02', 613, 28, 248, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1226, '2018-03-03', 613, 28, 248, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1227, '2018-03-04', 614, 28, 248, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1228, '2018-03-05', 614, 28, 249, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1229, '2018-03-06', 615, 28, 249, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1230, '2018-03-07', 615, 28, 249, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1231, '2018-03-08', 616, 28, 249, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1232, '2018-03-09', 616, 28, 249, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1233, '2018-03-10', 617, 28, 250, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1234, '2018-03-11', 617, 28, 250, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1235, '2018-03-12', 618, 28, 250, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1236, '2018-03-13', 618, 28, 250, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1237, '2018-03-14', 619, 28, 250, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1238, '2018-03-15', 619, 28, 251, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1239, '2018-03-16', 620, 28, 251, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1240, '2018-03-17', 620, 28, 251, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1241, '2018-03-18', 621, 28, 251, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1242, '2018-03-19', 621, 28, 251, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1243, '2018-03-20', 622, 28, 252, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1244, '2018-03-21', 622, 28, 252, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1245, '2018-03-22', 623, 28, 252, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1246, '2018-03-23', 623, 28, 252, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1247, '2018-03-24', 624, 28, 252, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1248, '2018-03-25', 624, 28, 253, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1249, '2018-03-26', 625, 28, 253, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1250, '2018-03-27', 625, 28, 253, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1251, '2018-03-28', 626, 28, 253, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1252, '2018-03-29', 626, 28, 253, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1253, '2018-03-30', 627, 28, 254, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1254, '2018-03-31', 627, 28, 254, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1255, '2018-04-01', 628, 28, 254, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1256, '2018-04-02', 628, 28, 254, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1257, '2018-04-03', 629, 28, 254, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1258, '2018-04-04', 629, 28, 255, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1259, '2018-04-05', 630, 28, 255, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1260, '2018-04-06', 630, 28, 255, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1261, '2018-04-07', 631, 28, 255, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1262, '2018-04-08', 631, 28, 255, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1263, '2018-04-09', 632, 28, 256, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1264, '2018-04-10', 632, 28, 256, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1265, '2018-04-11', 633, 28, 256, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1266, '2018-04-12', 633, 28, 256, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1267, '2018-04-13', 634, 28, 256, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1268, '2018-04-14', 634, 28, 257, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1269, '2018-04-15', 635, 28, 257, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1270, '2018-04-16', 635, 28, 257, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1271, '2018-04-17', 636, 28, 257, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1272, '2018-04-18', 636, 28, 257, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1273, '2018-04-19', 637, 28, 258, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1274, '2018-04-20', 637, 28, 258, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1275, '2018-04-21', 638, 29, 258, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1276, '2018-04-22', 638, 29, 258, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1277, '2018-04-23', 639, 29, 258, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1278, '2018-04-24', 639, 29, 259, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1279, '2018-04-25', 640, 29, 259, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1280, '2018-04-26', 640, 29, 259, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1281, '2018-04-27', 641, 29, 259, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1282, '2018-04-28', 641, 29, 259, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1283, '2018-04-29', 642, 29, 260, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1284, '2018-04-30', 642, 29, 260, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1285, '2018-05-01', 643, 29, 260, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1286, '2018-05-02', 643, 29, 260, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1287, '2018-05-03', 644, 29, 260, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1288, '2018-05-04', 644, 29, 261, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1289, '2018-05-05', 645, 29, 261, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1290, '2018-05-06', 645, 29, 261, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1291, '2018-05-07', 646, 29, 261, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1292, '2018-05-08', 646, 29, 261, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1293, '2018-05-09', 647, 29, 262, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1294, '2018-05-10', 647, 29, 262, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1295, '2018-05-11', 648, 29, 262, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1296, '2018-05-12', 648, 29, 262, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1297, '2018-05-13', 649, 29, 262, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1298, '2018-05-14', 649, 29, 263, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1299, '2018-05-15', 5, 29, 263, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1300, '2018-05-16', 650, 29, 263, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1301, '2018-05-17', 651, 29, 263, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1302, '2018-05-18', 651, 29, 263, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1303, '2018-05-19', 652, 29, 264, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1304, '2018-05-20', 652, 29, 264, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1305, '2018-05-21', 653, 29, 264, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1306, '2018-05-22', 1, 29, 264, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1307, '2018-05-23', 654, 29, 264, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1308, '2018-05-24', 654, 29, 265, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1309, '2018-05-25', 1, 29, 265, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1310, '2018-05-26', 655, 29, 265, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1311, '2018-05-27', 656, 29, 265, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1312, '2018-05-28', 656, 29, 265, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1313, '2018-05-29', 657, 29, 266, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1314, '2018-05-30', 657, 29, 266, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1315, '2018-05-31', 658, 29, 266, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1316, '2018-06-01', 658, 29, 266, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1317, '2018-06-02', 659, 29, 266, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1318, '2018-06-03', 659, 29, 267, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1319, '2018-06-04', 660, 29, 267, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1320, '2018-06-05', 660, 29, 267, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1321, '2018-06-06', 661, 29, 267, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1322, '2018-06-07', 661, 29, 267, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1323, '2018-06-08', 662, 29, 268, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1324, '2018-06-09', 662, 29, 268, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1325, '2018-06-10', 663, 30, 268, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1326, '2018-06-11', 663, 30, 268, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1327, '2018-06-12', 664, 30, 268, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1328, '2018-06-13', 664, 30, 269, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1329, '2018-06-14', 665, 30, 269, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1330, '2018-06-15', 665, 30, 269, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1331, '2018-06-16', 666, 30, 269, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1332, '2018-06-17', 666, 30, 269, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1333, '2018-06-18', 667, 30, 270, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1334, '2018-06-19', 667, 30, 270, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1335, '2018-06-20', 668, 30, 270, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1336, '2018-06-21', 668, 30, 270, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1337, '2018-06-22', 669, 30, 270, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1338, '2018-06-23', 669, 30, 271, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1339, '2018-06-24', 670, 30, 271, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1340, '2018-06-25', 670, 30, 271, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1341, '2018-06-26', 671, 30, 271, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1342, '2018-06-27', 671, 30, 271, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1343, '2018-06-28', 672, 30, 272, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1344, '2018-06-29', 672, 30, 272, 14, '2018-01-25 06:38:19', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1345, '2018-06-30', 673, 30, 272, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1346, '2018-07-01', 673, 30, 272, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1347, '2018-07-02', 674, 30, 272, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1348, '2018-07-03', 674, 30, 273, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1349, '2018-07-04', 675, 30, 273, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1350, '2018-07-05', 675, 30, 273, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1351, '2018-07-06', 676, 30, 273, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1352, '2018-07-07', 676, 30, 273, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1353, '2018-07-08', 677, 30, 274, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1355, '2018-07-10', 678, 30, 274, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1356, '2018-07-11', 678, 30, 274, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1357, '2018-07-12', 679, 30, 274, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1358, '2018-07-13', 679, 30, 275, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1359, '2018-07-14', 680, 30, 275, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1360, '2018-07-15', 680, 30, 275, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1361, '2018-07-16', 681, 30, 275, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1362, '2018-07-17', 681, 30, 275, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1363, '2018-07-18', 682, 30, 276, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1365, '2018-07-20', 683, 30, 276, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1366, '2018-07-21', 683, 30, 276, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1367, '2018-07-22', 684, 30, 276, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1368, '2018-07-23', 684, 30, 277, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1369, '2018-07-24', 685, 30, 277, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1370, '2018-07-25', 685, 30, 277, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1371, '2018-07-26', 686, 30, 277, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1372, '2018-07-27', 686, 30, 277, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1373, '2018-07-28', 687, 30, 278, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1374, '2018-07-29', 687, 30, 278, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1375, '2018-07-30', 688, 31, 278, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1376, '2018-07-31', 688, 31, 278, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1377, '2018-08-01', 689, 31, 278, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1378, '2018-08-02', 689, 31, 279, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1379, '2018-08-03', 690, 31, 279, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1380, '2018-08-04', 690, 31, 279, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1381, '2018-08-05', 691, 31, 279, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1382, '2018-08-06', 691, 31, 279, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1383, '2018-08-07', 692, 31, 280, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1384, '2018-08-08', 692, 31, 280, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1385, '2018-08-09', 1, 31, 280, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1386, '2018-08-10', 693, 31, 280, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1387, '2018-08-11', 694, 31, 280, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1388, '2018-08-12', 694, 31, 281, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1389, '2018-08-13', 695, 31, 281, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1390, '2018-08-14', 695, 31, 281, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1391, '2018-08-15', 696, 31, 281, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1392, '2018-08-16', 696, 31, 281, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1393, '2018-08-17', 697, 31, 282, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1394, '2018-08-18', 697, 31, 282, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1395, '2018-08-19', 698, 31, 282, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1396, '2018-08-20', 698, 31, 282, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1397, '2018-08-21', 699, 31, 282, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1398, '2018-08-22', 699, 31, 283, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1399, '2018-08-23', 700, 31, 283, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1400, '2018-08-24', 700, 31, 283, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1401, '2018-08-25', 701, 31, 283, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1402, '2018-08-26', 701, 31, 283, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1403, '2018-08-27', 702, 31, 284, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1404, '2018-08-28', 702, 31, 284, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1405, '2018-08-29', 703, 31, 284, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1406, '2018-08-30', 703, 31, 284, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1407, '2018-08-31', 704, 31, 284, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1408, '2018-09-01', 1, 31, 285, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1409, '2018-09-02', 705, 31, 285, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1410, '2018-09-03', 705, 31, 285, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1411, '2018-09-04', 706, 31, 285, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1412, '2018-09-05', 706, 31, 285, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1413, '2018-09-06', 707, 31, 286, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1414, '2018-09-07', 707, 31, 1, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1415, '2018-09-08', 708, 31, 1, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1416, '2018-09-09', 1, 31, 1, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1417, '2018-09-10', 1, 31, 2, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1418, '2018-09-11', 709, 31, 287, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1419, '2018-09-12', 710, 31, 287, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1420, '2018-09-13', 710, 31, 287, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1421, '2018-09-14', 711, 31, 287, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1422, '2018-09-15', 711, 31, 287, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1423, '2018-09-16', 712, 31, 288, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1424, '2018-09-17', 712, 31, 288, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1425, '2018-09-18', 713, 32, 288, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1426, '2018-09-19', 713, 32, 288, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1427, '2018-09-20', 714, 32, 288, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1428, '2018-09-21', 714, 32, 289, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1429, '2018-09-22', 715, 32, 289, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1430, '2018-09-23', 715, 32, 289, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1431, '2018-09-24', 716, 32, 1, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1432, '2018-09-25', 716, 32, 289, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1433, '2018-09-26', 717, 32, 290, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1434, '2018-09-27', 717, 32, 290, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1435, '2018-09-28', 718, 32, 290, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1436, '2018-09-29', 718, 32, 1, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1437, '2018-09-30', 719, 32, 290, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1438, '2018-10-01', 719, 32, 291, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1439, '2018-10-02', 720, 32, 291, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1440, '2018-10-03', 720, 32, 291, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1441, '2018-10-04', 721, 32, 291, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1442, '2018-10-05', 721, 32, 291, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1443, '2018-10-06', 722, 32, 292, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1444, '2018-10-07', 722, 32, 292, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1445, '2018-10-08', 1, 32, 292, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1446, '2018-10-09', 723, 32, 292, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1447, '2018-10-10', 724, 32, 292, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1448, '2018-10-11', 724, 32, 293, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1449, '2018-10-12', 725, 32, 293, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1450, '2018-10-13', 725, 32, 293, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1451, '2018-10-14', 726, 32, 4, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1452, '2018-10-15', 726, 32, 293, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1453, '2018-10-16', 727, 32, 294, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1454, '2018-10-17', 727, 32, 294, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1455, '2018-10-18', 728, 32, 294, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1456, '2018-10-19', 728, 32, 294, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1457, '2018-10-20', 729, 32, 294, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1458, '2018-10-21', 729, 32, 295, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1459, '2018-10-22', 730, 32, 1, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1460, '2018-10-23', 730, 32, 295, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1461, '2018-10-24', 731, 32, 295, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1462, '2018-10-25', 731, 32, 295, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1463, '2018-10-26', 732, 32, 296, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1464, '2018-10-27', 732, 32, 296, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1465, '2018-10-28', 733, 32, 296, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1466, '2018-10-29', 2, 32, 3, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1467, '2018-10-30', 734, 32, 296, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1468, '2018-10-31', 734, 32, 297, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1469, '2018-11-01', 735, 32, 297, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1470, '2018-11-02', 735, 32, 297, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1471, '2018-11-03', 1, 32, 297, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1472, '2018-11-04', 736, 32, 1, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1473, '2018-11-05', 737, 32, 298, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1474, '2018-11-06', 737, 32, 298, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1475, '2018-11-07', 738, 33, 298, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1476, '2018-11-08', 738, 33, 169, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1477, '2018-11-09', 1, 33, 298, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1478, '2018-11-10', 739, 33, 78, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1479, '2018-11-11', 740, 33, 299, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1480, '2018-11-12', 740, 33, 299, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1481, '2018-11-13', 741, 33, 299, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1482, '2018-11-14', 741, 33, 299, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1483, '2018-11-15', 742, 33, 300, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1484, '2018-11-16', 742, 33, 35, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1485, '2018-11-17', 743, 33, 300, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1486, '2018-11-18', 743, 33, 300, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1487, '2018-11-19', 744, 33, 300, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1488, '2018-11-20', 744, 33, 301, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1489, '2018-11-21', 745, 33, 234, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1490, '2018-11-22', 456, 33, 301, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1491, '2018-11-23', 746, 33, 301, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1492, '2018-11-24', 746, 33, 301, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1493, '2018-11-25', 747, 33, 302, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1494, '2018-11-26', 747, 4, 302, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1495, '2018-11-27', 748, 33, 302, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1496, '2018-11-28', 748, 33, 36, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1497, '2018-11-29', 749, 33, 302, 2, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1498, '2018-11-30', 749, 3, 303, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1499, '2018-12-01', 750, 33, 303, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1500, '2018-12-02', 234, 33, 303, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1501, '2018-12-03', 751, 33, 303, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1502, '2018-12-04', 751, 33, 303, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1503, '2018-12-05', 752, 6, 304, 33, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1505, '2018-12-07', 753, 33, 55, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1506, '2018-12-08', 753, 33, 304, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1507, '2018-12-09', 754, 33, 304, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1508, '2018-12-10', 754, 1, 305, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1509, '2018-12-11', 755, 33, 305, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1510, '2018-12-12', 755, 33, 305, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1511, '2018-12-13', 756, 33, 305, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1512, '2018-12-14', 366, 33, 305, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1513, '2018-12-15', 757, 33, 66, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1514, '2018-12-16', 757, 33, 306, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1515, '2018-12-17', 758, 33, 306, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1516, '2018-12-18', 758, 2, 306, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1517, '2018-12-19', 759, 33, 306, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1518, '2018-12-20', 564, 33, 307, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1519, '2018-12-21', 760, 33, 307, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1520, '2018-12-22', 760, 33, 307, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1521, '2018-12-23', 761, 33, 307, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1522, '2018-12-24', 761, 33, 307, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1527, '2018-12-29', 764, 34, 308, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1528, '2018-12-30', 764, 34, 309, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1529, '2018-12-31', 765, 34, 309, 14, '2018-01-25 06:38:20', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1554, '2018-01-01', 333, 34, 314, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1555, '2018-01-02', 778, 34, 314, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1556, '2018-01-03', 778, 34, 314, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1557, '2018-01-04', 779, 34, 314, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1558, '2018-01-05', 779, 34, 315, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1559, '2018-01-06', 780, 34, 315, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1560, '2018-01-07', 780, 34, 315, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1561, '2018-01-08', 781, 34, 315, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1562, '2018-01-09', 781, 34, 315, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1563, '2018-01-10', 782, 34, 316, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1564, '2018-01-11', 782, 34, 316, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1565, '2018-01-12', 783, 34, 316, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1566, '2018-01-13', 783, 34, 316, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1567, '2018-01-14', 784, 34, 316, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1568, '2018-01-15', 784, 34, 317, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1569, '2018-01-16', 23, 34, 317, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1570, '2018-01-17', 785, 34, 317, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1571, '2018-01-18', 786, 34, 317, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1572, '2018-01-19', 786, 34, 317, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1573, '2018-01-20', 787, 2, 318, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1574, '2018-01-21', 787, 2, 318, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1575, '2018-01-22', 788, 1, 318, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1576, '2018-01-23', 788, 35, 318, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1577, '2018-01-24', 789, 35, 318, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1578, '2018-01-25', 789, 1, 319, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1579, '2018-01-26', 790, 1, 319, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1580, '2018-01-27', 531, 2, 319, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1581, '2018-01-28', 791, 2, 319, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1582, '2018-01-29', 791, 2, 319, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1583, '2018-01-30', 2, 4, 2, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1584, '2018-01-31', 792, 35, 320, 14, '2018-02-02 08:58:31', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1586, '2018-02-01', 793, 4, 3, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1587, '2018-02-02', 794, 2, 1, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1588, '2018-02-03', 794, 1, 4, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1589, '2018-02-04', 795, 35, 321, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1590, '2018-02-05', 795, 35, 321, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1591, '2018-02-06', 796, 35, 321, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1592, '2018-02-07', 796, 35, 321, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1593, '2018-02-08', 797, 35, 322, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1594, '2018-02-09', 797, 35, 322, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1595, '2018-02-10', 99, 35, 322, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1596, '2018-02-11', 798, 35, 322, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1597, '2018-02-12', 799, 35, 322, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1598, '2018-02-13', 799, 35, 323, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1599, '2018-02-14', 800, 35, 323, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1600, '2018-02-15', 800, 35, 323, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1601, '2018-02-16', 89, 35, 90, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1602, '2018-02-17', 801, 35, 323, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1603, '2018-02-18', 802, 23, 324, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1604, '2018-02-19', 802, 2, 324, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1605, '2018-02-20', 803, 56, 324, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1606, '2018-02-21', 45, 35, 89, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1607, '2018-02-22', 804, 35, 324, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1608, '2018-02-23', 804, 35, 325, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1609, '2018-02-24', 805, 1, 3, 14, '2018-02-25 10:54:34', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1610, '2018-05-15', 0, 0, 0, 7, '2018-05-16 00:25:27', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1611, '2018-10-01', 0, 0, 0, 7, '2018-10-24 16:17:15', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1612, '2018-10-02', 0, 0, 0, 7, '2018-10-24 16:17:15', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1613, '2018-10-03', 0, 0, 0, 7, '2018-10-24 16:17:15', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1614, '2018-10-04', 0, 0, 0, 7, '2018-10-24 16:17:15', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1615, '2018-10-05', 0, 0, 0, 7, '2018-10-24 16:17:15', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1078490017163833345, '2018-12-28', 0, 0, 154, 170, '2018-12-28 11:17:12', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1087142127818768386, '2019-01-02', 2, 0, 167, 177, '2019-01-21 08:17:36', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1087198321809457153, '2019-01-01', 1, 0, 130, 189, '2019-01-21 12:00:54', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1087198383973236738, '2019-01-03', 0, 0, 114, 130, '2019-01-21 12:01:09', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1087451681764982785, '2019-01-04', 0, 0, 118, 155, '2019-01-22 04:47:39', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1087455336471785473, '2019-01-05', 0, 0, 184, 186, '2019-01-22 05:02:11', '2019-09-09 12:12:12');
INSERT INTO `statistics_daily` VALUES (1105339962460491777, '2019-03-01', 0, 143, 168, 136, '2019-03-12 13:29:18', '2019-03-12 13:29:18');
INSERT INTO `statistics_daily` VALUES (1105339977027309569, '2019-03-02', 0, 165, 171, 158, '2019-03-12 13:29:21', '2019-03-12 13:29:21');
INSERT INTO `statistics_daily` VALUES (1105339990738489346, '2019-03-03', 0, 143, 147, 194, '2019-03-12 13:29:25', '2019-03-12 13:29:25');
INSERT INTO `statistics_daily` VALUES (1105340000544772098, '2019-03-04', 0, 155, 106, 153, '2019-03-12 13:29:27', '2019-03-12 13:29:27');
INSERT INTO `statistics_daily` VALUES (1105340011244441602, '2019-03-05', 0, 186, 102, 155, '2019-03-12 13:29:30', '2019-03-12 13:29:30');
INSERT INTO `statistics_daily` VALUES (1105340020929089538, '2019-03-06', 0, 140, 192, 129, '2019-03-12 13:29:32', '2019-03-12 13:29:32');
INSERT INTO `statistics_daily` VALUES (1105340029800042497, '2019-03-07', 0, 186, 139, 116, '2019-03-12 13:29:34', '2019-03-12 13:29:34');
INSERT INTO `statistics_daily` VALUES (1105340038696161282, '2019-03-08', 0, 120, 166, 112, '2019-03-12 13:29:36', '2019-03-12 13:29:36');
INSERT INTO `statistics_daily` VALUES (1105340049441968129, '2019-03-09', 0, 182, 147, 119, '2019-03-12 13:29:39', '2019-03-12 13:29:39');
INSERT INTO `statistics_daily` VALUES (1105340059738984449, '2019-03-10', 0, 199, 141, 103, '2019-03-12 13:29:41', '2019-03-12 13:29:41');
INSERT INTO `statistics_daily` VALUES (1105340070438653953, '2019-03-11', 0, 127, 137, 156, '2019-03-12 13:29:44', '2019-03-12 13:29:44');
INSERT INTO `statistics_daily` VALUES (1105340080307851266, '2019-03-12', 0, 167, 123, 132, '2019-03-12 13:29:46', '2019-03-12 13:29:46');
INSERT INTO `statistics_daily` VALUES (1105340090047025153, '2019-03-13', 0, 106, 132, 103, '2019-03-12 13:29:48', '2019-03-12 13:29:48');
INSERT INTO `statistics_daily` VALUES (1105340100075606017, '2019-03-14', 0, 166, 180, 118, '2019-03-12 13:29:51', '2019-03-12 13:29:51');
INSERT INTO `statistics_daily` VALUES (1105340110511034370, '2019-03-15', 0, 114, 151, 185, '2019-03-12 13:29:53', '2019-03-12 13:29:53');
INSERT INTO `statistics_daily` VALUES (1105340121412030466, '2019-03-16', 0, 134, 105, 126, '2019-03-12 13:29:56', '2019-03-12 13:29:56');
INSERT INTO `statistics_daily` VALUES (1105340132833120258, '2019-03-17', 0, 169, 106, 131, '2019-03-12 13:29:59', '2019-03-12 13:29:59');
INSERT INTO `statistics_daily` VALUES (1105340145659301890, '2019-03-18', 0, 120, 106, 163, '2019-03-12 13:30:02', '2019-03-12 13:30:02');
INSERT INTO `statistics_daily` VALUES (1105340153578147842, '2019-03-19', 0, 146, 155, 153, '2019-03-12 13:30:03', '2019-03-12 13:30:03');
INSERT INTO `statistics_daily` VALUES (1105340162436517890, '2019-03-20', 0, 127, 181, 186, '2019-03-12 13:30:06', '2019-03-12 13:30:06');
INSERT INTO `statistics_daily` VALUES (1105340171517186050, '2019-03-21', 0, 106, 134, 145, '2019-03-12 13:30:08', '2019-03-12 13:30:08');
INSERT INTO `statistics_daily` VALUES (1105340181034061825, '2019-03-22', 0, 161, 182, 143, '2019-03-12 13:30:10', '2019-03-12 13:30:10');
INSERT INTO `statistics_daily` VALUES (1105340190072786946, '2019-03-23', 0, 183, 101, 182, '2019-03-12 13:30:12', '2019-03-12 13:30:12');
INSERT INTO `statistics_daily` VALUES (1105340199426084865, '2019-03-24', 0, 117, 100, 102, '2019-03-12 13:30:14', '2019-03-12 13:30:14');
INSERT INTO `statistics_daily` VALUES (1105340209261727745, '2019-03-25', 0, 116, 103, 160, '2019-03-12 13:30:17', '2019-03-12 13:30:17');
INSERT INTO `statistics_daily` VALUES (1105340217935548418, '2019-03-26', 0, 101, 119, 150, '2019-03-12 13:30:19', '2019-03-12 13:30:19');
INSERT INTO `statistics_daily` VALUES (1105340225967640577, '2019-03-27', 0, 129, 141, 181, '2019-03-12 13:30:21', '2019-03-12 13:30:21');
INSERT INTO `statistics_daily` VALUES (1105340234075230209, '2019-03-28', 0, 113, 179, 158, '2019-03-12 13:30:23', '2019-03-12 13:30:23');
INSERT INTO `statistics_daily` VALUES (1105340242837131265, '2019-03-29', 0, 117, 131, 101, '2019-03-12 13:30:25', '2019-03-12 13:30:25');
INSERT INTO `statistics_daily` VALUES (1105340252395950082, '2019-03-30', 0, 153, 187, 174, '2019-03-12 13:30:27', '2019-03-12 13:30:27');
INSERT INTO `statistics_daily` VALUES (1105340261958963201, '2019-03-31', 0, 179, 135, 199, '2019-03-12 13:30:29', '2019-03-12 13:30:29');
INSERT INTO `statistics_daily` VALUES (1105372743634898945, '2019-01-06', 0, 113, 143, 148, '2019-03-12 15:39:34', '2019-03-12 15:39:34');
INSERT INTO `statistics_daily` VALUES (1105372754380705793, '2019-01-07', 0, 173, 158, 153, '2019-03-12 15:39:36', '2019-03-12 15:39:36');
INSERT INTO `statistics_daily` VALUES (1105372762526044162, '2019-01-08', 0, 135, 199, 131, '2019-03-12 15:39:38', '2019-03-12 15:39:38');
INSERT INTO `statistics_daily` VALUES (1105372771229224961, '2019-01-09', 0, 161, 107, 162, '2019-03-12 15:39:40', '2019-03-12 15:39:40');
INSERT INTO `statistics_daily` VALUES (1105372780922261505, '2019-01-10', 0, 182, 196, 135, '2019-03-12 15:39:42', '2019-03-12 15:39:42');
INSERT INTO `statistics_daily` VALUES (1105372790103592961, '2019-01-11', 0, 123, 194, 102, '2019-03-12 15:39:45', '2019-03-12 15:39:45');
INSERT INTO `statistics_daily` VALUES (1105372798626418689, '2019-01-12', 0, 185, 106, 180, '2019-03-12 15:39:47', '2019-03-12 15:39:47');
INSERT INTO `statistics_daily` VALUES (1183991737299263490, '2019-10-01', 0, 145, 149, 153, '2019-10-15 14:23:22', '2019-10-15 14:23:22');
INSERT INTO `statistics_daily` VALUES (1183999299272904705, '2019-10-03', 0, 125, 102, 153, '2019-10-15 14:53:25', '2019-10-15 14:53:25');
INSERT INTO `statistics_daily` VALUES (1183999309477646338, '2019-10-04', 0, 103, 194, 161, '2019-10-15 14:53:28', '2019-10-15 14:53:28');
INSERT INTO `statistics_daily` VALUES (1183999318919024642, '2019-10-05', 0, 173, 174, 147, '2019-10-15 14:53:30', '2019-10-15 14:53:30');
INSERT INTO `statistics_daily` VALUES (1183999331409661954, '2019-10-06', 0, 129, 197, 173, '2019-10-15 14:53:33', '2019-10-15 14:53:33');
INSERT INTO `statistics_daily` VALUES (1183999342897860610, '2019-10-07', 0, 184, 125, 169, '2019-10-15 14:53:36', '2019-10-15 14:53:36');
INSERT INTO `statistics_daily` VALUES (1183999351588458498, '2019-10-08', 0, 173, 143, 138, '2019-10-15 14:53:38', '2019-10-15 14:53:38');
INSERT INTO `statistics_daily` VALUES (1183999360316805122, '2019-10-09', 0, 161, 158, 117, '2019-10-15 14:53:40', '2019-10-15 14:53:40');
INSERT INTO `statistics_daily` VALUES (1183999367480676353, '2019-10-10', 0, 190, 166, 135, '2019-10-15 14:53:42', '2019-10-15 14:53:42');
INSERT INTO `statistics_daily` VALUES (1184030117693284353, '2019-10-11', 0, 182, 199, 193, '2019-10-15 16:55:53', '2019-10-15 16:55:53');
INSERT INTO `statistics_daily` VALUES (1185373213064482818, '2019-01-19', 6, 135, 126, 167, '2019-10-19 09:52:52', '2019-10-19 09:52:52');
INSERT INTO `statistics_daily` VALUES (1186536619937435650, '2019-10-02', 0, 187, 183, 108, '2019-10-22 14:55:50', '2019-10-22 14:55:50');
INSERT INTO `statistics_daily` VALUES (1192253597226455042, '2019-11-01', 0, 129, 122, 167, '2019-11-07 09:33:03', '2019-11-07 09:33:03');
INSERT INTO `statistics_daily` VALUES (1192253902756335617, '2019-11-02', 0, 170, 192, 192, '2019-11-07 09:34:16', '2019-11-07 09:34:16');
INSERT INTO `statistics_daily` VALUES (1194060032935493633, '2019-11-11', 0, 121, 121, 122, '2019-11-12 09:11:11', '2019-11-12 09:11:11');
INSERT INTO `statistics_daily` VALUES (1194060301425475585, '2019-11-10', 0, 155, 187, 140, '2019-11-12 09:12:15', '2019-11-12 09:12:15');
INSERT INTO `statistics_daily` VALUES (1542778443513462786, '2018-07-19', 0, 126, 150, 102, '2022-07-01 15:53:39', '2022-07-01 15:53:39');
INSERT INTO `statistics_daily` VALUES (1542778598606241794, '2022-07-21', 0, 125, 154, 167, '2022-07-01 15:54:16', '2022-07-01 15:54:16');
INSERT INTO `statistics_daily` VALUES (1542778722480816130, '2022-07-19', 0, 143, 127, 129, '2022-07-01 15:54:46', '2022-07-01 15:54:46');
INSERT INTO `statistics_daily` VALUES (1542780041534898178, '2022-07-01', 0, 128, 112, 139, '2022-07-01 16:00:00', '2022-07-01 16:00:00');
INSERT INTO `statistics_daily` VALUES (1543146607464169473, '2018-07-09', 0, 169, 165, 159, '2022-07-02 16:16:36', '2022-07-02 16:16:36');
INSERT INTO `statistics_daily` VALUES (1543886389232398337, '2022-07-03', 0, 140, 176, 155, '2022-07-04 17:16:14', '2022-07-04 17:16:14');
INSERT INTO `statistics_daily` VALUES (1544610113724190722, '2022-06-29', 0, 170, 147, 135, '2022-07-06 17:12:03', '2022-07-06 17:12:03');
INSERT INTO `statistics_daily` VALUES (1544612206711246849, '2022-06-28', 0, 108, 135, 100, '2022-07-06 17:20:22', '2022-07-06 17:20:22');
INSERT INTO `statistics_daily` VALUES (1544612293176823810, '2022-07-05', 0, 107, 146, 103, '2022-07-06 17:20:43', '2022-07-06 17:20:43');
INSERT INTO `statistics_daily` VALUES (1544652391683457025, '2022-07-06', 1, 144, 141, 171, '2022-07-06 20:00:03', '2022-07-06 20:00:03');
INSERT INTO `statistics_daily` VALUES (1545044971172745217, '2022-07-07', 1, 110, 138, 132, '2022-07-07 22:00:01', '2022-07-07 22:00:01');
INSERT INTO `statistics_daily` VALUES (1545054346822111234, '2019-07-10', 0, 158, 132, 148, '2022-07-07 22:37:17', '2022-07-07 22:37:17');
INSERT INTO `statistics_daily` VALUES (1545216306901528577, '2022-07-04', 0, 116, 126, 194, '2022-07-08 09:20:51', '2022-07-08 09:20:51');
INSERT INTO `statistics_daily` VALUES (1545377159609081857, '2022-07-08', 0, 123, 180, 174, '2022-07-08 20:00:01', '2022-07-08 20:00:01');

-- ----------------------------
-- Table structure for student_member
-- ----------------------------
DROP TABLE IF EXISTS `student_member`;
CREATE TABLE `student_member`  (
  `id` bigint NOT NULL COMMENT '会员id',
  `openid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '微信openid',
  `mobile` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT '' COMMENT '手机号',
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '密码',
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '昵称',
  `sex` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '性别 1 女，2 男',
  `age` tinyint UNSIGNED NULL DEFAULT NULL COMMENT '年龄',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT 'https://img.51miz.com/Element/00/88/08/84/72f298b9_E880884_d0f63115.png' COMMENT '用户头像',
  `sign` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '用户签名',
  `is_enable` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否启用 1（true）已启用，  0（false）已禁用',
  `is_deleted` tinyint(1) NOT NULL DEFAULT 0 COMMENT '逻辑删除 1（true）已删除， 0（false）未删除',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '会员表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_member
-- ----------------------------
INSERT INTO `student_member` VALUES (1, NULL, '13700000001', '96e79218965eb72c92a549dd5a330112', '小三123', 1, 5, 'https://coursera-class.oss-cn-beijing.aliyuncs.com/2025/12/19/c1ee9ef8c33QQ图片20250210233434.jpg', '我的个人签名', 1, 0, '2019-01-01 12:11:33', '2025-12-19 21:29:03');
INSERT INTO `student_member` VALUES (1080736474267144193, NULL, '13700000011', '96e79218965eb72c92a549dd5a330112', '用户XJtDfaYeKk', 1, 19, 'https://img.51miz.com/Element/00/88/08/84/72f298b9_E880884_d0f63115.png', NULL, 1, 0, '2019-01-02 12:12:45', '2019-01-02 12:12:56');
INSERT INTO `student_member` VALUES (1080736474355224577, NULL, '13700000002', '96e79218965eb72c92a549dd5a330112', '用户wUrNkzAPrc', 1, 27, 'https://img.51miz.com/Element/00/88/08/84/72f298b9_E880884_d0f63115.png', NULL, 1, 0, '2019-01-02 12:13:56', '2019-01-02 12:14:07');
INSERT INTO `student_member` VALUES (1086387099449442306, NULL, '13520191388', '96e79218965eb72c92a549dd5a330112', '用户XTMUeHDAoj', 2, 20, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `student_member` VALUES (1086387099520745473, NULL, '13520191389', '96e79218965eb72c92a549dd5a330112', '用户vSdKeDlimn', 1, 21, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `student_member` VALUES (1086387099608825858, NULL, '13520191381', '96e79218965eb72c92a549dd5a330112', '用户EoyWUVXQoP', 1, 18, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `student_member` VALUES (1086387099701100545, NULL, '13520191382', '96e79218965eb72c92a549dd5a330112', '用户LcAYbxLNdN', 2, 24, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `student_member` VALUES (1086387099776598018, NULL, '13520191383', '96e79218965eb72c92a549dd5a330112', '用户dZdjcgltnk', 2, 25, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `student_member` VALUES (1086387099852095490, NULL, '13520191384', '96e79218965eb72c92a549dd5a330112', '用户wNHGHlxUwX', 2, 23, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-01-19 06:17:23', '2019-01-19 06:17:23');
INSERT INTO `student_member` VALUES (1106746895272849410, 'o1R-t5u2TfEVeVjO9CPGdHPNw-to', NULL, '96e79218965eb72c92a549dd5a330112', '檀梵\'', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/zZfLXcetf2Rpsibq6HbPUWKgWSJHtha9y1XBeaqluPUs6BYicW1FJaVqj7U3ozHd3iaodGKJOvY2PvqYTuCKwpyfQ/132', NULL, 1, 0, '2019-03-16 10:39:57', '2019-03-16 10:39:57');
INSERT INTO `student_member` VALUES (1106822699956654081, NULL, NULL, '96e79218965eb72c92a549dd5a330112', '12', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-03-16 15:41:10', '2019-03-16 15:41:10');
INSERT INTO `student_member` VALUES (1106823035660357634, 'o1R-t5i4gENwHYRb5lVFy98Z0bdk', NULL, NULL, 'GaoSir', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJI53RcCuc1no02os6ZrattWGiazlPnicoZQ59zkS7phNdLEWUPDk8fzoxibAnXV1Sbx0trqXEsGhXPw/132', NULL, 1, 0, '2019-03-16 15:42:30', '2019-03-16 15:42:30');
INSERT INTO `student_member` VALUES (1106823041599492098, NULL, NULL, '96e79218965eb72c92a549dd5a330112', '13', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-03-16 15:42:32', '2019-03-16 15:42:32');
INSERT INTO `student_member` VALUES (1106823115788341250, 'o1R-t5l_3rnbZbn4jWwFdy6Gk6cg', NULL, '', '换个网名哇、', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/jJHyeM0EN2jhB70LntI3k8fEKe7W6CwykrKMgDJM4VZqCpcxibVibX397p0vmbKURGkLS4jxjGB0GpZfxCicgt07w/132', NULL, 1, 0, '2019-03-16 15:42:49', '2019-03-16 15:42:49');
INSERT INTO `student_member` VALUES (1106826046730227714, 'o1R-t5gyxumyBqt0CWcnh0S6Ya1g', NULL, '', '我是Helen', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKDRfib8wy7A2ltERKh4VygxdjVC1x5OaOb1t9hot4JNt5agwaVLdJLcD9vJCNcxkvQnlvLYIPfrZw/132', NULL, 1, 0, '2019-03-16 15:54:28', '2019-03-16 15:54:28');
INSERT INTO `student_member` VALUES (1106828185829490690, 'o1R-t5nNlou5lRwBVgGNJFm4rbc4', NULL, '', ' 虎头', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTKxCqRzuYWQmpwiaqQEjNxbC7WicebicXQusU306jgmfoOzUcFg1qaDq5BStiblwBjw5dUOblQ2gUicQOQ/132', NULL, 1, 0, '2019-03-16 16:02:58', '2019-03-16 16:02:58');
INSERT INTO `student_member` VALUES (1106830599651442689, 'o1R-t5hZHQB1cbX7HZJsiM727_SA', NULL, '', '是吴啊', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/Q0j4TwGTfTJ9CsqApybcs7f3Dyib9IxIh0sBqJb7LicbjU4WticJFF0PVwFvHgtbFdBwfmk3H2t3NyqmEmVx17tRA/132', NULL, 1, 0, '2019-03-16 16:12:34', '2019-03-16 16:12:34');
INSERT INTO `student_member` VALUES (1106830976199278593, 'o1R-t5meKOoyEJ3-IhWRCBKFcvzU', NULL, NULL, '我才是Helen', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83epMicP9UT6mVjYWdno0OJZkOXiajG0sllJTbGJ9DYiceej2XvbDSGCK8LCF7jv1PuG2uoYlePWic9XO8A/132', NULL, 1, 0, '2019-03-16 16:14:03', '2019-03-16 16:14:03');
INSERT INTO `student_member` VALUES (1106831936900415490, 'o1R-t5jXYSWakGtnUBnKbfVT5Iok', NULL, NULL, '文若姬', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/3HEmJwpSzguqqAyzmBwqT6aicIanswZibEOicQInQJI3ZY1qmu59icJC6N7SahKqWYv24GvX5KH2fibwt0mPWcTJ3fg/132', NULL, 1, 0, '2019-03-16 16:17:52', '2019-03-16 16:17:52');
INSERT INTO `student_member` VALUES (1106832491064442882, 'o1R-t5sud081Qsa2Vb2xSKgGnf_g', NULL, NULL, 'Peanut', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-03-16 16:20:04', '2019-03-16 16:20:04');
INSERT INTO `student_member` VALUES (1106833021442510849, 'o1R-t5lsGc3I8P5bDpHj7m_AIRvQ', NULL, NULL, '食物链终结者', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/MQ7qUmCprK9am16M1Ia1Cs3RK0qiarRrl9y8gsssBjIZeS2GwKSrnq7ZYhmrzuzDwBxSMMAofrXeLic9IBlW4M3Q/132', NULL, 1, 0, '2019-03-16 16:22:11', '2019-03-16 16:22:11');
INSERT INTO `student_member` VALUES (1191600824445046786, NULL, '15210078344', '96e79218965eb72c92a549dd5a330112', 'IT妖姬', 1, 5, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-11-05 14:19:10', '2019-11-08 18:04:43');
INSERT INTO `student_member` VALUES (1191616288114163713, NULL, '17866603606', '96e79218965eb72c92a549dd5a330112', 'xiaowu', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-11-05 15:20:37', '2019-11-05 15:20:37');
INSERT INTO `student_member` VALUES (1195187659054329857, NULL, '15010546384', '96e79218965eb72c92a549dd5a330112', 'qy', NULL, NULL, 'http://thirdwx.qlogo.cn/mmopen/vi_32/DYAIOgq83eoj0hHXhgJNOTSOFsS4uZs8x1ConecaVOB8eIl115xmJZcT4oCicvia7wMEufibKtTLqiaJeanU2Lpg3w/132', NULL, 1, 0, '2019-11-15 11:51:58', '2019-11-15 11:51:58');
INSERT INTO `student_member` VALUES (1542307507052015618, 'o3_SC599cgeV8i75dWrlqrkGUA2I', '', NULL, '卫天', NULL, NULL, 'https://thirdwx.qlogo.cn/mmopen/vi_32/rhwWwianRPt65VVJXL1TXZmPaCt6GbKGz6LSdGwbCZWP0pUgEl96BDwEDaSzRIHyw1A7LrfJVrLWZ29pF51bRyg/132', NULL, 1, 0, '2022-06-30 08:42:19', '2022-06-30 08:42:19');
INSERT INTO `student_member` VALUES (1542309609698574338, 'o3_SC5zRydLw97xk_TEBQMRS3NWI', '', NULL, '哄哄', 2, 10, 'https://thirdwx.qlogo.cn/mmopen/vi_32/Q3auHgzwzM5JBpZdGzrpibAypSwaQPeBgXuGHN3INUxrMJHXc9fypebib8iaibYibjtjf1868OwYAPEgEWpYjXPibbSQ/132', '在学习zhong', 1, 0, '2022-06-30 08:50:40', '2022-07-08 09:08:57');
INSERT INTO `student_member` VALUES (1545034536738373633, NULL, '13509432595', '96e79218965eb72c92a549dd5a330112', '好起来了', 2, 20, 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/08/08/93efd688cf3Ai.jpg', '我的个性签名', 1, 0, '2022-07-07 21:18:34', '2022-08-08 10:07:15');
INSERT INTO `student_member` VALUES (1976202474631708673, 'o3_SC575qPoqIy77hDzbkPP_mP0g', '', NULL, '旧城新月', NULL, 0, 'https://thirdwx.qlogo.cn/mmopen/vi_32/PiajxSqBRaEKp5rSkHcGV9ucIMQibrIQDic5XIWzVpkibeh67963NzSS2sZr0JcDZt203vQBslRJqCKP0CZK42e7rw/132', NULL, 1, 0, '2025-10-09 16:26:01', '2025-10-12 16:19:48');
INSERT INTO `student_member` VALUES (2024503386716000258, NULL, '15270843079', 'e10adc3949ba59abbe56e057f20f883e', '小胡', NULL, 0, 'image/2026/03/01/d86778822fab440c8cacafc04429ae94.jpg', NULL, 1, 0, '2026-02-19 23:16:36', '2026-03-01 23:29:55');
INSERT INTO `student_member` VALUES (2025395129279934465, NULL, '15770643487', 'e10adc3949ba59abbe56e057f20f883e', 'JCXYOZH', NULL, 0, 'image/2026/02/24/8b36f6550e234d4899abf7631c2b4e79.jpg', NULL, 1, 0, '2026-02-22 10:20:03', '2026-04-20 18:50:59');
INSERT INTO `student_member` VALUES (2029444408252669954, NULL, '13395740108', 'e10adc3949ba59abbe56e057f20f883e', '林', NULL, 0, 'image/2026/05/06/8fe77c4624b64516ba4f10750083a45a.jpg', NULL, 1, 0, '2026-03-05 14:30:27', '2026-05-06 12:15:35');

-- ----------------------------
-- Table structure for student_study_record
-- ----------------------------
DROP TABLE IF EXISTS `student_study_record`;
CREATE TABLE `student_study_record`  (
  `id` bigint NOT NULL COMMENT '主键',
  `member_id` bigint NULL DEFAULT NULL COMMENT '用户id',
  `course_id` bigint NOT NULL COMMENT '课程id',
  `video_source_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL,
  `nickname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL DEFAULT NULL COMMENT '用户昵称',
  `course_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '课程名',
  `course_cover` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '课程封面',
  `teacher_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '讲师名',
  `video_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT '小节名',
  `create_time` datetime NOT NULL COMMENT '创建时间（学习时间）',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin COMMENT = '学生学习记录' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student_study_record
-- ----------------------------
INSERT INTO `student_study_record` VALUES (1983873481874018305, 1, 1983843035974930434, 'f0d8f398b58971f0bfc75017f0f80102', '小三123', 'test', 'https://img2.huashi6.com/images/resource/2009/01/24/28h33392p0.jpg', '老宋计算机二级', '大纲', '2025-10-30 20:27:51', '2025-10-30 20:27:51');
INSERT INTO `student_study_record` VALUES (2002008480659525633, 1, 1983843035974930434, 'f0d8f398b58971f0bfc75017f0f80102', '小三123', 'test', 'https://img2.huashi6.com/images/resource/2009/01/24/28h33392p0.jpg', '老宋计算机二级', '大纲', '2025-12-19 21:29:52', '2025-12-19 21:29:52');
INSERT INTO `student_study_record` VALUES (2004190107175575554, 1, 1983843035974930434, 'f0d8f398b58971f0bfc75017f0f80102', '小三123', 'test', 'https://img2.huashi6.com/images/resource/2009/01/24/28h33392p0.jpg', '老宋计算机二级', '大纲', '2025-12-25 21:58:52', '2025-12-25 21:58:52');
INSERT INTO `student_study_record` VALUES (2026208351167729666, 2025395129279934465, 1542321527846887426, 'cc03514545394a79b111e37eb86e855c', 'JCXYOZH', '大数据算法', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '刘经纬', '第一节', '2026-02-24 16:11:31', '2026-02-24 16:11:31');
INSERT INTO `student_study_record` VALUES (2026208878345605122, 2025395129279934465, 1542321527846887426, 'cc03514545394a79b111e37eb86e855c', 'JCXYOZH', '大数据算法', 'https://nichijoux-oes.oss-cn-chengdu.aliyuncs.com/2022/07/25/670403fc85fSnipaste_2022-07-25_14-43-19.jpg', '刘经纬', '第一节', '2026-02-24 16:13:36', '2026-02-24 16:13:36');

-- ----------------------------
-- Table structure for t_exam_paper
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper`;
CREATE TABLE `t_exam_paper`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `subject_id` int NULL DEFAULT NULL,
  `paper_type` int NULL DEFAULT NULL,
  `grade_level` int NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  `question_count` int NULL DEFAULT NULL,
  `suggest_time` int NULL DEFAULT NULL,
  `limit_start_time` datetime NULL DEFAULT NULL,
  `limit_end_time` datetime NULL DEFAULT NULL,
  `frame_text_content_id` int NULL DEFAULT NULL,
  `create_user` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `task_exam_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_exam_paper
-- ----------------------------
INSERT INTO `t_exam_paper` VALUES (1, 'test', 1, 1, 12, 10, 1, 1, NULL, NULL, 2, 2, '2025-07-11 23:15:37', b'1', NULL);
INSERT INTO `t_exam_paper` VALUES (2, '大学政治', 2, 1, 1, 150, 15, 10, NULL, NULL, 6, 2, '2026-02-26 15:45:05', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (3, '大学英语', 3, 1, 1, 150, 15, 10, '2026-02-26 00:00:00', '2026-04-19 00:00:00', 7, 2, '2026-02-26 15:47:55', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (4, '大学英语模拟试题', 3, 1, 1, 10, 1, 2, NULL, NULL, 9, 2, '2026-03-04 11:18:39', b'1', NULL);
INSERT INTO `t_exam_paper` VALUES (5, '高等数学', 5, 1, 1, 160, 16, 15, NULL, NULL, 53, 2, '2026-07-19 17:08:14', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (6, '信息技术', 6, 1, 1, 150, 15, 10, NULL, NULL, 69, 2, '2026-07-19 18:26:33', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (7, '生理学', 7, 1, 1, 150, 15, 10, NULL, NULL, 85, 2, '2026-07-19 22:07:29', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (8, '法理学', 8, 1, 1, 150, 15, 10, NULL, NULL, 101, 2, '2026-07-20 09:14:24', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (9, '人体解剖', 9, 1, 1, 150, 15, 10, NULL, NULL, 117, 2, '2026-07-20 10:03:53', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (10, '艺术概论', 10, 1, 1, 150, 15, 10, NULL, NULL, 133, 2, '2026-07-20 12:15:02', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (11, '管理学', 11, 1, 1, 150, 15, 10, NULL, NULL, 150, 2, '2026-07-20 13:00:00', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (12, '经济学', 12, 1, 1, 150, 15, 10, NULL, NULL, 166, 2, '2026-07-20 16:12:40', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (13, '工程力学', 13, 1, 1, 150, 15, 10, NULL, NULL, 182, 2, '2026-07-20 16:49:52', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (14, '教育心理', 14, 1, 1, 150, 15, 10, NULL, NULL, 198, 2, '2026-07-20 18:26:06', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (15, '文史基础', 15, 1, 1, 150, 15, 10, NULL, NULL, 215, 2, '2026-07-20 22:12:05', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (16, '近现代史', 16, 1, 1, 160, 16, 10, NULL, NULL, 232, 2, '2026-07-20 22:54:25', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (17, '新媒体', 17, 1, 1, 150, 15, 10, NULL, NULL, 248, 2, '2026-07-20 23:32:23', b'0', NULL);

-- ----------------------------
-- Table structure for t_exam_paper_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_answer`;
CREATE TABLE `t_exam_paper_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `exam_paper_id` int NULL DEFAULT NULL,
  `paper_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `paper_type` int NULL DEFAULT NULL,
  `subject_id` int NULL DEFAULT NULL,
  `system_score` int NULL DEFAULT NULL,
  `user_score` int NULL DEFAULT NULL,
  `paper_score` int NULL DEFAULT NULL,
  `question_correct` int NULL DEFAULT NULL,
  `question_count` int NULL DEFAULT NULL,
  `do_time` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `create_user` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `task_exam_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_exam_paper_answer
-- ----------------------------
INSERT INTO `t_exam_paper_answer` VALUES (1, 1, 'test', 1, 1, 10, 10, 10, 1, 1, 3, 2, 3, '2025-07-13 23:13:41', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (2, 1, 'test', 1, 1, 0, 0, 10, 0, 1, 3, 2, 3, '2025-07-13 23:25:39', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (3, 1, 'test', 1, 1, 0, 0, 10, 0, 1, 60, 2, 3, '2025-07-14 17:56:45', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (4, 2, '基础试题测试', 1, 2, 10, 10, 10, 1, 1, 34, 2, 3, '2026-02-26 15:59:46', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (5, 3, '模拟试卷测试', 4, 3, 10, 10, 20, 1, 2, 34, 2, 3, '2026-02-26 16:00:53', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (6, 2, '基础试题测试', 1, 2, 0, 0, 10, 0, 1, 6, 2, 12, '2026-03-05 21:39:46', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (7, 3, '模拟试卷测试', 4, 3, 10, 10, 20, 1, 2, 23, 2, 12, '2026-03-05 21:40:26', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (8, 3, '模拟试卷测试', 4, 3, 10, 10, 20, 1, 2, 101, 2, 15, '2026-05-09 17:11:23', NULL);
INSERT INTO `t_exam_paper_answer` VALUES (9, 2, '基础试题测试', 1, 2, 10, 10, 10, 1, 1, 56, 2, 15, '2026-05-09 17:14:06', NULL);

-- ----------------------------
-- Table structure for t_exam_paper_question_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_exam_paper_question_customer_answer`;
CREATE TABLE `t_exam_paper_question_customer_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_id` int NULL DEFAULT NULL,
  `exam_paper_id` int NULL DEFAULT NULL,
  `exam_paper_answer_id` int NULL DEFAULT NULL,
  `question_type` int NULL DEFAULT NULL,
  `subject_id` int NULL DEFAULT NULL,
  `customer_score` int NULL DEFAULT NULL,
  `question_score` int NULL DEFAULT NULL,
  `question_text_content_id` int NULL DEFAULT NULL,
  `answer` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `text_content_id` int NULL DEFAULT NULL,
  `do_right` bit(1) NULL DEFAULT NULL,
  `create_user` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `item_order` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_exam_paper_question_customer_answer
-- ----------------------------
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (1, 1, 1, 1, 1, 1, 10, 10, 1, 'A', NULL, b'1', 3, '2025-07-13 23:13:41', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (2, 1, 1, 2, 1, 1, 0, 10, 1, '', NULL, b'0', 3, '2025-07-13 23:25:39', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (3, 1, 1, 3, 1, 1, 0, 10, 1, '', NULL, b'0', 3, '2025-07-14 17:56:45', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (4, 2, 2, 4, 2, 2, 10, 10, 3, 'A,B,D', NULL, b'1', 3, '2026-02-26 15:59:46', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (5, 3, 3, 5, 1, 3, 0, 10, 4, 'D', NULL, b'0', 3, '2026-02-26 16:00:53', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (6, 4, 3, 5, 1, 3, 10, 10, 5, 'A', NULL, b'1', 3, '2026-02-26 16:00:53', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (7, 2, 2, 6, 2, 2, 0, 10, 3, 'A', NULL, b'0', 12, '2026-03-05 21:39:46', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (8, 3, 3, 7, 1, 3, 10, 10, 4, 'A', NULL, b'1', 12, '2026-03-05 21:40:26', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (9, 4, 3, 7, 1, 3, 0, 10, 5, 'C', NULL, b'0', 12, '2026-03-05 21:40:26', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (10, 3, 3, 8, 1, 3, 10, 10, 4, 'A', NULL, b'1', 15, '2026-05-09 17:11:23', 1);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (11, 4, 3, 8, 1, 3, 0, 10, 5, 'C', NULL, b'0', 15, '2026-05-09 17:11:23', 2);
INSERT INTO `t_exam_paper_question_customer_answer` VALUES (12, 2, 2, 9, 2, 2, 10, 10, 3, 'A,B,D', NULL, b'1', 15, '2026-05-09 17:14:06', 1);

-- ----------------------------
-- Table structure for t_exchange_item
-- ----------------------------
DROP TABLE IF EXISTS `t_exchange_item`;
CREATE TABLE `t_exchange_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '兑换物名称',
  `points_required` int NULL DEFAULT 0 COMMENT '所需积分，0代表限时免费',
  `pdf_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'PDF相对路径',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_exchange_item
-- ----------------------------
INSERT INTO `t_exchange_item` VALUES (1, '纸质版详解配套练习资料', 0, '/file/pdf/zzzl.pdf', '2026-05-12 18:43:27');
INSERT INTO `t_exchange_item` VALUES (2, '必背英语词汇', 0, '/file/pdf/yych.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (3, '经典流程图', 2, '/file/pdf/lct.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (4, '计算机信息技术', 50, '/file/pdf/xxjs.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (5, '高数知识点', 46, '/file/pdf/gszsd.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (6, '政治重点汇总笔记', 60, '/file/pdf/zzbj.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (7, '2025政治真题', 3, '/file/pdf/25zzzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (8, '2025信息技术真题', 3, '/file/pdf/25xxzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (9, '2024政治真题', 3, '/file/pdf/24zzzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (10, '2024英语真题', 3, '/file/pdf/24yyzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (11, '2024高数真题', 3, '/file/pdf/24gszt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (12, '2024信息真题', 3, '/file/pdf/24xxzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (13, '2024信息答案', 0, '/file/pdf/24xxda.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (14, '2023政治真题', 3, '/file/pdf/23zzzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (15, '2022政治真题', 3, '/file/pdf/22zzzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (16, '2019政治真题', 3, '/file/pdf/19zzzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (17, '2018政治真题', 3, '/file/pdf/18zzzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (18, '2017政治真题', 3, '/file/pdf/17zzzt.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (19, '19-23英语真题', 10, '/file/pdf/19_23yy.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (20, '19-23高数真题', 10, '/file/pdf/19_23gs.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (21, '21-23信息真题', 6, '/file/pdf/21_23xx.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (22, '21-23信息答案', 0, '/file/pdf/21_23xxda.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (23, '政治精炼易错题', 75, '/file/pdf/zzct.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (24, '英语精炼易错题', 75, '/file/pdf/yyct.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (25, '高数精炼易错题', 75, '/file/pdf/gsct.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (26, '信息精炼易错题', 75, '/file/pdf/xxct.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (27, '英语模考卷二', 36, '/file/pdf/yymk2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (28, '英语万人模考二', 12, '/file/pdf/yywnmk2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (29, '信息万人模考一', 12, '/file/pdf/xxwnmk1.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (30, '信息万人模考二', 12, '/file/pdf/xxwnmk2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (31, '高数全真模拟卷一', 33, '/file/pdf/gsqzmn1.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (32, '高数模考卷二', 36, '/file/pdf/sxmk2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (33, '高数万人模考二', 12, '/file/pdf/sxwnmk2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (34, '高数冲刺模考五', 23, '/file/pdf/gsczmk5.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (35, '高数冲刺模考六', 23, '/file/pdf/gsczmk6.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (36, '高数冲刺密卷一', 29, '/file/pdf/gsczmj1.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (37, '高数冲刺密卷二', 29, '/file/pdf/gsczmj2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (38, '政治模拟卷', 99, '/file/pdf/zzmnj.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (39, '英语模拟卷', 99, '/file/pdf/yymnj.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (40, '信息模拟卷', 99, '/file/pdf/xxmnj.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (41, '高数模拟卷', 99, '/file/pdf/gsmnj.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (42, '政治模拟答案1', 0, '/file/pdf/zzmnda1.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (43, '政治模拟答案2', 0, '/file/pdf/zzmnda2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (44, '政治模拟答案3', 0, '/file/pdf/zzmnda3.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (45, '政治模拟答案4', 0, '/file/pdf/zzmnda4.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (46, '政治模拟答案5', 0, '/file/pdf/zzmnda5.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (47, '政治模拟答案6', 0, '/file/pdf/zzmnda6.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (48, '政治模拟答案7', 0, '/file/pdf/zzmnda7.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (49, '政治模拟答案8', 0, '/file/pdf/zzmnda8.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (50, '政治模拟答案9', 0, '/file/pdf/zzmnda9.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (51, '政治模拟答案10', 0, '/file/pdf/zzmnda10.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (52, '政治模拟答案11', 0, '/file/pdf/zzmnda11.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (53, '政治模拟答案12', 0, '/file/pdf/zzmnda12.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (54, '政治模拟答案13', 0, '/file/pdf/zzmnda13.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (55, '政治模拟答案14', 0, '/file/pdf/zzmnda14.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (56, '政治模拟答案15', 0, '/file/pdf/zzmnda15.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (57, '英语模拟答案1', 0, '/file/pdf/yymnda1.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (58, '英语模拟答案2', 0, '/file/pdf/yymnda2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (59, '英语模拟答案3', 0, '/file/pdf/yymnda3.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (60, '英语模拟答案4', 0, '/file/pdf/yymnda4.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (61, '英语模拟答案5', 0, '/file/pdf/yymnda5.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (62, '英语模拟答案6', 0, '/file/pdf/yymnda6.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (63, '英语模拟答案7', 0, '/file/pdf/yymnda7.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (64, '英语模拟答案8', 0, '/file/pdf/yymnda8.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (65, '英语模拟答案9', 0, '/file/pdf/yymnda9.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (66, '英语模拟答案10', 0, '/file/pdf/yymnda10.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (67, '英语模拟答案11', 0, '/file/pdf/yymnda11.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (68, '英语模拟答案12', 0, '/file/pdf/yymnda12.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (69, '英语模拟答案13', 0, '/file/pdf/yymnda13.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (70, '英语模拟答案14', 0, '/file/pdf/yymnda14.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (71, '英语模拟答案15', 0, '/file/pdf/yymnda15.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (72, '信息模拟答案1', 0, '/file/pdf/xxmnda1.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (73, '信息模拟答案2', 0, '/file/pdf/xxmnda2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (74, '信息模拟答案3', 0, '/file/pdf/xxmnda3.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (75, '信息模拟答案4', 0, '/file/pdf/xxmnda4.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (76, '信息模拟答案5', 0, '/file/pdf/xxmnda5.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (77, '信息模拟答案6', 0, '/file/pdf/xxmnda6.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (78, '信息模拟答案7', 0, '/file/pdf/xxmnda7.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (79, '信息模拟答案8', 0, '/file/pdf/xxmnda8.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (80, '信息模拟答案9', 0, '/file/pdf/xxmnda9.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (81, '信息模拟答案10', 0, '/file/pdf/xxmnda10.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (82, '信息模拟答案11', 0, '/file/pdf/xxmnda11.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (83, '信息模拟答案12', 0, '/file/pdf/xxmnda12.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (84, '信息模拟答案13', 0, '/file/pdf/xxmnda13.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (85, '信息模拟答案14', 0, '/file/pdf/xxmnda14.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (86, '信息模拟答案15', 0, '/file/pdf/xxmnda15.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (87, '高数模拟答案1', 0, '/file/pdf/gsmnda1.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (88, '高数模拟答案2', 0, '/file/pdf/gsmnda2.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (89, '高数模拟答案3', 0, '/file/pdf/gsmnda3.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (90, '高数模拟答案4', 0, '/file/pdf/gsmnda4.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (91, '高数模拟答案5', 0, '/file/pdf/gsmnda5.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (92, '高数模拟答案6', 0, '/file/pdf/gsmnda6.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (93, '高数模拟答案7', 0, '/file/pdf/gsmnda7.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (94, '高数模拟答案8', 0, '/file/pdf/gsmnda8.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (95, '高数模拟答案9', 0, '/file/pdf/gsmnda9.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (96, '高数模拟答案10', 0, '/file/pdf/gsmnda10.pdf', '2026-07-29 23:03:15');
INSERT INTO `t_exchange_item` VALUES (97, '高数模拟答案11', 0, '/file/pdf/gsmnda11.pdf', '2026-07-30 19:32:17');
INSERT INTO `t_exchange_item` VALUES (98, '高数模拟答案12', 0, '/file/pdf/gsmnda12.pdf', '2026-07-30 19:32:45');
INSERT INTO `t_exchange_item` VALUES (99, '高数模拟答案13', 0, '/file/pdf/gsmnda13.pdf', '2026-07-30 19:32:58');
INSERT INTO `t_exchange_item` VALUES (100, '高数模拟答案14', 0, '/file/pdf/gsmnda14.pdf', '2026-07-30 19:33:07');
INSERT INTO `t_exchange_item` VALUES (101, '高数模拟答案15', 0, '/file/pdf/gsmnda15.pdf', '2026-07-30 19:33:39');

-- ----------------------------
-- Table structure for t_exchange_record
-- ----------------------------
DROP TABLE IF EXISTS `t_exchange_record`;
CREATE TABLE `t_exchange_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `item_id` int NOT NULL,
  `exchange_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id` ASC) USING BTREE,
  INDEX `item_id`(`item_id` ASC) USING BTREE,
  CONSTRAINT `t_exchange_record_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `t_exchange_record_ibfk_2` FOREIGN KEY (`item_id`) REFERENCES `t_exchange_item` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_exchange_record
-- ----------------------------
INSERT INTO `t_exchange_record` VALUES (1, 16, 1, '2026-05-12 22:39:13');
INSERT INTO `t_exchange_record` VALUES (2, 3, 1, '2026-05-12 23:16:21');
INSERT INTO `t_exchange_record` VALUES (3, 15, 1, '2026-05-13 13:59:58');
INSERT INTO `t_exchange_record` VALUES (4, 17, 1, '2026-05-14 22:51:23');

-- ----------------------------
-- Table structure for t_invite_record
-- ----------------------------
DROP TABLE IF EXISTS `t_invite_record`;
CREATE TABLE `t_invite_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `inviter_id` int NOT NULL,
  `invitee_mobile` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL COMMENT '被邀请人手机号',
  `status` tinyint NULL DEFAULT 1 COMMENT '1:有效',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_mobile`(`invitee_mobile` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_invite_record
-- ----------------------------
INSERT INTO `t_invite_record` VALUES (1, 16, '15770643487', 1, '2026-05-09 17:02:52');
INSERT INTO `t_invite_record` VALUES (2, 16, '1', 1, '2026-05-09 17:06:28');
INSERT INTO `t_invite_record` VALUES (3, 16, '13395740108', 1, '2026-05-10 17:59:47');
INSERT INTO `t_invite_record` VALUES (4, 16, '13700000001', 1, '2026-05-10 20:39:47');

-- ----------------------------
-- Table structure for t_message
-- ----------------------------
DROP TABLE IF EXISTS `t_message`;
CREATE TABLE `t_message`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `send_user_id` int NULL DEFAULT NULL,
  `send_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `send_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `receive_user_count` int NULL DEFAULT NULL,
  `read_count` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_message
-- ----------------------------
INSERT INTO `t_message` VALUES (1, '测试', '复习计划安排测试', '2026-02-24 18:51:08', 2, 'admin', '管理员', 1, 1);

-- ----------------------------
-- Table structure for t_message_user
-- ----------------------------
DROP TABLE IF EXISTS `t_message_user`;
CREATE TABLE `t_message_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `message_id` int NULL DEFAULT NULL,
  `receive_user_id` int NULL DEFAULT NULL,
  `receive_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `receive_real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `readed` bit(1) NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `read_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_message_user
-- ----------------------------
INSERT INTO `t_message_user` VALUES (1, 1, 3, 'test', NULL, b'1', '2026-02-24 18:51:08', '2026-02-25 09:50:21');

-- ----------------------------
-- Table structure for t_points_log
-- ----------------------------
DROP TABLE IF EXISTS `t_points_log`;
CREATE TABLE `t_points_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `points` int NOT NULL COMMENT '变动积分（正数获得，负数消费）',
  `type` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT 'sign,invite,exchange等',
  `description` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL COMMENT '描述',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_user_id`(`user_id` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_points_log
-- ----------------------------
INSERT INTO `t_points_log` VALUES (1, 16, 25, 'invite', '邀请用户 15770643487', '2026-05-09 17:02:53');
INSERT INTO `t_points_log` VALUES (2, 16, 25, 'invite', '邀请用户 1', '2026-05-09 17:06:29');
INSERT INTO `t_points_log` VALUES (3, 16, 2, 'sign', '签到奖励，连续第1天', '2026-05-09 17:09:45');
INSERT INTO `t_points_log` VALUES (4, 16, 1, 'sign', '签到奖励，连续第2天', '2026-05-10 17:20:55');
INSERT INTO `t_points_log` VALUES (5, 16, 25, 'invite', '邀请用户 13395740108', '2026-05-10 17:59:48');
INSERT INTO `t_points_log` VALUES (6, 16, 25, 'invite', '邀请用户 13700000001', '2026-05-10 20:39:49');
INSERT INTO `t_points_log` VALUES (7, 16, 1, 'sign', '签到奖励，连续第3天', '2026-05-11 12:19:35');
INSERT INTO `t_points_log` VALUES (8, 16, 1, 'sign', '签到奖励，连续第4天', '2026-05-12 21:59:01');
INSERT INTO `t_points_log` VALUES (9, 16, 0, 'exchange', '兑换物品：信息技术概论考纲', '2026-05-12 22:39:17');
INSERT INTO `t_points_log` VALUES (10, 3, 0, 'exchange', '兑换物品：信息技术概论考纲', '2026-05-12 23:16:22');
INSERT INTO `t_points_log` VALUES (11, 16, 1, 'sign', '签到奖励，连续第5天', '2026-05-13 10:27:28');
INSERT INTO `t_points_log` VALUES (12, 15, 0, 'exchange', '兑换物品：信息技术概论考纲', '2026-05-13 13:59:58');
INSERT INTO `t_points_log` VALUES (13, 3, 2, 'sign', '签到奖励，连续第1天', '2026-05-14 00:23:39');
INSERT INTO `t_points_log` VALUES (14, 17, 0, 'exchange', '兑换物品：信息技术概论考纲', '2026-05-14 22:51:23');
INSERT INTO `t_points_log` VALUES (15, 16, 1, 'sign', '签到奖励，连续第6天', '2026-05-14 22:57:59');
INSERT INTO `t_points_log` VALUES (16, 16, 2, 'sign', '签到奖励，连续第7天', '2026-05-15 19:46:34');
INSERT INTO `t_points_log` VALUES (17, 16, 2, 'sign', '签到奖励，连续第8天', '2026-05-16 14:49:20');
INSERT INTO `t_points_log` VALUES (18, 16, 2, 'sign', '签到奖励，连续第1天', '2026-05-18 21:55:28');
INSERT INTO `t_points_log` VALUES (19, 15, 2, 'sign', '签到奖励，连续第1天', '2026-05-18 23:50:27');
INSERT INTO `t_points_log` VALUES (20, 16, 1, 'sign', '签到奖励，连续第2天', '2026-05-19 09:24:57');
INSERT INTO `t_points_log` VALUES (21, 15, 1, 'sign', '签到奖励，连续第2天', '2026-05-19 09:26:32');
INSERT INTO `t_points_log` VALUES (22, 16, 1, 'sign', '签到奖励，连续第3天', '2026-05-20 10:36:19');
INSERT INTO `t_points_log` VALUES (23, 16, 1, 'sign', '签到奖励，连续第4天', '2026-05-21 21:35:01');
INSERT INTO `t_points_log` VALUES (24, 16, 1, 'sign', '签到奖励，连续第5天', '2026-05-22 10:50:13');
INSERT INTO `t_points_log` VALUES (25, 16, 1, 'sign', '签到奖励，连续第6天', '2026-05-23 11:10:35');
INSERT INTO `t_points_log` VALUES (26, 16, 2, 'sign', '签到奖励，连续第7天', '2026-05-24 09:26:18');
INSERT INTO `t_points_log` VALUES (27, 16, 2, 'sign', '签到奖励，连续第8天', '2026-05-25 08:45:35');
INSERT INTO `t_points_log` VALUES (28, 16, 2, 'sign', '签到奖励，连续第1天', '2026-07-30 21:54:13');
INSERT INTO `t_points_log` VALUES (29, 15, 2, 'sign', '签到奖励，连续第1天', '2026-07-31 15:23:00');

-- ----------------------------
-- Table structure for t_question
-- ----------------------------
DROP TABLE IF EXISTS `t_question`;
CREATE TABLE `t_question`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `question_type` int NULL DEFAULT NULL,
  `subject_id` int NULL DEFAULT NULL,
  `score` int NULL DEFAULT NULL,
  `grade_level` int NULL DEFAULT NULL,
  `difficult` int NULL DEFAULT NULL,
  `correct` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `info_text_content_id` int NULL DEFAULT NULL,
  `create_user` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 230 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES (1, 1, 1, 10, 12, 1, 'A', 1, 2, 1, '2025-07-11 23:14:12', b'1');
INSERT INTO `t_question` VALUES (2, 2, 2, 10, 1, 3, 'A,B,D', 3, 2, 1, '2026-02-26 15:19:12', b'0');
INSERT INTO `t_question` VALUES (3, 1, 3, 10, 1, 3, 'A', 4, 2, 1, '2026-02-26 15:29:51', b'0');
INSERT INTO `t_question` VALUES (4, 1, 3, 10, 1, 3, 'A', 5, 2, 1, '2026-02-26 15:34:14', b'0');
INSERT INTO `t_question` VALUES (5, 1, 4, 10, 3, 3, 'A', 8, 2, 1, '2026-03-04 11:16:53', b'1');
INSERT INTO `t_question` VALUES (6, 1, 3, 10, 1, 3, 'A', 10, 2, 1, '2026-07-18 15:57:52', b'0');
INSERT INTO `t_question` VALUES (7, 1, 3, 10, 1, 3, 'A', 11, 2, 1, '2026-07-18 16:23:28', b'0');
INSERT INTO `t_question` VALUES (8, 1, 3, 10, 1, 2, 'C', 12, 2, 1, '2026-07-18 16:31:54', b'0');
INSERT INTO `t_question` VALUES (9, 1, 3, 10, 1, 2, 'C', 13, 2, 1, '2026-07-18 16:37:16', b'0');
INSERT INTO `t_question` VALUES (10, 1, 3, 10, 1, 3, 'A', 14, 2, 1, '2026-07-18 16:41:15', b'0');
INSERT INTO `t_question` VALUES (11, 1, 3, 10, 1, 2, 'D', 15, 2, 1, '2026-07-18 16:45:08', b'0');
INSERT INTO `t_question` VALUES (12, 1, 3, 10, 1, 3, 'A', 16, 2, 1, '2026-07-18 16:48:06', b'0');
INSERT INTO `t_question` VALUES (13, 1, 3, 10, 1, 2, 'B', 17, 2, 1, '2026-07-18 16:50:36', b'0');
INSERT INTO `t_question` VALUES (14, 1, 3, 10, 1, 3, 'B', 18, 2, 1, '2026-07-18 16:54:49', b'0');
INSERT INTO `t_question` VALUES (15, 1, 3, 10, 1, 2, 'C', 19, 2, 1, '2026-07-18 17:00:28', b'0');
INSERT INTO `t_question` VALUES (16, 1, 3, 10, 1, 2, 'A', 20, 2, 1, '2026-07-18 17:06:05', b'0');
INSERT INTO `t_question` VALUES (17, 1, 3, 10, 1, 3, 'C', 21, 2, 1, '2026-07-18 17:12:54', b'0');
INSERT INTO `t_question` VALUES (18, 1, 3, 10, 1, 2, 'C', 22, 2, 1, '2026-07-18 17:16:19', b'0');
INSERT INTO `t_question` VALUES (19, 1, 2, 10, 1, 2, 'D', 23, 2, 1, '2026-07-18 18:30:01', b'0');
INSERT INTO `t_question` VALUES (20, 1, 2, 10, 1, 2, 'C', 24, 2, 1, '2026-07-18 18:33:48', b'0');
INSERT INTO `t_question` VALUES (21, 1, 2, 10, 1, 1, 'D', 25, 2, 1, '2026-07-18 18:38:15', b'0');
INSERT INTO `t_question` VALUES (22, 1, 2, 10, 1, 1, 'A', 26, 2, 1, '2026-07-18 18:43:09', b'0');
INSERT INTO `t_question` VALUES (23, 1, 2, 10, 1, 1, 'C', 27, 2, 1, '2026-07-18 18:46:51', b'0');
INSERT INTO `t_question` VALUES (24, 1, 2, 10, 1, 1, 'C', 28, 2, 1, '2026-07-18 18:51:35', b'0');
INSERT INTO `t_question` VALUES (25, 1, 2, 10, 1, 2, 'A', 29, 2, 1, '2026-07-18 18:56:03', b'0');
INSERT INTO `t_question` VALUES (26, 1, 2, 10, 1, 2, 'C', 30, 2, 1, '2026-07-18 18:59:09', b'0');
INSERT INTO `t_question` VALUES (27, 1, 2, 10, 1, 2, 'A', 31, 2, 1, '2026-07-18 19:02:56', b'0');
INSERT INTO `t_question` VALUES (28, 1, 2, 10, 1, 1, 'B', 32, 2, 1, '2026-07-18 19:07:14', b'0');
INSERT INTO `t_question` VALUES (29, 1, 2, 10, 1, 2, 'A', 33, 2, 1, '2026-07-18 19:10:21', b'0');
INSERT INTO `t_question` VALUES (30, 1, 2, 10, 1, 1, 'B', 34, 2, 1, '2026-07-18 19:13:16', b'0');
INSERT INTO `t_question` VALUES (31, 2, 2, 10, 1, 3, 'A,B,D,E', 35, 2, 1, '2026-07-18 19:18:41', b'0');
INSERT INTO `t_question` VALUES (32, 2, 2, 10, 1, 4, 'A,B,C,E', 36, 2, 1, '2026-07-18 19:23:24', b'0');
INSERT INTO `t_question` VALUES (33, 1, 5, 10, 1, 1, 'C', 37, 2, 1, '2026-07-18 20:55:34', b'0');
INSERT INTO `t_question` VALUES (34, 1, 5, 10, 1, 2, 'B', 38, 2, 1, '2026-07-18 21:08:58', b'0');
INSERT INTO `t_question` VALUES (35, 1, 5, 10, 1, 2, 'C', 39, 2, 1, '2026-07-18 21:30:46', b'0');
INSERT INTO `t_question` VALUES (36, 1, 5, 10, 1, 2, 'D', 40, 2, 1, '2026-07-18 21:45:34', b'0');
INSERT INTO `t_question` VALUES (37, 1, 5, 10, 1, 2, 'D', 41, 2, 1, '2026-07-18 21:55:26', b'0');
INSERT INTO `t_question` VALUES (38, 1, 5, 10, 1, 2, 'A', 42, 2, 1, '2026-07-18 21:59:29', b'0');
INSERT INTO `t_question` VALUES (39, 1, 5, 10, 1, 2, 'A', 43, 2, 1, '2026-07-18 22:05:21', b'0');
INSERT INTO `t_question` VALUES (40, 1, 5, 10, 1, 3, 'D', 44, 2, 1, '2026-07-18 22:11:16', b'0');
INSERT INTO `t_question` VALUES (41, 1, 5, 10, 1, 2, 'C', 45, 2, 1, '2026-07-18 22:11:54', b'0');
INSERT INTO `t_question` VALUES (42, 1, 5, 10, 1, 3, 'A', 46, 2, 1, '2026-07-18 23:03:39', b'0');
INSERT INTO `t_question` VALUES (43, 1, 5, 10, 1, 2, 'A', 47, 2, 1, '2026-07-19 11:50:51', b'0');
INSERT INTO `t_question` VALUES (44, 1, 5, 10, 1, 2, 'B', 48, 2, 1, '2026-07-19 12:07:20', b'0');
INSERT INTO `t_question` VALUES (45, 1, 5, 10, 1, 2, 'B', 49, 2, 1, '2026-07-19 12:11:57', b'0');
INSERT INTO `t_question` VALUES (46, 1, 5, 10, 1, 1, 'C', 50, 2, 1, '2026-07-19 12:15:18', b'0');
INSERT INTO `t_question` VALUES (47, 1, 5, 10, 1, 2, 'A', 51, 2, 1, '2026-07-19 12:20:27', b'0');
INSERT INTO `t_question` VALUES (48, 1, 5, 10, 1, 2, 'D', 52, 2, 1, '2026-07-19 12:30:07', b'0');
INSERT INTO `t_question` VALUES (49, 1, 6, 10, 1, 2, 'A', 54, 2, 1, '2026-07-19 17:13:27', b'0');
INSERT INTO `t_question` VALUES (50, 1, 6, 10, 1, 2, 'D', 55, 2, 1, '2026-07-19 17:19:15', b'0');
INSERT INTO `t_question` VALUES (51, 1, 6, 10, 1, 2, 'A', 56, 2, 1, '2026-07-19 17:23:39', b'0');
INSERT INTO `t_question` VALUES (52, 1, 6, 10, 1, 2, 'D', 57, 2, 1, '2026-07-19 17:28:29', b'0');
INSERT INTO `t_question` VALUES (53, 1, 6, 10, 1, 2, 'C', 58, 2, 1, '2026-07-19 17:30:57', b'0');
INSERT INTO `t_question` VALUES (54, 1, 6, 10, 1, 2, 'D', 59, 2, 1, '2026-07-19 17:33:01', b'0');
INSERT INTO `t_question` VALUES (55, 1, 6, 10, 1, 1, 'B', 60, 2, 1, '2026-07-19 17:35:09', b'0');
INSERT INTO `t_question` VALUES (56, 1, 6, 10, 1, 2, 'C', 61, 2, 1, '2026-07-19 17:39:33', b'0');
INSERT INTO `t_question` VALUES (57, 1, 6, 10, 1, 2, 'D', 62, 2, 1, '2026-07-19 17:43:49', b'0');
INSERT INTO `t_question` VALUES (58, 1, 6, 10, 1, 2, 'A', 63, 2, 1, '2026-07-19 17:51:37', b'0');
INSERT INTO `t_question` VALUES (59, 1, 6, 10, 1, 2, 'A', 64, 2, 1, '2026-07-19 17:55:00', b'0');
INSERT INTO `t_question` VALUES (60, 1, 6, 10, 1, 1, 'D', 65, 2, 1, '2026-07-19 18:04:44', b'0');
INSERT INTO `t_question` VALUES (61, 1, 6, 10, 1, 2, 'A', 66, 2, 1, '2026-07-19 18:13:18', b'0');
INSERT INTO `t_question` VALUES (62, 1, 6, 10, 1, 2, 'B', 67, 2, 1, '2026-07-19 18:17:10', b'0');
INSERT INTO `t_question` VALUES (63, 1, 6, 10, 1, 2, 'C', 68, 2, 1, '2026-07-19 18:20:15', b'0');
INSERT INTO `t_question` VALUES (64, 1, 7, 10, 1, 1, 'C', 70, 2, 1, '2026-07-19 21:21:24', b'0');
INSERT INTO `t_question` VALUES (65, 1, 7, 10, 1, 2, 'B', 71, 2, 1, '2026-07-19 21:23:55', b'0');
INSERT INTO `t_question` VALUES (66, 1, 7, 10, 1, 1, 'C', 72, 2, 1, '2026-07-19 21:30:34', b'0');
INSERT INTO `t_question` VALUES (67, 1, 7, 10, 1, 2, 'C', 73, 2, 1, '2026-07-19 21:32:31', b'0');
INSERT INTO `t_question` VALUES (68, 1, 7, 10, 1, 1, 'A', 74, 2, 1, '2026-07-19 21:36:43', b'0');
INSERT INTO `t_question` VALUES (69, 1, 7, 10, 1, 1, 'B', 75, 2, 1, '2026-07-19 21:39:30', b'0');
INSERT INTO `t_question` VALUES (70, 1, 7, 10, 1, 1, 'B', 76, 2, 1, '2026-07-19 21:41:33', b'0');
INSERT INTO `t_question` VALUES (71, 1, 7, 10, 1, 1, 'B', 77, 2, 1, '2026-07-19 21:44:32', b'0');
INSERT INTO `t_question` VALUES (72, 1, 7, 10, 1, 2, 'A', 78, 2, 1, '2026-07-19 21:51:22', b'0');
INSERT INTO `t_question` VALUES (73, 1, 7, 10, 1, 1, 'C', 79, 2, 1, '2026-07-19 21:53:26', b'0');
INSERT INTO `t_question` VALUES (74, 1, 7, 10, 1, 1, 'C', 80, 2, 1, '2026-07-19 21:55:24', b'0');
INSERT INTO `t_question` VALUES (75, 1, 7, 10, 1, 2, 'B', 81, 2, 1, '2026-07-19 21:57:20', b'0');
INSERT INTO `t_question` VALUES (76, 1, 7, 10, 1, 2, 'C', 82, 2, 1, '2026-07-19 21:59:22', b'0');
INSERT INTO `t_question` VALUES (77, 1, 7, 10, 1, 2, 'C', 83, 2, 1, '2026-07-19 22:03:01', b'0');
INSERT INTO `t_question` VALUES (78, 1, 7, 10, 1, 1, 'A', 84, 2, 1, '2026-07-19 22:05:38', b'0');
INSERT INTO `t_question` VALUES (79, 1, 8, 10, 1, 2, 'C', 86, 2, 1, '2026-07-20 08:25:34', b'0');
INSERT INTO `t_question` VALUES (80, 1, 8, 10, 1, 2, 'B', 87, 2, 1, '2026-07-20 08:28:45', b'0');
INSERT INTO `t_question` VALUES (81, 1, 8, 10, 1, 2, 'D', 88, 2, 1, '2026-07-20 08:31:29', b'0');
INSERT INTO `t_question` VALUES (82, 1, 8, 10, 1, 3, 'B', 89, 2, 1, '2026-07-20 08:34:46', b'0');
INSERT INTO `t_question` VALUES (83, 1, 8, 10, 1, 3, 'A', 90, 2, 1, '2026-07-20 08:38:35', b'0');
INSERT INTO `t_question` VALUES (84, 1, 8, 10, 1, 2, 'A', 91, 2, 1, '2026-07-20 08:42:11', b'0');
INSERT INTO `t_question` VALUES (85, 1, 8, 10, 1, 3, 'B', 92, 2, 1, '2026-07-20 08:45:06', b'0');
INSERT INTO `t_question` VALUES (86, 1, 8, 10, 1, 3, 'B', 93, 2, 1, '2026-07-20 08:47:44', b'0');
INSERT INTO `t_question` VALUES (87, 1, 8, 10, 1, 2, 'D', 94, 2, 1, '2026-07-20 08:51:30', b'0');
INSERT INTO `t_question` VALUES (88, 1, 8, 10, 1, 2, 'A', 95, 2, 1, '2026-07-20 08:54:05', b'0');
INSERT INTO `t_question` VALUES (89, 1, 8, 10, 1, 1, 'B', 96, 2, 1, '2026-07-20 08:57:41', b'0');
INSERT INTO `t_question` VALUES (90, 1, 8, 10, 1, 2, 'A', 97, 2, 1, '2026-07-20 08:59:55', b'0');
INSERT INTO `t_question` VALUES (91, 1, 8, 10, 1, 1, 'A', 98, 2, 1, '2026-07-20 09:04:01', b'0');
INSERT INTO `t_question` VALUES (92, 1, 8, 10, 1, 2, 'D', 99, 2, 1, '2026-07-20 09:07:32', b'0');
INSERT INTO `t_question` VALUES (93, 1, 8, 10, 1, 2, 'D', 100, 2, 1, '2026-07-20 09:10:39', b'0');
INSERT INTO `t_question` VALUES (94, 1, 9, 10, 1, 2, 'D', 102, 2, 1, '2026-07-20 09:18:36', b'0');
INSERT INTO `t_question` VALUES (95, 1, 9, 10, 1, 3, 'B', 103, 2, 1, '2026-07-20 09:21:51', b'0');
INSERT INTO `t_question` VALUES (96, 1, 9, 10, 1, 2, 'C', 104, 2, 1, '2026-07-20 09:26:13', b'0');
INSERT INTO `t_question` VALUES (97, 1, 9, 10, 1, 2, 'B', 105, 2, 1, '2026-07-20 09:28:46', b'0');
INSERT INTO `t_question` VALUES (98, 1, 9, 10, 1, 1, 'A', 106, 2, 1, '2026-07-20 09:31:13', b'0');
INSERT INTO `t_question` VALUES (99, 1, 9, 10, 1, 2, 'A', 107, 2, 1, '2026-07-20 09:33:22', b'0');
INSERT INTO `t_question` VALUES (100, 1, 9, 10, 1, 1, 'C', 108, 2, 1, '2026-07-20 09:40:08', b'0');
INSERT INTO `t_question` VALUES (101, 1, 9, 10, 1, 2, 'C', 109, 2, 1, '2026-07-20 09:42:08', b'0');
INSERT INTO `t_question` VALUES (102, 2, 9, 10, 1, 1, 'A,B,C,D,E', 110, 2, 1, '2026-07-20 09:44:26', b'0');
INSERT INTO `t_question` VALUES (103, 2, 9, 10, 1, 2, 'A,B', 111, 2, 1, '2026-07-20 09:46:55', b'0');
INSERT INTO `t_question` VALUES (104, 2, 9, 10, 1, 2, 'A,B', 112, 2, 1, '2026-07-20 09:49:08', b'0');
INSERT INTO `t_question` VALUES (105, 2, 9, 10, 1, 3, 'A,C,D,E', 113, 2, 1, '2026-07-20 09:51:56', b'0');
INSERT INTO `t_question` VALUES (106, 2, 9, 10, 1, 3, 'A,C,D,E', 114, 2, 1, '2026-07-20 09:54:43', b'0');
INSERT INTO `t_question` VALUES (107, 1, 9, 10, 1, 2, 'D', 115, 2, 1, '2026-07-20 09:59:08', b'0');
INSERT INTO `t_question` VALUES (108, 1, 9, 10, 1, 2, 'C', 116, 2, 1, '2026-07-20 10:01:06', b'0');
INSERT INTO `t_question` VALUES (109, 1, 10, 10, 1, 1, 'D', 118, 2, 1, '2026-07-20 10:36:27', b'0');
INSERT INTO `t_question` VALUES (110, 1, 10, 10, 1, 2, 'A', 119, 2, 1, '2026-07-20 10:40:09', b'0');
INSERT INTO `t_question` VALUES (111, 1, 10, 10, 1, 2, 'B', 120, 2, 1, '2026-07-20 10:43:03', b'0');
INSERT INTO `t_question` VALUES (112, 1, 10, 10, 1, 1, 'C', 121, 2, 1, '2026-07-20 10:45:23', b'0');
INSERT INTO `t_question` VALUES (113, 1, 10, 10, 1, 1, 'C', 122, 2, 1, '2026-07-20 10:47:25', b'0');
INSERT INTO `t_question` VALUES (114, 1, 10, 10, 1, 1, 'B', 123, 2, 1, '2026-07-20 10:49:39', b'0');
INSERT INTO `t_question` VALUES (115, 1, 10, 10, 1, 1, 'A', 124, 2, 1, '2026-07-20 10:51:44', b'0');
INSERT INTO `t_question` VALUES (116, 1, 10, 10, 1, 1, 'D', 125, 2, 1, '2026-07-20 10:53:20', b'0');
INSERT INTO `t_question` VALUES (117, 1, 10, 10, 1, 2, 'B', 126, 2, 1, '2026-07-20 10:55:06', b'0');
INSERT INTO `t_question` VALUES (118, 1, 10, 10, 1, 2, 'C', 127, 2, 1, '2026-07-20 10:57:14', b'0');
INSERT INTO `t_question` VALUES (119, 1, 10, 10, 1, 1, 'B', 128, 2, 1, '2026-07-20 11:00:42', b'0');
INSERT INTO `t_question` VALUES (120, 1, 10, 10, 1, 2, 'C', 129, 2, 1, '2026-07-20 11:03:19', b'0');
INSERT INTO `t_question` VALUES (121, 1, 10, 10, 1, 1, 'C', 130, 2, 1, '2026-07-20 11:05:15', b'0');
INSERT INTO `t_question` VALUES (122, 1, 10, 10, 1, 1, 'C', 131, 2, 1, '2026-07-20 11:07:24', b'0');
INSERT INTO `t_question` VALUES (123, 2, 10, 10, 1, 2, 'A,B,C', 132, 2, 1, '2026-07-20 11:10:45', b'0');
INSERT INTO `t_question` VALUES (124, 1, 11, 10, 1, 1, 'C', 134, 2, 1, '2026-07-20 12:18:28', b'0');
INSERT INTO `t_question` VALUES (125, 1, 11, 10, 1, 1, 'B', 135, 2, 1, '2026-07-20 12:21:23', b'0');
INSERT INTO `t_question` VALUES (126, 1, 11, 10, 1, 1, 'B', 136, 2, 1, '2026-07-20 12:24:05', b'0');
INSERT INTO `t_question` VALUES (127, 1, 11, 10, 1, 2, 'C', 137, 2, 1, '2026-07-20 12:26:05', b'0');
INSERT INTO `t_question` VALUES (128, 1, 11, 10, 1, 4, 'C', 139, 2, 1, '2026-07-20 12:28:47', b'0');
INSERT INTO `t_question` VALUES (129, 1, 11, 10, 1, 2, 'A', 140, 2, 1, '2026-07-20 12:30:24', b'0');
INSERT INTO `t_question` VALUES (130, 1, 11, 10, 1, 1, 'A', 141, 2, 1, '2026-07-20 12:32:16', b'0');
INSERT INTO `t_question` VALUES (131, 1, 11, 10, 1, 2, 'A', 142, 2, 1, '2026-07-20 12:34:38', b'0');
INSERT INTO `t_question` VALUES (132, 1, 11, 10, 1, 2, 'D', 143, 2, 1, '2026-07-20 12:36:30', b'0');
INSERT INTO `t_question` VALUES (133, 2, 11, 10, 1, 1, 'A,C', 144, 2, 1, '2026-07-20 12:39:05', b'0');
INSERT INTO `t_question` VALUES (134, 3, 11, 10, 1, 1, 'B', 145, 2, 1, '2026-07-20 12:40:59', b'0');
INSERT INTO `t_question` VALUES (135, 3, 11, 10, 1, 1, 'B', 146, 2, 1, '2026-07-20 12:42:07', b'0');
INSERT INTO `t_question` VALUES (136, 3, 11, 10, 1, 1, 'B', 147, 2, 1, '2026-07-20 12:43:20', b'0');
INSERT INTO `t_question` VALUES (137, 3, 11, 10, 1, 1, 'B', 148, 2, 1, '2026-07-20 12:56:16', b'0');
INSERT INTO `t_question` VALUES (138, 3, 11, 10, 1, 1, 'B', 149, 2, 1, '2026-07-20 12:57:15', b'0');
INSERT INTO `t_question` VALUES (139, 1, 12, 10, 1, 1, 'A', 151, 2, 1, '2026-07-20 15:16:36', b'0');
INSERT INTO `t_question` VALUES (140, 1, 12, 10, 1, 1, 'B', 152, 2, 1, '2026-07-20 15:18:35', b'0');
INSERT INTO `t_question` VALUES (141, 1, 12, 10, 1, 1, 'A', 153, 2, 1, '2026-07-20 15:22:14', b'0');
INSERT INTO `t_question` VALUES (142, 1, 12, 10, 1, 2, 'B', 154, 2, 1, '2026-07-20 15:24:16', b'0');
INSERT INTO `t_question` VALUES (143, 1, 12, 10, 1, 1, 'C', 155, 2, 1, '2026-07-20 15:33:01', b'0');
INSERT INTO `t_question` VALUES (144, 1, 12, 10, 1, 3, 'C', 156, 2, 1, '2026-07-20 15:34:53', b'0');
INSERT INTO `t_question` VALUES (145, 1, 12, 10, 1, 2, 'D', 157, 2, 1, '2026-07-20 15:36:34', b'0');
INSERT INTO `t_question` VALUES (146, 1, 12, 10, 1, 2, 'B', 158, 2, 1, '2026-07-20 15:38:47', b'0');
INSERT INTO `t_question` VALUES (147, 1, 12, 10, 1, 2, 'B', 159, 2, 1, '2026-07-20 15:41:34', b'0');
INSERT INTO `t_question` VALUES (148, 1, 12, 10, 1, 2, 'A', 160, 2, 1, '2026-07-20 15:51:17', b'0');
INSERT INTO `t_question` VALUES (149, 1, 12, 10, 1, 2, 'C', 161, 2, 1, '2026-07-20 16:00:10', b'0');
INSERT INTO `t_question` VALUES (150, 1, 12, 10, 1, 1, 'C', 162, 2, 1, '2026-07-20 16:04:42', b'0');
INSERT INTO `t_question` VALUES (151, 1, 12, 10, 1, 2, 'B', 163, 2, 1, '2026-07-20 16:06:52', b'0');
INSERT INTO `t_question` VALUES (152, 1, 12, 10, 1, 2, 'A', 164, 2, 1, '2026-07-20 16:08:33', b'0');
INSERT INTO `t_question` VALUES (153, 1, 12, 10, 1, 3, 'C', 165, 2, 1, '2026-07-20 16:11:36', b'0');
INSERT INTO `t_question` VALUES (154, 3, 13, 10, 1, 2, 'B', 167, 2, 1, '2026-07-20 16:15:53', b'0');
INSERT INTO `t_question` VALUES (155, 3, 13, 10, 1, 1, 'A', 168, 2, 1, '2026-07-20 16:17:13', b'0');
INSERT INTO `t_question` VALUES (156, 3, 13, 10, 1, 1, 'B', 169, 2, 1, '2026-07-20 16:18:15', b'0');
INSERT INTO `t_question` VALUES (157, 1, 13, 10, 1, 2, 'C', 170, 2, 1, '2026-07-20 16:22:01', b'0');
INSERT INTO `t_question` VALUES (158, 1, 13, 10, 1, 1, 'A', 171, 2, 1, '2026-07-20 16:24:52', b'0');
INSERT INTO `t_question` VALUES (159, 1, 13, 10, 1, 2, 'B', 172, 2, 1, '2026-07-20 16:27:52', b'0');
INSERT INTO `t_question` VALUES (160, 1, 13, 10, 1, 2, 'C', 173, 2, 1, '2026-07-20 16:30:07', b'0');
INSERT INTO `t_question` VALUES (161, 1, 13, 10, 1, 2, 'D', 174, 2, 1, '2026-07-20 16:32:07', b'0');
INSERT INTO `t_question` VALUES (162, 1, 13, 10, 1, 1, 'D', 175, 2, 1, '2026-07-20 16:33:59', b'0');
INSERT INTO `t_question` VALUES (163, 1, 13, 10, 1, 2, 'C', 176, 2, 1, '2026-07-20 16:37:59', b'0');
INSERT INTO `t_question` VALUES (164, 1, 13, 10, 1, 2, 'A', 177, 2, 1, '2026-07-20 16:40:00', b'0');
INSERT INTO `t_question` VALUES (165, 1, 13, 10, 1, 2, 'B', 178, 2, 1, '2026-07-20 16:41:55', b'0');
INSERT INTO `t_question` VALUES (166, 1, 13, 10, 1, 2, 'A', 179, 2, 1, '2026-07-20 16:43:24', b'0');
INSERT INTO `t_question` VALUES (167, 1, 13, 10, 1, 1, 'A', 180, 2, 1, '2026-07-20 16:45:05', b'0');
INSERT INTO `t_question` VALUES (168, 3, 13, 10, 1, 2, 'B', 181, 2, 1, '2026-07-20 16:47:52', b'0');
INSERT INTO `t_question` VALUES (169, 1, 14, 10, 1, 1, 'B', 183, 2, 1, '2026-07-20 17:42:36', b'0');
INSERT INTO `t_question` VALUES (170, 1, 14, 10, 1, 1, 'D', 184, 2, 1, '2026-07-20 17:45:56', b'0');
INSERT INTO `t_question` VALUES (171, 1, 14, 10, 1, 2, 'D', 185, 2, 1, '2026-07-20 17:48:54', b'0');
INSERT INTO `t_question` VALUES (172, 1, 14, 10, 1, 2, 'B', 186, 2, 1, '2026-07-20 17:51:46', b'0');
INSERT INTO `t_question` VALUES (173, 1, 14, 10, 1, 1, 'C', 187, 2, 1, '2026-07-20 17:54:05', b'0');
INSERT INTO `t_question` VALUES (174, 1, 14, 10, 1, 2, 'B', 188, 2, 1, '2026-07-20 17:56:27', b'0');
INSERT INTO `t_question` VALUES (175, 1, 14, 10, 1, 1, 'A', 189, 2, 1, '2026-07-20 18:03:59', b'0');
INSERT INTO `t_question` VALUES (176, 1, 14, 10, 1, 1, 'B', 190, 2, 1, '2026-07-20 18:06:39', b'0');
INSERT INTO `t_question` VALUES (177, 1, 14, 10, 1, 2, 'B', 191, 2, 1, '2026-07-20 18:09:00', b'0');
INSERT INTO `t_question` VALUES (178, 1, 14, 10, 1, 4, 'A', 192, 2, 1, '2026-07-20 18:11:33', b'0');
INSERT INTO `t_question` VALUES (179, 1, 14, 10, 1, 2, 'A', 193, 2, 1, '2026-07-20 18:13:54', b'0');
INSERT INTO `t_question` VALUES (180, 1, 14, 10, 1, 3, 'C', 194, 2, 1, '2026-07-20 18:16:18', b'0');
INSERT INTO `t_question` VALUES (181, 1, 14, 10, 1, 1, 'C', 195, 2, 1, '2026-07-20 18:18:50', b'0');
INSERT INTO `t_question` VALUES (182, 1, 14, 10, 1, 1, 'C', 196, 2, 1, '2026-07-20 18:22:03', b'0');
INSERT INTO `t_question` VALUES (183, 2, 14, 10, 1, 3, 'A,B,C,D', 197, 2, 1, '2026-07-20 18:24:48', b'0');
INSERT INTO `t_question` VALUES (184, 1, 15, 10, 1, 2, 'D', 199, 2, 1, '2026-07-20 21:29:07', b'0');
INSERT INTO `t_question` VALUES (185, 1, 15, 10, 1, 3, 'A', 200, 2, 1, '2026-07-20 21:32:07', b'0');
INSERT INTO `t_question` VALUES (186, 1, 15, 10, 1, 2, 'C', 201, 2, 1, '2026-07-20 21:35:04', b'0');
INSERT INTO `t_question` VALUES (187, 1, 15, 10, 1, 2, 'A', 202, 2, 1, '2026-07-20 21:41:26', b'0');
INSERT INTO `t_question` VALUES (188, 1, 15, 10, 1, 2, 'B', 203, 2, 1, '2026-07-20 21:43:49', b'0');
INSERT INTO `t_question` VALUES (189, 1, 15, 10, 1, 2, 'B', 204, 2, 1, '2026-07-20 21:46:03', b'0');
INSERT INTO `t_question` VALUES (190, 1, 15, 10, 1, 3, 'A', 205, 2, 1, '2026-07-20 21:48:17', b'0');
INSERT INTO `t_question` VALUES (191, 1, 15, 10, 1, 1, 'B', 206, 2, 1, '2026-07-20 21:50:44', b'0');
INSERT INTO `t_question` VALUES (192, 1, 15, 10, 1, 1, 'A', 207, 2, 1, '2026-07-20 21:53:25', b'0');
INSERT INTO `t_question` VALUES (193, 1, 15, 10, 1, 2, 'B', 208, 2, 1, '2026-07-20 21:55:42', b'0');
INSERT INTO `t_question` VALUES (194, 1, 15, 10, 1, 2, 'B', 209, 2, 1, '2026-07-20 21:57:56', b'0');
INSERT INTO `t_question` VALUES (195, 1, 15, 10, 1, 2, 'B', 211, 2, 1, '2026-07-20 22:01:41', b'0');
INSERT INTO `t_question` VALUES (196, 1, 15, 10, 1, 2, 'C', 212, 2, 1, '2026-07-20 22:03:27', b'0');
INSERT INTO `t_question` VALUES (197, 1, 15, 10, 1, 3, 'C', 213, 2, 1, '2026-07-20 22:07:07', b'0');
INSERT INTO `t_question` VALUES (198, 1, 15, 10, 1, 3, 'A', 214, 2, 1, '2026-07-20 22:09:34', b'0');
INSERT INTO `t_question` VALUES (199, 1, 16, 10, 1, 2, 'B', 216, 2, 1, '2026-07-20 22:19:02', b'0');
INSERT INTO `t_question` VALUES (200, 1, 16, 10, 1, 2, 'B', 217, 2, 1, '2026-07-20 22:21:37', b'0');
INSERT INTO `t_question` VALUES (201, 1, 16, 10, 1, 2, 'B', 218, 2, 1, '2026-07-20 22:23:49', b'0');
INSERT INTO `t_question` VALUES (202, 1, 16, 10, 1, 1, 'A', 219, 2, 1, '2026-07-20 22:25:51', b'0');
INSERT INTO `t_question` VALUES (203, 1, 16, 10, 1, 1, 'C', 220, 2, 1, '2026-07-20 22:27:44', b'0');
INSERT INTO `t_question` VALUES (204, 1, 16, 10, 1, 1, 'C', 221, 2, 1, '2026-07-20 22:31:21', b'0');
INSERT INTO `t_question` VALUES (205, 1, 16, 10, 1, 1, 'D', 222, 2, 1, '2026-07-20 22:33:27', b'0');
INSERT INTO `t_question` VALUES (206, 1, 16, 10, 1, 3, 'C', 223, 2, 1, '2026-07-20 22:37:30', b'0');
INSERT INTO `t_question` VALUES (207, 1, 16, 10, 1, 2, 'C', 224, 2, 1, '2026-07-20 22:41:07', b'0');
INSERT INTO `t_question` VALUES (208, 1, 16, 10, 1, 1, 'C', 225, 2, 1, '2026-07-20 22:42:57', b'0');
INSERT INTO `t_question` VALUES (209, 1, 16, 10, 1, 1, 'D', 226, 2, 1, '2026-07-20 22:46:25', b'0');
INSERT INTO `t_question` VALUES (210, 1, 16, 10, 1, 1, 'D', 227, 2, 1, '2026-07-20 22:47:02', b'0');
INSERT INTO `t_question` VALUES (211, 1, 16, 10, 1, 2, 'D', 228, 2, 1, '2026-07-20 22:47:51', b'0');
INSERT INTO `t_question` VALUES (212, 1, 16, 10, 1, 2, 'C', 229, 2, 1, '2026-07-20 22:49:37', b'0');
INSERT INTO `t_question` VALUES (213, 1, 16, 10, 1, 1, 'C', 230, 2, 1, '2026-07-20 22:51:18', b'0');
INSERT INTO `t_question` VALUES (214, 1, 16, 10, 1, 2, 'A', 231, 2, 1, '2026-07-20 22:52:57', b'0');
INSERT INTO `t_question` VALUES (215, 1, 17, 10, 1, 1, 'C', 233, 2, 1, '2026-07-20 22:58:33', b'0');
INSERT INTO `t_question` VALUES (216, 1, 17, 10, 1, 1, 'C', 234, 2, 1, '2026-07-20 23:00:23', b'0');
INSERT INTO `t_question` VALUES (217, 1, 17, 10, 1, 1, 'C', 235, 2, 1, '2026-07-20 23:02:22', b'0');
INSERT INTO `t_question` VALUES (218, 1, 17, 10, 1, 1, 'B', 236, 2, 1, '2026-07-20 23:04:05', b'0');
INSERT INTO `t_question` VALUES (219, 1, 17, 10, 1, 1, 'C', 237, 2, 1, '2026-07-20 23:05:46', b'0');
INSERT INTO `t_question` VALUES (220, 1, 17, 10, 1, 1, 'B', 238, 2, 1, '2026-07-20 23:07:34', b'0');
INSERT INTO `t_question` VALUES (221, 1, 17, 10, 1, 1, 'C', 239, 2, 1, '2026-07-20 23:09:42', b'0');
INSERT INTO `t_question` VALUES (222, 1, 17, 10, 1, 1, 'B', 240, 2, 1, '2026-07-20 23:13:37', b'0');
INSERT INTO `t_question` VALUES (223, 1, 17, 10, 1, 2, 'D', 241, 2, 1, '2026-07-20 23:19:29', b'0');
INSERT INTO `t_question` VALUES (224, 1, 17, 10, 1, 2, 'B', 242, 2, 1, '2026-07-20 23:21:24', b'0');
INSERT INTO `t_question` VALUES (225, 1, 17, 10, 1, 1, 'C', 243, 2, 1, '2026-07-20 23:23:25', b'0');
INSERT INTO `t_question` VALUES (226, 1, 17, 10, 1, 1, 'C', 244, 2, 1, '2026-07-20 23:24:55', b'0');
INSERT INTO `t_question` VALUES (227, 1, 17, 10, 1, 1, 'C', 245, 2, 1, '2026-07-20 23:26:38', b'0');
INSERT INTO `t_question` VALUES (228, 1, 17, 10, 1, 1, 'B', 246, 2, 1, '2026-07-20 23:29:00', b'0');
INSERT INTO `t_question` VALUES (229, 1, 17, 10, 1, 1, 'C', 247, 2, 1, '2026-07-20 23:30:25', b'0');

-- ----------------------------
-- Table structure for t_sign_record
-- ----------------------------
DROP TABLE IF EXISTS `t_sign_record`;
CREATE TABLE `t_sign_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `sign_date` date NOT NULL,
  `continuous_days` int NULL DEFAULT 1 COMMENT '连续签到天数',
  `points_earned` int NULL DEFAULT 0 COMMENT '本次签到获得积分',
  `create_time` datetime NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `uk_user_date`(`user_id` ASC, `sign_date` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 22 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_sign_record
-- ----------------------------
INSERT INTO `t_sign_record` VALUES (1, 16, '2026-05-09', 1, 2, '2026-05-09 17:09:40');
INSERT INTO `t_sign_record` VALUES (2, 16, '2026-05-10', 2, 1, '2026-05-10 17:20:54');
INSERT INTO `t_sign_record` VALUES (3, 16, '2026-05-11', 3, 1, '2026-05-11 12:19:34');
INSERT INTO `t_sign_record` VALUES (4, 16, '2026-05-12', 4, 1, '2026-05-12 21:58:59');
INSERT INTO `t_sign_record` VALUES (5, 16, '2026-05-13', 5, 1, '2026-05-13 10:27:24');
INSERT INTO `t_sign_record` VALUES (6, 3, '2026-05-14', 1, 2, '2026-05-14 00:23:39');
INSERT INTO `t_sign_record` VALUES (7, 16, '2026-05-14', 6, 1, '2026-05-14 22:57:59');
INSERT INTO `t_sign_record` VALUES (8, 16, '2026-05-15', 7, 2, '2026-05-15 19:46:34');
INSERT INTO `t_sign_record` VALUES (9, 16, '2026-05-16', 8, 2, '2026-05-16 14:49:20');
INSERT INTO `t_sign_record` VALUES (10, 16, '2026-05-18', 1, 2, '2026-05-18 21:55:27');
INSERT INTO `t_sign_record` VALUES (11, 15, '2026-05-18', 1, 2, '2026-05-18 23:50:27');
INSERT INTO `t_sign_record` VALUES (12, 16, '2026-05-19', 2, 1, '2026-05-19 09:24:54');
INSERT INTO `t_sign_record` VALUES (13, 15, '2026-05-19', 2, 1, '2026-05-19 09:26:28');
INSERT INTO `t_sign_record` VALUES (14, 16, '2026-05-20', 3, 1, '2026-05-20 10:36:18');
INSERT INTO `t_sign_record` VALUES (15, 16, '2026-05-21', 4, 1, '2026-05-21 21:34:59');
INSERT INTO `t_sign_record` VALUES (16, 16, '2026-05-22', 5, 1, '2026-05-22 10:50:13');
INSERT INTO `t_sign_record` VALUES (17, 16, '2026-05-23', 6, 1, '2026-05-23 11:10:34');
INSERT INTO `t_sign_record` VALUES (18, 16, '2026-05-24', 7, 2, '2026-05-24 09:26:17');
INSERT INTO `t_sign_record` VALUES (19, 16, '2026-05-25', 8, 2, '2026-05-25 08:45:34');
INSERT INTO `t_sign_record` VALUES (20, 16, '2026-07-30', 1, 2, '2026-07-30 21:54:12');
INSERT INTO `t_sign_record` VALUES (21, 15, '2026-07-31', 1, 2, '2026-07-31 15:23:00');

-- ----------------------------
-- Table structure for t_subject
-- ----------------------------
DROP TABLE IF EXISTS `t_subject`;
CREATE TABLE `t_subject`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `level` int NULL DEFAULT NULL,
  `level_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `item_order` int NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES (1, 'test', 12, '高三', NULL, b'1');
INSERT INTO `t_subject` VALUES (2, '大学政治', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (3, '大学英语', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (4, '大学英语', 3, '三年级', NULL, b'1');
INSERT INTO `t_subject` VALUES (5, '高等数学', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (6, '信息技术', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (7, '生理学', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (8, '法理学', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (9, '人体解剖', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (10, '艺术概论', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (11, '管理学', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (12, '经济学', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (13, '工程力学', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (14, '教育心理', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (15, '文史基础', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (16, '近现代史', 1, '大学', NULL, b'0');
INSERT INTO `t_subject` VALUES (17, '新媒体', 1, '大学', NULL, b'0');

-- ----------------------------
-- Table structure for t_task_exam
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam`;
CREATE TABLE `t_task_exam`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `grade_level` int NULL DEFAULT NULL,
  `frame_text_content_id` int NULL DEFAULT NULL,
  `create_user` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `create_user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_task_exam
-- ----------------------------

-- ----------------------------
-- Table structure for t_task_exam_customer_answer
-- ----------------------------
DROP TABLE IF EXISTS `t_task_exam_customer_answer`;
CREATE TABLE `t_task_exam_customer_answer`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_exam_id` int NULL DEFAULT NULL,
  `create_user` int NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `text_content_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_task_exam_customer_answer
-- ----------------------------

-- ----------------------------
-- Table structure for t_text_content
-- ----------------------------
DROP TABLE IF EXISTS `t_text_content`;
CREATE TABLE `t_text_content`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 249 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_text_content
-- ----------------------------
INSERT INTO `t_text_content` VALUES (1, '{\"titleContent\":\"test\",\"analyze\":\"test\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<p>t</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<p>f</p><br/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"f\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"f\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2025-07-11 23:14:12');
INSERT INTO `t_text_content` VALUES (2, '[{\"name\":\"test\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]}]', '2025-07-11 23:15:37');
INSERT INTO `t_text_content` VALUES (3, '{\"titleContent\":\"<span style=\\\"font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; color: black;\\\">推进绿色发展，加快形成节约资源和保护环境的空间格局、产业结构、生产和生活方式，要坚持（）为主。</span>\",\"analyze\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">推进绿色发展，坚持节约优先、保护优先、自然恢复为主，加快形成节约资源和保护环境的空间格局、产业结构、生产和生活方式。C 项效率优先与保护优先相悖。故本题选 ABD。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\\\">节约优先</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\\\">保护优先</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\\\">效率优先</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\\\">自然恢复</span>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-02-26 15:19:12');
INSERT INTO `t_text_content` VALUES (4, '{\"titleContent\":\"__<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">is way to school, he found a mobile phone and handed it to the teacher.</span>\",\"analyze\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">【选项释义】A. On 在...…上；B. In 在……内；C. At 在；D. By 通过。【解题思路】本题考查固定搭配，on one&#39;s way to +地点，意为在去某地的路上；in the way 意为阻碍；the way to do 意为做某事的方法。故本题选A。【句意】在上学的路上，他发现了一个手机，并把它交给了老师。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"On\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"In\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"At\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"By\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-02-26 15:29:51');
INSERT INTO `t_text_content` VALUES (5, '{\"titleContent\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">That was the situation ____ sellers were going to either get rich or go bankrupt.</span>\",\"analyze\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">【选项释义】A. where 在…...地方；B. this 这个；C. which 哪一个；D. on which 在......上。<br/>【解题思路】分析句子结构可知，空处引导一个定语从句，修饰表示抽象地点的先行词 situation，所以应用 where 引导，where 在从句中作地点状语。in a(n) …... situation 为固定搭配，意为“在…...情况下”，所以这里也可以用 in which，但不能用 on which。故本题选 A。<br/>【干扰项排除】B、C、D 选项引导词均不正确。<br/>【句意】那种情况下卖方要么变得富有要么破产。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"where\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"this\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"which\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"on which\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-02-26 15:34:14');
INSERT INTO `t_text_content` VALUES (6, '[{\"name\":\"大学政治\",\"questionItems\":[{\"id\":23,\"itemOrder\":1},{\"id\":19,\"itemOrder\":2},{\"id\":20,\"itemOrder\":3},{\"id\":22,\"itemOrder\":4},{\"id\":24,\"itemOrder\":5},{\"id\":21,\"itemOrder\":6},{\"id\":25,\"itemOrder\":7},{\"id\":26,\"itemOrder\":8},{\"id\":28,\"itemOrder\":9},{\"id\":27,\"itemOrder\":10},{\"id\":30,\"itemOrder\":11},{\"id\":29,\"itemOrder\":12},{\"id\":31,\"itemOrder\":13},{\"id\":32,\"itemOrder\":14},{\"id\":2,\"itemOrder\":15}]}]', '2026-02-26 15:45:05');
INSERT INTO `t_text_content` VALUES (7, '[{\"name\":\"大学英语\",\"questionItems\":[{\"id\":3,\"itemOrder\":1},{\"id\":4,\"itemOrder\":2},{\"id\":6,\"itemOrder\":3},{\"id\":10,\"itemOrder\":4},{\"id\":8,\"itemOrder\":5},{\"id\":11,\"itemOrder\":6},{\"id\":9,\"itemOrder\":7},{\"id\":7,\"itemOrder\":8},{\"id\":12,\"itemOrder\":9},{\"id\":15,\"itemOrder\":10},{\"id\":13,\"itemOrder\":11},{\"id\":14,\"itemOrder\":12},{\"id\":17,\"itemOrder\":13},{\"id\":16,\"itemOrder\":14},{\"id\":18,\"itemOrder\":15}]}]', '2026-02-26 15:47:55');
INSERT INTO `t_text_content` VALUES (8, '{\"titleContent\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">That was the situation ____ sellers were going to either get rich or go bankrupt.</span>\",\"analyze\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">【选项释义】A. where 在…...地方；B. this 这个；C. which 哪一个；D. on which 在......上。</span><br/><span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">【解题思路】分析句子结构可知，空处引导一个定语从句，修饰表示抽象地点的先行词 situation，所以应用 where 引导，where 在从句中作地点状语。in a(n) …... situation 为固定搭配，意为“在…...情况下”，所以这里也可以用 in which，但不能用 on which。故本题选 A。</span><br/><span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">【干扰项排除】B、C、D 选项引导词均不正确。</span><br/><span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">【句意】那种情况下卖方要么变得富有要么破产。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<span style=\\\"text-wrap-mode: wrap;\\\"></span><span style=\\\"text-wrap-mode: wrap;\\\">where</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<span style=\\\"text-wrap-mode: wrap;\\\"></span><span style=\\\"text-wrap-mode: wrap;\\\">this</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<span style=\\\"text-wrap-mode: wrap;\\\"></span><span style=\\\"text-wrap-mode: wrap;\\\">which</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<span style=\\\"text-wrap-mode: wrap;\\\"></span><span style=\\\"text-wrap-mode: wrap;\\\">on which</span>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-03-04 11:16:53');
INSERT INTO `t_text_content` VALUES (9, '[{\"name\":\"大学英语模拟题\",\"questionItems\":[{\"id\":5,\"itemOrder\":1}]}]', '2026-03-04 11:18:39');
INSERT INTO `t_text_content` VALUES (10, '{\"titleContent\":\"<p class=\\\"ueditor-p\\\">There was nothing we could do ____ wait at that moment.</p>\",\"analyze\":\"<p class=\\\"ueditor-p\\\">A 【翻译】那时我们除了等待，什么都做不了。</p><p class=\\\"ueditor-p\\\">[考点] 词义辨析 [精析] A在介词but,except,</p><p class=\\\"ueditor-p\\\">besides后跟不定式作宾语时，如果介词前有</p><p class=\\\"ueditor-p\\\">do及其变化形式，则不定式可省略to。选项</p><p class=\\\"ueditor-p\\\">A、D均符合此用法，但but意为“除了......”，</p><p class=\\\"ueditor-p\\\">besides意为“除了......还......”。根据句意可</p><p class=\\\"ueditor-p\\\">知，选A。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<p class=\\\"ueditor-p\\\">but</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<p class=\\\"ueditor-p\\\">rather than</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<p class=\\\"ueditor-p\\\">in spite of</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<p class=\\\"ueditor-p\\\">besides</p>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 15:57:52');
INSERT INTO `t_text_content` VALUES (11, '{\"titleContent\":\"Some companies have introduced flexible working time with less emphasis on pressure ____.\",\"analyze\":\"A[翻译]一些公司已经引进较少强调工作压力<p class=\\\"ueditor-p\\\">而更多地强调工作效率的弹性工作制。[考点]</p><p class=\\\"ueditor-p\\\">比较级的用法[精析]A根据句意，此处意思</p><p class=\\\"ueditor-p\\\">是“更多地强调工作效率”，and连接前后两个</p><p class=\\\"ueditor-p\\\">比较级，more后面可省略emphasis。“在工</p><p class=\\\"ueditor-p\\\">作效率方面”应用on efficiency表达。故选A。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"and more on efficiency\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"and more efficiency\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"than efficiency\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"than more on efficiency\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 16:23:28');
INSERT INTO `t_text_content` VALUES (12, '{\"titleContent\":\"Steven ____ my letter, otherwise he would have replied before now.\",\"analyze\":\"C [翻译]史蒂芬一定没有收到我的信;不然的<p class=\\\"ueditor-p\\\">话，他在此之前一定会给我回信的。[考点]</p><p class=\\\"ueditor-p\\\">情态动词[精析]C本题考查情态动词的用法。</p><p class=\\\"ueditor-p\\\">根据题意可知，本句是对过去发生事情的否定</p><p class=\\\"ueditor-p\\\">推测，所以应用couldn&#39;t have done,意为“一</p><p class=\\\"ueditor-p\\\">定没有做过某事”。should/ought to have</p><p class=\\\"ueditor-p\\\">done表示“过去本应该做某事”。故选C。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"has received\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"should have received\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"couldn&#39;t have received\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"ought to have received\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 16:31:54');
INSERT INTO `t_text_content` VALUES (13, '{\"titleContent\":\"We must ____ that the experiment is controlled as rigidly as possible.\",\"analyze\":\"C[翻译]我们必须确保实验尽可能严格地执<p class=\\\"ueditor-p\\\">行。[考点]词义辨析[精析]C assure使(某</p><p class=\\\"ueditor-p\\\">人)确信(某事)，后面常跟人作宾语;ensure:</p><p class=\\\"ueditor-p\\\">保证,确保,使安全,后面可以接从句作宾语;</p><p class=\\\"ueditor-p\\\">secure:使安全;issue:发行，发布。根据</p><p class=\\\"ueditor-p\\\">句意可知，选C。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"assure\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"secure\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"ensure\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"issue\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 16:37:16');
INSERT INTO `t_text_content` VALUES (14, '{\"titleContent\":\"I need to move to a larger apartment. Do you know of any ____ one in this neighborhood?\",\"analyze\":\"A[翻译]我需要搬到一所更大的公寓，你知道<p class=\\\"ueditor-p\\\">附近哪儿有空置的公寓吗?[考点]词义辨析</p><p class=\\\"ueditor-p\\\">[精析]A vacant:土地、房屋、座位、职位等)</p><p class=\\\"ueditor-p\\\">空的，未被占用的;bare:(树木)光秃秃的，</p><p class=\\\"ueditor-p\\\">(土地)荒芜的;blank:空白的;empty:</p><p class=\\\"ueditor-p\\\">(座位、剧院等)空的。根据句意可知，选A。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"vacant\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"bare\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"blank\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"empty\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 16:41:15');
INSERT INTO `t_text_content` VALUES (15, '{\"titleContent\":\"Religion has a great ____ on man&#39;s thought.\",\"analyze\":\"D[翻译)宗教对人的思想有很大影响。[考<p class=\\\"ueditor-p\\\">点]词语搭配[精析]D have a great</p><p class=\\\"ueditor-p\\\">influence on意为“对.....有很大影响”，为固</p><p class=\\\"ueditor-p\\\">定搭配，符合题意。efficiency: (n.)效率;</p><p class=\\\"ueditor-p\\\">affect: (v.)影响，,感染; affection: (n.)喜爱，</p><p class=\\\"ueditor-p\\\">感情，均不符合题意。故选D。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"efficiency\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"affect\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"affection\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"influence\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-18 16:45:08');
INSERT INTO `t_text_content` VALUES (16, '{\"titleContent\":\"The children are getting more and more excited when Christmas is ____ near.\",\"analyze\":\"A[翻译]当圣诞节越来越近时，孩子们变得越<p class=\\\"ueditor-p\\\">来越兴奋。[考点]词义辨析[精析]A draw:</p><p class=\\\"ueditor-p\\\">行进,临近,与near连用构成draw near(临近，</p><p class=\\\"ueditor-p\\\">靠近);join:连接，汇合;take:拿，取;</p><p class=\\\"ueditor-p\\\">operate:运转，操作。根据句意，选A。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"drawing\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"joining\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"taking\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"operating\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 16:48:06');
INSERT INTO `t_text_content` VALUES (17, '{\"titleContent\":\"Many companies provide their employees ____ free lunch during the weekdays.\",\"analyze\":\"B[翻译]许多公司在工作日为他们的员工提供<p class=\\\"ueditor-p\\\">免费午餐。[考点]词语搭配[精析]B</p><p class=\\\"ueditor-p\\\">provide sb. with sth.为固定搭配，意为“为某</p><p class=\\\"ueditor-p\\\">人提供某物”。故选B。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"by\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"with\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"to\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"for\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-18 16:50:36');
INSERT INTO `t_text_content` VALUES (18, '{\"titleContent\":\"<p class=\\\"ueditor-p\\\">The work seemed easy at first, but it ____ to be quite difficult.</p>\",\"analyze\":\"B[翻译]这项工作刚开始看起来简单，结果证<p class=\\\"ueditor-p\\\">明它很难。[考点]词义辨析[精析]B break</p><p class=\\\"ueditor-p\\\">out:爆发，突发; turn out:结果是,证明是;</p><p class=\\\"ueditor-p\\\">work out:解决,算出;set out:出发,启程，</p><p class=\\\"ueditor-p\\\">动身。根据句意可知，选B。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"broke out\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"turned out\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"worked out\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"set out\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-18 16:54:49');
INSERT INTO `t_text_content` VALUES (19, '{\"titleContent\":\"I got a splitting headache. It kept me ____ the whole night.\",\"analyze\":\"C[翻译]我头痛欲裂，这使我整晚都睡不着。<p class=\\\"ueditor-p\\\">[考点]词义辨析[精析]C wake:唤醒，常用</p><p class=\\\"ueditor-p\\\">搭配为wake up(醒来)和wake sb. up(唤醒某</p><p class=\\\"ueditor-p\\\">人);aware:有意识的，常用于be aware of</p><p class=\\\"ueditor-p\\\">结构中，意为“意识到”; awake:清醒的，醒</p><p class=\\\"ueditor-p\\\">着的,常与be, keep, stay等词连用; awaken:</p><p class=\\\"ueditor-p\\\">唤醒，使意识到。根据句意可知，选C。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"waken\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"aware\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"awake\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"awaken\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 17:00:28');
INSERT INTO `t_text_content` VALUES (20, '{\"titleContent\":\"She pretended ____ indifferent but her facial expression betrayed her.\",\"analyze\":\"A[翻译]她假装漠不关心，但是她的面部表情<p class=\\\"ueditor-p\\\">出卖了她。[考点]固定用法[精析]A</p><p class=\\\"ueditor-p\\\">pretend to do sth.为固定搭配，意为“假装做</p><p class=\\\"ueditor-p\\\">某事”。故选A。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"to be\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"being\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"be\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"been\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 17:06:05');
INSERT INTO `t_text_content` VALUES (21, '{\"titleContent\":\"How far is it from your home to the post office? --It&#39;s about a ____ walk.\",\"analyze\":\"C[翻译]从你家到办公室有多远?走路大约两<p class=\\\"ueditor-p\\\">英里。[考点]数词的用法[精析]C“数词+可</p><p class=\\\"ueditor-p\\\">数名词”作定语修饰其他名词时，若数词和可</p><p class=\\\"ueditor-p\\\">数名词之间有连字符连接，则名词应用单数形</p><p class=\\\"ueditor-p\\\">式。所以，两英里的路程可以用a two-mile</p><p class=\\\"ueditor-p\\\">walk或two miles&#39; walk表示。故选C。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"two mile&#39;\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"two miles\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"two-mile\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"two mile&#39;s\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 17:12:54');
INSERT INTO `t_text_content` VALUES (22, '{\"titleContent\":\"Although Rosemary had suffered from a serious illness for years, she lost of her enthusiasm for life.\",\"analyze\":\"[翻译]虽然罗兹玛丽多年遭受重病，但她丝<p class=\\\"ueditor-p\\\">毫没有失去对生活的热情。[考点]代词的用法</p><p class=\\\"ueditor-p\\\">[精析]C根据句意，可排除表示肯定意义的A、</p><p class=\\\"ueditor-p\\\">D两项; neither:两者都不，不符合语境;</p><p class=\\\"ueditor-p\\\">none:没有一个，没有任何东西，none of用</p><p class=\\\"ueditor-p\\\">于名词前时，表示“都不，一点也不”。故选C。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"some\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"neither\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"none\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"all\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 17:16:19');
INSERT INTO `t_text_content` VALUES (23, '{\"titleContent\":\"割裂感性认识和理性认识的辩证统一关系，否认理性认识而片面夸大感性认识的作用，在实践中则会导致（）。\",\"analyze\":\"A.唯理论:夸大理性认识，轻视感性认识，与题干“夸大感性认识、否认理性认识”不符，排除。B.教条主义:片面依赖理论教条，忽视实际，本质是夸大理性认识，与题干不符，排除。C.绝对主义:强调事物绝对化，否定相对性，与感性、理性认识关系无关，排除。D.经验主义:片面夸大感性经验的作用，轻视甚至否认理性认识，与题干“否认理性认识而片面夸大感性认识”完全契合。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"唯理论\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"教条主义\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"绝对主义\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"经验主义\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-18 18:30:01');
INSERT INTO `t_text_content` VALUES (24, '{\"titleContent\":\"看问题“只见树木，不见森林”是（）的观点。\",\"analyze\":\"A.唯物辩证法:主张用联系、发展、全面的观点看问题，与“只见树木，不见森林”(片面看问题)相悖，排除。B.客观唯心主义:把客观精神(如上帝、理念等)视为世界本原，与题干观点无关，排除。C.形而上学:用孤立、静止、片面的观点看问题,“只见树木，不见森林”体现了片面性，符合其特征，正确。D.不可知论:认为世界不可认识或不能完全认识，与题干无关，排除。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"唯物辩证法\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"客观唯心主义\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"形而上学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"不可知论\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 18:33:48');
INSERT INTO `t_text_content` VALUES (25, '{\"titleContent\":\"“社会形态的发展是一个自然历史的过程”，这句话的含义是指社会的发展（）。\",\"analyze\":\"A.等同于自然界的发展:社会发展有人的参与，与自然界发展有本质区别，排除。B.不会受人的影响:社会由人组成，人的活动影响社会发展，此说法错误，排除。C.是真正自然力作用下的发展:社会发展依赖于人的实践活动，并非单纯自然力作用，排除。D.具有不以人的意志为转移的客观性:社会形态发展遵循自身客观规律(如生产力决定生产关系)，具有客观性，符合题意，正确。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"等同于自然界的发展\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"不会受人的影响\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"是真正自然力作用下的发展\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"具有不以人的意志为转移的客观性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-18 18:38:15');
INSERT INTO `t_text_content` VALUES (26, '{\"titleContent\":\"人的思想动机实现的程度决定于（）。\",\"analyze\":\"<p class=\\\"ueditor-p\\\">A.它和社会发展客观规律符合的程度：马克思主义哲学认为，社会发展有其客观规律，人的思想动机若符合规律,实践活动才可能成功，思想动机才易实现，此选项正确。B.人的意志坚定与否：意志坚定是主观条件，但违背客观规律时，再坚定也难以实现目标，非决定因素，错误。C.人的动机善良与否：动机善良与能否实现无必然决定关系，善良但不符合规律仍可能失败，错误。D.支持者人数的多少：人数多少并非思想动机实现的关键，关键在于是否符合客观规律，错误。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"它和社会发展客观规律符合的程度\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"人的意志坚定与否\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"人的动机善良与否\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"支持者人数的多少\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 18:43:09');
INSERT INTO `t_text_content` VALUES (27, '{\"titleContent\":\"人类的社会基本矛盾是（）。\",\"analyze\":\"A.人类社会与自然界之间的矛盾:这是人与自然的关系，并非社会基本矛盾，排除。B.开拓进取与因循守旧之间的矛盾:属于思想观念层面的矛盾，非社会基本矛盾，排除。C.生产力与生产关系、经济基础和上层建筑之间的矛盾:这两对矛盾贯穿社会发展始终，决定社会性质和趋势,是推动社会发展的根本动力，符合社会基本矛盾定义，正确。D.剥削阶级与被剥削阶级之间的矛盾:是阶级社会中的矛盾，但并非贯穿所有社会形态的基本矛盾，<p class=\\\"ueditor-p\\\">排除。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"人类社会与自然界之间的矛盾\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"开拓进取与因循守旧之间的矛盾\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"生产力与生产关系、经济基础和上层建筑之间的矛盾\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"剥削阶级与被剥削阶级之间的矛盾\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 18:46:51');
INSERT INTO `t_text_content` VALUES (28, '{\"titleContent\":\"从根本上说，科学活动的生命力在于（）。\",\"analyze\":\"A.发扬前人积累的所有经验:前人经验有局限性，科学需批判继承而非全盘接受，错误。B.固守他人创造的知识:科学需发展，固守会停滞，错误。C.在实践基础上不断创新:科学发展依赖实践，创新推动进步，是生命力所在,正确。D.科学家之间的恶性竞争:恶性竞争危害科学发展,非生命力体现,错误。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"发扬前人积累的所有经验\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"固守他人创造的知识\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"在实践基础上不断创新\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"科学家之间的恶性竞争\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 18:51:35');
INSERT INTO `t_text_content` VALUES (29, '{\"titleContent\":\"历史唯物主义认为，决定人的本质的是（）。\",\"analyze\":\"<p class=\\\"ueditor-p\\\">历史唯物主义认为，人的本质不是单个人所固有的抽象物，在其现实性上，它是一切社会关系的总和，这强调了人的社会属性对本质的决定性作用。分析各选项:A.人的社会属性:符合历史唯物主义观点，社会关系的总和决定</p><p class=\\\"ueditor-p\\\">人的本质，正确。B.人的生理结构:属于自然属性范畴，不能决定人的本质，错误。C.人的心理状况:是内在心理特征，不决定人的本质，错误。D.人的自然属性:如生物特征等，并非本质的决定因素，错误。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"人的社会属性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"人的生理结构\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"人的心理状况\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"人的自然属性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 18:56:03');
INSERT INTO `t_text_content` VALUES (30, '{\"titleContent\":\"马克思主义价值观以绝大多数人的利益为是非、善恶、美丑的评价标准，归根结底是以（）为评价标准。\",\"analyze\":\"A.个人进步和个人绝对自由:马克思主义强调社会整体发展与人类解放，而非片面追求个人绝对自由，此选项错误。B.统治阶级的利益和意志:马克思主义代表无产阶级及广大人民利益，并非维护剥削阶级(统治阶级)的利<p class=\\\"ueditor-p\\\">益和意志，此选项错误。C.社会的进步和人类的彻底解放:马克思主义的根本目标是推动社会进步，实现人类从受压迫、受束缚状态中彻底解放，符合其价值观的终极指向，此选项正确。D.被统治阶级的利益和意志:马克思</p><p class=\\\"ueditor-p\\\">主义虽代表被压迫阶级利益，但根本落脚点是社会进步与全人类解放，而非局限于被统治阶级的利益和意志，此选项不准确。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"个人进步和个人绝对自由\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"统治阶级的利益和意志\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"社会的进步和人类的彻底解放\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"被统治阶级的利益和意志\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 18:59:09');
INSERT INTO `t_text_content` VALUES (31, '{\"titleContent\":\"哲学家休谟认为，真理是“观念与主体感觉相符合”,这一观点是（）的真理观。\",\"analyze\":\"A.主观唯心主义:把人的主观精神(如感觉、经验等)作为衡量真理的标准，休谟认为真理是“观念与主体感觉相符合”，正是以人的主观感觉为尺度，符合主观唯心主义真理观，正确。B.客观唯心主义:主张以客观精神(如理念、绝对精神等)为真理标准，题干未体现，排除。C.历史唯物主义:探讨社会历史发展规律，与真理观的定义无关，排除。D.辩证唯物主义:认为真理具有客观性，检验标准是实践，与题干中“观念与主体感觉相符合”的<p class=\\\"ueditor-p\\\">主观标准不符，排除。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"主观唯心主义\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"客观唯心主义\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"历史唯物主义\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"辩证唯物主义\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 19:02:56');
INSERT INTO `t_text_content` VALUES (32, '{\"titleContent\":\"社会存在也称社会物质生活条件,是社会生活的物质方面，主要包括（）、人口因素和物质生产方式。\",\"analyze\":\"社会存在作为社会生活的物质方面，其构成要素包括自然地理环境、人口因素和物质生产方式。分析各选项:A.宗教道德方面:属于社会意识范畴,并非社会存在的物质方面,排除。B.自然地理环境:是社会存在的重要组成部<p class=\\\"ueditor-p\\\">分，符合题意，正确。C.历史政治方面:政治属于上层建筑,归属于社会意识领域，排除。D.情感精神方面:明显是社会意识，而非社会存在的物质内容，排除。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"宗教道德方面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"自然地理环境\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"历史政治方面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"情感精神方面\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-18 19:07:14');
INSERT INTO `t_text_content` VALUES (33, '{\"titleContent\":\"哲学与具体科学的关系是（）。\",\"analyze\":\"A.一般与个别的关系:哲学对具体科学进行概括和总结，揭示普遍规律，具体科学研究特定领域，二者是一般与个别的关系，正确。B.包含与被包含的关系:哲学并非简单包含具体科学，而是对其抽象概括，此说法错误，<p class=\\\"ueditor-p\\\">排除。C.思维与存在的关系:这是哲学基本问题，与哲学和具体科学的关系无关，排除。D.决定与被决定的关系:二者不存在决定与被决定关系，具体科学是哲学基础，哲学为具体科学提供指导，此说法错误，排除。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"一般与个别的关系\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"包含与被包含的关系\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"思维与存在的关系\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"决定与被决定的关系\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 19:10:21');
INSERT INTO `t_text_content` VALUES (34, '{\"titleContent\":\"马克思主义哲学的根本特征是以（）为基础的科学性和革命性的统一。\",\"analyze\":\"A.普遍性:马克思主义哲学虽具普遍指导意义，但并非其科学性与革命性统一的基础，排除。B.实践性:马克思主义哲学源于实践、在实践中发展，实践是其科学性(正确反映规律，受实践检验)与革命性(指导实践改造世界)统一的根基，正确。C.人民性:是马克思主义的价值立场，而非科学性与革命性统一的基础，排除。D.同一性:通常指矛盾双方的相互依存等关系，与题干无关，排除。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"普遍性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"实践性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"人民性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"同一性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-18 19:13:16');
INSERT INTO `t_text_content` VALUES (35, '{\"titleContent\":\"以下各项属于主观唯心主义观点的有（）\",\"analyze\":\"A、B是贝克莱的主观唯心主义观点，强调存在依赖于感知。D、E来自中国心学(王阳明、陆九渊)，主张心为万物本源。C(理在事先)属于朱熹的客观唯心主义，与主观唯心主义无关。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"存在就是被感知\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"物是观念的复合\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"理在事先\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"心外无事，心外无理\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"吾心即宇宙\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-18 19:18:41');
INSERT INTO `t_text_content` VALUES (36, '{\"titleContent\":\"马克思主义哲学以前的唯物主义的缺陷有（）\",\"analyze\":\"A.用机械力学的尺度去衡量物质的一切运动:近代形而上学唯物主义具有机械性，将一切运动归结为机械运动，此为缺陷，正确。B.不能把世界理解为处于不断变化发展中的过程:旧唯物主义具形而上学性，用静止观点<p class=\\\"ueditor-p\\\">看世界，不能理解世界的发展过程，正确。C.对社会历史的观点是唯心主义的:旧唯物主义在自然观唯物，但历史观陷入唯心，认为精神决定历史，正确。D.不承认存在决定意识:旧唯物主义承认存在决定意识，此选</p><p class=\\\"ueditor-p\\\">项错误。E.不承认社会存在决定社会意识:旧唯物主义在社会历史观上是唯心的，不承认社会存在决定社会意识，正确。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"用机械力学的尺度去衡量物质的一切运动\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"不能把世界理解为处于不断变化发展中的过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"对社会历史的观点是唯心主义的\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"不承认存在决定意识\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"不承认社会存在决定社会意识\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-18 19:23:24');
INSERT INTO `t_text_content` VALUES (37, '{\"titleContent\":\"已知函数y=2sin3x+1，则其周期T=（）\",\"analyze\":\"T=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAkCAYAAACXOioTAAACl0lEQVR4AeSWS6hNURyHt1dJ5P1MGFCiGJA8SikDA5HHwMBAMqBQEhlIzBSllAyYmBkpJa9SojwzMFBEHiVK8gh5x/etzr733HP2XWvv233Uvafft/5rr7P2/7f32mutvftn3fTr20b9GOXNcBSOw31YDKVUZehWknEC7IGdcAYuwFxIqqzRQDKtg5vwD9RFip+wApKqYjScbEdgFKjvFL9gBiRV1ugHmdbAQvgAahLFCLgKSZU1akzkUG6h8RZcgaQ6arSazPNhK3yGpDpitICs22E9vIJSqmo0lax7YRNoMo24FpKqYuSs203GfaAJIZtDMQWSKmvkwz9Mth3wFFxLcp76E0iqrNEfMm0Dt6FGLtGeVFmjZKJUhx4x0rQrCDdr4lChGAZO3c5kKTmD6o1c4c6szuR6cKGoN+IwaADlQfgLN2AyNGoDDW9hHtTLLekdDU3vqCIjDTTytk3kAnVKc36Qa8q9zpfg8tDSWryk6k7f9I4qMqJv0F1K18gy4mjItYjKSHgOXsxgYq7LVE7Aa2ijmJGL1NeAVz62dtZQotvQfqLD6hCNoZ7Lu3VLepg35DFmZB+3G694iAewEUzygHgHxoMbKyFoZiiz7HEttoSUUUtHKtPBZ+PQuM894li5oxsHUTgZzhIdDUKryhh9pLscIJ4EZxUhe0PxHmaBWkXhpLlNbFLKyO8CT9pF8QX88iEEae5Dd/p7V266x/in6W5oy1JGzrZxdFwCh6A+yW+Ov4HP5TTxFDyDQsWMHIbZnGUyxz4fMpqCvlL6AvTV/oL6OWhXMSOn8kTO1OQesT1d4w+/Xr1DqsWKGbkV+dkbu1IXtN8P7pPFDrXWmNEn+mgUu1KnshOCrnHFjOJnVvy39xn9BwAA///M4PkuAAAABklEQVQDAGWuekmzrHR9AAAAAElFTkSuQmCC\\\" data-latex=\\\"\\\\frac {2} {\\\\mathcal{W}}\\\"/>π=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAkCAYAAACAGLraAAAB7UlEQVR4AcyVSygFURzGL/IoyWNFnkUsLCRlw55kSUhYWHtFkkSRiFBsrEgs7OzY2iAlG5YsFFlJigUSv2+u7tzTnTP33ihu3+/8z5z5znfPTDNnEgM//P3vgAaubh2m4RJaIEK2S6jG2Qx9MAkjsANNYMgWoH87wfkO0inNBbSBIVtAGq4FKANJQS908iEdQrIFDOMogCuQMmkK4RAURAnKFhA867btdJ9hGwzFElDLjN5vbqiGogUU416EbjiDCPkF6LrnmKH7oclZ9DshBUKyBSTjGIU10GRKoJSmBt4gJFtAP45xOIbPbxR0S9+QLWAJV4IHy4wZsgUYJr+DXw1QWDw4C9MEp0OTAbrzsTCA11F4wBMj8zGygs9ReIAzEG/jF9BI2AbomdB+oD2CQ1O2gApsXTAEqzALW6AXi+LKFlCOpRUqQbpTA/VgyBawjysPtHRKIJsmCbStUVzZAj6wPICqXqwO+pugHYniyhYgRypNHcyApJdLe6P6IfwCXnEdwRjsgpZfRTXkFxBu1Kt8z4C+ExRXXgHa0vewnEMOSFq6duMSDqJu61r6NUZ91h6pUi6NvhEHVAVRgvJagXagKU4XgZ75HqoeJvVVOXTlFaCz+pcJOoOgJ1DfRO1SuhSGXNkCXEeU3t8HfAEAAP//gqdO5gAAAAZJREFUAwCk5FVJEkzNZQAAAABJRU5ErkJggg==\\\" data-latex=\\\"\\\\frac {2} {3}\\\"/>π\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"2π\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"3π\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAkCAYAAACAGLraAAAB7UlEQVR4AcyVSygFURzGL/IoyWNFnkUsLCRlw55kSUhYWHtFkkSRiFBsrEgs7OzY2iAlG5YsFFlJigUSv2+u7tzTnTP33ihu3+/8z5z5znfPTDNnEgM//P3vgAaubh2m4RJaIEK2S6jG2Qx9MAkjsANNYMgWoH87wfkO0inNBbSBIVtAGq4FKANJQS908iEdQrIFDOMogCuQMmkK4RAURAnKFhA867btdJ9hGwzFElDLjN5vbqiGogUU416EbjiDCPkF6LrnmKH7oclZ9DshBUKyBSTjGIU10GRKoJSmBt4gJFtAP45xOIbPbxR0S9+QLWAJV4IHy4wZsgUYJr+DXw1QWDw4C9MEp0OTAbrzsTCA11F4wBMj8zGygs9ReIAzEG/jF9BI2AbomdB+oD2CQ1O2gApsXTAEqzALW6AXi+LKFlCOpRUqQbpTA/VgyBawjysPtHRKIJsmCbStUVzZAj6wPICqXqwO+pugHYniyhYgRypNHcyApJdLe6P6IfwCXnEdwRjsgpZfRTXkFxBu1Kt8z4C+ExRXXgHa0vewnEMOSFq6duMSDqJu61r6NUZ91h6pUi6NvhEHVAVRgvJagXagKU4XgZ75HqoeJvVVOXTlFaCz+pcJOoOgJ1DfRO1SuhSGXNkCXEeU3t8HfAEAAP//gqdO5gAAAAZJREFUAwCk5FVJEkzNZQAAAABJRU5ErkJggg==\\\" data-latex=\\\"\\\\frac {2} {3}\\\"/>π\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"6π\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 20:55:34');
INSERT INTO `t_text_content` VALUES (38, '{\"titleContent\":\"已知函数f(x)=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAdCAYAAAC5UQwxAAACGklEQVR4AeyVSyguYRzG51w7nbM4l87pLM5xKbJQFi5ZsiElNnJNlMSOhdtCkmzkmigppcRCZGVDUkq5lEguRVLKQqEskFzi93wxoRlmvoaVr+f3/t+Z753/M+877+W98cq/N0O3A57EA91QD6uQDg/k5ZBGkjkFSqAWKmAAksGUl4bqzSyZL0Cap1iBLDDlpeEXsjZBKEgyPqHyD76BT14alpPxP2yB9J0iAKZAxgTD8NLQl/BekU39GPrB1EsZxuJQeMsO0dRLGAaRvRnyYQEeyGtDfbcGHPQ9ZfaDei58Bp+eMvxACw1LD1H0EZUwntgFjTAEmigE4xNFFXSCzAhGCEU0nINPdobv+LcMfkExKFE4cRwKoBI08zKImSCVUlTDDFzfIuNd6qbsDKNoEQbtoIc12/SgJsMg964gAg5gEqRWCr3oY9q4b8rOMJUWI6DFSzA0lHqBDS6W4AzUuz/EZXAsO8M6MozBnTTzgrlYg0PwW3aGjxPGcOMrTMAl+C0nhh/JnginoElA8F9ODP+SXj1cJ27DnRKoaOgJzmVlqOT7pBgGnQCajYHUN+EIJK05HTujunCDlWEcCX7DHGjx65xTXbNUO4emfR7/qceLRFeyMtTuod79JJOGTDtMGnUdOzrvWqhLHRRaowTnsjLUAtfuUUMa7SjTxD3IgSLQPtlL1OInuJOVobsMLlu/GbocsOebv/qQ3gAAAP//MSmADwAAAAZJREFUAwC3vFg7OeokQQAAAABJRU5ErkJggg==\\\" data-latex=\\\"{x}^{2}\\\"/>-2x+3，x<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAZCAYAAAArK+5dAAABGUlEQVR4AeyUP+tBURjHf38oAynZJYPsJmUyEq+BxUQpsxh4A/JK/BtsyoKXYaCklEFRfJ6y4Nxz77nY6Pu5D6fu93s857n37+fDn2+AbYO/LXpbi/5xSsEADnBRUGHtSU7OIMRdIxjfiFF/FXRZe5JdQIQ7piC7jlJ7sAHH0gV4cWnCGkqwA2PpApK4ZaEFe3AlXUAOx8UNijtZBXiwi8MMjuBaVgE+HMPQBtVIqtaMxlR2vcW8A6qRVK0ZjekZ4wlkIAiuZdUiMRxyCUAZZMcUc+kCVtgVoQZVkNcFxUy6AHGac8mDHOCSWgA/OJZdgBjJs5DgSwPqIE/2y1OEz51O/OpDGuQfyJk8YjRF+LxHTlr0UtLHA64AAAD//8tmVbUAAAAGSURBVAMAXRA3M7z03kMAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\in \\\"/>[0,3]，则函数f(x)的最小值为（）\",\"analyze\":\"根据函数在给定区间上的单调性可求得最小值。由题意得f(x)=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAdCAYAAAC5UQwxAAACGklEQVR4AeyVSyguYRzG51w7nbM4l87pLM5xKbJQFi5ZsiElNnJNlMSOhdtCkmzkmigppcRCZGVDUkq5lEguRVLKQqEskFzi93wxoRlmvoaVr+f3/t+Z753/M+877+W98cq/N0O3A57EA91QD6uQDg/k5ZBGkjkFSqAWKmAAksGUl4bqzSyZL0Cap1iBLDDlpeEXsjZBKEgyPqHyD76BT14alpPxP2yB9J0iAKZAxgTD8NLQl/BekU39GPrB1EsZxuJQeMsO0dRLGAaRvRnyYQEeyGtDfbcGHPQ9ZfaDei58Bp+eMvxACw1LD1H0EZUwntgFjTAEmigE4xNFFXSCzAhGCEU0nINPdobv+LcMfkExKFE4cRwKoBI08zKImSCVUlTDDFzfIuNd6qbsDKNoEQbtoIc12/SgJsMg964gAg5gEqRWCr3oY9q4b8rOMJUWI6DFSzA0lHqBDS6W4AzUuz/EZXAsO8M6MozBnTTzgrlYg0PwW3aGjxPGcOMrTMAl+C0nhh/JnginoElA8F9ODP+SXj1cJ27DnRKoaOgJzmVlqOT7pBgGnQCajYHUN+EIJK05HTujunCDlWEcCX7DHGjx65xTXbNUO4emfR7/qceLRFeyMtTuod79JJOGTDtMGnUdOzrvWqhLHRRaowTnsjLUAtfuUUMa7SjTxD3IgSLQPtlL1OInuJOVobsMLlu/GbocsOebv/qQ3gAAAP//MSmADwAAAAZJREFUAwC3vFg7OeokQQAAAABJRU5ErkJggg==\\\" data-latex=\\\"{x}^{2}\\\"/>-2x+3=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEoAAAAdCAYAAAANW/o+AAAEXklEQVR4AeyZZ6gVRxiGj+m9J4T0TjohhZCQ/iOVJCTkbwIhBRJI7BXrHytiQxRFQUX9o6Ci2BWxoWABsaJYsWLv3edZPIdzLrN79lz1uudyL++z8+3M7O7sd2dnvplzQ67hL5UHGhyVyk25XIOjrrKj7uZ+N0K16jYaLiRB3UtuH2gFU2EsPAwFletRjaj5L/wBF6BadSsNHwRvQU3dREY7GA894We4H0bCnRCpnKO86BVqDoSLUK06TMM7Qxd4Gor1FCcvwRpQJzmMgk/gZYiU5KgXqPEf9IazUO3ayguMga5wM+Sl/T4nTSGvIxh3wCMQKc5Rdsc21BgHW6Aa5Av/RUOnw10Q0iQy74HvIa/1GI9BB8jrVQwdm+9lsbOeXe4dKk+BLMsBuiUNnAhzwN7ieIQZlJ/VaEr+hNshpCfI/BUGwDaIFNejvqN0JWS9N52ijb3gR/gGVkM5LaGCzrDXYJbIXtmenPnQHwrjcshRdlsfOqu4InZ90XZeZAN8CsVyhm9Cxnn4H0rG5ZCjHMAepaI3I6l3OscbLYcPwbGYJNJPHB8HnaWTvsJ+DSKFHOXAZuEuDwk8QFlf6A4z4R9wfHCmNB4ZwXlHsDuTZErraI1hgoE0Zu5dDu9BW9BJ9q6vsQuODDnKYMvu5/dP3aCMZAdT4nTr7Gh80oPzyXAGtG1IC+zQWEB2XavkeU7/95HjZOB4Zdzke5wgz3HJ4PoH7N0QKeQoX2wfpUmO+ptyp9qlpGoPB+v70AnYD8KLsAA2QdZ0kAbZ0x1mdmAbVNuLinmefN+LJBcbHkSFMQd73BuU+bmRRLL3PIQ1G/aC45vf+7fYxyCLspMUPq1yDbRyuTo1y/1v/EZmwdvYxlyNSBeDXZekfinkqEMVvqLfueuiA1znbEKSKAdJnVkbHGwTb15B4WnqOiaRlFfIUTu57EkorJyxk+Qs+TYVVoExCkmiplFq76sN3bj2asg238KNUneKOEfp7bSOep0HGnctJC0ej5z5PiIvi3K9t5mGHYVUCjnKWcD/9nOBO5jfnHzDh99JPf+SVC3zcBl3HpwBXQZdzspU4m7BRlpU/I/lNF4hR+2nui/oAI1ZIrceXN44HvmpGUo8Sw0/uXx9e2Iz8vpB6oZQt67kEu1NHjYXUivkKEN8V+OuhWqusI9zZ6Nue8/n2M5+7n662nZA70SeW6pDSfMxFuY1lc8fwhMMdm2zaJtnGUUleoYzA+ZFpKkVcpQX623jotDW6QwqOHO5am+NbfQ6j/RjMEI3GF2BXVcaxoN85mekDgWibZ5lZJfoF84cTyvaGYlzlDHScG7oOJQ6KKN+1uVs/gWNdP/c8AQzneIc5dX+EmGI/4En9QB7mht2fpaFncu075XkKDfkG3MjF7YuUTCrWv5Q4o6HY2hFvcm3TnKU5e4bu6r2JytnPPOuG1fwYLe2XZ/6u53bKBXfqpyjvOFaDg7aqcN96mdN7j/5c5V75rVq2yUAAAD//8MUG/0AAAAGSURBVAMAioO/OwWjw7sAAAAASUVORK5CYII=\\\" data-latex=\\\"{(x-1)}^{2}\\\"/>+2，x<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAZCAYAAAArK+5dAAABGUlEQVR4AeyUP+tBURjHf38oAynZJYPsJmUyEq+BxUQpsxh4A/JK/BtsyoKXYaCklEFRfJ6y4Nxz77nY6Pu5D6fu93s857n37+fDn2+AbYO/LXpbi/5xSsEADnBRUGHtSU7OIMRdIxjfiFF/FXRZe5JdQIQ7piC7jlJ7sAHH0gV4cWnCGkqwA2PpApK4ZaEFe3AlXUAOx8UNijtZBXiwi8MMjuBaVgE+HMPQBtVIqtaMxlR2vcW8A6qRVK0ZjekZ4wlkIAiuZdUiMRxyCUAZZMcUc+kCVtgVoQZVkNcFxUy6AHGac8mDHOCSWgA/OJZdgBjJs5DgSwPqIE/2y1OEz51O/OpDGuQfyJk8YjRF+LxHTlr0UtLHA64AAAD//8tmVbUAAAAGSURBVAMAXRA3M7z03kMAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\in \\\"/>[0,3]，<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAZCAYAAAAv3j5gAAAAvElEQVR4AeyUMQ6CQBRE1cTE2sYbeAlrPYa9nXoQpaPnGFBzCW5AQ01CArzfEJrd/bshNCyZByT7mUkm7B52K10xKLjoWF2sbmog5Gd483UPKRxBJd+gE6532MMDzqCSb1CL6wf+8IQaVPINEtOK2xdKUCskSG0+H4xB8za83rdV3ZVufnADjazzpurkBJBNKZszI+UCNjnnTUFyAhQ4D5BDAzY5501BYppwk/UXzw5css6LkctgkfXVgkYAAAD//yosdYUAAAAGSURBVAMARRUaMw+4OTcAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\therefore \\\"/>函数f(x)在区间(0,1)上单调递减，在区间(1,3)上单调递增，<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAZCAYAAAAv3j5gAAAAvElEQVR4AeyUMQ6CQBRE1cTE2sYbeAlrPYa9nXoQpaPnGFBzCW5AQ01CArzfEJrd/bshNCyZByT7mUkm7B52K10xKLjoWF2sbmog5Gd483UPKRxBJd+gE6532MMDzqCSb1CL6wf+8IQaVPINEtOK2xdKUCskSG0+H4xB8za83rdV3ZVufnADjazzpurkBJBNKZszI+UCNjnnTUFyAhQ4D5BDAzY5501BYppwk/UXzw5css6LkctgkfXVgkYAAAD//yosdYUAAAAGSURBVAMARRUaMw+4OTcAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\therefore \\\"/>当x=1时，函数f(x)取得最小值，且<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFAAAAAcCAYAAAD2izi6AAAGJklEQVR4AezZdahtRRQG8P0M7O7uxhYD86EiooIdYCKK2C2oYPynqBjYYmBgoCi2YmB3YAcGiJ2YYH6/9+72nnvvPufsU+8qvMv6zppZM7Nm9tpr1prZd5pi6l9PFhi0AafP6mYJeiHj6elFx8DGDtKAi2bVVwfzBr2Q8fTQ14uegYwdlAHnyGrPCc4LPg56IePpoY/eXnT1fWw3Blw+q7g3OCO4MVgtaKQJqRwbvBw8H/SD6KGPXvr7obMvOjo14JKZlfHuDn822DE4PGiktVLZIrgy+DvoB9FDH73090NnX3R0asB9M+tCAeOtF/5XcE9QEu/YL5X7gy+CfhJ99NJvnn7q7lpXJwaUDTfKTN8GnwUnBDMGtwUlLZzChsGdwSCIATeJYvOEjT91YsC5stwVg/eD74MqWjvC34MPgkHQ21H6WzA67kY0PtSJAW3dubNMWfGn8Cqyrd9LQzMDp6knopd+O6EnRf0a3IkBF8ukMwWvBlU0XYQrBG8Egn5YJU0b6f7B5UO4JtzxZNPwiwLZ/ebwqnMfvfSbx3zpNr7UzoAe9uAs8bLg7MADbByufkr4rEFJ4qFD7zeloIIL/kdHzpMPDD8+WDkQ2ySH41L+Odgl2DWoIvrNY76q9ikqa2fAP7MaXuGo8mbK3wUnBh7+tPDGrTxb6ksFnwbNyBHEOfLcdPAyjP8k5XUDZ0rzrZry18FDQRXRbzdIalXt7WR9bW9nwHIyW0wCkRw+L4Vd8O0y5tZAogkr6GXQd1JxUJYgeN98qTcLFWkqbN+6a9e/Hayjq/t23UUsmBV4qHfDBfKwrujUjLovKGmJFBzOxTVbM9UpTjzeycLaOp68rgGXiWZb1IPaeqmOIV5lS45paCFYJ20zBw8GfwR1yTzmq9u/Vb/X0sg5TgrvmOoa0Pal3DbDq2D7fZWG5YI6ZBtumY6/BC8EdUnSMY/56o4ZWL86BvSggr8byEctVsIrnBHnadGnsWmBVHig5CS2pjqJ3HdbbafZ08s85pPVj0z9gcAHhwPCLwmOCl4Ptg6cHo4IfySQDMMmkbh3YUpXBBcHnlMc1P/h1O8KDgnUnTieSHnM0aqOAefMwJUCycObT7EpCfxrpLXqiMFYxt8y1C72LJ5yY1z1ALtF1uwqSC/95km3wsuytrNSwb3ow1J2xpTJfQY7P3Vc7D005fkDxDiOT6+ksnngaLVsuJdyafg2gfl8AXJsk/l3iGwE1THgIhlh8Fvh7RLI0+mjrwdLcQS5wzq/PROp8+XO4cqysJdk4XtFxiNfCq8ieiWd54YanUN9HXJ8srYzIxcbGYlehuCtdAtDdpCQwTDk5tkzY3wQ8XJnSPn2wH1evL82ZTHf3dsaG3dKmoqijgENlkCeyoh2gd7DexDele4jyO2C97lT26JuID6HyYAenBcZwGMsWnk06JWtBX5tDGKriaXmZgTypfPDuNacYsGgzpqPpWLri5/Xp8yoYupNKZuTN9K9QerGlvrUf4zMHGHDVMeAa6Y7w5VvPdWm9ENaGGqfcDEl7F9yYHa7ODkSN47Hw4WFPcLFrmPCffNzmE5xDNFHL/3mKTvwDNvXAzMO+cT8fBgID2GFZ3CXfzSV3QNxdEL49gGjeek7pYwc2Xi5OMiorq/bpkGdI9Gd6mRqZ0Cuzp0txJeQyaNa/3pAwXb11t06bqWPXvobB/MiYYNxyHmeNfOW0tDCxZNp5EVisW3MK7eK7IaATFhJsRBHlYUsdaHAC+CxDPkrYYkqA1LGdW038W+VdFYWlFNsS1+mh6uazCcppNoz0UMfvfQ3KvRwTgg8jpyXMKjMbOeQiZPkvPy6CMiNkZnXT90WlVBSLNz1ZXDhQR23+7wEu+BFwhJVBmwM9s503qJUX46pw31kFUscMWyVOmOa9TGeHvroHd3vgghsOUkhxcLHXgf/q1SG4Pq4Wcp7B7ZsWCHZuNP7yu6DieckPyg/bFDWcVdQYeb0tBkXNpmqDGiL3JFmcYJyd1PxK6LaJHbwFnxEzKitYbjjxKIoBH3/laNvuOU/UKoyIGMJrg6PAq74181SvSmZVfDtZnw5xnhe1iy5lP3GhVcZcFwW8n+d9B8AAAD//0VoA+EAAAAGSURBVAMAHgAsSEeS6c4AAAAASUVORK5CYII=\\\" data-latex=\\\"{f(x)}_{min}\\\"/>=f(1)=2，故选B。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"3\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"2\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"6\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"0\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-18 21:08:58');
INSERT INTO `t_text_content` VALUES (39, '{\"titleContent\":\"若方程<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC8AAAAcCAYAAADxyeavAAAEEElEQVR4AeyWd6gVRxSHJw0CCSSkF0hPSAhJCIQQkhBIQiAhjRQSQkJIREVFRRFFQUTFXrBg/UPF/2wIYm/YxYYNbIhdxIK9N/T77r657lv3vvcUvF7Fy/n2nDm7d/e3M2dm9v5wB//uib9dg3dX9vwT9OYMOAJXYAM8BRVlpXpe0d+i9Ce4BGvhMFSUlRIfRb5L8CAsBEcAVzlWk3hFf4PUs7AaKs5qEv84at+BHVXgKstqEv82Ut+CFVBx9Y6mUJP4WO/LuLBUvbsC9eb8aGgKs+E/eAhK2X2c+AKmQhvwv1/h28HXUGcrJT7W+xnutAry7DuSLqGeV/Ag2o2hC7QEReKq2QO02sJwaAK9wBcYjO8GvgSublZK/JP8/UPYCbsga5+TmAD9YRzEkdlGvACawyuQtQYkOoPn430P0LY0cWGxh7pSSvyb3OAl8KbZen+G/DDYDSMhCicMxu4LL9B4HdL2Ko32MBfSIh+mbfntx28BzVGrR9AHBsJK+BSqWSnxH3OVpTMHryBc0f4gcj5Y3/YazaI9QvQi+PBs3fs/z83jvMsvrmAK/4BI4Qfx2g8cnoPW4Cg5L6YQex0usTzxivYtrffNyWXFo71krZuY7yGDy+sb5NyhLTnCgvlS7hmOypJC5trB8nqWpvlTeJ//G34RxI6bRnwe3PVxieWJj/W+kUu2Q9oeo+ESehJvfeOq2Xu0LDeHOS3+UfKWjSOVzpMOcZSX2wDF+xxXMb+xSAVH6gKB5YxLLE+8FyhgHZcchX/gS9AuczgH5uMQ0yyYpeJw21tDyPhAXMF8jqLc8I4XMsnBnKPsSG1NUsH7/0L8CZjHBeeQozrLRsSbxjj62BPWpjf/jBNOJlw4FkJYDy55Qlg0//cvLVegyfi0OVIK9+V9uXjOklG8o7w3JjNeDfXJLYWZULQ88fuqzp7AWyKuLnuINWu2H4GT0ZciLJh1PopoKLiOpwWSCtbyGILX4GnQnJCuVs/TWAO+IO46+5nMR9AI0qMW8sTbawO48H9wTbYnfTjNgrl8fk9kObkr9iDuCl6v8IvEeTaCpPftie8AHcFJigt5kz/wczTduX8njvsCYWJ54k9zqgX8WoWznrCauav+SKY7KPhPvBMu2+Oki+ZL9aXlkmmnNA0hOL+s603ks/YyCXdfd2+FW2JqIp1YnvjkzK0/ujxaDk7UWKrxqa42rWjYMQonDO9zcCHBJVYO8Qo8xOPGg/sELrgy/U2gGL+J0rXsBLUUm3HeF3M0ZRJtNzJcYuUQ7xeku6gfcW40Ptnhd55YPmNNpHBRaEzbF8wynXzRyiHeD7eJPNERaIi3V//C+3HXCe9cwN24lUO867fbvRuYn8LWsatHbRO81rcph/haRdzsBVcBAAD//+HNbtsAAAAGSURBVAMAkLXFOSE/HTIAAAAASUVORK5CYII=\\\" data-latex=\\\"{log}_{2}\\\"/>x+<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAdCAYAAABbjRdIAAACC0lEQVR4AeyVSyilYRzGz0xzbaZmmmY2s5lZTdPMNGWBkrJgQbJiQ7mW3KVEUZQNSikllEvIQhQLWYqUFAuysWBBkpCFXHKN3yN9vY73HOc7YXX0/L7/e386//fipecZ/0Jmj5LsUBqfPI1/cBiCHliGWYiHF2DqNZVaaIY5yIA+0LwyoiNfexbNiCLIhhz4B4MwBhVgGmZRP4BymId2GIEoiIR3cCOb2Sd68qARjkC65NMGo9AAcSC94aO+fuJb+AkzMAG/IRVO4EY2s3B6tmEDTJ1TGQDNSSJKZ3yUrj3idwiDaTiEe9JE78b/NCglrcRXYGqTyjFozEeiKaX6Mw36VQRPIp+/4MhmtkLvKdik8dovpfeCATGgNJUSlbJ9orKidGZS3gVHmuxUbgs6BNrUYupakODoF6X3oIMgkzXKk/ANlmAKKqH+lh2iI5uZ0+lVkEk6bVugvSN41vkkQA3o4OjX5VNOg0W4IzdmycyMhRJYBdcK1CyClZsgF3SHCO4ViNkPlu2EKtDLcEUMSg+ZfWFVXYE6Yi8EbcRcjz8zvSRdDOoAM3U6qToIH2h3JV9melyrWUlP1DjR1FcqevN83UW67bKZyaiF4Xoh9CKkUDbRPdLD630HGeZfNjP9iyhgWiEMW9DRX6DdtWxm3ayiJ8kf5h4yPDDZzAKbGcSokFkQSbs/5VnTeA0AAP//HeHdqAAAAAZJREFUAwBoj1k7eOvnBgAAAABJRU5ErkJggg==\\\" data-latex=\\\"{2}^{x}\\\"/>-a=0在区间[1,2]内有解，则实数a的取值范围是（）\",\"analyze\":\"<p class=\\\"ueditor-p\\\">由原方程可知<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC8AAAAcCAYAAADxyeavAAAEEElEQVR4AeyWd6gVRxSHJw0CCSSkF0hPSAhJCIQQkhBIQiAhjRQSQkJIREVFRRFFQUTFXrBg/UPF/2wIYm/YxYYNbIhdxIK9N/T77r657lv3vvcUvF7Fy/n2nDm7d/e3M2dm9v5wB//uib9dg3dX9vwT9OYMOAJXYAM8BRVlpXpe0d+i9Ce4BGvhMFSUlRIfRb5L8CAsBEcAVzlWk3hFf4PUs7AaKs5qEv84at+BHVXgKstqEv82Ut+CFVBx9Y6mUJP4WO/LuLBUvbsC9eb8aGgKs+E/eAhK2X2c+AKmQhvwv1/h28HXUGcrJT7W+xnutAry7DuSLqGeV/Ag2o2hC7QEReKq2QO02sJwaAK9wBcYjO8GvgSublZK/JP8/UPYCbsga5+TmAD9YRzEkdlGvACawyuQtQYkOoPn430P0LY0cWGxh7pSSvyb3OAl8KbZen+G/DDYDSMhCicMxu4LL9B4HdL2Ko32MBfSIh+mbfntx28BzVGrR9AHBsJK+BSqWSnxH3OVpTMHryBc0f4gcj5Y3/YazaI9QvQi+PBs3fs/z83jvMsvrmAK/4BI4Qfx2g8cnoPW4Cg5L6YQex0usTzxivYtrffNyWXFo71krZuY7yGDy+sb5NyhLTnCgvlS7hmOypJC5trB8nqWpvlTeJ//G34RxI6bRnwe3PVxieWJj/W+kUu2Q9oeo+ESehJvfeOq2Xu0LDeHOS3+UfKWjSOVzpMOcZSX2wDF+xxXMb+xSAVH6gKB5YxLLE+8FyhgHZcchX/gS9AuczgH5uMQ0yyYpeJw21tDyPhAXMF8jqLc8I4XMsnBnKPsSG1NUsH7/0L8CZjHBeeQozrLRsSbxjj62BPWpjf/jBNOJlw4FkJYDy55Qlg0//cvLVegyfi0OVIK9+V9uXjOklG8o7w3JjNeDfXJLYWZULQ88fuqzp7AWyKuLnuINWu2H4GT0ZciLJh1PopoKLiOpwWSCtbyGILX4GnQnJCuVs/TWAO+IO46+5nMR9AI0qMW8sTbawO48H9wTbYnfTjNgrl8fk9kObkr9iDuCl6v8IvEeTaCpPftie8AHcFJigt5kz/wczTduX8njvsCYWJ54k9zqgX8WoWznrCauav+SKY7KPhPvBMu2+Oki+ZL9aXlkmmnNA0hOL+s603ks/YyCXdfd2+FW2JqIp1YnvjkzK0/ujxaDk7UWKrxqa42rWjYMQonDO9zcCHBJVYO8Qo8xOPGg/sELrgy/U2gGL+J0rXsBLUUm3HeF3M0ZRJtNzJcYuUQ7xeku6gfcW40Ptnhd55YPmNNpHBRaEzbF8wynXzRyiHeD7eJPNERaIi3V//C+3HXCe9cwN24lUO867fbvRuYn8LWsatHbRO81rcph/haRdzsBVcBAAD//+HNbtsAAAAGSURBVAMAkLXFOSE/HTIAAAAASUVORK5CYII=\\\" data-latex=\\\"{log}_{2}\\\"/>x+<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAdCAYAAABbjRdIAAACC0lEQVR4AeyVSyilYRzGz0xzbaZmmmY2s5lZTdPMNGWBkrJgQbJiQ7mW3KVEUZQNSikllEvIQhQLWYqUFAuysWBBkpCFXHKN3yN9vY73HOc7YXX0/L7/e386//fipecZ/0Jmj5LsUBqfPI1/cBiCHliGWYiHF2DqNZVaaIY5yIA+0LwyoiNfexbNiCLIhhz4B4MwBhVgGmZRP4BymId2GIEoiIR3cCOb2Sd68qARjkC65NMGo9AAcSC94aO+fuJb+AkzMAG/IRVO4EY2s3B6tmEDTJ1TGQDNSSJKZ3yUrj3idwiDaTiEe9JE78b/NCglrcRXYGqTyjFozEeiKaX6Mw36VQRPIp+/4MhmtkLvKdik8dovpfeCATGgNJUSlbJ9orKidGZS3gVHmuxUbgs6BNrUYupakODoF6X3oIMgkzXKk/ANlmAKKqH+lh2iI5uZ0+lVkEk6bVugvSN41vkkQA3o4OjX5VNOg0W4IzdmycyMhRJYBdcK1CyClZsgF3SHCO4ViNkPlu2EKtDLcEUMSg+ZfWFVXYE6Yi8EbcRcjz8zvSRdDOoAM3U6qToIH2h3JV9melyrWUlP1DjR1FcqevN83UW67bKZyaiF4Xoh9CKkUDbRPdLD630HGeZfNjP9iyhgWiEMW9DRX6DdtWxm3ayiJ8kf5h4yPDDZzAKbGcSokFkQSbs/5VnTeA0AAP//HeHdqAAAAAZJREFUAwBoj1k7eOvnBgAAAABJRU5ErkJggg==\\\" data-latex=\\\"{2}^{x}\\\"/>=a在[1,2]内有解，设y=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC8AAAAcCAYAAADxyeavAAAEEElEQVR4AeyWd6gVRxSHJw0CCSSkF0hPSAhJCIQQkhBIQiAhjRQSQkJIREVFRRFFQUTFXrBg/UPF/2wIYm/YxYYNbIhdxIK9N/T77r657lv3vvcUvF7Fy/n2nDm7d/e3M2dm9v5wB//uib9dg3dX9vwT9OYMOAJXYAM8BRVlpXpe0d+i9Ce4BGvhMFSUlRIfRb5L8CAsBEcAVzlWk3hFf4PUs7AaKs5qEv84at+BHVXgKstqEv82Ut+CFVBx9Y6mUJP4WO/LuLBUvbsC9eb8aGgKs+E/eAhK2X2c+AKmQhvwv1/h28HXUGcrJT7W+xnutAry7DuSLqGeV/Ag2o2hC7QEReKq2QO02sJwaAK9wBcYjO8GvgSublZK/JP8/UPYCbsga5+TmAD9YRzEkdlGvACawyuQtQYkOoPn430P0LY0cWGxh7pSSvyb3OAl8KbZen+G/DDYDSMhCicMxu4LL9B4HdL2Ko32MBfSIh+mbfntx28BzVGrR9AHBsJK+BSqWSnxH3OVpTMHryBc0f4gcj5Y3/YazaI9QvQi+PBs3fs/z83jvMsvrmAK/4BI4Qfx2g8cnoPW4Cg5L6YQex0usTzxivYtrffNyWXFo71krZuY7yGDy+sb5NyhLTnCgvlS7hmOypJC5trB8nqWpvlTeJ//G34RxI6bRnwe3PVxieWJj/W+kUu2Q9oeo+ESehJvfeOq2Xu0LDeHOS3+UfKWjSOVzpMOcZSX2wDF+xxXMb+xSAVH6gKB5YxLLE+8FyhgHZcchX/gS9AuczgH5uMQ0yyYpeJw21tDyPhAXMF8jqLc8I4XMsnBnKPsSG1NUsH7/0L8CZjHBeeQozrLRsSbxjj62BPWpjf/jBNOJlw4FkJYDy55Qlg0//cvLVegyfi0OVIK9+V9uXjOklG8o7w3JjNeDfXJLYWZULQ88fuqzp7AWyKuLnuINWu2H4GT0ZciLJh1PopoKLiOpwWSCtbyGILX4GnQnJCuVs/TWAO+IO46+5nMR9AI0qMW8sTbawO48H9wTbYnfTjNgrl8fk9kObkr9iDuCl6v8IvEeTaCpPftie8AHcFJigt5kz/wczTduX8njvsCYWJ54k9zqgX8WoWznrCauav+SKY7KPhPvBMu2+Oki+ZL9aXlkmmnNA0hOL+s603ks/YyCXdfd2+FW2JqIp1YnvjkzK0/ujxaDk7UWKrxqa42rWjYMQonDO9zcCHBJVYO8Qo8xOPGg/sELrgy/U2gGL+J0rXsBLUUm3HeF3M0ZRJtNzJcYuUQ7xeku6gfcW40Ptnhd55YPmNNpHBRaEzbF8wynXzRyiHeD7eJPNERaIi3V//C+3HXCe9cwN24lUO867fbvRuYn8LWsatHbRO81rcph/haRdzsBVcBAAD//+HNbtsAAAAGSURBVAMAkLXFOSE/HTIAAAAASUVORK5CYII=\\\" data-latex=\\\"{log}_{2}\\\"/>x+<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAdCAYAAABbjRdIAAACC0lEQVR4AeyVSyilYRzGz0xzbaZmmmY2s5lZTdPMNGWBkrJgQbJiQ7mW3KVEUZQNSikllEvIQhQLWYqUFAuysWBBkpCFXHKN3yN9vY73HOc7YXX0/L7/e386//fipecZ/0Jmj5LsUBqfPI1/cBiCHliGWYiHF2DqNZVaaIY5yIA+0LwyoiNfexbNiCLIhhz4B4MwBhVgGmZRP4BymId2GIEoiIR3cCOb2Sd68qARjkC65NMGo9AAcSC94aO+fuJb+AkzMAG/IRVO4EY2s3B6tmEDTJ1TGQDNSSJKZ3yUrj3idwiDaTiEe9JE78b/NCglrcRXYGqTyjFozEeiKaX6Mw36VQRPIp+/4MhmtkLvKdik8dovpfeCATGgNJUSlbJ9orKidGZS3gVHmuxUbgs6BNrUYupakODoF6X3oIMgkzXKk/ANlmAKKqH+lh2iI5uZ0+lVkEk6bVugvSN41vkkQA3o4OjX5VNOg0W4IzdmycyMhRJYBdcK1CyClZsgF3SHCO4ViNkPlu2EKtDLcEUMSg+ZfWFVXYE6Yi8EbcRcjz8zvSRdDOoAM3U6qToIH2h3JV9melyrWUlP1DjR1FcqevN83UW67bKZyaiF4Xoh9CKkUDbRPdLD630HGeZfNjP9iyhgWiEMW9DRX6DdtWxm3ayiJ8kf5h4yPDDZzAKbGcSokFkQSbs/5VnTeA0AAP//HeHdqAAAAAZJREFUAwBoj1k7eOvnBgAAAABJRU5ErkJggg==\\\" data-latex=\\\"{2}^{x}\\\"/>，只需求出其值域，即可得到实数a的取值范围。因为方程<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC8AAAAcCAYAAADxyeavAAAEEElEQVR4AeyWd6gVRxSHJw0CCSSkF0hPSAhJCIQQkhBIQiAhjRQSQkJIREVFRRFFQUTFXrBg/UPF/2wIYm/YxYYNbIhdxIK9N/T77r657lv3vvcUvF7Fy/n2nDm7d/e3M2dm9v5wB//uib9dg3dX9vwT9OYMOAJXYAM8BRVlpXpe0d+i9Ce4BGvhMFSUlRIfRb5L8CAsBEcAVzlWk3hFf4PUs7AaKs5qEv84at+BHVXgKstqEv82Ut+CFVBx9Y6mUJP4WO/LuLBUvbsC9eb8aGgKs+E/eAhK2X2c+AKmQhvwv1/h28HXUGcrJT7W+xnutAry7DuSLqGeV/Ag2o2hC7QEReKq2QO02sJwaAK9wBcYjO8GvgSublZK/JP8/UPYCbsga5+TmAD9YRzEkdlGvACawyuQtQYkOoPn430P0LY0cWGxh7pSSvyb3OAl8KbZen+G/DDYDSMhCicMxu4LL9B4HdL2Ko32MBfSIh+mbfntx28BzVGrR9AHBsJK+BSqWSnxH3OVpTMHryBc0f4gcj5Y3/YazaI9QvQi+PBs3fs/z83jvMsvrmAK/4BI4Qfx2g8cnoPW4Cg5L6YQex0usTzxivYtrffNyWXFo71krZuY7yGDy+sb5NyhLTnCgvlS7hmOypJC5trB8nqWpvlTeJ//G34RxI6bRnwe3PVxieWJj/W+kUu2Q9oeo+ESehJvfeOq2Xu0LDeHOS3+UfKWjSOVzpMOcZSX2wDF+xxXMb+xSAVH6gKB5YxLLE+8FyhgHZcchX/gS9AuczgH5uMQ0yyYpeJw21tDyPhAXMF8jqLc8I4XMsnBnKPsSG1NUsH7/0L8CZjHBeeQozrLRsSbxjj62BPWpjf/jBNOJlw4FkJYDy55Qlg0//cvLVegyfi0OVIK9+V9uXjOklG8o7w3JjNeDfXJLYWZULQ88fuqzp7AWyKuLnuINWu2H4GT0ZciLJh1PopoKLiOpwWSCtbyGILX4GnQnJCuVs/TWAO+IO46+5nMR9AI0qMW8sTbawO48H9wTbYnfTjNgrl8fk9kObkr9iDuCl6v8IvEeTaCpPftie8AHcFJigt5kz/wczTduX8njvsCYWJ54k9zqgX8WoWznrCauav+SKY7KPhPvBMu2+Oki+ZL9aXlkmmnNA0hOL+s603ks/YyCXdfd2+FW2JqIp1YnvjkzK0/ujxaDk7UWKrxqa42rWjYMQonDO9zcCHBJVYO8Qo8xOPGg/sELrgy/U2gGL+J0rXsBLUUm3HeF3M0ZRJtNzJcYuUQ7xeku6gfcW40Ptnhd55YPmNNpHBRaEzbF8wynXzRyiHeD7eJPNERaIi3V//C+3HXCe9cwN24lUO867fbvRuYn8LWsatHbRO81rcph/haRdzsBVcBAAD//+HNbtsAAAAGSURBVAMAkLXFOSE/HTIAAAAASUVORK5CYII=\\\" data-latex=\\\"{log}_{2}\\\"/>x+<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAdCAYAAABbjRdIAAACC0lEQVR4AeyVSyilYRzGz0xzbaZmmmY2s5lZTdPMNGWBkrJgQbJiQ7mW3KVEUZQNSikllEvIQhQLWYqUFAuysWBBkpCFXHKN3yN9vY73HOc7YXX0/L7/e386//fipecZ/0Jmj5LsUBqfPI1/cBiCHliGWYiHF2DqNZVaaIY5yIA+0LwyoiNfexbNiCLIhhz4B4MwBhVgGmZRP4BymId2GIEoiIR3cCOb2Sd68qARjkC65NMGo9AAcSC94aO+fuJb+AkzMAG/IRVO4EY2s3B6tmEDTJ1TGQDNSSJKZ3yUrj3idwiDaTiEe9JE78b/NCglrcRXYGqTyjFozEeiKaX6Mw36VQRPIp+/4MhmtkLvKdik8dovpfeCATGgNJUSlbJ9orKidGZS3gVHmuxUbgs6BNrUYupakODoF6X3oIMgkzXKk/ANlmAKKqH+lh2iI5uZ0+lVkEk6bVugvSN41vkkQA3o4OjX5VNOg0W4IzdmycyMhRJYBdcK1CyClZsgF3SHCO4ViNkPlu2EKtDLcEUMSg+ZfWFVXYE6Yi8EbcRcjz8zvSRdDOoAM3U6qToIH2h3JV9melyrWUlP1DjR1FcqevN83UW67bKZyaiF4Xoh9CKkUDbRPdLD630HGeZfNjP9iyhgWiEMW9DRX6DdtWxm3ayiJ8kf5h4yPDDZzAKbGcSokFkQSbs/5VnTeA0AAP//HeHdqAAAAAZJREFUAwBoj1k7eOvnBgAAAABJRU5ErkJggg==\\\" data-latex=\\\"{2}^{x}\\\"/>-a=0在区间[1,2]内有解，所以<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC8AAAAcCAYAAADxyeavAAAEEElEQVR4AeyWd6gVRxSHJw0CCSSkF0hPSAhJCIQQkhBIQiAhjRQSQkJIREVFRRFFQUTFXrBg/UPF/2wIYm/YxYYNbIhdxIK9N/T77r657lv3vvcUvF7Fy/n2nDm7d/e3M2dm9v5wB//uib9dg3dX9vwT9OYMOAJXYAM8BRVlpXpe0d+i9Ce4BGvhMFSUlRIfRb5L8CAsBEcAVzlWk3hFf4PUs7AaKs5qEv84at+BHVXgKstqEv82Ut+CFVBx9Y6mUJP4WO/LuLBUvbsC9eb8aGgKs+E/eAhK2X2c+AKmQhvwv1/h28HXUGcrJT7W+xnutAry7DuSLqGeV/Ag2o2hC7QEReKq2QO02sJwaAK9wBcYjO8GvgSublZK/JP8/UPYCbsga5+TmAD9YRzEkdlGvACawyuQtQYkOoPn430P0LY0cWGxh7pSSvyb3OAl8KbZen+G/DDYDSMhCicMxu4LL9B4HdL2Ko32MBfSIh+mbfntx28BzVGrR9AHBsJK+BSqWSnxH3OVpTMHryBc0f4gcj5Y3/YazaI9QvQi+PBs3fs/z83jvMsvrmAK/4BI4Qfx2g8cnoPW4Cg5L6YQex0usTzxivYtrffNyWXFo71krZuY7yGDy+sb5NyhLTnCgvlS7hmOypJC5trB8nqWpvlTeJ//G34RxI6bRnwe3PVxieWJj/W+kUu2Q9oeo+ESehJvfeOq2Xu0LDeHOS3+UfKWjSOVzpMOcZSX2wDF+xxXMb+xSAVH6gKB5YxLLE+8FyhgHZcchX/gS9AuczgH5uMQ0yyYpeJw21tDyPhAXMF8jqLc8I4XMsnBnKPsSG1NUsH7/0L8CZjHBeeQozrLRsSbxjj62BPWpjf/jBNOJlw4FkJYDy55Qlg0//cvLVegyfi0OVIK9+V9uXjOklG8o7w3JjNeDfXJLYWZULQ88fuqzp7AWyKuLnuINWu2H4GT0ZciLJh1PopoKLiOpwWSCtbyGILX4GnQnJCuVs/TWAO+IO46+5nMR9AI0qMW8sTbawO48H9wTbYnfTjNgrl8fk9kObkr9iDuCl6v8IvEeTaCpPftie8AHcFJigt5kz/wczTduX8njvsCYWJ54k9zqgX8WoWznrCauav+SKY7KPhPvBMu2+Oki+ZL9aXlkmmnNA0hOL+s603ks/YyCXdfd2+FW2JqIp1YnvjkzK0/ujxaDk7UWKrxqa42rWjYMQonDO9zcCHBJVYO8Qo8xOPGg/sELrgy/U2gGL+J0rXsBLUUm3HeF3M0ZRJtNzJcYuUQ7xeku6gfcW40Ptnhd55YPmNNpHBRaEzbF8wynXzRyiHeD7eJPNERaIi3V//C+3HXCe9cwN24lUO867fbvRuYn8LWsatHbRO81rcph/haRdzsBVcBAAD//+HNbtsAAAAGSURBVAMAkLXFOSE/HTIAAAAASUVORK5CYII=\\\" data-latex=\\\"{log}_{2}\\\"/>x+<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAdCAYAAABbjRdIAAACC0lEQVR4AeyVSyilYRzGz0xzbaZmmmY2s5lZTdPMNGWBkrJgQbJiQ7mW3KVEUZQNSikllEvIQhQLWYqUFAuysWBBkpCFXHKN3yN9vY73HOc7YXX0/L7/e386//fipecZ/0Jmj5LsUBqfPI1/cBiCHliGWYiHF2DqNZVaaIY5yIA+0LwyoiNfexbNiCLIhhz4B4MwBhVgGmZRP4BymId2GIEoiIR3cCOb2Sd68qARjkC65NMGo9AAcSC94aO+fuJb+AkzMAG/IRVO4EY2s3B6tmEDTJ1TGQDNSSJKZ3yUrj3idwiDaTiEe9JE78b/NCglrcRXYGqTyjFozEeiKaX6Mw36VQRPIp+/4MhmtkLvKdik8dovpfeCATGgNJUSlbJ9orKidGZS3gVHmuxUbgs6BNrUYupakODoF6X3oIMgkzXKk/ANlmAKKqH+lh2iI5uZ0+lVkEk6bVugvSN41vkkQA3o4OjX5VNOg0W4IzdmycyMhRJYBdcK1CyClZsgF3SHCO4ViNkPlu2EKtDLcEUMSg+ZfWFVXYE6Yi8EbcRcjz8zvSRdDOoAM3U6qToIH2h3JV9melyrWUlP1DjR1FcqevN83UW67bKZyaiF4Xoh9CKkUDbRPdLD630HGeZfNjP9iyhgWiEMW9DRX6DdtWxm3ayiJ8kf5h4yPDDZzAKbGcSokFkQSbs/5VnTeA0AAP//HeHdqAAAAAZJREFUAwBoj1k7eOvnBgAAAABJRU5ErkJggg==\\\" data-latex=\\\"{2}^{x}\\\"/>=a在[1,2]内有解。设y=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAC8AAAAcCAYAAADxyeavAAAEEElEQVR4AeyWd6gVRxSHJw0CCSSkF0hPSAhJCIQQkhBIQiAhjRQSQkJIREVFRRFFQUTFXrBg/UPF/2wIYm/YxYYNbIhdxIK9N/T77r657lv3vvcUvF7Fy/n2nDm7d/e3M2dm9v5wB//uib9dg3dX9vwT9OYMOAJXYAM8BRVlpXpe0d+i9Ce4BGvhMFSUlRIfRb5L8CAsBEcAVzlWk3hFf4PUs7AaKs5qEv84at+BHVXgKstqEv82Ut+CFVBx9Y6mUJP4WO/LuLBUvbsC9eb8aGgKs+E/eAhK2X2c+AKmQhvwv1/h28HXUGcrJT7W+xnutAry7DuSLqGeV/Ag2o2hC7QEReKq2QO02sJwaAK9wBcYjO8GvgSublZK/JP8/UPYCbsga5+TmAD9YRzEkdlGvACawyuQtQYkOoPn430P0LY0cWGxh7pSSvyb3OAl8KbZen+G/DDYDSMhCicMxu4LL9B4HdL2Ko32MBfSIh+mbfntx28BzVGrR9AHBsJK+BSqWSnxH3OVpTMHryBc0f4gcj5Y3/YazaI9QvQi+PBs3fs/z83jvMsvrmAK/4BI4Qfx2g8cnoPW4Cg5L6YQex0usTzxivYtrffNyWXFo71krZuY7yGDy+sb5NyhLTnCgvlS7hmOypJC5trB8nqWpvlTeJ//G34RxI6bRnwe3PVxieWJj/W+kUu2Q9oeo+ESehJvfeOq2Xu0LDeHOS3+UfKWjSOVzpMOcZSX2wDF+xxXMb+xSAVH6gKB5YxLLE+8FyhgHZcchX/gS9AuczgH5uMQ0yyYpeJw21tDyPhAXMF8jqLc8I4XMsnBnKPsSG1NUsH7/0L8CZjHBeeQozrLRsSbxjj62BPWpjf/jBNOJlw4FkJYDy55Qlg0//cvLVegyfi0OVIK9+V9uXjOklG8o7w3JjNeDfXJLYWZULQ88fuqzp7AWyKuLnuINWu2H4GT0ZciLJh1PopoKLiOpwWSCtbyGILX4GnQnJCuVs/TWAO+IO46+5nMR9AI0qMW8sTbawO48H9wTbYnfTjNgrl8fk9kObkr9iDuCl6v8IvEeTaCpPftie8AHcFJigt5kz/wczTduX8njvsCYWJ54k9zqgX8WoWznrCauav+SKY7KPhPvBMu2+Oki+ZL9aXlkmmnNA0hOL+s603ks/YyCXdfd2+FW2JqIp1YnvjkzK0/ujxaDk7UWKrxqa42rWjYMQonDO9zcCHBJVYO8Qo8xOPGg/sELrgy/U2gGL+J0rXsBLUUm3HeF3M0ZRJtNzJcYuUQ7xeku6gfcW40Ptnhd55YPmNNpHBRaEzbF8wynXzRyiHeD7eJPNERaIi3V//C+3HXCe9cwN24lUO867fbvRuYn8LWsatHbRO81rcph/haRdzsBVcBAAD//+HNbtsAAAAGSURBVAMAkLXFOSE/HTIAAAAASUVORK5CYII=\\\" data-latex=\\\"{log}_{2}\\\"/>x+<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAdCAYAAABbjRdIAAACC0lEQVR4AeyVSyilYRzGz0xzbaZmmmY2s5lZTdPMNGWBkrJgQbJiQ7mW3KVEUZQNSikllEvIQhQLWYqUFAuysWBBkpCFXHKN3yN9vY73HOc7YXX0/L7/e386//fipecZ/0Jmj5LsUBqfPI1/cBiCHliGWYiHF2DqNZVaaIY5yIA+0LwyoiNfexbNiCLIhhz4B4MwBhVgGmZRP4BymId2GIEoiIR3cCOb2Sd68qARjkC65NMGo9AAcSC94aO+fuJb+AkzMAG/IRVO4EY2s3B6tmEDTJ1TGQDNSSJKZ3yUrj3idwiDaTiEe9JE78b/NCglrcRXYGqTyjFozEeiKaX6Mw36VQRPIp+/4MhmtkLvKdik8dovpfeCATGgNJUSlbJ9orKidGZS3gVHmuxUbgs6BNrUYupakODoF6X3oIMgkzXKk/ANlmAKKqH+lh2iI5uZ0+lVkEk6bVugvSN41vkkQA3o4OjX5VNOg0W4IzdmycyMhRJYBdcK1CyClZsgF3SHCO4ViNkPlu2EKtDLcEUMSg+ZfWFVXYE6Yi8EbcRcjz8zvSRdDOoAM3U6qToIH2h3JV9melyrWUlP1DjR1FcqevN83UW67bKZyaiF4Xoh9CKkUDbRPdLD630HGeZfNjP9iyhgWiEMW9DRX6DdtWxm3ayiJ8kf5h4yPDDZzAKbGcSokFkQSbs/5VnTeA0AAP//HeHdqAAAAAZJREFUAwBoj1k7eOvnBgAAAABJRU5ErkJggg==\\\" data-latex=\\\"{2}^{x}\\\"/>，则函数在(0,+<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAZCAYAAAAiwE4nAAACDElEQVR4AezUy8tNURjH8XWIAUVEIrmUEhkYmZkYkaIkKcotEyV38hfInZSJ3IqSpCgxMjEzMhAp5ZJIRBQDcvn8znE63rPPeeut0zs6p993/dZ+1trPs87aa+8RZZh//YI93/D+lva3dMg70O3QjJPpML7jD37gIuaik6YKHscHvMVrnELysJY6FZxs+BZmYRHm4yo24gl2YCSaWqbzCB+Re6bxmbiPG8hiWEPtBWvCB3EXa/EYT7EZuWYlK99TSsnc5aWUK9iGQ/iGKLtyW+c8diNzWSntBbO6bNtlo7mJ1ZX+db0shpUk36tzDNn6m7yT7glOR/KyasHZovlX73m7UvSk4DlkoUf4c5xBxlhFX0TyPJNXt1pwgugndNNPA/vwANF4zWgMpuRL3vqcrLTe+dd85hMxmHJis/LMWaw5ilHopuRL3vp4e8EXojOQlbOKaiLbMQf78RtbsQsZYwM0xdUCJC8rlUOTd+iNkaXopFWCB9A8MP8fojXiNTSV/gYXz5C8rFQK5uGfMLIFK1BDNFaT5Gf5etxB5uZl36kfXdNcwDzkX+U672hOdOYKl0rBBN9pVmMJXiGre8knYSHyjrK6fmlPIx+HS3wd8nF4yHPPSp6vD2uo/Rk2oqV81cnK8zzzDuXrk5c9izFUUbZtk2hObI2PQbY+eXRb6lawNaPHvX7BHm9oKX8BAAD//8tYz+sAAAAGSURBVAMAJLlcM/pj5dYAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\infty \\\"/>)上是增函数，所以当x<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAZCAYAAAArK+5dAAABGUlEQVR4AeyUP+tBURjHf38oAynZJYPsJmUyEq+BxUQpsxh4A/JK/BtsyoKXYaCklEFRfJ6y4Nxz77nY6Pu5D6fu93s857n37+fDn2+AbYO/LXpbi/5xSsEADnBRUGHtSU7OIMRdIxjfiFF/FXRZe5JdQIQ7piC7jlJ7sAHH0gV4cWnCGkqwA2PpApK4ZaEFe3AlXUAOx8UNijtZBXiwi8MMjuBaVgE+HMPQBtVIqtaMxlR2vcW8A6qRVK0ZjekZ4wlkIAiuZdUiMRxyCUAZZMcUc+kCVtgVoQZVkNcFxUy6AHGac8mDHOCSWgA/OJZdgBjJs5DgSwPqIE/2y1OEz51O/OpDGuQfyJk8YjRF+LxHTlr0UtLHA64AAAD//8tmVbUAAAAGSURBVAMAXRA3M7z03kMAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\in \\\"/>[1,2]时，y<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAZCAYAAAArK+5dAAABGUlEQVR4AeyUP+tBURjHf38oAynZJYPsJmUyEq+BxUQpsxh4A/JK/BtsyoKXYaCklEFRfJ6y4Nxz77nY6Pu5D6fu93s857n37+fDn2+AbYO/LXpbi/5xSsEADnBRUGHtSU7OIMRdIxjfiFF/FXRZe5JdQIQ7piC7jlJ7sAHH0gV4cWnCGkqwA2PpApK4ZaEFe3AlXUAOx8UNijtZBXiwi8MMjuBaVgE+HMPQBtVIqtaMxlR2vcW8A6qRVK0ZjekZ4wlkIAiuZdUiMRxyCUAZZMcUc+kCVtgVoQZVkNcFxUy6AHGac8mDHOCSWgA/OJZdgBjJs5DgSwPqIE/2y1OEz51O/OpDGuQfyJk8YjRF+LxHTlr0UtLHA64AAAD//8tmVbUAAAAGSURBVAMAXRA3M7z03kMAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\in \\\"/>[2,5]，故a<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAZCAYAAAArK+5dAAABGUlEQVR4AeyUP+tBURjHf38oAynZJYPsJmUyEq+BxUQpsxh4A/JK/BtsyoKXYaCklEFRfJ6y4Nxz77nY6Pu5D6fu93s857n37+fDn2+AbYO/LXpbi/5xSsEADnBRUGHtSU7OIMRdIxjfiFF/FXRZe5JdQIQ7piC7jlJ7sAHH0gV4cWnCGkqwA2PpApK4ZaEFe3AlXUAOx8UNijtZBXiwi8MMjuBaVgE+HMPQBtVIqtaMxlR2vcW8A6qRVK0ZjekZ4wlkIAiuZdUiMRxyCUAZZMcUc+kCVtgVoQZVkNcFxUy6AHGac8mDHOCSWgA/OJZdgBjJs5DgSwPqIE/2y1OEz51O/OpDGuQfyJk8YjRF+LxHTlr0UtLHA64AAAD//8tmVbUAAAAGSURBVAMAXRA3M7z03kMAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\in \\\"/>[2,5]，选C。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"[2,3]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"[2,4]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"[2,5]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"[2,6]\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 21:30:46');
INSERT INTO `t_text_content` VALUES (40, '{\"titleContent\":\"已知函数y=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAdCAYAAAC5UQwxAAABt0lEQVR4AeyUzStEURjGke8UGxtZWFgoEhtKyspCNhYkykcpWUmUJKQIK1tS5GNJ/gOR2LCRYmHFEikipMTvmcatuXPv3HPqYjPT85t37rnve545773npKX88SdpGHrDky3915am4j4Dw+BWBgNTsAgn0A0bsAZD4MjmGdZQJTNNzs8Y9XL1DCNwCkuwC3VQC9kQkalhHtnTkAtuZTLwCZuQBSVwDHtQBh3wDhGZGraTfQmv4NYHA2rdA7EIquEQXiBOJoalVFXCDgSpgoQC0OoIKc18lYOjIEM9Lz30FSq0EkKcGhhRywaJat8T8RbU2h7iPTgKMmwh8wouwE/X3NiHQjiHAxiFuSh3REeJDIvJagS93gRf3XCnCSZhHrTKAWInnEGM/Ay151S0RbZaRAhHfob10emPojG04GWYz+xdsAxfEKq8DFtx0Kmio0pv5w8TjOdAG2hsgagtQDCXl+Eq5VXQ72KW6zfYBt0bIz6ClbwMrSawTbYxVDt1btp6xOSbGKq9avM6lekwDtqbfURrmRhq82pynanan3qLdWTpT/yKofWkiQpMVpio3vpe0tC6ZUEF3wAAAP//J4T3FAAAAAZJREFUAwAGkUI7HJwi1gAAAABJRU5ErkJggg==\\\" data-latex=\\\"{4}^{x}\\\"/>-3·<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAdCAYAAABbjRdIAAACC0lEQVR4AeyVSyilYRzGz0xzbaZmmmY2s5lZTdPMNGWBkrJgQbJiQ7mW3KVEUZQNSikllEvIQhQLWYqUFAuysWBBkpCFXHKN3yN9vY73HOc7YXX0/L7/e386//fipecZ/0Jmj5LsUBqfPI1/cBiCHliGWYiHF2DqNZVaaIY5yIA+0LwyoiNfexbNiCLIhhz4B4MwBhVgGmZRP4BymId2GIEoiIR3cCOb2Sd68qARjkC65NMGo9AAcSC94aO+fuJb+AkzMAG/IRVO4EY2s3B6tmEDTJ1TGQDNSSJKZ3yUrj3idwiDaTiEe9JE78b/NCglrcRXYGqTyjFozEeiKaX6Mw36VQRPIp+/4MhmtkLvKdik8dovpfeCATGgNJUSlbJ9orKidGZS3gVHmuxUbgs6BNrUYupakODoF6X3oIMgkzXKk/ANlmAKKqH+lh2iI5uZ0+lVkEk6bVugvSN41vkkQA3o4OjX5VNOg0W4IzdmycyMhRJYBdcK1CyClZsgF3SHCO4ViNkPlu2EKtDLcEUMSg+ZfWFVXYE6Yi8EbcRcjz8zvSRdDOoAM3U6qToIH2h3JV9melyrWUlP1DjR1FcqevN83UW67bKZyaiF4Xoh9CKkUDbRPdLD630HGeZfNjP9iyhgWiEMW9DRX6DdtWxm3ayiJ8kf5h4yPDDZzAKbGcSokFkQSbs/5VnTeA0AAP//HeHdqAAAAAZJREFUAwBoj1k7eOvnBgAAAABJRU5ErkJggg==\\\" data-latex=\\\"{2}^{x}\\\"/>+3，若其值域为[1,7]，则x可能的取值范围是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"[2,4]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"(-∞,0]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"(0,1)∪[2,4]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"(-∞,0]∪[1,2]\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-18 21:45:34');
INSERT INTO `t_text_content` VALUES (41, '{\"titleContent\":\"<p>设b&gt;a&gt;0，c∈R，则下列不等式中不一定成立的是（）</p>\",\"analyze\":\"<p>略</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAmCAYAAAA1MOAmAAACS0lEQVR4AeyWTShlYRjH78w0HzXTfDXTfDTNTLOZ2cwshogksiL5WlhJkrC0YeNjIykWNliRZGVhIQtZKIWSIkTEwkIkHwsLIYnf3w3nuO+5zsmb1b39f+d5z33f8/zPfc/zvuc+Dj3gJ2bmZ7IfMSgFBuAVRMjmND4n+0t4BkbZNDvGYQ/OwCibZkYD55cxM+dseLVf0PEVPsAXeAIu2ZxGFcgQ2VX+a8SIQrFpRv7osmGmafuDjRd0hWXDTJm0e3ih/ktsmGkhL5PNC7rCsmEWzhQKfaPRCtXQDW/AJZtm+WQehHZQ6WcSXbJp9pHM6XAEu6A1R7iRTbMG0jbCJ/gOI+CSTTMlfsqhDjSVS0SXbJqp9CvIPgpjkAsu3WX2mtHN0As10AHJ0ASqPsK1imgVQxZ0gfZKwo2imf1g2DicQBm0gPa+CaKMfxKd6uMkAcpBldlPdMnLTGtEa+WA0W1wCtI8hw3YhHUIJC+zSrJkQCfIkHCptxz1Z0YPf592IJnMVLolZNmGaXDqPyfvYRL0SiH4l8nsL5f/hlnYAqcSOTmH2zfBV3fLZPaPy1TGc0Tn3b/jPAl0AyvEwDKZaWEq0YwODj7T/gUqEu30ObSrwLdMZnpVKMFVBaqtX5pHw/m8UjlfBN8ymU1xtaotjijJqJCGFqyel/5bqIi0/y3wvW+ZzHa4ugDiQRur1pt2A51rN9GrQ++tHvo1luBPJjNducohG+qhFLRdHRJrIQ30K4eJgeRlFiiJ38ExM78zFXXcPacxau6IzgsAAAD//9oXVaIAAAAGSURBVAMAAuFYTc5E8wMAAAAASUVORK5CYII=\\\" data-latex=\\\"{a}^{\\\\frac {1} {2}}\\\"/>&lt;<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAmCAYAAAAxxTAbAAACWElEQVR4AeyVyytmYRzHzUxza6aZmqa5NTWXmquwkCzIhiKSlcRKFmLBgh2xYSvJwsIfYIONsmKHZOG6cM1CEmKhhJLL54v3dY7zPMd5e09Wr76f83vOeR6/7zm/5/I+TnqAv4SJs8iPuMmGAXgNHoVRrudkfQXPwKgwTE7IvAdnYFQYJsbEzocJE2c1XnDzBd7DZ3gCLoVRLk38EFm1jFeJngUQhgl5/RWPiUr0l/Q26LpWPCbKoN1uQ/1XxGOyRYZFH+i6ls2knG4luSCeQx7YVEBHE/RCLejLCLeymfQx5A+MgcyWiCbpQMynowe6oBq+g0s2Ew36yuU/zIHOJoJHOhz1Mv/o2QfpjS5O/Ex+MfAdjIP2AsEjJS7k6QSkwTqsgEt+JpmM1JxMEe/TNwZoPhqIx+CSzUS1zmKk33zQfaW3XBuhHnS0pBJdspl8YJRqvUYsgw5og2H4DRG9pNEJP6AZWuEQXLKZyOATI1VnTbzetIX7GRgEvQQhSaWpolEMWlklRM0L4VY2Ex12GlXHZQQimqSRDOkQWCYT/V5r0rfJolVDiOrpTctT95vnxmAy+chIve00URNPiCryBafRJwEaJpOf/J+MZonO/aFJlomW9Tx9gWUyUSl0/uhIcSbScZHBg2VYgMAymajuR2TYBadyudEJoDNqh3ZgmUx0fN/9CdWSrSHrKOjwJASXyUTLdIMUKSDpy9ppaE9UEg8gJplMVKYKspSCNmA/UXOQQ9yEmGUyURKtniIaOkq0i7tp60sIsctmEnsmn/9ImPgUx9v1IOW6BAAA//+wapaJAAAABklEQVQDADOuW03WOPX5AAAAAElFTkSuQmCC\\\" data-latex=\\\"{b}^{\\\\frac {1} {2}}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAAkCAYAAABv2tHkAAABZUlEQVR4AeyVOy9EQRiGD0IiolMgERQunUZCoRGJ+ANo0FCoFQoiCnFp0WgUEhr+CFGQCAmNRqHQKMRms5vd551id2fPzGzOZovdZDfvM9/szDfvOfOdW2tUg1/jmLSz2wPYAq982+lgxTpcwyYE5TNJs+oSZPRKDMpnElxUPtk0Ka9IFDVGTaY48RUYhQVYgl6IKbSdB7IvoB/m4Ra+IaaQSSzZN1BzExkmxZycFpkOTTdsJ2CCXKNSk19GThLwRK5RqYkZqKZpmsSrFqpJJ+nHcAdncAO70AWWfCb6VJySqYdvjbgP6k8Ss2DJZzJHlhafE/9BR+8j3kMKLLlMWshYhnd4AWmcpgf0ZBNsuUx01GHS3kB3MSGapfmCH9B7pY1YkMvkj9lP0AcsQxyERXiEIRgBqy4ukxxJKuoYcQf24AoGQNvU1aJblMtEs88003AEG3AIM7AKH2DJZ2IlVfpTPyZ5AAAA//9CQmrwAAAABklEQVQDAK+tN0ntzfUOAAAAAElFTkSuQmCC\\\" data-latex=\\\"\\\\frac {1} {a}\\\"/>-c&gt;<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAkCAYAAACAGLraAAABdklEQVR4AeyVzStEURjGr4+SJMWCsGChFBuyRBaspSzFf8CKjVKU8rmw8y/IypodC2Fhx5YNUcLCRxG/50T3nu55byNTM4uZnt95z9x53mfOPac7Ux7981X8AV3c4QE0QlDWLXTi3oJtaAdTVsAlHTOwBpmyAjKbkh+WAqKoePegnqMahXFohUkYgArwZN3CA649mIIqWIdD+ARPVoBnynqT1wCF/QW3MDW4CUMtzOVIHz6nZMATV1Zy5ASfUzLAXfgZ6qjT8A6bYMoK0Gr26XqGUzBlBaihjaEGrsBUVkAPXXdwDaasgEo6euECHsGUFdBAh1agkEXmO7AMCqbEsgI6sOgh0gnMMt+ACdDPPCWWFSDjPbZd+AI9UE3UZvAUCijDMQg6vhuqpMAXJrfgKRSgo2vBdQxvUA1jcAT6v6DECgWo6feb5exn6AZt5ivVUyjgA8cqjMASzINWcEZNKRQg0znDMCzAEGg/KGlZAWmncaXwAd8AAAD//1Qswl0AAAAGSURBVAMAGy86SSjCnWAAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\frac {1} {b}\\\"/>-c\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACcAAAAkCAYAAAAKNyObAAAD8ElEQVR4AeyYR6gUSxSGry/xIo8HL/CSAXNYKCi6EFFUDKCiYMK0EXFhBHNAUQyYA6i4ERMKYtgp4kIQxAAqCIoJA4IKImbF/H13rJ5unJ6rM433Lrz835yq6jM1Z6q7Tp25X1XU4L8vwZV6c6pr5f4j4I0wCY7DcvgBEqqO4H4mgrmwGJZBb+gJS+FriJR1cN8z8wpoAGlqyYVv4QaoO7zsgV7wJ0TKOrhvmLke/ARp0mcwFwdB0EMav8FHB+czsIg37II1sB1mQrEP5nKVOozHd7ANVC1emsAZuAaR0lbOZV+NVyMYDnPAdmvsa8hS3uauTLgKHkCktOA642FQa7HPwNX6G3sMnkNW+pWJ3BgrsXshoULBucwD8boAZ0G57L/TcNtjIvWgZUoI+GXaMDYbwph2Mn03CyaSd8fADjLiJnqLTahQcK6SD/U5PMMyd6J9E+7CAAhbfj/tUTHG0j4J8yE+bpqIr7gLMA6fixACc17zH0M5FQruCZeuwgt4BXWgP/ihdbENodznrs/7Odxorpi5rztjLyFSoeB0djM0xmsGeIs2Y/8Hb7e7l2bJasU7N4HPmV/ez3tEvzY8hkiFgvOi27odjYUwEhZAexgG3gpMyTrNO81p3to4XRj3rmFySgsud/XTX518Hm+7DGUr6+C8Ra6MQWYanIHWFCq/mMFUNnj5BabUACyjCKOiIh6cOc2kWN0sqYyMl3hwdBMyn5lCzGkdE1c+U6dYcJeI4SjcguuQlTxPzXE+Qp4wO5j4D/hAxYLT2XPSY+uenQywljOx72Yub18/rDlvC9ZjE5NXseDcIJ4S53G3GMRUKZO0hWSao6eApZfntj5WPFtpdACLC0xexYJzqevjat4yf9GsUv/gYWmFKSgrkbZcmQhBfvEf6SSqYPqJ3Wo/jqvmBw1l0FtxAmtRiClZlmF+Ac/rMEkzGj7TYTXp5pRcudxYePUsvU9nDHjG7sNOhQ+eDcZKlSWSj4J1YPjBE82VFpyFoeXzATxPgTIo6zzLG/vl4i2exSRHIJRONPNKC86qtwVuh8CyJgR7hX44N63tLK2sdAPWfRL6Wn305a2RatGaAOZQi85EHcd4pdKC+4urTmDpRLPC36GWUP6+DDWXv5TGczFe8VrrSXxMH31xjdSX1r9ggAbWjXZzSCgtOPOaz5vOBmlN54YwYTpWDv6CM39OZxIDc36rYHMgQ3mlBec33YCbG2A91kQ5BOv5iylZbgDz2jRmeAqmqDdY/yVxG5tQWnC+aR2e/ugYjR0BriamLHnaNGUGVyuO+dR/S3Apr7Tg8h6f1tqJu0cTpnxlHZzJVMqPjBmyDo4ps9M7AAAA//9OJarMAAAABklEQVQDAEu/zkluDA6LAAAAAElFTkSuQmCC\\\" data-latex=\\\"\\\\frac {a+2} {b+2}\\\"/>&gt;<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAAkCAYAAABv2tHkAAAB10lEQVR4AeyVyysFURzHvSUpyoKFkDxLNpJkI38DsmCBjZWSlFdWHlvsyYKNnaWVpVchkreUBWUjeeT9+U5dc6c5Z7h1F9S9fT/n95u5v/OdmTPnnEmIi8IvZuIfxP8xJmnc+AQswTQswBCkg0e2x0mmagpKoB1GQXk18R08spk0UqXOM8Qn0NVziWvwDB6ZTOKpaIEj2AOpjCYb1sEnk4muWkjlAdyB1EBzBbfQDInwLZPJA/9ewAu8QT40wSYUQDF4xsVk8kmRBrWUOAgjMA95oMfU2yJ1ZTLRvzs0tTAOXTAG9dAGx+CRzcRT9NNB1E1kGCnOTaqTk9BkQH8EVFHrKNxEc2KSs79lm1pH4SbOibCmhnwFbkCvm2BWkMkGXQ5BE++aaFWQiaZ/BT1lollMalaQSRZdtPA08TT9OTQryETrRCt319zVPRtkooFNobQPhkF7SSXRJ5tJEpV1cAqdoLVzRuwBn2wmmVSWwyJcgvaPVKIeUQNO6spmok0ph7JVkEKm5xw8gkc2ExncU3kCkjboIhLtJdpvSF3ZTLQNam58UKpPRzdxDkJ3RurKZrJFyTJoQGeJ+9ALr+CTzUTFA1R3QCvoo6VPB6lfNhN/ZcCZv2PyBQAA///fGK6+AAAABklEQVQDAO8eU0mwUEPZAAAAAElFTkSuQmCC\\\" data-latex=\\\"\\\\frac {a} {b}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"a<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAdCAYAAABfeMd1AAAB5klEQVR4AeyVTSgFURiGr99Sys/CStY2RJFYUyjsRLK0pURJkpWU3+zYSKwkPwspKxuFiGyUhWRnYeEvC8Tznsx06547Q2e6q3t7n/OdmXvme8+cme9MZiwFv7RJ/CKXcrAMQ3ACs5AHvlyXK59MEzAFM9AOrTANWWDkalJFlhy4B+mBZgvaoASMXE2yydINXeDpmU4RRGZySLJcWAcpg6YcLuEOjFzvxCSJa7R8TRwvwBMYRWlSQEa9APPEbfAVlYkevgwOyDwH3+ArChM9h34y3oBn0Elf9UOIxcJMMhhVBxugd1+zVbFpaThl1EH7BYugO1DtNNP/AKMgEy2BEu8zUoU2TByBCxgDqZpmBfQcPokyeSGWwSsYJTPRHSjRAKP64BSkGholrCVqxjJUTWh8PI38/wZGyUxUsTLZZNQueKqgUww74M+UfqBsJprhIFdpZqtELQPBSEujPUl1YE78pbGZaLb1XHwNZ+Asm0klWbVVaGt4pO8sm0nhb9Yrot4WgptsJuekDErewP+qFT0buuGymRxx2R60gF4CgpGSetv6OGdUgIRw2UzeuUzfh2PiEvTCKKg+bomqHb8GOA6VzUQXKYmqu4eDNZgE7U/6hgctJcMSlcwkcaTDmbTJvxYvJcv1AwAA///ctlDkAAAABklEQVQDAGgxTDuAntIIAAAAAElFTkSuQmCC\\\" data-latex=\\\"{c}^{2}\\\"/>&lt;b<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAdCAYAAABfeMd1AAAB5klEQVR4AeyVTSgFURiGr99Sys/CStY2RJFYUyjsRLK0pURJkpWU3+zYSKwkPwspKxuFiGyUhWRnYeEvC8Tznsx06547Q2e6q3t7n/OdmXvme8+cme9MZiwFv7RJ/CKXcrAMQ3ACs5AHvlyXK59MEzAFM9AOrTANWWDkalJFlhy4B+mBZgvaoASMXE2yydINXeDpmU4RRGZySLJcWAcpg6YcLuEOjFzvxCSJa7R8TRwvwBMYRWlSQEa9APPEbfAVlYkevgwOyDwH3+ArChM9h34y3oBn0Elf9UOIxcJMMhhVBxugd1+zVbFpaThl1EH7BYugO1DtNNP/AKMgEy2BEu8zUoU2TByBCxgDqZpmBfQcPokyeSGWwSsYJTPRHSjRAKP64BSkGholrCVqxjJUTWh8PI38/wZGyUxUsTLZZNQueKqgUww74M+UfqBsJprhIFdpZqtELQPBSEujPUl1YE78pbGZaLb1XHwNZ+Asm0klWbVVaGt4pO8sm0nhb9Yrot4WgptsJuekDErewP+qFT0buuGymRxx2R60gF4CgpGSetv6OGdUgIRw2UzeuUzfh2PiEvTCKKg+bomqHb8GOA6VzUQXKYmqu4eDNZgE7U/6hgctJcMSlcwkcaTDmbTJvxYvJcv1AwAA///ctlDkAAAABklEQVQDAGgxTDuAntIIAAAAAElFTkSuQmCC\\\" data-latex=\\\"{c}^{2}\\\"/>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-18 21:55:26');
INSERT INTO `t_text_content` VALUES (42, '{\"titleContent\":\"<p>已知a=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAmCAYAAADa8osYAAACf0lEQVR4AeyWOUgdURSGTchKQhKyQao0SQjZqixNmpAUIZAqKZIigWyELFai4FJoo4I2gojgDiIuqIWotaBYCFoqKoKIuICVC4rr9zvozLy5M+/Ne4OV8n/v3Dv3zPmfd+7c+06mHdHfsVHQRJ9iMB8eg0dRTt0rqv+DM+BRVEbXqPwJxsCoqIw+U70dlsCoKIweUvkS9IOvojCapnod3ITzoGk8TXQpCqMVKs7DDlwArT61adqKwkjVdvmYgpfQA9vgUlRGrqKmTqpG9ykaBMOWUjU6QZkgGLaUqtEoZYJg2FKqRqqi/+g7jZ+QB39A1wi2gowekNYKtaBvPUh8C7FFbnDtLyinl/gD9E4RbPkZaZlqg/xGqr7tI2IzdEEmOM0W6T+FAbgL4+DZikxGl0n8DcWwCpLeiwoanVAEb8Cps3TegTbWQuIWuGQyekbGAsyAU5t0GkH3vCc6tUFHL6qeUQtt7X8EW7rJ7lmtJ4QMKAdtJ4RDzdJaA+VcJEo66IZp3AFNmc6jW7RdMhlNkKFvSPBI+Xo+mtKD6dEZ1ESmnpOmXAuoj75LutF1gY4e+DnifzgoRnNf9/jUDj1EXAdJU1pKQ4tFR3kubV0j2DIZ2aPulgy+cGkO9KwIiSuM0QfKvoZ0mIRQStToOVVL4Bd0QGglYnSbqlWQDQ2gs4cQTvGMrlJOy7yAWA9JmXBfWpCRdohqkirBOV1akfrVo2ObocTkZ6QfFzmU0LbTTXTqOp0X4PeuMeSVyUgmZaTqzb9C/BhDFv1liH3HuOQvk9FX0nWmaOtvox2LlvcI10PJZFRDBW0zQTifGenxZTKKf1cSGcdGSUyadcuRTd0eAAAA//9t1kR+AAAABklEQVQDAFy+ZU3onqqhAAAAAElFTkSuQmCC\\\" data-latex=\\\"{2}^{\\\\frac {4} {3}}\\\"/>，b=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAmCAYAAADa8osYAAACqElEQVR4AeyWS6hNURjHj1eeUZKE8hh4hjKQYuhdKDMpiiLyKDIhSiZCeSQGIkqhxEQZkJlXDFAoISMSkvIqit/vnHP32etae599Ors7urf/b3/f3nut73/P2mutvXtWuuiv2yhroBdxYxecho3QAwKVMXSDqLgQTsExWA9jIVAZRn2pOBEmw2dQgz2kKcPI4ksoehdmwBt4CYHKMOooOIbE57Od+BMClWU0hKo7YCsMg+kQqAyj/lQ8AuNgN+yFbxCoDCOHaS1Vl4IzbjnR50RoqAyjRrWcrF2jSdTOg9s1tWvkDpBHzYVju0YvqJEHt2tq16hWpVJxr9vJySbYB30gUJ7RFFpehotwBh6Dm+ZoYloDOHH9vCdeg2VgX0JDWUbzaLINnLYrietgLoyEh+C+RqjqB0e3oAtEN9NPxLcQKGbUjxaazCKOgg65CP1lI7jgVkNI1JtsNrj9HCZ+hUAxoz+0+AITYCik9bt+4nDV02qwz32yzXAA5kOgLKPVtBoIdiYkmlbPbtWjYTiHRzAHvoO/ZjwxUMwoaJA6ceP0QfuMbqaufyQ/CS5c/8HX5JcgUFGjXvRy6vpCW0PuO4hQ1V+OZ8Hnp6ETx1/FpYaaGa2g6SG4B279C4guUEJramZ0lXIuRGfgHvLrcBx8foTiamaUrvSKky2wAXz//Lf6uZ6pVows4rBpuIoTh5JQTDEjX2C/6H4CXIiERF53lrmO3CWSG82SmJEF/IRypnXu73D5fNx23nW+mXceM7pDh3PgduKKJ03kWnHIbnPlORRWzOgZvZ/CQXDdEKpywe4n+wDOQL8VSIspZuQCPEp3d+MrxBtwHvxAfEKcCb4yCMUVM7K3Zg9IXKCLie4GU4l+u/kaIG1NWUatVSnQutuowCDFm3TZ0P0DAAD//y3a7foAAAAGSURBVAMAgIRrTTNj4UgAAAAASUVORK5CYII=\\\" data-latex=\\\"{3}^{\\\\frac {2} {3}}\\\"/>，c=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACUAAAAmCAYAAABDClKtAAADUUlEQVR4AeyXWahNURjHr3kMIWUoQ5JkejEU5QElhQc8SBSS2YOp8CREeBEZMoQ8yJjEm+SJQqIkUxGS8CBDxvj9nM45e++7zrn7PDj7Phx9P9+3hr3Wf6291rfPbVrXCP/VRKV9KVnsVBPEjYVz0B7qWRaiWqGiHbSEoGUh6htK3sNvCFoWooJCopU1UdHdKBdnsVOtEdQDukJ3aAYxy0KUB/0SKkwLT/D1DnwWotBR3qopagBSBpaBppxVU5Qzms1LYfs/qinqMTM+LANNOaumqNyMdXWTCNbCUtgELSBm5UQNoudpOAqu8AbeAd1+wpjZ5wQ1Q8Ar7kTDiC/AfMhbW4KV8AZsm4p3HlzRSonyui6j2zxw0MH4U+BVdpVJYQqZQ/t9+AU/wEVcxB+HvH0lmAwnoQ/4DXyOj1lIVEd6LILt8AU0c8k+Ale3DT8BovaJwjRw5TPxLsJxjhH7LK5gzYlGwyrYBR8hZiFRI+jxFl5C1H5ScIU+M4U4an8ovAZ38iz+AdgfV8/cyZvULgcXPhEfMyeIVVAYCqthL7gqXMGc2Fdgn+APtELPcNCN6tswBnwL7lI/4piFRJn6v8d6FQv29zw5oCsutqSL3tHNY2ASnUv8DDyruKI5SbGUi3wFfjTd3uTEZuU2dLsFfsNwBfMc7afkedyId7LkzfI1e1OP0K64BXh3C1e0kKhiazxSjDfM6+zZirb6KvtS4XU/iN8KTnwVPxIqskpETWfk8bACnkLUFLOZiujhNiU8om4HKBqXztKKcrU7GXIhnIekmRKSV/8zncxbHurhxKktjajejHYI1oOJ0HNBmMq8rd5gx0j1gJ0aEtWZTqYGv1EmwqQgz9kB+lyBLlDKepVqCNWXE2VGPsxDThp9Zd7MWdT7t1sHvMnPWxY6N7a7kDv0S22lRPlB3cAoXtvL+Kj523oUFeayD/hr4K18gY+aIj1PJsu70YaG4pAoBe3mQQfthJ+RYB1lD7Y5TPZQ3gL9IW9+oL2l7qA/URSfb2vQh0SZaZfwpIOdwSdxsujK79FnNqyB62B+Mh30JPbniztFmN5CohzUT0k5omfM2V7x32IYB2ZpU4hfBBMtVZVZSFRlI/yH3jVRaTe1tlNpd+ovAAAA///r6D3oAAAABklEQVQDAOlilE1LBgihAAAAAElFTkSuQmCC\\\" data-latex=\\\"{25}^{\\\\frac {1} {3}}\\\"/>，则（）</p><br/>\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"b&lt;a&lt;c\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"a&lt;b&lt;c\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"b&lt;c&lt;a\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"c&lt;a&lt;b\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 21:59:29');
INSERT INTO `t_text_content` VALUES (43, '{\"titleContent\":\"<p>设f(x)=cos(<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB8AAAAZCAYAAADJ9/UkAAACmElEQVR4AeyVS4hPURzHrzd5Rh6xIPJYKJQ3xcLGwgZJSclGFoQsJFYkG0JkIZFYWUiyUkpSxIKFV+SxsJBnMTPNq5nP5zb/29wz9577r1nMYubf93N/5/zOOfd3z+88/oOTPvwNBK8lfzyFW9ABb2E1xDSIxp3wBzZAkexzjoZvsAgyhWlvpOUUXIMFcB+WQJmG0rAZJsB2KNIUnJtgOuyDTGHwVlpewx64Dr70EHYIFGklznWglvGYBKF+4tgCL2EWjIZUYfDUycOPOIP9Cyug6KWj8O+H4/AVzNQ8bKh2HAY+gf0BzZCqLLiNrtFHCpNhKoTaiMMX38C+gOGwFMo0ggb7tWFTxYK7id7QaxyEM3cdD+K/CP/gAaiy4O6N9XR4Apliwe30nod9TDHFVO7e3ZRewVNQ7hNnNJ+KJwaTk0tiZhyTNfjirFJQMK2hezGObXAWDIhJviRJ8h3mQLhEznov/jvQBJmqgmcduwrO6jTly/AJanKJ3lGZCB4pTKZVlPQ9xOZUT/AWRrjrTbdH0DW+ia+7Gqg4e983m3JNfuxRKpfgP+Rk55wjqMyl7tHw8llOeRd4tHLpw6c++ABPBybxY023H/VIR0hV8GEM+A0j4SqcBK9dTA95MnT6wdq1PLaCy+S9QTGvWPAxdJ0Jpv0I9jHchjK57m7AsXQw9eexXtVeQBR7Khbc2ZpCZyKlM+h6rUvhh86g7vl/hr0HpYoFN/A0RrrZPNelM6CP8qg5+zVUvJiOYQvTjT9VLLgzcLe6zs/T3vGHd4L4R3KArr8gqljwhYy8AhfA/3dMpTxOHkfv8MrOseB3GX0YoqmjvSaXZwcVbzJMtWLBPzPcywNTl9xw/nXWm6UkFryuiL3p1H+DdwIAAP//dzvkbAAAAAZJREFUAwCAI3QzlbP4CAAAAABJRU5ErkJggg==\\\" data-latex=\\\"\\\\mathcal{W}\\\"/>X)的最小正周期为6，则f(1)+f(2)+…+f(2018)的值是（）</p><br/>\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"0\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"1\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAkCAYAAACAGLraAAABdElEQVR4AeyUSytFURiGl0sZiUxIchkopZhIUuYGSi5jJAPKZSDyE4QJI1M/QYnITBnwB8jIH1BGLhHPuyf256xvn32inIHT+6xvr33e9XbW3t86leGHn/IP6GaH59AIUXlb6MK9C/vQAa68gBtWrMAWZMoLyFyU/vI/IITyfQYNvKpRmIQWmIIhqAIjbwsPuA5hGmpgGy7gHYy8AGPKmvxqgMJKIflhWpBcMNTCek768CVKBzxyZzMnV/gSpQOSG6UOXkAFQbOwA3twDYNQIC9gBGcTrMEyHMAR9IJRLKAaxwSocT6o0jHDCwyDkRdQh0vdp5bmMjwxvEInGMUCnnGMwQCopSmhmaEezsAoFmAMTLSlOeolnIJRngCdSjXOPCvVK5QvFQvox7oIOtb31AJlBbThVmvPULW4nToORl6A3sIqzg3QYkroYWgFo1iAHprOxBLOO1AvCP3B3DI3igW84VgAtfN3TrhvFAswhmKTvw/4BAAA//8/JwYrAAAABklEQVQDAGwjN0linoJsAAAAAElFTkSuQmCC\\\" data-latex=\\\"\\\\frac {1} {2}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABcAAAAnCAYAAADkUNMNAAACi0lEQVR4AdSWOWgVQRjHV9FGRRFURMUTPEEUFCsPtNBGQdHSTrATbby1EAQVQdHGTlHBxhQhRbochJQhkCIkIZCDQA4COYrc1+//eJs3897uvm9fEkge/998M7P7/d/u7OzsrA9W8LdqzPdwk8XYzTmLSnPlnWQ9KgKHc0pjvpG050Xo4/iirOYHyHgAkv7kFZUP8B6q4TAUyGp+lcwqkO5TTMELeA0art/EreApjXlHNvMy8S5sg3logdNwCDxZzYedrIfUr0PYt5d6N/SCJ4v5WTLCIaEaTFCExgep607eEgfAk8XcHe8weQeVm/AZfkA5FMhiLoORvMxB2hVwD46B6luInizm77wMv6EH+p+ua3ARPEWZX+GMnyDlD4musp8DmuOEjMYpZ+AEeIoy17wVelgyr3Uyhqg3wF8IJdNJGnqZCDnFmctQ5noTc2cHgWbEYzqeZVFdb+5t2o3gKcpcJ9RQnIInkK82OvSWfiR+BQ2jLoaqrzhznXWGwp3fNNMpybweqyYoWUnmv0p2zSYmmWdPKT245lrl9NSXyq3wclxz9bVSLJV2PDJyzbV+NNO7HGATBK55piOm0JB94dhTqIR/sBMSZTHfgMNLKINPcAe2gz5tm4mxspjvJ/soaLgIgRaqP1QuwXGIlcVcX/sLOLhLwSjtTbALYmUx1+zRTuuN43KSeheEd0O1UBbz/Kx9dGjh+k7Uh5kQrbTmGiLtVeqw+wb6EhGilcZ8HRZav2eJ2jNOExOVxlzLgvYo+gMZa++iNT/2D6zm53A4D9rCyVh3cYO23gFCtCzmeoCa19rhjmGjcZ4jaoHydrX0ebKY95Chj7Cu1uUI/doJEKJlMY/ONPSuXfMFAAAA///GGdkFAAAABklEQVQDAEnxik/Dd0n+AAAAAElFTkSuQmCC\\\" data-latex=\\\"\\\\frac {\\\\sqrt {3}} {2}\\\"/>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 22:05:21');
INSERT INTO `t_text_content` VALUES (44, '{\"titleContent\":\"已知a&gt;b,则不等式<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABsAAAAdCAYAAABbjRdIAAACG0lEQVR4AeyVyytmYRzHz0zNNDXT3DYzNddmpmY1U3NpJhZSFiJJEkpJWNiQIgtiQVKEhchGEv+Bha1yF3KNpCSXJBaKckl8vqf3PR16Xs6pw8rb9/P8fs95n/P7nvM8zznnoXWHv3szL5Mdz6B2qIZ5SINLCmoaf1E1CQqhCkqhBxLBUVBmuosRqp6CNEYzBxngKCizJ1Ssh28gyfSQ5B08BVtBmZVQ7T2sgPSC5gP0g0wJlhWUmV3M1WSSH0A3OLoNs39UzwuxRnQUtNknKjdANkzAJQVppnWqo7rWT0YvybPgMdi6yew5o1Sgi1gGrRANtaANQbD1iFb/txBlRLC+0vyBE7B1nZmmZIBRx5AP2tq9xEFQ4c/EsIpIymEYzkPIdIPcUSQzTUkHo/ahGfTcEKwZmnXYhFUIq5HkgYEmjjmKZFbAiDhoAxkSbGkdnpEtwB74ksnsDRVyYBvGwa3fdF7DEByBL5nMflDhO0zBFrj1n47W5OpFcPhmmcx+cprmf5rovvpX9KNAF7BE9C2TmbaxCk2qcfGW/Atok+wSk6EYPMtkthg6O7wD1dWdppC41yuGvj6SBG8ymY1yqnabHkhSS0bpJHoFab3OyLWJPhJnwbNMZjucnQp/oQb0vOl7pb7eJgkc0/uvk6ixBG8ymenMZRp95iuJuaDXlb5LFeSxoLvsI/pSJDNfRbwOvjfzOlPXjrvTabwAAAD//4yYFYYAAAAGSURBVAMAVMJZO7pUvowAAAAASUVORK5CYII=\\\" data-latex=\\\"{a}^{2}\\\"/>&gt;<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABkAAAAdCAYAAABfeMd1AAACMElEQVR4AeyUO0tcQRiGTUiKkEBCiiSEkIRAEkhIUsQbKjZaCAriDdFKxEJBbUSxsdJCUAv1F1jZiCCIomjlBVHwWqhoo4ioiGDj/fa8sA6768zZswhWLu8z35w5M/Pu+ebyNOYBfo8mt0l+QqUUWqEDZiAJQnTfdGUx2weohWrogn74B0b3MXnGLHkwBtcgDVCcQgYYuUyK6LENGnxFTIdwyeQ1jS3wFqRjijP4DkYuk256/IRxkNkKMVwnNORAIhyA9JHiDQyDkctEHT5R/IIF2IdI0peV0WkShsDIy0SfrDRM0Fv/muCpbN7GQjkcgpGXSQK9tCbTxEiKp0Ml5MMGhMhl8opeyeBaD14ZfaFWByUgg6/EXDBymbyjhxZ+nVgIbdAI2qI/iLfS7qrhoR5kQIj5S/EZjFwmMtAh06HSwmuiBkbNQS/oT2ihm6lXwRootaKP+ioYuUxSAj00wUigrjBF8Rv+wwVUgK6WcAZpN7KZvOStFn2HqO1IMHoeqCklgWrkYDN5zzD921miFp5gpC/Qw7kKv9hMvjFYRvPE4PPxgmeZKO+L1H3LZqJUKMe6UoIn0taMo0GLukT0LZuJ8n7EDHsQrDQedAO0E3fBt2wmy4y+hGBpy+q6GKVRlyfBv2wm2qabTPEHJH1ZExVd4zrVIfcS7RFlM1GaihlZADqAPUStQSpxC6KWzUSTaPdkUtFVotu1k7q+hBC9XCbRz+Qx4tHEIzl3Xz1Ium4AAAD//1vRO1YAAAAGSURBVAMAaJRaO0O1+FQAAAAASUVORK5CYII=\\\" data-latex=\\\"{b}^{2}\\\"/>，<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAAkCAYAAABv2tHkAAABZUlEQVR4AeyVOy9EQRiGD0IiolMgERQunUZCoRGJ+ANo0FCoFQoiCnFp0WgUEhr+CFGQCAmNRqHQKMRms5vd551id2fPzGzOZovdZDfvM9/szDfvOfOdW2tUg1/jmLSz2wPYAq982+lgxTpcwyYE5TNJs+oSZPRKDMpnElxUPtk0Ka9IFDVGTaY48RUYhQVYgl6IKbSdB7IvoB/m4Ra+IaaQSSzZN1BzExkmxZycFpkOTTdsJ2CCXKNSk19GThLwRK5RqYkZqKZpmsSrFqpJJ+nHcAdncAO70AWWfCb6VJySqYdvjbgP6k8Ss2DJZzJHlhafE/9BR+8j3kMKLLlMWshYhnd4AWmcpgf0ZBNsuUx01GHS3kB3MSGapfmCH9B7pY1YkMvkj9lP0AcsQxyERXiEIRgBqy4ukxxJKuoYcQf24AoGQNvU1aJblMtEs88003AEG3AIM7AKH2DJZ2IlVfpTPyZ5AAAA//9CQmrwAAAABklEQVQDAK+tN0ntzfUOAAAAAElFTkSuQmCC\\\" data-latex=\\\"\\\\frac {1} {a}\\\"/>&lt;<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAkCAYAAACAGLraAAABdklEQVR4AeyVzStEURjGr4+SJMWCsGChFBuyRBaspSzFf8CKjVKU8rmw8y/IypodC2Fhx5YNUcLCRxG/50T3nu55byNTM4uZnt95z9x53mfOPac7Ux7981X8AV3c4QE0QlDWLXTi3oJtaAdTVsAlHTOwBpmyAjKbkh+WAqKoePegnqMahXFohUkYgArwZN3CA649mIIqWIdD+ARPVoBnynqT1wCF/QW3MDW4CUMtzOVIHz6nZMATV1Zy5ASfUzLAXfgZ6qjT8A6bYMoK0Gr26XqGUzBlBaihjaEGrsBUVkAPXXdwDaasgEo6euECHsGUFdBAh1agkEXmO7AMCqbEsgI6sOgh0gnMMt+ACdDPPCWWFSDjPbZd+AI9UE3UZvAUCijDMQg6vhuqpMAXJrfgKRSgo2vBdQxvUA1jcAT6v6DECgWo6feb5exn6AZt5ivVUyjgA8cqjMASzINWcEZNKRQg0znDMCzAEGg/KGlZAWmncaXwAd8AAAD//1Qswl0AAAAGSURBVAMAGy86SSjCnWAAAAAASUVORK5CYII=\\\" data-latex=\\\"\\\\frac {1} {b}\\\"/>，<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACcAAAAkCAYAAAAKNyObAAACUklEQVR4AeyXOUgdURSGTUI2knTZQ8hG9jIhCyRFEggJKZIiC4QkTUJIk8bCQlELcWldChFFBC1cQAQre0ERRBHFpbBwQUQUC3FHv3/g6buPGRlmLs4TRv7vnnPHe+/8c96shzPS+C82F/THsVm5o5gogEywIhvmjuHkN9TDP7AmG+bWcFMDMjhItCYb5qyZSV0oNpdaEb/9uHJ+K5U6Lq5cakX89m1V7ik7/AF34B18hYsQSrbMdeOiEi7DW2iCGQglW+ZCmfCafGDMyWi64BRTZpyE5gxkpQHP8eAo2dwiW0rSgE48OEo252zYh+Y4+/gO09AKJ8BVUZhbxUkHLEA/rICrojAnI1dodE8cJnoqKnO3cKTX+zGip6Iy9whHUzABntrL3ElmFUMzlEED5MApCCPN17P4Aoto/Qqi1j5NNGSa2/2XPvNK6epB/ouYD8ofEzchjGTqIQs0gr7WdPt6Qf4SDHmZe8MomSonLoOO9hKxC5Kvrs/0q3zwkTEJ3STRerXEddC5J+6TG3Izd4gR32AEBkC6R3MW9PZB2FEL2V8ftDEmoSck4zAKksyeI9H+CLtyM6ejusGQIdBTg5DximYS5kDvakeIQXWXib0wDyrEJ6JuKT1EQ27mlhihI9PH8gb5NfgCmnydeBvCnHdaW/vdYp0H8AHyYBYMaZCxgY4m6WLQEWbTz4U6uAr6uXX1kgZWNTPPQyHonP5P1GOMYMrNnEb00TyDIvgDWkhX1E/yxLlCGkg6Pd4zU7el18R2UEEIprzMmaMi6sXmghZ+GwAA///AUTAuAAAABklEQVQDADOaekl+qGlPAAAAAElFTkSuQmCC\\\" data-latex=\\\"\\\\frac {1} {a-b}\\\"/>&gt;<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABEAAAAkCAYAAABv2tHkAAABZUlEQVR4AeyVOy9EQRiGD0IiolMgERQunUZCoRGJ+ANo0FCoFQoiCnFp0WgUEhr+CFGQCAmNRqHQKMRms5vd551id2fPzGzOZovdZDfvM9/szDfvOfOdW2tUg1/jmLSz2wPYAq982+lgxTpcwyYE5TNJs+oSZPRKDMpnElxUPtk0Ka9IFDVGTaY48RUYhQVYgl6IKbSdB7IvoB/m4Ra+IaaQSSzZN1BzExkmxZycFpkOTTdsJ2CCXKNSk19GThLwRK5RqYkZqKZpmsSrFqpJJ+nHcAdncAO70AWWfCb6VJySqYdvjbgP6k8Ss2DJZzJHlhafE/9BR+8j3kMKLLlMWshYhnd4AWmcpgf0ZBNsuUx01GHS3kB3MSGapfmCH9B7pY1YkMvkj9lP0AcsQxyERXiEIRgBqy4ukxxJKuoYcQf24AoGQNvU1aJblMtEs88003AEG3AIM7AKH2DJZ2IlVfpTPyZ5AAAA//9CQmrwAAAABklEQVQDAK+tN0ntzfUOAAAAAElFTkSuQmCC\\\" data-latex=\\\"\\\\frac {1} {a}\\\"/>中不成立的个数为（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"0\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"1\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"2\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"3\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-18 22:11:16');
INSERT INTO `t_text_content` VALUES (45, '{\"titleContent\":\"不等式-<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAdCAYAAAC5UQwxAAACGklEQVR4AeyVSyguYRzG51w7nbM4l87pLM5xKbJQFi5ZsiElNnJNlMSOhdtCkmzkmigppcRCZGVDUkq5lEguRVLKQqEskFzi93wxoRlmvoaVr+f3/t+Z753/M+877+W98cq/N0O3A57EA91QD6uQDg/k5ZBGkjkFSqAWKmAAksGUl4bqzSyZL0Cap1iBLDDlpeEXsjZBKEgyPqHyD76BT14alpPxP2yB9J0iAKZAxgTD8NLQl/BekU39GPrB1EsZxuJQeMsO0dRLGAaRvRnyYQEeyGtDfbcGHPQ9ZfaDei58Bp+eMvxACw1LD1H0EZUwntgFjTAEmigE4xNFFXSCzAhGCEU0nINPdobv+LcMfkExKFE4cRwKoBI08zKImSCVUlTDDFzfIuNd6qbsDKNoEQbtoIc12/SgJsMg964gAg5gEqRWCr3oY9q4b8rOMJUWI6DFSzA0lHqBDS6W4AzUuz/EZXAsO8M6MozBnTTzgrlYg0PwW3aGjxPGcOMrTMAl+C0nhh/JnginoElA8F9ODP+SXj1cJ27DnRKoaOgJzmVlqOT7pBgGnQCajYHUN+EIJK05HTujunCDlWEcCX7DHGjx65xTXbNUO4emfR7/qceLRFeyMtTuod79JJOGTDtMGnUdOzrvWqhLHRRaowTnsjLUAtfuUUMa7SjTxD3IgSLQPtlL1OInuJOVobsMLlu/GbocsOebv/qQ3gAAAP//MSmADwAAAAZJREFUAwC3vFg7OeokQQAAAABJRU5ErkJggg==\\\" data-latex=\\\"{x}^{2}\\\"/>+3x+10&gt;0的解集为（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"{x|x&lt;-2或x&gt;5}\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"{x|x&lt;-5或x&gt;2}\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<p>{x|-2&lt;x&lt;5}</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<p>{x|-5&lt;x&lt;2}</p>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-18 22:11:54');
INSERT INTO `t_text_content` VALUES (46, '{\"titleContent\":\"不等式<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACYAAAAkCAYAAADl9UilAAACSklEQVR4AeyXS0hUURjHh6AnBUEPIlrUriioFhXVIiIiok3Lil4giAiK4BtRBEEFURAExYUvUBDBlQ9ciOIDRTci4lIUVPC1EBVfiP7+V5RxvOPM3ONwR5nh/zvfuffMne8/3zlz59wLngh9RY2FOjFuVuweZtvgORyTG8bu4yIPauAV2MoNY7M4yYYsWANbuWHM1ojvyZOMveDNDVAB1ZAJpdAKDyCs8mfsLlnTQWbKiN/hCUzBR3gEYZU/Y/rF1JNZRtS/Qb8RSuAa9IKkL1BEpzIAhYzfhqDlz9gon9ACkio0TWcMfDXPiVSIDUAG44sQtPwZO/iA63TewwDMwC34A5cgrLIzdoWMTTAOn+AtTMAOxIDGt4hhlZ2xTTIOQh98gQT4DFpLWl+6MXLoWFe58iv8AN1sfxOV5zLxUHbGdhktBq2beKIW9mtiCuTCNphonYvbQWtTS0Kxg2MVhLAvO2P7Iy63Z8KYTEYC1lzJiNWh0U00jeg2WPB4vI0tc0Z3aLfBxlFj1olIabwrFimeLB9RY1YZQmjOdcUuUogc0F5tiPgXaqEKksCRTqNi/8m8AskwDOXQDO/gDWg3QvBSEF1TY/oT1naojlzaHTwk9kMnPIafsAEhy9SY9mWasiUyawvzktgDq2AkU2PeyZ9xcBNULYLnG81TcCRTYx/IqqlKJGra9Lc2R19T+o+4AI5kamySrF1wB/QA003UJiCfKPSwQjd0mRrT4522yXrkLyC9qhZH/AUj4FimxhwnDnRh1FigCvmO7wEAAP//PfNHggAAAAZJREFUAwCUjntJrCByHgAAAABJRU5ErkJggg==\\\" data-latex=\\\"\\\\frac {x-1} {x}\\\"/>≥2的解集为（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"[-1,0]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"[1,+∞)\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"(-∞,-1]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"(-∞,-1]∪(0,+∞)\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-18 23:03:39');
INSERT INTO `t_text_content` VALUES (47, '{\"titleContent\":\"<p>设x∈R，则“1&lt;x&lt;2”是“|x-2|&lt;1”的（）</p><br/>\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"充分而不必要条件\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"必要而不充分条件\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"充要条件\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"既不充分也不必要条件\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 11:50:51');
INSERT INTO `t_text_content` VALUES (48, '{\"titleContent\":\"<p>已知集合A={x|-1&lt;x&lt;2}，B={x|x(x-3)&gt;0}，则集合A∪B=（）</p>\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<p>{x|-1&lt;x&lt;3}</p><br/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<p>{x|x&lt;2或x&gt;3}</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"{x|0&lt;x&lt;2}\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"{x|x&lt;0或x&gt;3}\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-19 12:07:20');
INSERT INTO `t_text_content` VALUES (49, '{\"titleContent\":\"<p>已知f(x+2)=2x+3，则f(x)的解析式为（）</p><br/>\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"f(x)=2x+1\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"f(x)=2x-1\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"f(x)=2x-3\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"f(x)=2x+3\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-19 12:11:57');
INSERT INTO `t_text_content` VALUES (50, '{\"titleContent\":\"<p>一次函数f(x)的图像过点A(-1,0)和B(2,3)，则下列各点在函数f(x)的图像上的是（）</p>\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"(2,1)\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"(-1,1)\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"(1,2)\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"(3,2)\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 12:15:18');
INSERT INTO `t_text_content` VALUES (51, '{\"titleContent\":\"<p>已知函数y=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAdCAYAAAC5UQwxAAACGklEQVR4AeyVSyguYRzG51w7nbM4l87pLM5xKbJQFi5ZsiElNnJNlMSOhdtCkmzkmigppcRCZGVDUkq5lEguRVLKQqEskFzi93wxoRlmvoaVr+f3/t+Z753/M+877+W98cq/N0O3A57EA91QD6uQDg/k5ZBGkjkFSqAWKmAAksGUl4bqzSyZL0Cap1iBLDDlpeEXsjZBKEgyPqHyD76BT14alpPxP2yB9J0iAKZAxgTD8NLQl/BekU39GPrB1EsZxuJQeMsO0dRLGAaRvRnyYQEeyGtDfbcGHPQ9ZfaDei58Bp+eMvxACw1LD1H0EZUwntgFjTAEmigE4xNFFXSCzAhGCEU0nINPdobv+LcMfkExKFE4cRwKoBI08zKImSCVUlTDDFzfIuNd6qbsDKNoEQbtoIc12/SgJsMg964gAg5gEqRWCr3oY9q4b8rOMJUWI6DFSzA0lHqBDS6W4AzUuz/EZXAsO8M6MozBnTTzgrlYg0PwW3aGjxPGcOMrTMAl+C0nhh/JnginoElA8F9ODP+SXj1cJ27DnRKoaOgJzmVlqOT7pBgGnQCajYHUN+EIJK05HTujunCDlWEcCX7DHGjx65xTXbNUO4emfR7/qceLRFeyMtTuod79JJOGTDtMGnUdOzrvWqhLHRRaowTnsjLUAtfuUUMa7SjTxD3IgSLQPtlL1OInuJOVobsMLlu/GbocsOebv/qQ3gAAAP//MSmADwAAAAZJREFUAwC3vFg7OeokQQAAAABJRU5ErkJggg==\\\" data-latex=\\\"{x}^{2}\\\"/>+2(a-1)x+(a-1)的图像都在x轴的上方，则实数a的取值范围是（）</p><br/>\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"(1,2)\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"(-∞,1]U[2,+∞)\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"[1,2]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"(-∞,1)U(2,+∞)\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 12:20:27');
INSERT INTO `t_text_content` VALUES (52, '{\"titleContent\":\"已知函数(x)=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABwAAAAdCAYAAAC5UQwxAAACGklEQVR4AeyVSyguYRzG51w7nbM4l87pLM5xKbJQFi5ZsiElNnJNlMSOhdtCkmzkmigppcRCZGVDUkq5lEguRVLKQqEskFzi93wxoRlmvoaVr+f3/t+Z753/M+877+W98cq/N0O3A57EA91QD6uQDg/k5ZBGkjkFSqAWKmAAksGUl4bqzSyZL0Cap1iBLDDlpeEXsjZBKEgyPqHyD76BT14alpPxP2yB9J0iAKZAxgTD8NLQl/BekU39GPrB1EsZxuJQeMsO0dRLGAaRvRnyYQEeyGtDfbcGHPQ9ZfaDei58Bp+eMvxACw1LD1H0EZUwntgFjTAEmigE4xNFFXSCzAhGCEU0nINPdobv+LcMfkExKFE4cRwKoBI08zKImSCVUlTDDFzfIuNd6qbsDKNoEQbtoIc12/SgJsMg964gAg5gEqRWCr3oY9q4b8rOMJUWI6DFSzA0lHqBDS6W4AzUuz/EZXAsO8M6MozBnTTzgrlYg0PwW3aGjxPGcOMrTMAl+C0nhh/JnginoElA8F9ODP+SXj1cJ27DnRKoaOgJzmVlqOT7pBgGnQCajYHUN+EIJK05HTujunCDlWEcCX7DHGjx65xTXbNUO4emfR7/qceLRFeyMtTuod79JJOGTDtMGnUdOzrvWqhLHRRaowTnsjLUAtfuUUMa7SjTxD3IgSLQPtlL1OInuJOVobsMLlu/GbocsOebv/qQ3gAAAP//MSmADwAAAAZJREFUAwC3vFg7OeokQQAAAABJRU5ErkJggg==\\\" data-latex=\\\"{x}^{2}\\\"/>-2x在区间[-1,t]上的最大值为3，则实数t的取值范围是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"(1,3]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"[1,3]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"[-1,3]\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"(-1,3]\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-19 12:30:07');
INSERT INTO `t_text_content` VALUES (53, '[{\"name\":\"高等数学\",\"questionItems\":[{\"id\":33,\"itemOrder\":1},{\"id\":37,\"itemOrder\":2},{\"id\":38,\"itemOrder\":3},{\"id\":34,\"itemOrder\":4},{\"id\":36,\"itemOrder\":5},{\"id\":35,\"itemOrder\":6},{\"id\":40,\"itemOrder\":7},{\"id\":42,\"itemOrder\":8},{\"id\":43,\"itemOrder\":9},{\"id\":39,\"itemOrder\":10},{\"id\":41,\"itemOrder\":11},{\"id\":44,\"itemOrder\":12},{\"id\":45,\"itemOrder\":13},{\"id\":48,\"itemOrder\":14},{\"id\":46,\"itemOrder\":15},{\"id\":47,\"itemOrder\":16}]}]', '2026-07-19 17:08:14');
INSERT INTO `t_text_content` VALUES (54, '{\"titleContent\":\"计算机内部采用二进制表示数据信息，二进制的一个主要优点是（）。\",\"analyze\":\"二进制编码只需要两个状态，实现0和1的表示即可，系统简单稳定，物理实现容易。故答案选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"容易实现\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"方便记忆\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"书写简单\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"符合人的习惯\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 17:13:27');
INSERT INTO `t_text_content` VALUES (55, '{\"titleContent\":\"下列关于二进制特点的叙述，错误的是（）\",\"analyze\":\"二进制有如下特点:(1)状态少，技术实现简单:计算机由逻辑电路组成，逻辑电路通常只有两个状态，即开关的接通与断开，这两种状态正好可以用“1”和“0”表示。(2)简化运算规则:二进制数运算规则简单，有利于简化<p class=\\\"ueditor-p\\\">计算机内部结构，提高运算速度。(3)适合逻辑运算:逻辑代数是逻辑运算的理论依据，二进制只有两个数码，正好与逻辑代数中的“真”和“假”相吻合，故答案选D。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"状态少，易于物理实现\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"运算规则简单\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"可以进行逻辑运算\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"表达简洁，符合人们的认知习惯\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-19 17:19:15');
INSERT INTO `t_text_content` VALUES (56, '{\"titleContent\":\"某种数制每位上所使用的数码个数称为该数制的（）\",\"analyze\":\"数制中每位上所使用的数码个数称为该数制的基数。位权是指以基数为底，数字符号所在位置的序号为指数的整数次幂，故答案选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"基数\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"位权\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"数值\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"指数\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 17:23:39');
INSERT INTO `t_text_content` VALUES (57, '{\"titleContent\":\"十六进制数2A对应的十进制数是（）\",\"analyze\":\"按权展开，2A=2·<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACIAAAAdCAYAAADPa766AAACK0lEQVR4AeyWyytuURjGz71zGZwzPXXqGFCkpDBAyaUUKWIgTJRSUswwYiT8AVIuKeUeiYGB5JqEwoRkgGIol0RG/J5dW2z7+yx768vg0/P73nfvtfdaj7Xftfb+9OGd/IWNOB9EKGfkI4NXQAc8U6iMFDJyLzTCV3imUBkZZ+RymAdXhcqI6+CPTwYzomcaz8UbkADB9I/GLliFQZiBODCWm5Ec7h6ABeiHGAimFBqXYAqSoQSqQPXwm2gkNyPT3FkKadAHwRRJ4wi0wSTcwXdogWyIACO5GTG6kYu+QAMcgx4HwdItv1uwDGojvCw/RqLpvghm4QJsaVaaOciFUzCSHyOpjPAHVKAEf/JjJImhr+ESmqAeqmEIVF9adaSWVPBlZImgglYeRf4gr0Z+0YMK8RtRJiaIKth2ouqmm1gLtnZJtAJjiUL5PvmDvBrRf6tiFYv0tg22DklGoQ60qggvy6sRu2cVplaHfWxH1c1fDrLASF6NXNH7EdzAGQSS6ihQ25PzXo2okz1+VCM/iL7lx8gao3+G/+CU/aqfczYEOvZjZJ1OZSaPqKIlWFIhZ5KdwAoYyY8R7aY1jKKNTfsGqSXtE9pxtXwPrDMGP25G9Orv5N5h0B7xk6i8h9gK2k0JljQj+WR60+rjR/uJtnetljHOG8vNiF5YlfRQDDKhqdZ+oO9NbVbnnH+sTQ7SQZ+DBcQM2IFXyc3Iqzp4q4vDRpwzGZ4R54zcAwAA//9mdgAeAAAABklEQVQDAIngUDuEYfYPAAAAAElFTkSuQmCC\\\" data-latex=\\\"{16}^{1}\\\"/>+10·<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACMAAAAdCAYAAAAgqdWEAAACf0lEQVR4AeyWW4gNYQDHz7rlVqQoER4IJZSUS8ktRYp4EK9KoXhDKR4kpLzx4Pag3CMhHpBckpBLSbxg292XrW0v7aV92v39pp1pz+7Mac7MdtqHc/r/5v99M+d88z/fbWZEYRh9qmGSBqOSPbOcENdhA1yCzVCkSoWZxl0vwGV4BefhFCyESJUKs4I7ToW/oBo5tEBR71QqzCJuXA8doPQGCksgUqkwNXxrKXyBZVBKM7l4BT7CbXgBiyHU/LAwwGdQnwCB4sLYdbe4+gZuQtG4Uh+oVZx4B09gJeyG/XACJkFqxYV5zq/3wBq4AaU0l4v34Bw8hh4YC2dgE8yB1IoLk/bHo/jiMXAuODQUA3Vz/A7vwWtY4Y+HGOo41wmB8oRZQAs7waXaioeyd05T2QJNoH5ymA0TQemzKHje71MsFPKEWU0Lk8FJi5XUV64aeB6uHL4pFJ5BpDxh3FHt4jZaOwlH4SDcAedbDR7K4XJSH+DERtCP478hUtYwLkf/3RhaMsgj3El8EXceXcUPQ399puLCeIkb5ikeDRHlzMPkv3YCy1sa+gGh/lO4D0fA1YalU9aeCVv3n7lqwnrozqPpVHwoYumUNUw7zddCFzRDkpxXSdcGnc8axobcO5wz46wMBXnCfCLASHD/wIo0uq/2us9TWZ4wrg4DbeVOTmQskJN7PSWfyh/w1MoTxk3sEHdy83NfoRjIh6U7s0v7X3Am5SEujK8NvpHdpQ33kPG45Wv4WXDXxQLZM9so+YR+iLvf+ChwFT2gXpbiwviQ20cru8Agdrv7xV7qbmi+oVGM9I3SWtgB22Ed/IKyFRem7EaG6gfVMEk9We2ZpJ7pBQAA//+zxKJPAAAABklEQVQDAAlkZDs0LgCfAAAAAElFTkSuQmCC\\\" data-latex=\\\"{16}^{0}\\\"/>=42，故答案选D。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"26\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"30\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"32\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"42\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-19 17:28:29');
INSERT INTO `t_text_content` VALUES (58, '{\"titleContent\":\"二进制数11111111对应的十进制数是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"127\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"128\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"255\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"256\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 17:30:57');
INSERT INTO `t_text_content` VALUES (59, '{\"titleContent\":\"将十进制数125转换成二进制数是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"1011101\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"1101101\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"1110101\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"1111101\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-19 17:33:01');
INSERT INTO `t_text_content` VALUES (60, '{\"titleContent\":\"与二进制数101110等值的八进制数是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"45\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"56\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"67\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"76\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-19 17:35:09');
INSERT INTO `t_text_content` VALUES (61, '{\"titleContent\":\"下列四个不同进制的数据中，数值最小的是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAFYAAAAcCAYAAAD7lUj9AAADx0lEQVR4AeyZW6hNQRjH53Dcb8lJknvKpdyflGtRLqE8iCdJPCiXB3IePUjKnbwot1IkkeKBhLzhAUnECxIh5R65/n6bvdpnt9ZZe5+S017r9P+vb+abb+as+Tcza2Z2m5D//RMFKhW2G/+9LcwKutDRdrDFSBO2jpZXweXwJ8wKGujoEdgPtghpwi6k1RFwP/wFs4IndHQP3Al7wKrRnLBDaW013AG/wazhJh2+BddDZy6mciQJW08TjfAUfAzj4Bq0goILsCtMwmAKrsF5MAmtsS1n6CFeeAYcD6tCkrDDaWUCPA9L0ZHMBngWXoZbYAdYjrE4DkMFPYGdDMvRWtsqfc+XZBw4y7BVjdokYefS0G1YPlq/4NsGF8DZ8B6Mg3V9mSkUboZxaK1tlb+rwtqPvuUFzeXjhHVaK9olKjodMJnGA3rvIBiNrRhxwvamdh/4EOYI4W0I4RGcBCtGnLDFIf+i4lZqO9BZ65I3jG76UcekI07YnlT7AR3+mBwo8AY2QD+4mHTECTuSaq9hLiwi/MVzbH/oUReTjjhh02tlM8JloKiXR90DyODh4TrWQ1QnbIRiYOTIE6kKuGvaRNRWuB3Oh3Og29DooipOWL+CxOUoU+AjeY/2Hn48KT4lLzxEnCbhydIdFckQ4oStej0ptFTbj9LvjkvCErq7GBbxnoQf/VRhvxJY8UJNbK2jOx30xstRe5V0e3gMijoeXgF42oxOqnEj9hmBBg/B5gjBLZbT/06CGJbNpGw3fAcLiBPWPZvqewlTCMr4oxf9HwRvwHJ4V+tHbBcFZ2CEOGG/U+rt1VRsky0EeeGvCW41zpExRprWZxnu4It4UXw0hHAQCq15/ZbrM9561rcdaVqfZcYYax3r2oY+rXn9lusz3nrWtx1pWp9lxhhrHevahj6tef2W6yvlKDIOtrvYUvgBU9SLOL0Q94RG8g/ihLXkCg9/nnCYk2wCX2QlnmnQJUOa1mcZ7uBaszaEsBS6oBujNa/fcooKolvP+sZI0/r+Z1u+m6zn4TufxEbTnLTvuQbrfUpR1EXk3d9iQuyuwAK3EF7yevVn4/qyyDF0WrEUlmQEr0099u/F40h1bzuLtNsxTLKwFh7n4SibiK1ZNNMxp7qzy4/Sq5K4caS9xHddddlU2A/4BkB3DZjmhXXo27DHtoGF6Ow86ujqOui66uafZAR/B3PPakwp/QnnUzEqaY0tlrt3ayTjT+CdsVnBdDrqJVRx/SRbHdKEtbX7PDbCzzAr8Pe8fXTWdRRTPSoRtvpW8xrhNwAAAP//bcmxnAAAAAZJREFUAwDT9b85DdT2XQAAAABJRU5ErkJggg==\\\" data-latex=\\\"{(111111)}_{2}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAAcCAYAAAA9UNxEAAAEbUlEQVR4AeSYaaiNWxjH97nzPM/dqdv9cO/tTqWIhMgHIZKEDyRTyZS5fCFS5oiIKJmLQiQyF+WLkDmFTJkyTxl/v73Pu+19vPu8Z73nwz6y+//f9ay13udZ61l7rWet9b6Rec1+NXX4Y8blTVhOvEfjkiQ9khyuwHQ/2BM+heXEuzQ+B/4PUyPJ4Q5Y/hPOhs9gOXGTxsfAsfAXmArVOfw7FgfAqfARrAs4QyeWwQnwbRiMUg6/haVRcBU8DeNgg72p2AQ/gnH4kMJxcAbsDpfDIVBdkpdgeZLNdWh9AtvCYJRy+A8s1YMbYCEMGsMpWAu3QUfatYX4Ej6lZA28DQfDRbAb1LZLROfIZkJs+v59HkthL/g+DEIph1tjZT+s+u8+oGwybAdbwcOwFLpQ8QPU0Wj9uzRmUtYGNoMixKbvy708foR/wSDEOez01JktWIo6ihgER749GkfhNViI82RkV1J3AZJgnEXjBGwKgxDn8DdY+A5qkCQVvkfrP3gBPoaFcEpepuBv+BlMA23uQ7ERNN6Q1AxxDjsN1b7oIyU/R8/A4j+JWASn8FVKHFjXL2IqHEPL7clDEWLNEOewnX2Cuh0jSQUH7YMETdvR6YTXSlbfosYZEjRocQ4bCK5grDYOo54Ij6pB07GKxevkjfRBgxbnMHZeGdj/aNAMgB3p+VwY7fl9kS0nyUGFnPTqP43YjXGjP3QrdM9vgtwC5hHn8I18bXrB6HwvQd3A5XsJr1Vb/ZDaqJ0GyHehEZwk457vWcIlaj7LOIftxE/UeiwkSQXXl0GlqLFKS+7zRle3ptrECQPjO9iM/qADyEMr6TT3pFef/E4YIVPKYUeuNg7rzHFa+QpWjaLmv6b8EIw6ixgMt71TaHl0Jcls5TEeToG74DQ4CToQJDnEOXyOKhf6b6RpcQfFFfAf6CGEJA/P0s4gbz1pT3IacwqfRLAtkuwUXoLg5eJb0s7wV1iEOIc9Cjr3vTwUvRyY8Wbkac2GHUDV3Ub8mOBg7LAgJV0W/6K7HUbwZDefzEDoKW4i6UponiSHOIdd9N6GjHqeiXNvvnja4Xlk10PfkcqWWUdxFl7Y/YDgtI62Cm85R6gdBA0qJFmop752tCeVLbMu+1LBw3/ONbqnsswB1eZq8t6ZPb56LR1NXv0vSbOIc9gKR86Oxn1OWcALfaC3HRuSypZZR1UeBi4DifuhW0Unarxt2SHEPNRTXzvak8qWWZd/sVJwv92NHN3mPNX9TL7wKOty2UyZgdFDDmImNmhZcYnHQtgDGvFI6gxc/83pjd+3dAox43a0EcGPAlF/K8i3hJZ7ckTMlHTYStegx7aGZuoIK+iHF3+nu0uDbB7esw+SWww9aTmTdN61HA1MtQ67Bl0XwzDgvklSdhgTvqAX02HeCWRhTJiF4IcHl4/9dpsqWj6l1jB6WRgA/Lblp1rXSbawTA+3M7e5EbSvcyThSHJYi361GIkQHeEQywLvv36mLfrHQntSE4dDbdbp958DAAD//5klwZ8AAAAGSURBVAMAs+PDOa3T6GYAAAAASUVORK5CYII=\\\" data-latex=\\\"{(101)}_{8}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAAcCAYAAAAwTqwDAAAE4ElEQVR4AeSYWaiVVRTHPxsemmmgOaJ5IgqKopmgiIgimiNohIooKpopooeiQgUFRXxQcX5wQFFfxAkVFRURcVZQcZ7nefz9vnv28buf+zvneO459z54Wf9vrb32sPbae+299rnnJefIX62OXsZ6nA+aSY6vnabYqOZoJ6x+BT4DJ0AzyfG1oz3tNtRWNUffwNp9oCc4CZpJjq8d7Wm3obYqOXonlr4BXcFR0B6kHe1pV/sNs1nk6AVY+BUMB6tBnn5CMR48BS4Enq874L3A/yBLN1CYB34G1wHpUj7u2lT4PSBL2tOu9p1Htq5uucjRexnxETAOxMh+L1IxHRwBx8BysB78BfJ0NQoXYBPcEN0Lt93X8GUgT9rVvvPI19VVdsKxjq+gnA9cXViUvDheouZt8Di4BPwNDoI8zUTxBLDta/CbwENgAYjRWpRLgfOAtZ1ijhpWLzP0BODqw6K0Fa3ha5jNRj4EiugwFQuBbcfAN4BKYxshY2lj1LiAiG2jmKPXMuT1wFCEdRhp/2ash3ONWD/FHL2xNNzGEu8oFuyH+bRpHjFHr2TE46BSKFKd3MqnM/gReKmMgj8LYsne2/M96rqBj0Bv8C+4HBSR9p2H8ylqU7M+5uj99Pb8aQixkLyAvDm70KIH+B0MAqYNWCsyhXixfYe2P/gSXARGgitAjLTvPO6KVZ6tLuZoLWPo2Kc03A8CLUaYCP4Dt4BAWxCeB15usJS8iAYieRPrNGIhmadDpdHibW++Djr5VXyc0/twF/NPeLZfUq+jOugrhvHK5ORnUfJFYwgjpmT4mTfTQuazBtldfgteS3gaKf1om3dC5/9Ab44eCtdhn5FuBMUWijm6q6Wqrq9pw46Gv7wSQmh6s1ZyNMzHMP+YAaeALHlZmZvnlpSmpjnI5uxyaoo56mQNvXIjOgVy9TyL7tzdQRnhTl61bWxrH/uqy8MLKeaoP9luo7HzgRWSjhqm4Za24Qo+nm3HRkyioevAJviYoxfTy/P2INxzAWtFYeAZJa3vXy8tLyPfwyV1ypycNlYnSWIYp8rMx8vKI+J8MuozRHN+bKHU+SZIO8R2dB01ncDtIE8a9iH+BRXuFKxM9nmBkivrpYSY+IwbgfA9MKRgZXJ8Q9yQ3F7Wnhasd0znc1pbpxRzVKO+c31Ux4bti9KD/iQ8kBN6h4IXhjl1JbK0io8P/3/g7hAsJaPBHOyimZ68yNKKzEf7iyg7H1jbKOaoKz+aYZ8D2clRTMkVfh3pVTAN9AFynXwM2R2Clak70hDgG9fd9WacRDnk3N3IedKu9n0bO598fbbsbbszqyjJO+DbQEoxR62YzOca8DCI0R6Uv4FngHntafi7IPaTy91y5wzrN2ljrnNcIyP2S4cmifXadx5JlT/PsIvhpRSaeiR8K5cXscjRzfRwIp/Afb7B2o20p13tO49qhm3jrygX27ZGg3l8GIV9IKUiR600xLy1fL1Ybi9oT7vaz9r0EfABikeBbZRNIe6m6csf9x9S50VpHvVoUGyhSo667d/SzEe7D3jEppN2tKdd7WcNLqEwGDxQgrL5kmLiefQpOYCCPxx8g7c6FpUcpU+a3/zfjf+CNIeqaxYc/3MG/wHE8irq+qmao47sSv6CcAA0kxzfEAypqaG2anG0oQY7arBTAAAA//8whurfAAAABklEQVQDAFnc3Dn2fOUJAAAAAElFTkSuQmCC\\\" data-latex=\\\"{(55)}_{10}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEMAAAAcCAYAAAA6EgJRAAAF4ElEQVR4AeyZZ8gkRRCG15wVc44o5oyimMMPxSxiBCOKAQMoKIpZQRQTKohZzKJiBsWICAbEnPVyzjmn59mbmeuZ6Zndu91jvx/38b5b3dU9Pd01XdU18y3fWPaXWaBdY6zFFSvAXmMNJrASXCpoZYzluOvl8CI4D/YaGzCB5+AWsOtoZYxTuePO8DE4H/YaA5nAw/ABuA7sKuqMsT13uhLeD2fDbmBtBrkTvg81rvyN8hMFvk19CrR9JvJAmOJ7Cj/C66A7F9EdVBljRYa/Ab4BB8AijB+no/wQPgNfg79DjbcasgqTaLgZXgqHwunwAnhJgSdT98nbdw7lWTCFBvKeR6PYB3YNVcbYiTvsCz+ARfg07kC5KjwOXgjPgGfDW+CLsM4gNDccfzMK/RMiSpiL5j34DxwGQ4yk8hHUkM6HYueoMoaL/InhY7vChZxP28FQgyCa+IXfj+Ep8CBYBw3tIv6k0wRYhVE0aIiYm2qMQ2nXqIjOETPGmgx7LPwEuiUROUyj5uQ0ysqUU9jXLe0i644/XXC/5CL932uSakm4w3StGaWWRuMvdOr3QHYFMWNsxMibQLcnogQj+jZofSoTkSnMRbajYixwohSjWB/t3lDj/YAMcTiVG2EK84q/qRhMETm4o/5F4w5FdI6YMdJtN3wxh9+N/vvDZ2HMvVA3sQO/W0H9vh8yxFFUPF0QTfzK720wBo1p0N6RRncbojPEjLEuQxq83IIU28J69PLIfBl5D3SiiCh2RevkXYgGodqEhjyNkk8b0RbG0stELIxdqJYMMWPswlCjYStj6BZX0+9p+BU0eHpkTqVcBeOJ7mW7RvG0+oKKecO3yDFwCGwXBtct6aw7ITpDzBjtjjiZjmaDpuq6iMfk/+g8Zl00xRKMF3slWo9kY4Q0htyEXqM4LsW24S4L16GRDf4bF0YwGN+N7in4JDQnQixCOMgi7eKXdAsTNOOFrmIaHxtla5QG3xFIAyMig67p7sgUFNx9JngUW8LTzYfzOD23hSE83R5E4Sl4MdIgbdJm7KK6EDFjGKUXtrb4LTRrkC/RuSu0ukc01Ryc8OpoNIQ5BMUMgyl9DVO4IDPN2DhpH6UnjYv0BNNt71VZ4AnUj4Q+LOd5ImVznVysiRmjzg/dko8ykPHEG1DMYTw1U2wX4lOlmsMRSc1Fu4ik2hTuqPAUMvHTuOHx3ewY/LQT31ywruw9ByXXGud8882lD1XG8OUoFpQ0hgt127kDkrEzoV+aiBk/ir7vKbVn0rPoDok6E+Y6Jn4G2EwZKfjiZ95TNGzY1Xccd6TJ3bU0nAPvghvCHGLGMJq7UBOoXGcq7ggneAXld2ER+qEGe5WG4gRN5BxzHG11x6eG9iVRg4Y7hcty8IkbjH/OacsVd4D39lOEbvISXf6DypwLxozh2e17iT7FNSU4iNvdF7MwuJkn6LMG0ldKVzUavmGaj/xBmwZHlOBpYxD0iPY++nepU6Kwr8H4u6TeSnjCuDb7mcwdQOEQmCFmDLfTO/Q4DLrtETnow76o+WS+ocWF+/3BbxJXUddI9qHY0NU8Mn3F9zhT53eShyjYP+Xz1H1a5hmXUf4U+kAQldidFhfnwihWwhjouL7jhJ18kO6WTBczho2f82Nm5zakWIJB0kjvC9dZtPr9wb4vUDayI5owAfNsN/fwFNH9NqXFgBZ+wzgPnUayXRqcvQfqKHRFr3md1tTwFKMwqJvib15o9aF7qmXqKmOYJrtYvxd44+yCPlIwEBsLNEarKRnn3L1+LTOY2t+yCaJvzdabrDKGjQ5gVPdC632FBlhjk64W5irGo5OYpO83GupcysYE3UE3fZO6CdmtyGPgmTC8vlFnDLefN/Vbo5kj1/YcutA1zMI48RYyhKeUsU73WYWG+6DvTGa2uq7fcnXp29EfD3M5BvVaY9juGe4x578L9Hl1vaSnmNver+N1J80SzbFuZ6QD+mnueip+4UL0FJ9x90egTxvRXbRjjO7esQ+PtgAAAP//e2ltGwAAAAZJREFUAwDLNhdISkzWfwAAAABJRU5ErkJggg==\\\" data-latex=\\\"{(3E)}_{16}\\\"/>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 17:39:33');
INSERT INTO `t_text_content` VALUES (62, '{\"titleContent\":\"下列ASCII码值最小的是（）\",\"analyze\":\"ASCII码值小写字母&gt;大写字母&gt;数字&gt;控制符，故答案选D。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"&amp;\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"a\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"A\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"9\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-19 17:43:49');
INSERT INTO `t_text_content` VALUES (63, '{\"titleContent\":\"<p class=\\\"ueditor-p\\\">汉字“计”的十进制区位码是2838，则其十六进制国标码是（）</p>\",\"analyze\":\"已知十进制的区位码为2838，则需分开转成十六进制区位码进行运算，<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADsAAAAcCAYAAADfjMc9AAAFM0lEQVR4AeSYd6hcRRTGr713URHFjg0LCqJiQSwgKlas2FBExQqKIhhREcGGBUMKpJIEUklCAikkhEAgvZGekATSQxoJ6e332/fufbM3c3df3u6+/JHl++6ZdmfumTlz5syemBxHv9Yqew5zchJsNM5igFNgQ1BN2RMY9WP4HjwIG42LGaAHvALWHdWUfYERb4b/w0Ow0VjJAP/Av+B5sK6opOz1jPQp/BPug+2FqQw0E34FtSxEfVCk7Ml0/y0cCFfAPNy/r1I4GPaD62F3eB2Mwb34HRVjYBc4AXaCMXPVgrpR9xi8C9YNRcrexAh3wxEwD2f7GwpPhS/C16Cmfi5yGrwHhtAcnYgpFD4OP4APw15wNLwD5uHkjaLwXeh4iNpRpOxTdD0Lxlb1XsovhX2hq4BINvNwAnYhXZVLkCleIrEIjoUhJpHpCb+AMYVU9iHqLod1QUzZs+n5SejHpcqQzeBqDie3H4ZYRsYPvAV5O0zhB8fGsX4+j2ugZo4ow0Jyu2HYF9m2I/YRrspldLkY5uFH3UnhSPgMDOHE+IGuklsgrVtFwv19NTIP202ncAfMYysFS+ADsC6IKZuazdrICHsoU6GiM1fHRZPED02afzq5C0nPhk9DJwORuLd1Qv+aidDJm0f5jVCHiagNMWUvoMsDUBNClEHT/YSS06GmjMjgB+k991IyB6bwGNH0LfedQVR8Bj+C7mfPVpJRbKLUQMPxSNaGmLLuuY10G1OW4kLowR+ldijUKyMyjCN1H1wKn4e/wiFQr4soxBpqroRuH0RtiCnblh6NZzvwopP0NTIMQjRbzVcFNVtDT9s7KQYsZ9C+ErSY8DtvpbHO0xOBZAn28T0pLeYNpBGfRx7JFoSdtJQeXUplvuQVTfhZZN4sDTk12feb6zyariU9DPqeoaEKka0ILcdQ0mBEDx42fpuMAU1HZB/opP+MLENM2dC5lDUuyKjMO9TpnRcgQzj7hn2u+ragQg/tfu1K2cvwBlgEPbWWomP8nEa/wRAela9QMAPqUxDJZB4en45PsgkxZY9mn9xPNzosO84rSlVyGw8DjdgxpgI/Ur8dGocjjkBr/Mf5vKWleEyRLGEDz9NgWThapKxHTDWn4NHRIUmSN+k0NF3PU/coxYl7Mz2OzOfpahtYbMlXNOcNQe3b1W0uOkK4ep4g+QonwZghK48pq4m5D52trGEucRV5Y1zN1/ZkM7h3U+fgEeSHGIhkDYKEE2OMHbMKjxvf83wOXml7MqasZ5txsdFNrGcV7U2FihjduPdSGinpjFwNmiSreWiqnZH5sE9F/6Dc25BjkizDReRs4wWCZO2IKesm91jwZqJLD0dxtv+m4EGoZxyADOl1zxtQeIEwiHAyfqKtV7v0iucVUg9dpIz73UmYy3uV4Fkd2wY6Wvdu9m5MWSvH8zBy0YxIZjDQMCjQzIuoU8ibtvvyOXpxAjV/5Yfk8+0oKsGjyOOkPzn3NaIQKrWcWicZUYIhrxGbzrZU4KNIWWfL89D7pAPbtj3pHddJU9lq4+q8DEO9evqtLsITvKR1rkNmKFLWBpqk3swwz3x7UQ/ueep2Cc3Qy4RBi1vCiXiLD3I76e0NJnRyvvc65Sr9C9LLBKIJlZTVfHzZoECn1PRGY5+uipd596l/+YSj+QeBq6V5e4b+TuVE6KXFs/wH0oafRlA6SdtT1IJKytpKr6oj8e/UMy1oMB+hf/2CIWTZqlBeM6op6wCah3+57DTTYHo7+o8xXC1EfdEaZes74jHs7TAAAAD//+ROkC0AAAAGSURBVAMAnDHpObTkengAAAAASUVORK5CYII=\\\" data-latex=\\\"{(28)}_{10}\\\"/>=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEAAAAAcCAYAAADRJblSAAAE30lEQVR4AeSYZ8gcVRSG97P3jr2jooK9+0dREAsqFvSHDSsSG9j1h1hALKigpkJ6I5UkpBNSIIWQSkIK6b0Q0nvP82Q2w3773Z1ZdoZsIMv7zrlt7t05955zz70nFI7zX7UKOBs9nQjrgdMYVCLyR5oCGhiyGXwXHoD1wKkM2hLeCXNHmgJeZMRbYHN4ENYDmxn0R/gTvAbmiiQF3MBIn8C/4F6YFy6kI1fUWOQE2BWOhH/Ci6Cr7gvk3/AIlpLoBn+FJ8PcUEkBJzHCt7A3XAJD8I+8T8UweBZMwzk0+BcuhlfAp+FD8DX4GOwL+8Av4W9wNCzFADL28SwyN1RSwM2McA8cBEuhM/qKgv7QWXNGtFGyidB+p9LCD74d+TPcAkvhamhBwe/QuvnIUuwk42p5D3k6zAWVFPAMvU+H5bO/izKX6vPIp+AsmIb7aTAKboMvwPI+KYqhWSwjNxMuh+WYSMGV8FaYC0IKcDn7cSMYIavj02l1oR/xAY8VMAk6PBU0g0YqDNEIKmUeJY/AXBBSwMX0fCl0IETNcJn+z9s3QuUkZDVQ6So/1HYfhZrSw0j9FCIbQgq4vNjl6qKsVThLmpL9dKQTPwyRCD+wBy2SlDWXeleWwRnJbAgp4Hy63A+1d0RNcHbe4k23tDFIlzUiFY7ZilYqDRGEDvI8anTIiGwIKUAHs45u/TOImnA1bz0KxUAeziwiF2ykF7dgTZVkNoQUkK3H6G3NyKDGrSurL4l6bPz0f7vKjpSqkF/IfA7LcR8Fg6HRpHGGuwjZCHYUpfJ9akb+wQ10m7ScqY6hubj6/Ji4MCVxCvVGle40H5Iuh1twawo/hipgKFLTREQIKWBTVJXp6czr9PQlsprOrqXRd7CawGo37XbAPbAtVAnlMYnbuUGVEeYi2hiCN0MaTSIihBSwiqqr4JmwVqzkRW3VGXI7JJsIZ/9VWhhWh/Z/qmJoXvabNlEP8sYdcAgU63ncBb+BMSopQA1nUYBh7HBGMZ5wGZJMhHZquNwvsVVU6Qx6ntgaZSs+Dbl15I/T4k3oabLJOSKkAKM1Z+R6XqoVev0/eNlZ8j7hXNKV4If/QKUzkzb7NCs8wGMBTGvr7F9GO7+nE9KDmCb2HOkYIQW4VDwHeBiKG9aQmMY7L0HvE5p4X8pdYV8jP4POkEdekonQrp1ZzxaJDYuVmqKHLLN+lyvzUzKOjSgUQgpw9jztGcmF7FeH04a33d9tI01bZh1VMTwx6txc2nIyNZ2hdukK8b13yLtbIFJhX66m8aktC4XZtNGUdZYkY1xHSkUiwgqwQg27j7s8zZdSr+vBxkCngQpp2jLrKGqE7eQ8C9yLlG8gPWx9hPRPuluQrAov02ocrCaynEI7o0UVRjLGQlL+J0QhuAKsWMujHXwbup8j6g53Ji9OvB+sRmmaoKfHu4v//BKkZt0LGfuPkAlQfxjdeRpueolBsq5oYHQvQjQZVw3ZGDrF18ndBJ+Er0B3H21e32Lg8z1l/8H2sAOMkaQAz+Y6KK+oPH3FL9Uh4eXsBYz7DyyffS9JPEAZHzxBfU+4BgrDcM3NmysV0+R+M0kBdqBn9m7QrewMC+pAr+duY1x3jDwvZ+myUNEHHK4sPuYg3aPLvSnFRwWe/43jDa9zHzBtBeQ+4LHW4SEAAAD//yHahkUAAAAGSURBVAMAZmfZOepI6EoAAAAASUVORK5CYII=\\\" data-latex=\\\"{(1C)}_{16}\\\"/><img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADsAAAAcCAYAAADfjMc9AAAFUklEQVR4AeSYZ6gdRRTHN/beFbH3hg3F3rAgiig2FEXsHyyoKFYUsYCKFbEiFmxpJCE9kEoSElIgpDdSSU9I7z2/331vb3b3zt5387L35UMe//89M2dmZ/ZMOefs2yfai/5qNfZw1mRfWG8cxAQSUTyaMrYVU74En4PbYL1xIBP8Ai+HhaMpYx9kxgvhT3A7rDdWMsFH8GN4OiwU1Yw9h5legd/AzbClMJuJWsPP4P6wMOQZux8zvAs7wFkwC+/vIyh7wj9hOzgBujgHI7PwOtyDsjf8C3aEfeHN0DZECl2pHQHvhYUhz9gLmOFK2ANm4ct9glJHogHPUn4UPg4/hP/BpMH2fxOd49n/GcoPQRfrA+RrMIv1KP6Hz8PkWFSbjzxjfanRDBvaVRfiadpuhBqMKGEsv+7cA8gbYIzzKLiDPyCT12EZ9ffgU/BkmMVwFKfAi2AhCBl7GCPfDT1mIae0jjZfWqMPoBzDvluouJPJu6axJ6IPYT5K+4fa59A2Fd4CC0HI2BMY2cmdiGIFdCBnoHW39J4USzAWn0VpHpwMYyyn4O7ciczCcdagDJ0gF24UbddDfQhi9xAy9qTGIRc0ylrFxXS8GuqAki/vdRiCvi38CsZ38EjK3tnvkEthCC6aIciFDLXvki5k7NGMsBVugLXiGDp+Cg0ZXyA90ogS3LknKfWDOqpxSJOU35FfQj0zIohVaI+CSd9AtXkIGeuRW8JwTRnrautJ/6DvYKhzegG5FmaxEIVhxF0/m7KGeidHUK4Gr4D336tVrV9NbSFja3qQTqvh99Bd8gjPpDwdGoZ0OhTL8G66623QmAp6PF+nPAjahsiF75i8sxrvKXoj88RV1I35tyN/hjpZxE440M5a80seWxMQd06jTDPj0bxzxt7PUfSBY+AV0LCj7EXZEIOoCj2/C+tYnqBkZ3f+WxS/Qa+LvsEFMdVF1YCQsSsamnb5V4MH8pS7aiZlCLP8FrpuMHlkTRq82yYWhibjOl2C2IjWcLcJ6ZXRYLM1qmVcS+l4OAOKxfxoR2p3Q8Ya+06l86EwC4/Tjyi9z95Biil4xzTkTLTe6WORZk79kSF0QvkPNLwgKmBkcEd98YrGhMJrNJd67C+UhsDL0JWRZ6yrmWeshnhv3LUoispjWTCs+HLeX++0ObSfbbaF6Gnw/vqioXbz43isUHusOz8uZKSZWdmOkLFOrCEmCJlnI3fUfPllGkzWESncQc3dN6YacjxO3tH70DsmIgUX5zo03mVEBa5BMw06FmL3EDLWAG8i4PELjW6CfisNJv7uHMUSTCgMRToqva5Kd87vU431gyHZX0N1IiYc3nX7J+mdvxTFAFgIQsaapnVhdHNSX4hiCqaIfggY6IfRomGdkXrCV5Eugn0olmB6eRMlHdFQ5N/QREKn5en4mrqLgkjBkGSW5TOphkBlSkCnyliuc7MchYy1wdU8joIxEVEBnZAxzdj2GK33Q/v+i/QjAZGCmdA7aDyWfuX4ieeRN86GDKVr9DA/7noy9UQVxHi0hjhPA8VIeRoF9eXx84xdREeN8dvTO0i1RWE0uI0Z/X9U+WWp58EPBk/TuY0dPBWmsP5zoVEV5e6sHTyeBmsdiPWWYism8qO9O3IiTMKT8QQKr8RdSOO0X2g61Rep+89BT4zyfep6ekQD8nbWVldKh2Py7hFR1xI0+3JX/BrK7qof9L/yEsZfPxnbUzbvRkQj+dFf+B2usS5W6vlqxvJspHPxf1E+fIiKOtN/CFzCHG/D0N1H3Xw0ZawjT+JH51L2atTrBY+doUoHWPgctRhb+KR7asAdAAAA///G5HuyAAAABklEQVQDANDW7zmf0fxeAAAAAElFTkSuQmCC\\\" data-latex=\\\"{(38)}_{10}\\\"/>=<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADoAAAAcCAYAAAAwTqwDAAAFUElEQVR4AeSYd4hdRRTGZ23YO/aGBWyIHbuIDVERCxbEhtgVFRULKggqYi+IBbGgJoQ0kpBAIKSQQEhIIIV0Aum99578fps3l7t35773wr63+SPL971zptyZe2bOnDl39wv7yF+9hh7BeuwPm4kWBnceJWpjUctQJ32ZKZ+FO2AzsZPBb4efwgNhQ1HL0AeY7QL4M/RFEE1Fb0ZfBd+ALjKiMahm6LlM8Rr8Bm6FnQEX83cmugXeABuGMkMPYIb3YA84CxbheX2Uyl6wK1wM/4LnwDL4zMM0joHd4FD4ISy66WrqfoQfwcNhQ1Bm6PmMfgXsD4vQpd6l8iD4IHwM6t5HIjXiamQRh1DxG3wE3gGV7ppGOgZVbTCS0sGwYbtaZujdTDIOpnbzGupPhF2groYIK/jR+I3IP+EJMMKF+YCCz72EtC8i3MTP+/A2WIS7OphKF8TnUTuGlKG6y10MOwhGQ1AzuAP9KG2DecykMBBeCC+BEZejvA6NpkuQEQtRRsEhMAXn16vyi5bqV1ddylAHPomnp8MiDqPiUjgA3gvzcFGmUuEO+IKoQf0ZlPVwNMzD8W+k4n+Ygt7k8Tgv1bindSlDT6kM4opX1ExsRtOYsjvVgEOX4BUR+DsOehanIfO7SbEmdN+l9DoTdhgpQ49h1O1wEyxCd32VSgOF7ouawUitm26hZgIUp/JzOpwNL4M/wafgD/AzaABDJOGVtoaW02CHkTLUM+ZKpgytNqGR+lY69IFGX0TQO0zrbqZg0DER+AdduQ45HJYZ4vzLaG+a6zL2HsNr4mOecoHeQbobiOAuR/k3ip6CCJ5n71LjwQtUeJYRSTh2bLCf6egvsSInj0X/A+o13u3eHBR3I7Wju1vq/3XyN+mu296H1E0RbTCeUvHMe2Y9u6aZnmW6VIX9TEpc0LzxPnQUPxrnlWQ29wllFyQ7GilDYyChb13wBZ6mp1F4CjKPBRQ2QF1QV0RtB8+wZ7ldQ6XCoKRqFuY8ZlSW83yRgklJTHCeo+y42YKkDPXl7ORVQv+quI5Wg5P3btFImoKp4UoUx4puTLEueJ8bcefX6H087U9CjYyL8hblq+By2IoyQ71GfLnWTiU/pnq60RO05931LMr3QOFO6ra+sEHJukhd3utoWghhTqzMSXfDd5icq0upeoNBz9tCt3V3zdPd4ax/ytB5tPoSZyPL4Is/T6OuZH/UDJ5Vz4wVuuu/KBdBozIig2NcTMmdcNdR28CkxXFSi5DveAaFo6HyV6Q5tUZ/i555UcpQt9s8N2Y39G8DX9CX96406X6I1ki/aMxn8zvck/b/oO4UV1npFTOW+u9gCl4rxotahsZn+6IY7Y3oI9Afhy4wIoSUoSYF3oXefb5Qa8fKj4nC9+imbl763dHzNPL5JWP6RlMrnNxcdyIlo6L3qPenEdcAFs8VzRla0PzKMdVM7TbNGYwpaykVx/Go6NI0haShNphoe8jNay1H6or3U2ipQhOAojv7VWPIv5bnzIyuRH4FrUe0g+f8emr9HkZUhd4zlx4nwzz0hkWxIrWjthkt/dwyIc/83IZOoh/ow5hrEqwFj5pXj/9v8l3dhDt5SO8xL0cNpTtqo25o5uIuWO4s+i8cX9qz63mL83okPHd6g++k7jm2zxd0cvfMir5G121fQWYeU7aj9An6vGfrbQoGIETTYZT9nFn8UNclUTN4T/tJZ4CR6jMqrX4Gmp0ZCA16Hg8NrzRX31E7OZl3kv/yPNSKJtI71bzXnSx+u3Z42mo7Ggd3Jf03ialcrGuGNOH/koH9fxGisajH0MbOuJdG2wUAAP//3KAHFwAAAAZJREFUAwD12uw5KgoJ9QAAAABJRU5ErkJggg==\\\" data-latex=\\\"{(26)}_{16}\\\"/>，区位码+2020H=国标码，因此1C26H+2020H=3C46H，故答案选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"3C46H\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"463CH\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"BCC6H\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"C6B6H\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 17:51:37');
INSERT INTO `t_text_content` VALUES (64, '{\"titleContent\":\"<p class=\\\"ueditor-p\\\">40个24X24点阵汉字的字形库占用的存储空间是（）</p>\",\"analyze\":\"一个汉字字形码所占的字节数=行点数X列点数/8，对于一个24X24点阵的汉字需要72个字节，则40个24X24点阵的汉字字形码所占的字节数是2880，故答案选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"2880个字节\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"288K个字节\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"288个二进制位\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"288M个二进制位\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 17:55:00');
INSERT INTO `t_text_content` VALUES (65, '{\"titleContent\":\"表达式<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEUAAAAcCAYAAAA3DHIWAAAEg0lEQVR4AeyZV6hVRxSG902vhEAIIaSThCRPKRAI6SGKXVBsTyKigv1BURRRsSD2/qCoCII+iAVUUMT2YnvQFws+qViwYW9Yv+/euy/nHGffs/fGI+eIl/8/a2bNzNqz156yZu5L0Yu/JzyQ1inv0vJlWO2oo4P2VUkyH8o5ReP9Md0bPoTVjkd0sAWcCF+FuVDOKZ2w+j1cAH0gouqxlh5egUOhHxWRDc055WtMDYIz4D1YK/DjLaKz/8I/YGYkOeUVLI2Eq+FxGILDsw8Fm+E7MAlfUrALtodJ+J2CVXAAHAXXwW9hEsrZvErDuXAMbK5vFD+JJKd8R9Vf4EZYiDfIDIfr4TY4Gb4OS/EjimVQZ/iyf5JOQmcKFsIR0GmqTbmB/K8wRhabttnNj/3NPFqSnNIWgwdh6Si5g24a7Ahbw0MwBNv2ouAv6KKHCOJDtOPhYngCxthPYgv0S7+JFGltWlc6Wvxw3chkWltCTnG4+cJbMeb8RFQMP2PZqeALk2yCz/VL/4fmB5gXvoMjXuenthFyigY+wsIxWGk4rRx9lwIPOofOUeJUJpkLjvTXaPkNTI2QUz5ubH22UVZSfILxG9AtFFGEy+RuQ+sgcsEpdIGWn8PUCDnlfVo/gH5BRMXgNE3T2UxfuaS3hhLX0GVybMgpzmG9W2mn0NdUcOtPVTFQyXe4iD6TY0NOwcZzh0LHOmoM7obxlnuhwalrF8kGPL9OaXi/0l+n7DiUU+B02AG2gYYZTQfekFNCix7tnjpcYAtjk6QHHE4qyKB3wbW6AaCj5qQZ6A63Bmm07a5LMopCTjlDyafwbVhpnOIBH8B4xyPZBHVvkbMOIhccGS7mpxtbe3zpQbo7jOFC7OZS1il3afEsnOKcNhS3UzyyCDrlFpqjMC8cFb5HPNp2YMi4ZQVS1PFjHGTwaExDNgqOFL9MHaVfwUpjDw84AkvPJ35R70UM0+MXolpmGIS+R6t4upAsgtPJ58xGG0+xoFOMLvWc4TF1K4rzWB8Lu8AvYAyf/ROZCdAADpELbsWukSGn6CwX3FlY9g4G0YDQmnKfIk/BfyOLtirywls4tzRPsdaRptVZZh1fcA6J5XAJFErz6i1XJ13ovLeZR2YgHA09CLr47SMdwza21Ya21CvNq7dcXUxHe0sym6DRMaIJTisd4qFzJlrPWogGhJxiyXZ+XAAdXiSLYEf6ovkH+mBpWp1lqCPn55AoinpCFzDrKM2rt5yietghp4lOmI9mEmwHS6eNbWyrDW01Z5PmkU7ynsY7oajgz3aDyXu2ix3SlbzxCyIKTh8L3KqWkvD47/wmWXPwRXfS69LrDa89PMZ4CeUHcYdqRT2PBIhkp1i4kh+/yG/IWoNXqS6grhe+eNx/1ykvv9S7TFh2ncLPoHETonmnuBo7XA2H3evrG9TAjwuoN3dea5YGhwfov9t/HbKQ/5O/CeuRtKbUF/KjUe9q/TeHgRSqqoahej966EgoXKRRpUc5p2jJOML7UwMp89VM14qpdNBbO0Q+pHFKPss13OoxAAAA//8gHxWcAAAABklEQVQDAPyVwzk+2LTvAAAAAElFTkSuQmCC\\\" data-latex=\\\"{(1101)}_{2}\\\"/>+<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEcAAAAcCAYAAAAz+aIrAAAEh0lEQVR4AeyZR4gVWRSGX0/OgQnMDJMYBiYweVYDgwEUzIoLUReKiAqCAQO6FAQRzIoggglMiBhAF4qoW3WhYtaNigET5oTx+15TxXvtra6qVzb0E5v/f+eGc0/de26+/Urp5V+iB7I6530svArrCe9S2ddhzUhzTgOWh8PB8DGsJ3xKZZfCr2FNSHNOb6z+AufDJ7CecIrKzoEz4YcwN5pzzo9YGwFnwAewHrGHSu+F46CzAJEdSc55DRMT4Vp4EobgfB5Cxhb4HgzBeT+ZDHtwIHIVHAMti3gGpj9Pm472xXylA/wH5kKSc37Gyr9wM6zEW0TGw41wO5wC34QhOJQ3kHETjobL4ACobaepjiBaagmb2o14gYAdOAiZa/QkOacrhvbBpqPmHmnTYE/YGR6CSehHxldQp9iDBEtOz7kEusF2ULSETe1WUue0IcH6ILIh5ByniA3fhomoUQRz4W20e8Ej8AqsxFkisj8yT08WsXmUb9kJfyAzI+Sczyn9BTwOa8WXFPwTnoMPYSXuErkIf4MfwawoYvMaHzkB/4eZEXJONPTOZ7byrOLHJH0AHSGIKtiDl0mxE1xvCGZCEZvOAJeAn/iSmw0iHSHnWIlHFLURiJqgg99JKel3dFCKWpxd1KbT24Nh5g4JOedXqnMJFnEOxVPhdSRzL6Zaa1RozqZT/BvUPF4g0hFyTnqp+tWwM6I2e61YSFM8IO5Ceth10SfYiEixMdaSv63LtjvyJKo0FU6HPWAX6DHF0UewVAo5x5W9nFngxyF8J6W8i7J6KWpxtrpFbd7Cmmetv5AeQk8jhQfFdQS6w3gdDDnHSuSamxhsiqsk3ICuX4gq2GvfkeJ2nmddK2rTukRrqdPLQ2pf6hHB+lZtEknOuU+JzAsXuk1hw4+RGNod3C0+I+8gzDNKi9r0aOFN3dGzk2+/AZdD0cCP15qqW0HIOWdQVPkHZK2wAqsp/Dv08IaIYSUcmStJ8fyByIQiNu0Qp9L+hC+Z15G82fA6LCPkHM8DetCLZ1mpxh9v4J6yHbo6WzPOcx/OdJy9Z1oe1mrzEz7yPdwNm8ILsgvzLDLWwxgh53jc99bdFq2qrY24sHFugZuIqCMNm2YeyWXYAz6WObUWkOKTxQrkYTgKujAiyrCc5bWjPWnYNPPKSvzksYl6DEewnX4gTmkM2Fk6ZitRH8WqRnLIOeiVdvBjoxxuBKuwiNhQ6K3aESENm2YeWTFc5MYSGwa9nfdBul16vyIYw3KW1472pGHTzIsVCWS1iWoZLr52zBpiOhdRht8YScjRHTnG+nn+IbkU3MrNcGvzkcg3EI2bVq/0AmyDdU5lG3x28ZrkE4ojxl20EwrxiE4aOeiUnN/u+f8ZqVM6bZzCLrTudlEz/iawBLrOuIzoHB/lviXNhR+RPHLMdAhq2OO15xLT6okNVNYXSNcZD3hEY/iu7JlGnUr6nHo70mpu5KjjucC3ZP89k3bLVr81sT2V8ZAZrSdE8yHNOVrzNW8CgbSjOyqtCr5xz6NGriuI/MjinPxWX5ASTwEAAP//ddhGMwAAAAZJREFUAwDT+PE5a/YHhQAAAABJRU5ErkJggg==\\\" data-latex=\\\"{(1010)}_{2}\\\"/>的计算结果是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEcAAAAcCAYAAAAz+aIrAAAEh0lEQVR4AeyZR4gVWRSGX0/OgQnMDJMYBiYweVYDgwEUzIoLUReKiAqCAQO6FAQRzIoggglMiBhAF4qoW3WhYtaNigET5oTx+15TxXvtra6qVzb0E5v/f+eGc0/de26+/Urp5V+iB7I6530svArrCe9S2ddhzUhzTgOWh8PB8DGsJ3xKZZfCr2FNSHNOb6z+AufDJ7CecIrKzoEz4YcwN5pzzo9YGwFnwAewHrGHSu+F46CzAJEdSc55DRMT4Vp4EobgfB5Cxhb4HgzBeT+ZDHtwIHIVHAMti3gGpj9Pm472xXylA/wH5kKSc37Gyr9wM6zEW0TGw41wO5wC34QhOJQ3kHETjobL4ACobaepjiBaagmb2o14gYAdOAiZa/QkOacrhvbBpqPmHmnTYE/YGR6CSehHxldQp9iDBEtOz7kEusF2ULSETe1WUue0IcH6ILIh5ByniA3fhomoUQRz4W20e8Ej8AqsxFkisj8yT08WsXmUb9kJfyAzI+Sczyn9BTwOa8WXFPwTnoMPYSXuErkIf4MfwawoYvMaHzkB/4eZEXJONPTOZ7byrOLHJH0AHSGIKtiDl0mxE1xvCGZCEZvOAJeAn/iSmw0iHSHnWIlHFLURiJqgg99JKel3dFCKWpxd1KbT24Nh5g4JOedXqnMJFnEOxVPhdSRzL6Zaa1RozqZT/BvUPF4g0hFyTnqp+tWwM6I2e61YSFM8IO5Ceth10SfYiEixMdaSv63LtjvyJKo0FU6HPWAX6DHF0UewVAo5x5W9nFngxyF8J6W8i7J6KWpxtrpFbd7Cmmetv5AeQk8jhQfFdQS6w3gdDDnHSuSamxhsiqsk3ICuX4gq2GvfkeJ2nmddK2rTukRrqdPLQ2pf6hHB+lZtEknOuU+JzAsXuk1hw4+RGNod3C0+I+8gzDNKi9r0aOFN3dGzk2+/AZdD0cCP15qqW0HIOWdQVPkHZK2wAqsp/Dv08IaIYSUcmStJ8fyByIQiNu0Qp9L+hC+Z15G82fA6LCPkHM8DetCLZ1mpxh9v4J6yHbo6WzPOcx/OdJy9Z1oe1mrzEz7yPdwNm8ILsgvzLDLWwxgh53jc99bdFq2qrY24sHFugZuIqCMNm2YeyWXYAz6WObUWkOKTxQrkYTgKujAiyrCc5bWjPWnYNPPKSvzksYl6DEewnX4gTmkM2Fk6ZitRH8WqRnLIOeiVdvBjoxxuBKuwiNhQ6K3aESENm2YeWTFc5MYSGwa9nfdBul16vyIYw3KW1472pGHTzIsVCWS1iWoZLr52zBpiOhdRht8YScjRHTnG+nn+IbkU3MrNcGvzkcg3EI2bVq/0AmyDdU5lG3x28ZrkE4ojxl20EwrxiE4aOeiUnN/u+f8ZqVM6bZzCLrTudlEz/iawBLrOuIzoHB/lviXNhR+RPHLMdAhq2OO15xLT6okNVNYXSNcZD3hEY/iu7JlGnUr6nHo70mpu5KjjucC3ZP89k3bLVr81sT2V8ZAZrSdE8yHNOVrzNW8CgbSjOyqtCr5xz6NGriuI/MjinPxWX5ASTwEAAP//ddhGMwAAAAZJREFUAwDT+PE5a/YHhQAAAABJRU5ErkJggg==\\\" data-latex=\\\"{(1010)}_{2}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEUAAAAcCAYAAAA3DHIWAAAEkUlEQVR4AeyZR6gUWRSG603OAWaGmWEyMzAzzKDiSsygYlZcmBaKiAqCAQOKIAiKiFlBEEFFMC3EACooYtqIbnRhQFcqBkyYE8bv89FNV71br+u1i64WH/9f995z7r196tS58b0Tvf1r4IGsTvmclu/CvKMOA7XVlGxlKOcUOx9N18Phc5h3vMDAznAWfB9WhHJO6Uev/8Bl0B8kyT22YOEtOB76UUmahsac8iddjYEL4BNYK/DjrcDYjrANbDLSnPIePU2Fm+BZGILhOQLFLvgZTMPvKA7CXjANWfr6lMYz4RI4FG6AE6BtSWK4TWkpnA4bsw11Q6Q55W+qtoQ7YCk+ojAZboN74Wz4IUyiOYLVUGdsJG0Lk8jal+2+5LEV3oUOizWkQ6B2OrRDjjmE3t9ocrSkOaUHHR6DySh5hGwe7AO7wRMwBNsOQ9EOOumRNEDWvmw4iMePUGc4PMhGDmmjoSeFDjAJo8UPNwBFk+aWkFMMN194D50VDCBbNXzML/eFp+ANWIqLFORg0tCL+w5G/HfoMyPkFDv4nh7OwDzgB4xoBi/Bp7AUDylchf/Br2ASRvoHCP+CmRFyimFqB5d95IBfY8MX0IggicEheB2JH9L5g2wMDqFrSH6FmRFyikY8owd/kKTq8CN9UsYKbdYxyWrOO3cQ/gQzI+SUf2mtd/PiFMwpC48gbiOSFX0HI+m1h0+y4zehXLpkGzVu7ibxYoehm1Mnc7L1CEVKvabWn2H7XVlnoJoD58PesDt0m2G0kY2ikFM8N7xS5uThqvOgjC0OEeulVXPCVeem0qg5bwFegZuhu+3inBRyip3/TEW31SRVx00scLJ0riMbg1/elcVl2fkjpqRQ0BdWLucdN4ID0RVg37GJOs0pj2mRF6f4wqex5xuYXHYtf4v8OAxFuFHhe5xEL/bzcN+yllTU8fCo4A7cPQ3FKDh8LqCpg3/APOAeRnh++p/UjRxJEb6QUb0eSWj37SbUc1NhuFAtBoeT9y+LkRaGWNApbqX1nNtj6uYCnojdYRv2fjCNMgq8/NJhRoCyJF2KjaCQU3SWE+4iGnkHQ1KP0PBxK+0puD1VYksVZaEhLmnbKVhHmlemDnH0WxRFHvE9wK0kL0wtK1evzPq2s739SPPK1FlH+hW98HIILUfg1cE6UofFOFI3aSQx6LwuSHZC5yWSInSoDtmNZCGMRVnIKdSJ9vHQAMOLbAy+3Egknkz9YWlemTpUkeNTYzXeWd06ppaVq4/4s77tbG8daV6ZOqoU4YQ4kdIoqHP7k7qUev4h2wA6vjVS74RIivA3xlIy8goOsS/3L4ij4PBR4VK1iozHf2dssjUHX/QAVievN7z28BjjtYMR4grVlXrFaEuLFOpEjmO/bisLNUavUp1AnS988YL5Lch4+aXcaUKdF1e/IHdCJ0mPFJWOY0Pd7bB7AWW1QCdQbwSnYew5WIqjFNyT1JGWshPl+/AVGosUK9ipd7X+m6PcSdX61aZbdeccI+FIpcaUc4r9euM1hUy5rTZVqg7nirlY4f0sSWXI4pTKeq7hVi8BAAD//xgirWcAAAAGSURBVAMAa0fJOWqtZCYAAAAASUVORK5CYII=\\\" data-latex=\\\"{(1110)}_{2}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEUAAAAcCAYAAAA3DHIWAAAEg0lEQVR4AeyZV6hVRxSG902vhEAIIaSThCRPKRAI6SGKXVBsTyKigv1BURRRsSD2/qCoCII+iAVUUMT2YnvQFws+qViwYW9Yv+/euy/nHGffs/fGI+eIl/8/a2bNzNqz156yZu5L0Yu/JzyQ1inv0vJlWO2oo4P2VUkyH8o5ReP9Md0bPoTVjkd0sAWcCF+FuVDOKZ2w+j1cAH0gouqxlh5egUOhHxWRDc055WtMDYIz4D1YK/DjLaKz/8I/YGYkOeUVLI2Eq+FxGILDsw8Fm+E7MAlfUrALtodJ+J2CVXAAHAXXwW9hEsrZvErDuXAMbK5vFD+JJKd8R9Vf4EZYiDfIDIfr4TY4Gb4OS/EjimVQZ/iyf5JOQmcKFsIR0GmqTbmB/K8wRhabttnNj/3NPFqSnNIWgwdh6Si5g24a7Ahbw0MwBNv2ouAv6KKHCOJDtOPhYngCxthPYgv0S7+JFGltWlc6Wvxw3chkWltCTnG4+cJbMeb8RFQMP2PZqeALk2yCz/VL/4fmB5gXvoMjXuenthFyigY+wsIxWGk4rRx9lwIPOofOUeJUJpkLjvTXaPkNTI2QUz5ubH22UVZSfILxG9AtFFGEy+RuQ+sgcsEpdIGWn8PUCDnlfVo/gH5BRMXgNE3T2UxfuaS3hhLX0GVybMgpzmG9W2mn0NdUcOtPVTFQyXe4iD6TY0NOwcZzh0LHOmoM7obxlnuhwalrF8kGPL9OaXi/0l+n7DiUU+B02AG2gYYZTQfekFNCix7tnjpcYAtjk6QHHE4qyKB3wbW6AaCj5qQZ6A63Bmm07a5LMopCTjlDyafwbVhpnOIBH8B4xyPZBHVvkbMOIhccGS7mpxtbe3zpQbo7jOFC7OZS1il3afEsnOKcNhS3UzyyCDrlFpqjMC8cFb5HPNp2YMi4ZQVS1PFjHGTwaExDNgqOFL9MHaVfwUpjDw84AkvPJ35R70UM0+MXolpmGIS+R6t4upAsgtPJ58xGG0+xoFOMLvWc4TF1K4rzWB8Lu8AvYAyf/ROZCdAADpELbsWukSGn6CwX3FlY9g4G0YDQmnKfIk/BfyOLtirywls4tzRPsdaRptVZZh1fcA6J5XAJFErz6i1XJ13ovLeZR2YgHA09CLr47SMdwza21Ya21CvNq7dcXUxHe0sym6DRMaIJTisd4qFzJlrPWogGhJxiyXZ+XAAdXiSLYEf6ovkH+mBpWp1lqCPn55AoinpCFzDrKM2rt5yietghp4lOmI9mEmwHS6eNbWyrDW01Z5PmkU7ynsY7oajgz3aDyXu2ix3SlbzxCyIKTh8L3KqWkvD47/wmWXPwRXfS69LrDa89PMZ4CeUHcYdqRT2PBIhkp1i4kh+/yG/IWoNXqS6grhe+eNx/1ykvv9S7TFh2ncLPoHETonmnuBo7XA2H3evrG9TAjwuoN3dea5YGhwfov9t/HbKQ/5O/CeuRtKbUF/KjUe9q/TeHgRSqqoahej966EgoXKRRpUc5p2jJOML7UwMp89VM14qpdNBbO0Q+pHFKPss13OoxAAAA//8gHxWcAAAABklEQVQDAPyVwzk+2LTvAAAAAElFTkSuQmCC\\\" data-latex=\\\"{(1101)}_{2}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAE8AAAAcCAYAAAAgLuLfAAAEsElEQVR4AeyZV8gVRxiGTxrplXTSSSAJaZAQkkDKTSBBxYqoF/aODTt4qYigXigIIqh4YbnwQsGCIioK3njjhV0vFBv23uvzeNxlz3H23z37q78e/XnfnZlvvpkz77e7szPzP1168lc4AnmD9yq/8AysF6hFTY3SkxW8p+i9P+wBb8B6gVrUpDY1FtKVFbw29PoNnAZvwnqBWtSkNjUW0tVQ8L6kx4FwMrwK6w1qUpsa1VqzvrTgPUtPo+FCuAeG8BzGXnAFfAWG8DLGsXAK7ALnw6HQtiR3QXtWnzb6nMs62AKmIU9falOjWtWc1lfQnha8r/H+GS6FSbxAYQRcDFfD8fB5GMLrGBfBs3AInAM7Q/v2lVEcxVLePn/CeTY0aAtI/4TVyNtXsp0a1eq4kvbMfFrwmtFyE/TOkMS4RG4ibAn/h1tgGjpS8SE0aM4xZEu+KlPJNIf/QJG3T8fTjQZ/wXEwhLx9Jdvuo7AdqpkkP0LB8xU0MKvoJhJNtia8iHcruA0eh0kcoCA7kRb+0tH2XuEaHS2B/0KnGZJ8CAXvXZq+D3fCoviAhj/Cg9DBkcS4SO4I/A6+AR8GqPUjBvIezI1Q8HzV7OCQl4J8k3avQZ8wkgr4ah3D4k1yjiLb5Ii0RtpzDSgUPIVfp7UiSQrBQbyU0dLfMYAZbg+kWq1qdky5fzAUvG9pfRTaIcl9g1ukmpcH92k0alXzV4H+U02h4KU6PwYV0fLJD1l39E6Crg42kv4BK/AkeBXhiAsupfxouqYdhNXlll9kP4IUywgF71S5qlFXv7IXMnrwo6FfhtsDrVa7U0lbfnU9jJZqy8hfhv/BGKHgKehjPGpa8+CfxEkKZ6DzJ0kFXEd+isXlinMN2SaHx1Nu+dRu8NwduRl4687IXF5dIV8xJ6YFzyg3JngGZgc/9jasXo5Yfgf7ZuidJmlyuKg/zygMnje0Nfnf4AkoXD24Jl1pIWIoePupdML8grQoztHQ/ef3pC6YSWK4h/TJnoclei3INinUqma1Vw/EJ7Enxg3QQxCSMkLBczvlPtLNctmr2NUTFFfuHWjuwEhKfs08hDSwazU8JFSr+3S1Vw/JffwvGPvC0zBGKHhupzw1+RsvH2eSCih+Bha/PvpI89qso+o2/CEPGn11p2PxSGou6VY4GHpIQHIbtrO9/difNK/NOp0+4+LRll++meSFqWXt1mvT33a2tx9pXpt1+iSpRn08mlJ7su5XCgNgO7gXViAUPB3WcFG0x0BkK+CAe2PxVMQnSprXZh1VMfxoDKPUByqyPakTsRMw2Ri2s7392J80r806HT3hMejeBHcm+pha1m69fvrbzvb6SPParNMnSTWqVc1Jux+1kRi6QgPnzfFhoFhGWvAOUz0LegTkO0+2LqE2NapVzZFIv7bedA9JDZz2H7h8AmOkBU8H5yzv7O8W6pRqU6NaI4kGdAIFj+d3kfpRk05lriAwldFQ8JyzfB2G4+ojTFJXUJPa1KjWSJzzXj8Kvu7VXI49RkPB08lH1kfXf9FlnZLo/6hQLc6BvppqLJVKtQ89K3j26GnwKDJZ2y1cHhmoZQyj3Q0LI0/wCnde7w1vAQAA//8nU7EfAAAABklEQVQDANTR1DkpTpK0AAAAAElFTkSuQmCC\\\" data-latex=\\\"{(10111)}_{2}\\\"/>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-19 18:04:44');
INSERT INTO `t_text_content` VALUES (66, '{\"titleContent\":\"十进制数-15的8位二进制补码为（）\",\"analyze\":\"二进制结果为1111，原码为10001111，补码为11110001，故答案为A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"11110001\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"10001111\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"11110000\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"00001111\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 18:13:18');
INSERT INTO `t_text_content` VALUES (67, '{\"titleContent\":\"已知英文字母H的ASCII码为<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADsAAAAcCAYAAADfjMc9AAAE00lEQVR4AeSYZ8gdRRSG1957xV6xYEPRqCiCBREVsYEdRREVRQQbiKIoIooNLOAPFWw/FLEmBBLyKwkpJCGENNIr6b3X57m5s9m73+zevXx7v/zI5X3vmTkzO7Nnypkzu2+yF/2qGnsEY7If7DYOpgOJqB/tjN2HLl+AT8PtsNs4iA6+hVfA2tHO2Pvo8SL4NdwBu41VdPAufA+eCWtFmbHn0dNL8FO4BQZcTeJ7uD/sBmbT6K/wQ3gArA1FxmrIm/TyB5wFsziZzFPwN/gofCDCe9AdCwPc7w+R+RP63CLkD/BcGMM/KI+Ed8PaUGTshfRwFfwf5nF+U6GRP5P+PcKP0B0Khfv+DRIHwvvhw9CtoTGjSV8D89iA4hf4DDwE1oIiY++k9XEwP6uokjP401CNyNP2PqZc4+YhxbX8nQRdmmHfLydvHY1yS5xIPo8RKE6DF8Na4MvlGzocxR1wEAwvR7IBjdtGaiyMISy7fzOFzqb5rRmdyen8DYQacxkyj7kopsKbYC2IGesouy/tKNbJByh1IogW6D0fROPMhkE6jLzHSH9kGAiSDVhnMikH0C1DsgUOzhg010N9CKJ3iBl7SrPJhU2ZFb7gChTOLiKFXlPP/RWaZTBgEwkNKjqjdVxUSVYm8Z/POogGNfEaHWhjxh7D8xqzEVkVLntfeGTuAWfnRXRGRS5lkimcrSvJbYbjYQyrUR4NfR7RO8SMdQ8todmqxh5H3efgX9CZR1SCHv8Wav4N9cqIHnAVuWrcWj0KO1XEjO20jdt4wJUwDVkVGvAOlR3U15DZoIVsC3xHV0FQ6k/0AZcHRVOGYMcB/Aadqw2xGza0O9d5yuX1OI8Nh1VXgg7pFeq7hA0+Ys6O4h7Ql7yP9keoYYgUzvxn5L6Dg+En0Lqe5yR3IWase29Xafv/s6niOaojIVkJxttPUlPvPAnZDjq59VRaAN+Gb8F1MAvf4QQUM6BYzJ92tMxuzFgbPZ3KHhuIUjg7OjQdSWnFZqHHiA7Ll6hiqLNp5OWLN5uIikvQGsSEQVDOR9ey1IuMdTSrGNsvSRKjIB0JbZfCsNB96rLPLt2zeOouGIMh5UwK1sAyXFBQeCr61I6YsY6Q++ocKpZBp+HIl9UJZZ6Vz5Jx+do+yRSujqPSXGuiH1kd31pkrxEz1qDAuDgW1WQ71Dkdn1UUpDX0J8o8S29AGlcHehN6Hl12psk2YNhqGDmkkavhL2asgYBnnzFp2Y1D7zuHd/D4WIqMwQH5goIb4Zcwf0PyuqfHjF04XN7O+DCea4cpBRWMr3VujeKYsRY4ms6aca35GB2UJyjwpWIzQ1HigNxLwm1RRG82+aXNI4mzP5REbCBQt2ACOVeQq4FkovR2pj4NdIqM9XLt1ctLunvTBvqSngY306Hfo9KXJV8ELwx+0gl3bSfAjwcGH+kzRcZawSXmYX2dmT6kK8BL+3/0OREGuKU8stznOsbHKLgd+pHOleHe9+PgreiUnsct53+ZsY7Uyzz4KnSJIPoEBh3Oyuf0lp1Vj7gB6AwvPXuV3oc9JlEno/h7BHoP11gHK/t8UmYszyXuRb9F+XD4zKK+W/RycCmNvw7L4mWKO0c7Y23RSMdPKKlXU9kluuz8lOos1t5FFWNr73RPNbgTAAD//2LVONkAAAAGSURBVAMAr3jSORWDdEAAAAAASUVORK5CYII=\\\" data-latex=\\\"{(72)}_{10}\\\"/>，英文字母h的ASCII码是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADwAAAAcCAYAAAA9UNxEAAAE1ElEQVR4AeSYZ4gVVxiGN733kISQkE56IYGQQAqBJBCSkF5IIIWEkARsIChiwYZgw4JiwQoidlQEG4oIgoodu6CCXWwo9vY8K/fu3NkzZd3x+sPlfe9p35wz38zXZq+vucb+8ip8F8/lBlgN3MEhN8ErgiyFr+PU/+Ff8DysBh7kkJHwMVg4shT+lhNfhAPgBVgNbOeQvrA3vAcWijSFn+WkJrAXPAOriaUctgK2hFoZTTFIUvhGtm8NJ8JtMA8eQGgmfB2GoG+2YWEOHAIXwEEwZLpa03DWPoZvwsKQpPALnPAWnAHzwLfwD4LvQx8WTQU0zRHMLIGfQGU/pB0NZ8PQQ9rL/Cz4J3R/msYjSeHP2XolzPt230C2BUzC9yxshHNhFIsYjILNYUgpFf6AtUdhIQgpfCc7fwa9OU2LbipuY/UPOBUmwZsOnaX8On6egpo8TQU2MDoJX4OFIHQTD7HzI3ATzAMjuaa6JUV4B2s/wydhHLrOMiaPwTgOM7EZvgcLQUjhkvnsznGCkVy/nZwha/C7H5lV8AtYMt+36RuY+tGGoIWtZeF5GIoNTDcMIYXvY4tzUFOiSYTV0H+sDoYnYBpMMd8hcBpOh5NgU+j1+re5l2EQB5i1GLmVttEIKfwSu+6HWQrr5zuRM7jRZGIeEu9CTf8b2m5wCjQa0yRiFyuPw5CPM90whBTOs4N+/jWCRljNjm4qNGFNWSU1YUtVLcRAZ2Fj4EvbQHOO3uvLCBtUH6YtwT3aMdByfqW1OjQd0q1DdJO62fSeN28eHYuY5kaTCQOb5vs3kpqvRcXT9KdB05llpEoxTIX1gWWnBYuRPSr8O4Nn4EA4BmqlnWkrEFLYyFghFBsYaExd82PzSUPfgiViewSOwBKM3PrvUCZ+hM/BJBjBLW9NU80Q6g6j8H5+YmI5PAvFYn50O8+newkhhdN8xsDhzWtSPklLxBJ/YEvNqi2tc5ot3ZpX+TGohdKcSnRk/Sg04tPUQ56Yci9XaTGmMLq12MfvLTBautYkKXwKwVCQMJCp2Jesa9ZRTmBOxbrQOj+MVuirad/SvnWLj0MKB3g3c7qBb5luEL5Fs0t80QdhvCnPhxTW1PRTn1hZsBGd1VzrzVh+0q0Hi5GbmV0P49CivM78HV+7rHFIYQORqcYKqCGb+iZC8qYuzdZ8HS8RVbYnF/kV5bl0K+AXmDJWchULlzsIKazTmy78mtEns/bWV8chZLS9ndZUpQ/7ZhjWwkLDANWJkZ+Frtv6CWrkTlJI//dBrOG6NJjLQy5hANaXy9eGFHbRCGx1E71p50PUV42QKqsrvIKQPqyV0C1DPzV3+yBdt/2XVV2Iph5MU6aa8azo5zSJULGtrPrfGZpaWCJb2RmEayf8SVLYJ2au9FvUg5WtNv1GNsKqcNbZBjRL1ncQ9H598J/S11L30JaRpLACFhZGOMtBx9Wkkd1824dDoybpB8hXzOkePozf6PvxYhYwTRr4vO4X5lW8K21FJZimsGbkxebdJ7iwWvDt+A8B/Tb+FXaQm/Ctaerm2B6MF0I/dkyJHehbqlppWdkpz1Qd0hRWyvxnYPFftfqoc1eaH3GA+d5ys+LtMN9oZCnsAZpJKzrHYTXgV1V/DvKt0RSLPAoXe+JV3u0iAAAA//9WSR2FAAAABklEQVQDALUC1DklG4m7AAAAAElFTkSuQmCC\\\" data-latex=\\\"{(48)}_{10}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEUAAAAcCAYAAAA3DHIWAAAFCUlEQVR4AeyZachVVRSGT/M82WxFEQXNBVFREEX9iKgooplooImCaB5ogMLoT0WUOIKighOKqDjj9EdBBRFxVhxwwgnnCcfn+T7v9Zx79znnu/ce8PxQ3vdbe689r7vX2nsfz4xO/6uzQEeNcgktz4JlwflMRCKKR55RzmDIz+AH8CgsC85jIj3gA7Bw5BnlZUa8E3aDx2BZsJOJ/AZ/hzfDQpFllNsY6XP4DzwEy4Y1TGgQ/BOeAwtDmlHOZoQf4XC4GobgRD6iYCK8GIZwEcou8D/4LhwMv4a2ReTiSmpMgPfDEEajvBS+AAtDmlHuYIQH4VgYh8HtOxSj4FTor6R/k6zDZWhGwt3wS9gfvgPtW3fMM4zx7GPqPw79kRB12I9mIPwQXgALQZpRnqP3ebB2lxxA9xd8ET4LF8I0vElBZ6gxKvFIN/wf3fPwSZgFg+hXWRVOlM1C3gjvgoUgZBRdwQVPZoTKYkg2BH+1l2ixGG6DcawnI99CuhsQdbD9e2jdkYhMrKV0GXwCFoKQUa6h5+ugAyGawvW0Mg5sQB6GcbjlN6O4B14OQ/DUm03BCpgH+59LpcdgmptR1HGEjOKWt4eN/mmSV9DOAOiOIJmALrgVjcY3RpFMwFPPODIioc3OLKHYo9lLJsnWEDKKCzpCt04e0RQ07IU5LR1Hw8SrGXw/RdELuqMQHcIuarnrQkamqDGEjGLA2kI3rRiF5rnw2VC73Y1l7i6DfG4HsQrbSWvQWiOjbhwhozTeSzEtXJDBOX5aNdKza4kb2bg4jg6MbYg2GNg9WbuSexoOgJ5yiJOwo5O5U5dyst5JvNzVnlaNzkrX7RJFUb8oih6CcegFv6D4G06Bvp901atIVxEyyo5qafMJT519Oc0Nttaz2sP88SowDdksDtLQMe3zV9I/w70wDu9Hrs+x1a/kTyeYMF7IKHZ6ExW9oiOagj5u8POXqe3AxXtSeCwbtwyO31Lpbtgd9o7xVdLeWfx11ftaR1WHzmjOhS4YEYS78T5KjFkVYynNq6eoHWlG0eqtGMUFL2UIt6WLJlmF+avJLYAuQsO4eN8vulCcw6jjKfQHUn0fZAge/6so8EmBCML13BAsiaLb4/qQUdZRQaveimwWe2g4BN4LvcghqvDt4070hdvsjbna2YnEI0gveo5LsjWEjGKg80j0QdhK7wZNb8Vv0IlGRkQem7qABpuuIofugJwqke7o9m8lHiXGCBnFa7NvDt8S+nOiARkXpX+PIW0daVqdZajb4Icgr+u6UE80fjrwRbuI9BfQxyEiCPsZSokPQi+BHtP2X3d8UucW6It8JjILlfgRqrM8rgwZxXKt7mJCk9Cv9W9fue4AaVqdZbav0GD7DZlPoAt7Dekr2zhBMhX28zqlGsT+fSfZvzsYdQKvkJsBa1/0qBLQVeej0YjGF5KRzwJd2fhmvo1pRtlEaV/4PoxfiMiWCi7oKWbkfcNFk8zEJEq9JF6LFF7svL3PMVNhmlEsNybYwaNmSkh3kB+XdF1dsjJFXd7ngrHMo/ptCp6Bfgxzp/1E2q+K3mj9fOEnV09L1O3IMooxQd/3DuG9or1Fef4arzoxnX9hfJfomuPR+YXQu4vST6ZeM6ynEXVFb7R+CUzsEtpFWUax3I/DWtX/5tC/1ZWBHuse998zmayATXHjyDOKPfr17AcSXqERpYDfT/wvDndF4RPqiFEKH7TsHR4HAAD//zHSB0AAAAAGSURBVAMAGdfTOealThoAAAAASUVORK5CYII=\\\" data-latex=\\\"{(104)}_{10}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAAAcCAYAAADYzhkoAAAFE0lEQVR4AeyYZ8hWZRjHj7b3oL2LNkWLFhVFi6KiKIqKKCLaRdGgKERE9IsoOBFFQXAhIgoqKK5vLhA/uBFR3Av3nr+f73OO5zzPfd5nvS8exIfrf677vu5x/vf13OO6T8fo3C/jgVodcgWtzgNFEHnIp124VHNIB976E/gGHAdFEHnIR17ya1NO1RzyIW97CPQHJ0ARRB7ykZf82pRTaw65lzf9CnqCI6BIIh95yU+ebcYtzyHn84Z/wViwGoTkAozfgingchCSyzB2Bb3BV2AU+APYFlUhL2AZDX4G/4Hx4H4QEnnJT57yDdWp25bnkAfp6SkwCaTlYjJ/gwlgBugOLgIhuQqjA9qD/h0MA18C+3bKlzvlI8oGgH+A5fYtJpJ/BoREfvK0z1B53bY8h7xDTwuB/wIqkYOkeoD3wdtgMciTzyi4BegI1z3JyKneh8S74BUQyw0kuoDBYA2IZT6JqaATuASUy1oMy4B8Uc1LyCFOfwc7je7jgZCsSyT/AS2Wgu0gLevJiM/R8SnxJOm7gX8CKhHfP5vcq+BhUC5HMTiD3kC7PFHNScgh/ls30e0K0KjcTMPHwAYgaVQiB0htAY+Aq4HyEg9nX7nzMEebeejgvGUhz9uocyNoWkIOcZrb8UYfDeIa2l0JnAmojDjwbVh0vHsSycgB7SWxE5TLDgw60TokKyTmGfOuqFCPIeQQB3OMTiSOakgkd2mVlr5Hp7hE76xS1+L7fAQgT/naX6C4PlPIIa7VrXTji1DtJobg9RyX5adSTEye8s1zWFyvJh1ySE0NC1gp7TDTxj/GPGmqT5MZCl4DHvEeHiRPy9nkEEd1IQ/vOcPRP4C0uDx7YRgEpgPDB53mFYBsi3RsUZlnaGPLVKgh4+myv0o9N1bruZmmY4+8ZkvyCkp2eR8mPQTolPIY6Tns14NVQPGks01mloRmiCRvp0Uz57onw276cD9CZSTeRCXk+rdwHY/rgJsxKiPa3KCtkykoZfwUYAwj75IpqDzm7WNfqVTtKWh4UDJFUZ5DDlGjGYc42OX04SDjo5XsKTHvP7WInP8QKprLQ3vopNAhzjYjUqpViDGKg6vmkAcqWrYYbkUlYw05RC92oNI9oFFxGXhJe5QODNJQiRhgOQNHYjESRUVzeBjVvohOi6eQUaj3prwlI0/5yjvdtqF0yCFGi4bQXpoa6rTUyJutUeSn5CWMitz9Xd86a5aGEpxRnUl/DO4CscjhCTJufgZnJCvEOu4X8q4orNcQcoihtrfZl+nM6YjKiANyp/YOYR1hWptlceVdJPyA47IZSNrr/wi0//RvaC96qETGkfL7Rl/0L+B/4KXuPfQ8EBL5+X4/A8g7VCe2uYTjdFp7QXRJnrKFHGLBTB4O5HF0ubiLf4fR26r/vDCtzTKKEnFj/ZPc98Bb7ydoj7vQv+3ycWnogH7U6wa8FetAkkGRnzzlG6yQMrpnGRG7qWtW30FCu+8mGQU3VQu8UBnAfE3GdYwqnMhLfvKUbzWCC6jgrI0jWpfmtdgmg0TyZogV3AMMZp43U0DIS37yTNN7lswXwC9tb6Gdld7e3XR/JO/H6ddL2mWZOb1ac4jedK3/RWOnGqowIh95yU+eaWIe4e5ZHtdvUjAGbAKKH5z8DuO3Hh3j3pcsFyu05hDLjSD9ZmljgyNtZxrycL9yb5Jfm/Kp5hBfZnzgd85kJ9Z4BiEPp/rK9uBQi0Pa472F7fMkAAAA//+gb2/qAAAABklEQVQDAIy94DndEHRKAAAAAElFTkSuQmCC\\\" data-latex=\\\"{(100)}_{10}\\\"/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<img class=\\\"kfformula\\\" src=\\\"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAEQAAAAcCAYAAADYzhkoAAAFbUlEQVR4AeyYV6gdVRSG50bF3rsoFhTsBfVB7GBBFBXFjr0iWLCgoIgiiCCCFUXsXVNIIIX0kLwlechDegLpvfeE1O+b3JnMnLMnc++Ze8M85LD+s9Zes2fPP2v2XnvN9Ij2/3IR6GhAjuSsA0AdRB7y6RYuZQFp46ovg2fBDlAHkYd85CW/LuVUFpD7uNoF4FuwE9RB5CEfecmvSzntLSDncqVXwOdgK6iTyEde8pNnl3ErCsiBXOFd0AvMBiE5COfzYDA4AoTkcJwfgy/Bk+Af8AbwXFSTXIVnAPgb2HcM+kFg3kDlRF7yk6d8cwdbbRQF5HwGvBJIDpXKIVhvg35gBPgEHAxCcjTOvmAdeB38Bp4Aju2UbwzK/Rx7CRiAR9GPgNvALcCAhm5afvJ0TLpVl6KA3MnQE4BPAZXKZqzPwD3gDjAJFIk3dBoHDYTrHjNyqn+FcRe4CSRyPMZzwABvQCeyCeMjcC24DDTKPBxTgXxR1SUUEKe/NzuM4ZMbweyUHErve8EUsAJkZQEN4SxIdomz8J0JQrIGpzC4mDnZRqs/uBW4PFHVJBSQkxjyFDAdtCqncqJPdCFa0qhUfOpLaV0MjgHKKv6OBQ+BJEiYsZzIvwEu4qP/dPqcDCpLKCDJk1hUYXRv7ijOdyagcuKyW47HwJuTMKO5/JlvXDL/YR8HFPPMOxi9gTeOapKEZ8K7qUNnHKGAeDPbGUTiqJZEcoeVnOl1DIrdnEVvYfwKHgCzwKvgBzASmLeKlq885et4dK0moYBcyJDLgBdCdZu4lWZ3DpOpifU9rujscmdRD6VdFAwORfKU73k2qiIUkKpjtnq+y+RHTjbvmGSHY1uJuttdjV0mLq+kj3nI8v67xNGuvcY32O6AlgIfYGfPi+oSEGuWPyDnjuGymYN9O3gMuCUPQV8BOiIG8Rc6Nt6sQXof/2Jg0WdgLP+foZ1Kj9TaY6zeY7Zs+ZQ3lpxtYrWf3R7nz+RowYcZi3nBivXmuBVFT7frIpXw7kOHp8AokBXz2t04xgPFvDUOw5yVbtmhGSLJM+iYdsLurLiNruUk8xEqJ9Y51hxuva5/dxrrnoH0kiQqJ2NpfQouBZ6LyomfAs7GI29UoRgQl4eBTzrNwDD3mKswo+CSceAtHK0SEG92GmOcALxhVCq2rS0m4vGpmlyLyn+6xDKZf2eUAcTMiTWKCVneuQMNDWur0E6kL9ntggGZz0Bt4BzQqqznxH/BJcAiDZWK7x3OQJeDu4c3407yMD18gqicyMV3mkF4QzNInvaRN12qSWjJWGqb2X1pqjK6ictiyhuVsGN5w2Z/g5Vd499z0Cdl0vOJ04zF2WM9YuN3/wKQp+9U8g4c7pwrFBCfgsntRobKkqMZizdkweSOYB+hrc9jcSf+fP8w47tsvGFf///C7/R/De2LHioW+5rwXBaj8RhMYdBc826R2f50iUV+Xt/PAPKOnQV/7i7mtsbDK3F4XVQUXDIesDr0Ri630YCfaL8AfFttQwttfR7DlYqJ9U1aLwLfen21t+r0fQZXTvR9jceawzpBXE/7f+COg2oS+clTvk0HGxzmGINmck0OmfSdxT6Q2BeaIR5Ywt/PwK0uW03iqo3IS37ylG8ZMftYz1zX3tHZdQN2T2DOQ0WFM8SDTlmz7zU2agh5yU+eWXoWWxZ0fn2zj7Zbq7PD1wILPT9UOWutQ/7Mnlw0Q+zjNHKt+9Jl3aCvLpCPvOQnzywvv8GYqy7CKbStN2hG5gu/ypmgv8DxIXCponbL3gJiD0tov1n6yb/s7dX++wLyMF+Zm+TXpdcsC4gXM+J+kygrxe27LyAPp/7M7rhYRwLSHdet7Zi7AAAA///BAw3kAAAABklEQVQDAC1m9jm1g2UsAAAAAElFTkSuQmCC\\\" data-latex=\\\"{(108)}_{10}\\\"/>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-19 18:17:10');
INSERT INTO `t_text_content` VALUES (68, '{\"titleContent\":\"国家规定的用于汉字处理及传送使用的代码是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"汉字输入码\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"汉字内部码\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"汉字交换码\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"汉字字形码\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 18:20:15');
INSERT INTO `t_text_content` VALUES (69, '[{\"name\":\"信息技术\",\"questionItems\":[{\"id\":49,\"itemOrder\":1},{\"id\":54,\"itemOrder\":2},{\"id\":52,\"itemOrder\":3},{\"id\":51,\"itemOrder\":4},{\"id\":50,\"itemOrder\":5},{\"id\":53,\"itemOrder\":6},{\"id\":55,\"itemOrder\":7},{\"id\":57,\"itemOrder\":8},{\"id\":56,\"itemOrder\":9},{\"id\":59,\"itemOrder\":10},{\"id\":58,\"itemOrder\":11},{\"id\":60,\"itemOrder\":12},{\"id\":61,\"itemOrder\":13},{\"id\":63,\"itemOrder\":14},{\"id\":62,\"itemOrder\":15}]}]', '2026-07-19 18:26:33');
INSERT INTO `t_text_content` VALUES (70, '{\"titleContent\":\"内环境的理化性质不包括（）\",\"analyze\":\"内环境理化性质包括温度、渗透压、pH值、离子浓度等，与颜色无关。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"温度\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"渗透压\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"颜色\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"pH值\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 21:21:24');
INSERT INTO `t_text_content` VALUES (71, '{\"titleContent\":\"维持血糖浓度稳定的主要调节方式是（）\",\"analyze\":\"血糖调节主要依赖胰岛素、胰高血糖素等激素的体液调节。血糖升高时胰岛素分泌增加，促进糖利用;血糖降低时胰高血糖素分泌增加，促进糖原分解。神经调节起辅助作用，自身调节在此过程中不占主导。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"神经调节\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"体液调节\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"自身调节\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"正反馈调节\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-19 21:23:55');
INSERT INTO `t_text_content` VALUES (72, '{\"titleContent\":\"神经调节与体液调节的区别在于（）\",\"analyze\":\"神经调节依赖反射弧，具有反应快、范围局限的特点；体液调节通过化学物质运输，作用范围广。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"神经调节作用范围广\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"体液调节反应速度快\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"神经调节通过反射弧完成\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"体液调节仅作用于局部\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 21:30:34');
INSERT INTO `t_text_content` VALUES (73, '{\"titleContent\":\"自身调节的特点不包括（）\",\"analyze\":\"自身调节局限于器官局部(如肾、心肌)，调节幅度小，不依赖神经和体液因素。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"调节幅度小\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"不依赖神经和体液\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"作用范围广\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"反应速度慢\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 21:32:31');
INSERT INTO `t_text_content` VALUES (74, '{\"titleContent\":\"下列调节方式中，反应速度最快的是（）\",\"analyze\":\"神经调节通过反射弧(如感受器→神经中枢→效应器)以电信号和神经递质传递信息，反应速度毫秒级(如眨眼反射)。体液调节依赖激素血液运输,自身调节反应速度较慢，负反馈属于调节机制而非独立方式。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"神经调节\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"体液调节\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"自身调节\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"负反馈调节\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 21:36:43');
INSERT INTO `t_text_content` VALUES (75, '{\"titleContent\":\"关于反射弧的组成，错误的是（）\",\"analyze\":\"反射弧包括感受器、传入神经、神经中枢、传出神经和效应器。神经中枢可以是脊髓(如膝跳反射)或大脑皮层(如条件反射)，并非仅指大脑皮层。效应器由传出神经末梢及其支配的肌肉或腺体构成。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"感受器负责将刺激转化为电信号\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"神经中枢仅指大脑皮层\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"传出神经将指令传至效应器\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"效应器为肌肉或腺体等组织\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-19 21:39:30');
INSERT INTO `t_text_content` VALUES (76, '{\"titleContent\":\"反射活动的结构基础是（）\",\"analyze\":\"反射活动必须通过完整的反射弧(5个部分)才能完成，缺一不可。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"神经元\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"反射弧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"突触\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"效应器\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-19 21:41:33');
INSERT INTO `t_text_content` VALUES (77, '{\"titleContent\":\"下列属于负反馈的生理过程是（）\",\"analyze\":\"甲状腺激素对促甲状腺激素的抑制属于负反馈，可维持激素水平稳定。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"排卵前雌激素高峰促进黄体生成素分泌\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"血液中甲状腺激素升高抑制促甲状腺激\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"排尿过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"分娩过程\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-19 21:44:32');
INSERT INTO `t_text_content` VALUES (78, '{\"titleContent\":\"体液调节的主要传递方式是（）\",\"analyze\":\"体液调节中，激素主要通过血液运输至全身靶器官，发挥调节作用。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"血液运输\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"淋巴液运输\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"神经纤维传导\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"组织液扩散\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 21:51:22');
INSERT INTO `t_text_content` VALUES (79, '{\"titleContent\":\"关于内环境稳态的叙述，错误的是（）\",\"analyze\":\"内环境稳态是动态平衡，而非成分绝对不变。例如血浆pH维持在7.35~7.45，血糖浓度维持在3.9~6.1mmol/L，均允许一定波动范围。稳态通过神经-体液调节机制维持，是细胞代谢和功能正常的基础。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"稳态是细胞正常功能的前提\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"稳态依赖神经-体液调节机制\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"稳态指内环境成分绝对不变\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"体温和pH值属于稳态调节范畴\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 21:53:26');
INSERT INTO `t_text_content` VALUES (80, '{\"titleContent\":\"下列关于内环境的叙述，正确的是（）\",\"analyze\":\"内环境是细胞外液，包括血浆、组织液等，是细胞直接接触的生存环境。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"内环境即细胞内液\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"小肠腔内液体属于内环境\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"内环境是细胞生存的直接环境\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"内环境仅指血浆\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 21:55:24');
INSERT INTO `t_text_content` VALUES (81, '{\"titleContent\":\"正反馈调节的意义在于（）\",\"analyze\":\"正反馈(如血液凝固)可加速过程完成，避免机体因出血或分娩等过程受阻而受损。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"维持生理指标稳定\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"快速完成某一生理过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"适应外界环境变化\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"节约能量消耗\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-19 21:57:20');
INSERT INTO `t_text_content` VALUES (82, '{\"titleContent\":\"下列属于内环境成分的是（）\",\"analyze\":\"内环境指细胞外液，包括血浆、组织液等。血浆中的葡萄糖属于内环境成分;胃肠道消化液、肺泡气体因与外界相通，不属于内环境;血红蛋白存在于红细胞内,属于细胞内液，也非内环境成分。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"胃肠道中的消化液\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"红细胞内的血红蛋白\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"血浆中的葡萄糖\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"肺泡腔内的气体\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 21:59:22');
INSERT INTO `t_text_content` VALUES (83, '{\"titleContent\":\"下列属于细胞分子水平研究的是（）\",\"analyze\":\"细胞膜离子通道、酶活性、基因表达等属于细胞分子水平的研究内容。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"心脏泵血功能\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"红细胞的形态\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"细胞膜离子通道的机制\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"机体的体温调节\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-19 22:03:01');
INSERT INTO `t_text_content` VALUES (84, '{\"titleContent\":\"关于神经调节的叙述，正确的是（）\",\"analyze\":\"神经调节通过反射弧完成，反射是其基本方式(如膝跳反射)。其特点是反应迅速、作用精准但范围局限，区别于依赖激素运输的体液调节(作用范围广、时间持久)。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"基本方式是反射\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"作用范围广泛\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"反应速度缓慢\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"依赖激素运输\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-19 22:05:38');
INSERT INTO `t_text_content` VALUES (85, '[{\"name\":\"生理学\",\"questionItems\":[{\"id\":66,\"itemOrder\":1},{\"id\":65,\"itemOrder\":2},{\"id\":67,\"itemOrder\":3},{\"id\":68,\"itemOrder\":4},{\"id\":64,\"itemOrder\":5},{\"id\":69,\"itemOrder\":6},{\"id\":72,\"itemOrder\":7},{\"id\":71,\"itemOrder\":8},{\"id\":70,\"itemOrder\":9},{\"id\":73,\"itemOrder\":10},{\"id\":75,\"itemOrder\":11},{\"id\":74,\"itemOrder\":12},{\"id\":77,\"itemOrder\":13},{\"id\":78,\"itemOrder\":14},{\"id\":76,\"itemOrder\":15}]}]', '2026-07-19 22:07:29');
INSERT INTO `t_text_content` VALUES (86, '{\"titleContent\":\"下列关于法学与法理学的表述，正确的是（）\",\"analyze\":\"法学产生的条件有两个，第一个是研究的主体，第二个是研究的对象，也就是法律人阶层的出现和法律现象的积累。当研究的主体和研究的对象同时具备，才能产生法学。所以，不是有了人就有了法，也不是有了法就有了法学。A选项错误。尽管法理学的理论性很强，但是其对法律实践、法律教育以及法治事业的推进都有巨大的价值。B选项错误。法理学能对法治建设提供理论指引的作用。C选项正确。法学的研究对象是一切法律现象，特<p class=\\\"ueditor-p\\\">别是法理学，古今中外的所有法律现象都是法理学的研究对象;而法律史学尤其侧重对过往制度的研究。D选项错误。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"凡有法律的地方，就一定会有法学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法理学对法律创制和法律适用没有直接价值\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法理学的研究应当为法治建设提供理论支持与指导\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"法学的研究对象是有效的法律规范与现行的法律制度\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 08:25:34');
INSERT INTO `t_text_content` VALUES (87, '{\"titleContent\":\"下列关于法学的认识，错误的有（）\",\"analyze\":\"在法律研究对象不具备的情形下，是不可能产生法学学科的。A选项正确。法学中还有交叉法学，进行跨学科的研究，因此必然会与神学、哲学、道德学说等产生联系。另外，法律的发展过程中,早期的法律是和道德规范、<p class=\\\"ueditor-p\\\">宗教规范浑然一体的，之后法律才与之相对分离,而在中世纪，法学甚至是神学的一项内容。因此，法学必然要和道德、神学、哲学产生联系。B选项错误。法学考查法的产生、性质及其发展规律，具有社会科学的性质。C选项正确。法学在规则之下提供精神导向，具有人文科学的性质。D选项正确。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法学以法为研究对象，通常先有法后有法学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法学作为科学，它与神学、哲学和道德学说之间没有联系\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法学考查法的产生、发展及其规律，具有社会科学的性质\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"法学为人们在规则下生活提供精神导向，具有人文科学的性质\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 08:28:45');
INSERT INTO `t_text_content` VALUES (88, '{\"titleContent\":\"下列选项中，属于应用法学的是（）\",\"analyze\":\"应用法学就是部门法。部门法不在于研究理论问题，而在于现有的制度，在现实的法律实践中解决现实的法律问题。应用法学是直接服务于具体法律问题、解决法律纠纷的。法社会学、法政治学、法伦理学都不是直接服<p class=\\\"ueditor-p\\\">务于现实法律问题的解决，都属于理论法学的具体的研究方向。而行政法学明显是部门法的概念，能够应用来解决具体的行政争议和行政纠纷。D选项当选。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法社会学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法政治学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法伦理学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"行政法学\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 08:31:29');
INSERT INTO `t_text_content` VALUES (89, '{\"titleContent\":\"下列关于法学的表述，正确的是（）\",\"analyze\":\"法学是一个研究法律现象的知识体系，属于人文社会科学。A选项错误。马列主义在法律的本质这个问题上强调了法律的阶级性和物质制约性，法律为社会的物质生活条件所决定，是统治阶级意志的一种表达。超阶级性意味着代表了社会共同体的利益，或者代表了全人类的利益，这是资产阶级的法学家的观点，而非马克思主义法学的观点。当实现共产主义、世界大同的时候，也就不需要法律了。B选项正确。就西方社会而言，法学产生于古希腊而独立于古罗马，在中世纪的时候并入了神学。但是在12-16世纪的时候兴起了罗马法复兴，其后出现了代表新兴资产阶级利益诉求的各种法学流派。C选项错误。法学方法论本身就是法理学的一个重要组成部分。更重要<p class=\\\"ueditor-p\\\">的是法理学不仅有法学方法论的概念，同时也为各个部门法的研究提供了宏观的理论指导。D选项错误。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法学是社会科学，不具有人文科学的性质\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"马克思主义法学认为，超阶级的法学是不存在的\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法学是在资产阶级革命胜利后成为一门独立的学科\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"作为法学的一般理论和基础理论，法理学不是方法论\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 08:34:46');
INSERT INTO `t_text_content` VALUES (90, '{\"titleContent\":\"与其他法学相比，马克思主义法学具有的鲜明特征。下列不属于该特征的是（）\",\"analyze\":\"与以往的法学相比，马克思主义法学具有鲜明的特征。第一，马克思主义法学坚持历史唯物主义的立场。马克思主义法学主张，法律实现、反映或者体现了占统治地位的经济关系，法律归根结底是由社会的物质生活条件决定的。第二，马克思主义法学认为法律具有阶级性和意识形态性。马克思主义法学主张，在阶级社会中，法律的内容和程序直接或者间接地体现了统治阶级的利益，法律不仅体现了统治阶级的内在价值观,还为其提供了合法性。第三，马克思主义法学致力于实现人的解放。C、D选项正确。马克思主义法学认为法律受经济以外其他因素的影响，B选项正确。萨维尼主张法律是民族精神的体现，A选项错误。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"主张法律是民族精神的体现\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"认为法律受经济及之外其他因素影响\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"坚持历史唯物主义的立场\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"认为法律具有阶级性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 08:38:35');
INSERT INTO `t_text_content` VALUES (91, '{\"titleContent\":\"下列关于法理学的表述，错误的是（）\",\"analyze\":\"法理学的研究对象是所有法律现象中的一般特点、法律现象的本质和客观规律性，也包括对历史的法律规范的研究和总结。A选项错误。法理学相较于部门法来讲，理论性更强，并且相较于部门法所研究的具体制度和具体规范，法理学研究的是抽象的一般性的法学理论知识。法理学侧重于研究一般性的原理，而部门法侧重研究其中的具体制度。B、C选项正确。学术研究都要用于解决特定的现实问题。中国法理学要解决的实际问题就是建设法<p class=\\\"ueditor-p\\\">治国家。所有的法学研究，包括法理学的理论研究，最终的归宿和落脚点都要解决法治国家的建设问题。D选项正确。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法理学研究的是现行有效的法律规范\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法理学与部门法学之间是一般与特殊的关系\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法理学从总体上阐释法和法律现象的一般规律\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"当代中国法理学的研究起点与归宿是建设中国特色社会主义法治国家\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 08:42:11');
INSERT INTO `t_text_content` VALUES (92, '{\"titleContent\":\"以下有关法的表述中，哪项是法的本质的最终体现（）\",\"analyze\":\"法的本质具有层次性:法的本质首先表现为法的正式性或官方性，即法是由国家制定或认可的并由国家强制力保证实施的正式的、官方确定的行为规范;法的本质其次反映为法的阶级性，即在阶级对立的社会，法所体现的国家意志实际上是统治阶级的意志;法的本质最终体现为法的物质制约性，即法的内容是受一定物质因素制约的，最终也是由一定社会物质生活条件决定的。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法是由国家制定或认可的正式行为规范\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法的内容受一定社会因素制约，由一定社会物质生活条件决定\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法体现的国家意志是统治阶级的意志\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"法由国家强制力保证其实施\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 08:45:06');
INSERT INTO `t_text_content` VALUES (93, '{\"titleContent\":\"法的本质是指（）\",\"analyze\":\"法的本质，是指法这个事物的内部联系或内在规定性，它决定法的根本指向，比较深刻和稳定，往往难以感知，而需要通过抽象思维才能认识和把握。法的本质属性，是指法的规范性、国家强制性、阶级意志性和物质制约性。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法的强制性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法的内部联系\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法的表现形式\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"法的规范性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 08:47:44');
INSERT INTO `t_text_content` VALUES (94, '{\"titleContent\":\"“徒善不足以为政，徒法不足以自行”说明了（）\",\"analyze\":\"法有重大作用,但它本身具有局限性，需要具备多方面的条件。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法的继承性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法的阶级性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法的不确定性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"法的局限性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 08:51:30');
INSERT INTO `t_text_content` VALUES (95, '{\"titleContent\":\"下列不属于法的基本特征的是（）\",\"analyze\":\"“法的内容最终是由一定的社会物质生活条件决定的”是法的物质制约性(社会性)，是法的本质内容，不属于法的基本特征。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法的内容最终是由一定的社会物质生活条件决定的\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法是调整人的行为的社会规范\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法是以权利义务为内容的社会规范\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"法是具有普遍性的社会规范\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 08:54:05');
INSERT INTO `t_text_content` VALUES (96, '{\"titleContent\":\"下列有关法的特征的表述，错误的是（）\",\"analyze\":\"法律的特征包括以下几个方面。①法律是调整人的行为的社会规范，但这一社会规范与道德、宗教等其他社会规范不同，是一种以公共权力为后盾、具有特殊强制性的社会规范，而道德、宗教等其他社会规范建立在人们的信仰的基础上，通过人们的内心起作用。故应选B项。②法律是具有普遍性的社会规范，法的普遍性要求法在国家权力所及的范围内具有普遍的约束力，要求法律面前人人平等。近代以来法律虽然与一定的国家紧密联系，具有<p class=\\\"ueditor-p\\\">民族性、地域性，但是法律的内容始终具有与人类的普遍要求相一致的趋向。③法律是以权利、义务为内容的社会规范，法通过设定以权利、义务为内容的行为模式，指引人的行为，将人的行为纳入统一的秩序之中，以调节社会关系。④法律是以国家强制力为后盾、通过法律程序保证实现的社会规范。法律就一般而言是一种最具有外在强制性的社会规范，但是国家暴力还是一种合法的暴力，即国家权力必须合法行使，包括符合实体法和程序法两个方面的要求。⑤法律是由公共权力机构制定或认可的具有特定形式的社会规范。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法是由公共权力机构制定或认可的具有特定形式的社会规范\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"就性质而言，法律和道德等其他社会规范的性质是完全相同的\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法是以权利义务为内容的社会规范\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"法律是以国家强制力为后盾，通过法律程序保证实现的社会规范\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 08:57:41');
INSERT INTO `t_text_content` VALUES (97, '{\"titleContent\":\"法律规定了人们的一般行为模式，从而为人们的交互行为提供了一个模型、标准或方向。法律的这一特性是指（）\",\"analyze\":\"法律给人们提出了行动层面的要求，规定行为模式，确定人们行动的标准，这就是规范性的表现。规范性就是标准，而法律就是一个行动标准，通过设计行为模式来实现这一行动标准。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法律的规范性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法律的普遍性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法律的确定性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"法律的统一性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 08:59:55');
INSERT INTO `t_text_content` VALUES (98, '{\"titleContent\":\"法通常是为一般的人、抽象的人而不是单单为某个特定的人制定并提供行为标准的。这体现了法的（）\",\"analyze\":\"题干中所描述的法的特征主要指的是法的普遍性与规范性。法律具有普遍性的特征。法的普遍性有三层含义:一是普遍有效性，即在国家权力范围内，法具有普遍效力;二是普遍平等对待性，即要求平等地对待一切人，做到法律面前人人平等;三是普遍一致性，即法律的内容始终有与人类普遍要求相一致的趋向。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"普遍性与规范性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"强制性与国家意志性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"规律性与程序性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"权利性与义务性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 09:04:01');
INSERT INTO `t_text_content` VALUES (99, '{\"titleContent\":\"关于法学产生的原因，下列表述不正确的是（）\",\"analyze\":\"法学是研究法律现象的科学，因此，只有在社会上出现了法律现象以后，法学才可能产生。但是，法学的产生，要比法律现象的产生晚得多，故D项表述错误。法学的产生原因在于:①法学的产生需要人们从事法律活动的经验的积累;②人们从事法律活动的经验具有专门性，要经过特殊的学习和训练;③法学的产生需要专门从事法律工作的人员，即法律职业的存在。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"法学的产生需要人们从事法律活动的经验的积累\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"法学的产生需要人们从事法律活动的经验具有专门性，要经过特殊的学习和训练\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法学的产生需要法律职业的存在\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"法律现象是法学的研究对象，两者是同时产生、共同发展的\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 09:07:32');
INSERT INTO `t_text_content` VALUES (100, '{\"titleContent\":\"法理学是（）\",\"analyze\":\"从认识论角度，可将法学划分为理论法学、应用法学和边缘法学。法理学探讨法的普遍原理，从中概括出抽象性、普遍性的一般理论学说，而部门法学研究具体法律。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"部门法学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"应用法学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"法律部门\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"理论法学\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 09:10:39');
INSERT INTO `t_text_content` VALUES (101, '[{\"name\":\"法理学\",\"questionItems\":[{\"id\":93,\"itemOrder\":1},{\"id\":92,\"itemOrder\":2},{\"id\":88,\"itemOrder\":3},{\"id\":91,\"itemOrder\":4},{\"id\":90,\"itemOrder\":5},{\"id\":89,\"itemOrder\":6},{\"id\":85,\"itemOrder\":7},{\"id\":87,\"itemOrder\":8},{\"id\":86,\"itemOrder\":9},{\"id\":84,\"itemOrder\":10},{\"id\":83,\"itemOrder\":11},{\"id\":82,\"itemOrder\":12},{\"id\":80,\"itemOrder\":13},{\"id\":81,\"itemOrder\":14},{\"id\":79,\"itemOrder\":15}]}]', '2026-07-20 09:14:24');
INSERT INTO `t_text_content` VALUES (102, '{\"titleContent\":\"下列关于方位术语的描述，正确的是（）\",\"analyze\":\"在描述人体各部结构的位置、形态及其相互关系时，不论个体处于何种体位，都要以人体解剖学姿势为前提和依据。因此，即使人仰卧时，仍是近头者为上，故选项A错误;四肢的附着端接近躯干为近侧端，故选项B错误;空腔脏器的里面为内，内侧是指近正中矢状面者，故选项C、E错误;近皮肤者为浅，远离皮肤而距人体内部中心近者为深，故选项D正确。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"人仰卧时，近腹者为上\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"四肢的附着端为远侧端\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"空腔脏器的里面为内侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"近皮肤者为浅\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"近正中矢状面者为内\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 09:18:36');
INSERT INTO `t_text_content` VALUES (103, '{\"titleContent\":\"下列关于矢状轴的描述，正确的是（）\",\"analyze\":\"矢状轴为呈前、后方向的水平线，与人体冠状轴和垂直轴两两垂直，故选项A、E错误，选项B正确。选项C的描述适合矢状面，而非矢状轴。矢状轴可以有很多条，故选项D错误。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"呈上、下方向\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"与人体冠状轴垂直\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"可将人体分为左、右两部分\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"只有一条\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"呈左、右方向\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 09:21:51');
INSERT INTO `t_text_content` VALUES (104, '{\"titleContent\":\"以体表为准的方位术语是（）\",\"analyze\":\"上和下是描述器官或结构距颅顶或足底的相对远、近关系的术语，故选项A错误。前和后是指距身体前、后面距离相对远、近的名词，故选项B错误。浅和深是描述与皮肤表面相对距离关系的术语，近皮肤者为浅，远离皮肤而距人体内部中心近者为深，故选项C正确。内和外是描述空腔器官相互位置关系的术语，近内腔者为内，离内腔远者为外，故选项D错误。在四肢，距肢根部较近者为上，又称为近侧;反之为远侧，故选项E错误。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"上和下\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"前和后\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"浅和深\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"内和外\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"近侧和远侧\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 09:26:13');
INSERT INTO `t_text_content` VALUES (105, '{\"titleContent\":\"系统解剖学的主要研究方式是（）\",\"analyze\":\"系统解剖学是按人体功能系统，如运动系统、消化系统等，研究各器官的形态结构，选项A是局部解剖学的研究方式;选项C是生长解剖学的研究范畴;选项D属于病理解剖学内容，故答案选B。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"按人体的部位由浅入深研究各局部结构\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"按人体功能系统研究各器官形态结构\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"研究人体在不同生长发育阶段的形态变化\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"研究疾病状态下人体形态结构的改变\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 09:28:46');
INSERT INTO `t_text_content` VALUES (106, '{\"titleContent\":\"在描述人体结构方位时,“内侧”是指（）\",\"analyze\":\"解剖学方位术语中,“内侧”指靠近正中矢状面,“外侧”则远离正中矢状面;靠近身体腹侧面为“前”，靠近身体背侧面为“后”，所以答案是A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"靠近正中矢状面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"远离正中矢状面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"靠近身体腹侧面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"靠近身体背侧面\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 09:31:13');
INSERT INTO `t_text_content` VALUES (107, '{\"titleContent\":\"将人体分为左右对称两部分的切面是（）\",\"analyze\":\"正中矢状面是沿人体正中线所作的矢状面，将人体分为左右对称的两部分;矢状面包括正中矢状面及其他沿前后方向的矢状切面，但不一定对称;冠状面将人体分为前后两部分;水平面将人体分为上下两部分，答案选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"正中矢状面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"矢状面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"冠状面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"水平面\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 09:33:22');
INSERT INTO `t_text_content` VALUES (108, '{\"titleContent\":\"以下关于解剖学方位描述错误的是（）\",\"analyze\":\"在标准解剖学姿势下，手掌向前，手背应在手掌的后方;头在躯干上方，小腿外侧称腓侧，足尖为足的前方，描述均正确，所以答案为C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"头在躯干的上方\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"小腿的外侧又称腓侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"手背在手掌的前方\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"足尖为足的前方\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 09:40:08');
INSERT INTO `t_text_content` VALUES (109, '{\"titleContent\":\"人体垂直轴的方向是（）\",\"analyze\":\"人体的垂直轴为上下方向,垂直于地面，矢状轴是前后方向，冠状轴是左右方向，均垂直于地面;环绕身体、平行于地面的描述不符合人体轴的定义，答案选C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"前后方向，垂直于地面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"左右方向，垂直于地面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"上下方向，垂直于地面\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"环绕身体，平行于地面\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 09:42:08');
INSERT INTO `t_text_content` VALUES (110, '{\"titleContent\":\"下列关于解剖学姿势的描述，正确的是（）\",\"analyze\":\"解剖学姿势与立正相似，区别在于解剖学姿势是手掌和足尖均朝前。可两者结合起来区别记忆。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"身体直立\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"两眼向前平视\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"掌心朝前\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"双下肢靠拢\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"足尖向前\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-20 09:44:26');
INSERT INTO `t_text_content` VALUES (111, '{\"titleContent\":\"只适用于空腔脏器的方位术语是（）\",\"analyze\":\"只适用于空腔脏器的方位术语:内、外。选项C、D也适用于其他脏器，并非仅适用于空腔脏器，与题目要求不符;内侧、外侧与内、外只一字之差，却有本质区别，需要认真区分，切勿混淆。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"内\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"外\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"内侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"外侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"以上均是\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-20 09:46:55');
INSERT INTO `t_text_content` VALUES (112, '{\"titleContent\":\"只适用于四肢的方位术语是（）\",\"analyze\":\"本题五个选项中只适用于上肢和下肢的方位术语是远侧和近侧。内侧和外侧是指与正中矢状面的距离。上和下是描述器官或结构距颅顶或足底的相对远近关系的术语。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"远侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"近侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"内侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"外侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"上和下\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-20 09:49:08');
INSERT INTO `t_text_content` VALUES (113, '{\"titleContent\":\"下列方位术语可应用在同一个冠状面上的是（）\",\"analyze\":\"冠状面也称额状面，是从左、右方向，将人体纵切为前、后两部分的切面，与矢状面垂直。近正中矢状面者为内侧，远离正中矢状面者为外侧;近头者为上，近足者为下;近皮肤者为浅，远离皮肤者为深:近空腔脏器内腔者为内,离内腔远者为外。因此,选项A、C、D、E均可适用于同一个冠状面。对于选项B而言，根据概念，近腹者为前，也称腹侧;近背者为后，也称背侧。但在同一个冠状面上，不存在前、后之分，故不能应用。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"内侧、外侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"腹侧、背侧\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"上、下\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"浅、深\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"内、外\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-20 09:51:56');
INSERT INTO `t_text_content` VALUES (114, '{\"titleContent\":\"下列关于矢状面的描述，正确的是（）\",\"analyze\":\"矢状面是指沿前、后方向，将人体纵切为左、右两部分的切面，而且与冠状面和水平面两两垂直，故选项A、C、D、E正确。选项B描述的是冠状面的特征，不符合题目要求。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"呈前、后方向\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"将人体纵切为前、后两部分\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"将人体纵切为左、右两部分\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"与冠状面垂直\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"与水平面垂直\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-20 09:54:43');
INSERT INTO `t_text_content` VALUES (115, '{\"titleContent\":\"下列属于关节辅助结构的是（）\",\"analyze\":\"关节唇是附着于关节窝周缘的纤维软骨|环，可加深关节窝，属于关节的辅助结构。关节面软骨、滑膜层和关节腔是关节的基本构造。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"关节面软骨\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"滑膜层\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"关节腔\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"关节唇\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 09:59:08');
INSERT INTO `t_text_content` VALUES (116, '{\"titleContent\":\"绕垂直轴进行的运动是（）\",\"analyze\":\"旋转是关节绕垂直轴进行的运动，骨的前面转向内侧为旋内，转向外侧为旋外(在前臂称旋前和旋后)。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"屈和伸\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"收和展\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"旋转\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"环转\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 10:01:06');
INSERT INTO `t_text_content` VALUES (117, '[{\"name\":\"人体解剖\",\"questionItems\":[{\"id\":94,\"itemOrder\":1},{\"id\":98,\"itemOrder\":2},{\"id\":95,\"itemOrder\":3},{\"id\":96,\"itemOrder\":4},{\"id\":99,\"itemOrder\":5},{\"id\":97,\"itemOrder\":6},{\"id\":101,\"itemOrder\":7},{\"id\":107,\"itemOrder\":8},{\"id\":100,\"itemOrder\":9},{\"id\":108,\"itemOrder\":10},{\"id\":102,\"itemOrder\":11},{\"id\":103,\"itemOrder\":12},{\"id\":104,\"itemOrder\":13},{\"id\":105,\"itemOrder\":14},{\"id\":106,\"itemOrder\":15}]}]', '2026-07-20 10:03:53');
INSERT INTO `t_text_content` VALUES (118, '{\"titleContent\":\"关于艺术的审美认知作用，下列说法错误的是（）\",\"analyze\":\"艺术作品将生活真实升华为艺术真实，通过现象揭示本质，通过偶然揭示必然，通过个别显示一般，通过客观显示主观，使艺术的审美认知功能具有深刻的内涵。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"艺术的认知功能在认识自然现象方面，比不上物理、化学等自然科学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"艺术在帮助人们认识社会人生时，能够发挥其他社会科学、自然科学所不能代替的作用\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"艺术的认知作用是以艺术的审美价值为基础，使得艺术具有与自然科学和社会科学不同的特殊审美认知功能\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"艺术作品将生活真实等同于艺术真实\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 10:36:27');
INSERT INTO `t_text_content` VALUES (119, '{\"titleContent\":\"关于艺术教育，下列说法错误的是（）\",\"analyze\":\"美育理论体系的建立，包括“美育”(即“审美教育”)概念，由18世纪德国美学家席勒在《美育书简》首次提出了“美育”的概念。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"康德在《美育书简》首次提出了“美育”的概念\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"从狭义上讲，艺术教育被理解为培养艺术家或专业艺术人才所进行的各种理论和实践教育\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"在当代社会中，广义的艺术教育更加必要和紧迫\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"在中国最早公开将美育与德育、智育相提并论的是清末学者王国维\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 10:40:09');
INSERT INTO `t_text_content` VALUES (120, '{\"titleContent\":\"不属于客观精神说的代表人物的是（）\",\"analyze\":\"尼采认为人的主观意志是世界万事万物的主宰，也是推动历史发展的根本动因。尼采是主观精神说的代表人物。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"黑格尔\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"尼采\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"柏拉图\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"朱熹\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 10:43:03');
INSERT INTO `t_text_content` VALUES (121, '{\"titleContent\":\"关于艺术生产理论，下列说法错误的是（）\",\"analyze\":\"艺术生产与社会物质生产之间既存在平衡关系，也存在不平衡关系\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"马克思明确提出了“艺术生产”的概念\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"艺术是一种特殊的精神生产\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"艺术生产与社会物质生产之间一定是不平衡关系\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"艺术生产理论揭示了艺术系统的奥秘\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 10:45:23');
INSERT INTO `t_text_content` VALUES (122, '{\"titleContent\":\"艺术具有____特征。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"想象性、主体性、审美性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"形象性、典型性、审美性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"形象性、主体性、审美性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"想象性、主体性、美学性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 10:47:25');
INSERT INTO `t_text_content` VALUES (123, '{\"titleContent\":\"近代最早公开将美育与德育、智育相提并论来提倡的是清末学者（）\",\"analyze\":\"在近代最早公开将美育与德育、智育相提并论来提倡的是清末学者王国维。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"鲁迅\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"王国维\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"蔡元培\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"席勒\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 10:49:39');
INSERT INTO `t_text_content` VALUES (124, '{\"titleContent\":\"蔡元培提出了“以____代宗教”的主张，认为这是人类文化发展的必然趋势。\",\"analyze\":\"蔡元培提出了“以美育代宗教”的主张，认为这是人类文化发展的必然趋势。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"美育\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"艺术\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"文化\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"道德\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 10:51:44');
INSERT INTO `t_text_content` VALUES (125, '{\"titleContent\":\"美育的核心是（）\",\"analyze\":\"美育的核心是艺术教育。虽然美学理论关于美的形态有自然美、社会美、艺术美的划分，实施美育的途径又有家庭教育、学校教育、社会教育的区分，但普遍认为艺术教育是实施美育的主要手段。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"学校教育\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"社会教育\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"家庭教育\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"艺术教育\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 10:53:20');
INSERT INTO `t_text_content` VALUES (126, '{\"titleContent\":\"性灵说、妙悟说属于（）\",\"analyze\":\"宋代严羽的“妙悟说”和明代袁宏道的“性灵说”，也是把主观精神的表现和抒发，当作文学艺术的本质特征。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"客观精神说\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"主观精神说\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"模仿说\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"再现说\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 10:55:06');
INSERT INTO `t_text_content` VALUES (127, '{\"titleContent\":\"绘画六法的最高法则是（）\",\"analyze\":\"南齐谢赫论绘画六法时，其中第一条就是“气韵生动”，都强调绘画不但要形似，更重要的是要神似。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"以形写神\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"应物象形\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"气韵生动\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"传移模写\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 10:57:14');
INSERT INTO `t_text_content` VALUES (128, '{\"titleContent\":\"<p class=\\\"ueditor-p\\\">__日:“《诗》，可以兴，可以观，可以群，可以怨；迩之事父,远之事君；多识于鸟兽草木之名。”</p>\",\"analyze\":\"早在先秦时期，孔子就讲过:“《诗》，可以兴，可以观，可以群，可以怨;迩之事父，远之事君;多识于鸟兽草木之名。”孔子这段话，除了强调文艺为维护儒家的政治、伦理道德服务外，也指出了文艺具有两方面的认识作用:一方面是文艺“可以观”风俗之盛衰，具有认识社会、历史的作用;另一方面是“多识于鸟兽草木之名”，也就是文艺还具有认识自然现象、增长多方面知识的意义。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"墨子\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"孔子\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"荀子\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"庄子\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 11:00:42');
INSERT INTO `t_text_content` VALUES (129, '{\"titleContent\":\"美国人本主义心理学家____认为，人生的最高境界是一种“高峰体验”\",\"analyze\":\"美国著名人本主义心理学家马斯洛更是认为，人生的最高境界是一种“高峰体验”，这种时刻里，人会感受到强烈的幸福、狂喜、须悟、完美。马斯洛认为,“高峰体验”尤其存在于人的高级精神活动之中，也就是人处在最<p class=\\\"ueditor-p\\\">挂圭状态的时候并感受到最高快乐的实现。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"弗洛伊德\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"荣格\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"马斯洛\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"苏珊朗格\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 11:03:19');
INSERT INTO `t_text_content` VALUES (130, '{\"titleContent\":\"艺术教育是____的核心。\",\"analyze\":\"艺术教育是美育的核心，它的根本目标是培养全面发展的人。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"德育\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"智育\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"美育\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"体育\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 11:05:15');
INSERT INTO `t_text_content` VALUES (131, '{\"titleContent\":\"__中“路漫漫其修远兮，吾将上下而求索”\",\"analyze\":\"屈原《离骚》中“路漫漫其修远兮，吾将上下而求索”\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《诗经》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《岳阳楼记》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《离骚》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《九歌》\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 11:07:24');
INSERT INTO `t_text_content` VALUES (132, '{\"titleContent\":\"艺术的审美教育作用具有____特点\",\"analyze\":\"艺术这种审美教育作用的特点，可以列举出许多来，但最主要的，应当是“以情感人”“潜移默化”“寓教于乐”三个特点。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"以情感人\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"寓教于乐\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"潜移默化\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"以美感人\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-20 11:10:45');
INSERT INTO `t_text_content` VALUES (133, '[{\"name\":\"艺术概论\",\"questionItems\":[{\"id\":123,\"itemOrder\":1},{\"id\":121,\"itemOrder\":2},{\"id\":119,\"itemOrder\":3},{\"id\":120,\"itemOrder\":4},{\"id\":122,\"itemOrder\":5},{\"id\":118,\"itemOrder\":6},{\"id\":117,\"itemOrder\":7},{\"id\":115,\"itemOrder\":8},{\"id\":116,\"itemOrder\":9},{\"id\":112,\"itemOrder\":10},{\"id\":114,\"itemOrder\":11},{\"id\":113,\"itemOrder\":12},{\"id\":110,\"itemOrder\":13},{\"id\":111,\"itemOrder\":14},{\"id\":109,\"itemOrder\":15}]}]', '2026-07-20 12:15:02');
INSERT INTO `t_text_content` VALUES (134, '{\"titleContent\":\"管理的载体是（）\",\"analyze\":\"管理的载体是组织，且要掌握组织是两个及以上的人在一起为实现某个共同目标而协同行动的集合体。现代管理学研究的是有组织组织的群体活动。A选项相关资源是管理的研究对象，包括人在内的一切可以调动的资源。B选项管理活动是和人类历史一样悠久，自从有了有组织的活动就有了管理活动。D选项管理的主体是管理者，且是具有专门知识能利用专门技术和方法进行专门活动的人，不是所有人都能成为管理者。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"相关资源\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"管理活动\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"组织\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"管理者\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 12:18:28');
INSERT INTO `t_text_content` VALUES (135, '{\"titleContent\":\"管理的愿景是（）\",\"analyze\":\"教材的原文表述是管理的目的的是为了实现既定目标。这里是将目的同义转述为愿景，真题中还出现过管理的归宿是()。这里需要注意考试可能会出现同一概念的不同表述，同学们要能学会同义转述，碰到陌生表述，要联系相关考点，进行知识点定位。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"盈利\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"实现既定的目标\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"寻求市场机会\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"获取信息\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 12:21:23');
INSERT INTO `t_text_content` VALUES (136, '{\"titleContent\":\"管理的本质是合理分配和协调相关资源的过程，所谓“合理”是从____的角度来看的。\",\"analyze\":\"对于一个企业的管理是从该企业的管理者角度出发的，不是企业家，更不是员工。这里需要区分两个概念-企业家和管理者，企业家是企业从0-1的创造者，重大事项的决策者。管理者是决策的执行者和维护者，负责现有体系的高效运行，是一个企业从1-100的完善者。举个例子解释一下:马云是企业家，创立阿里巴巴，推动电商生态改革。张勇是管理者，打造双十一购物节,落地数字化管理体系。企业家定方向，管理者执行。但也存在一人担<p class=\\\"ueditor-p\\\">任多角的情况。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"企业家\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"管理者\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"员工\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"社会公众\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 12:24:05');
INSERT INTO `t_text_content` VALUES (137, '{\"titleContent\":\"管理是一种艺术，这是强调管理的（）\",\"analyze\":\"管理中管理理论和管理工具是科学的，而管理实践明显的表现出艺术性的特征，在管理实践中管理者根据活动环境、活动条件以及活动对象等因素的特征及其变化艺术性地运用科学理论、手段和方法。且管理活动的有效性在很大程度上正是取决于管理者能否艺术地运用以及在何种程度上艺术性地运用那些科学理论、手段和方法。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"不确定性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"系统性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"实践性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"复杂性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 12:26:05');
INSERT INTO `t_text_content` VALUES (139, '{\"titleContent\":\"管理的根本目的是（）\",\"analyze\":\"以人为中心的人本原理要求对组织活动的管理是为了人的管理，为了人的管理是旨管理的根本目的是为人民服务的，管理的为人服务应通过管理工作充分实现组织成员的社会价值，促进组织成员的个人发展。并且全体组织成员共享组织成果。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"盈利\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"实现组织目标\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"为人民服务\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"提高组织效率\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 12:28:47');
INSERT INTO `t_text_content` VALUES (140, '{\"titleContent\":\"管理的对象是（）\",\"analyze\":\"管理的对象是相关资源，即包括人在内的一切可以调用的资源，这些资源包括原材料、人员、资金、土地、设备、顾客和信息等。在这些资源中，人员是最重要的。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"相关资源\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"人\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"信息\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"资金\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 12:30:24');
INSERT INTO `t_text_content` VALUES (141, '{\"titleContent\":\"管理的客体是（）\",\"analyze\":\"这和上一题是同一概念的不同表述，参考马工程版《管理学》管理的概念。组织需要通过特定的活动来实现其目标，活动的过程是不同资源的消耗和利用的过程。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"组织活动及其参与要素\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"人\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"信息\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"设备\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 12:32:16');
INSERT INTO `t_text_content` VALUES (142, '{\"titleContent\":\"法国工业家法约尔在其____著作中提出管理者都行使着计划、组织、指挥，协调和控制职能，他的理论贡献主要体现在他对管理职能的划分和管理原则的归纳上。\",\"analyze\":\"这道题主要考查教材中出现的管理学代表人物的代表作。B选项亨利明茨伯格在《管理工作的性质》中提出管理者角色相关概念。C选项《科学管理理论》是泰罗在1911年发表的著作，标志着科学管理理论的诞生。D.《经<p class=\\\"ueditor-p\\\">理人员的职能》是巴纳德的管理理论贡献，提出正式组织和非正式组织的概念。</p>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《工业管理与一般管理》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《管理工作的性质》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《科学管理理论》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《经理人员的职能》\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 12:34:38');
INSERT INTO `t_text_content` VALUES (143, '{\"titleContent\":\"__是各项管理职能的灵魂和生命。\",\"analyze\":\"各项职能有自己的独特的表现形式。创新是贯穿在各种管理职能和各个组织层次之中的。对于一个有活力的组织来说，创新不处不在，无时不在。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"决策\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"组织\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"领导\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"创新\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 12:36:30');
INSERT INTO `t_text_content` VALUES (144, '{\"titleContent\":\"管理的二重性是指（）\",\"analyze\":\"管理的二重性(自然属性和社会属性)是马克思主义管理理论的核心观点之一，其根源在于管理活动本身必须同时协调生产力与生产关系。这一理论深刻揭示了管理活动的本质特征。科学性和艺术性是管理性质的表述。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"社会属性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"自然属性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"艺术性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"管理的二重性是指\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-20 12:39:05');
INSERT INTO `t_text_content` VALUES (145, '{\"titleContent\":\"管理的载体是个人。\",\"analyze\":\"管理的载体是组织，而非个人。组织是管理活动得以开展的依托，管理是在组织中进行的协调资源以实现目标的过程。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 12:40:59');
INSERT INTO `t_text_content` VALUES (146, '{\"titleContent\":\"管理的本质是指挥他人完成工作。\",\"analyze\":\"管理的本质是合理分配和协调各种资源的过程，而不仅仅是指挥他人，其核心在于资源的合理配置与协调。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 12:42:07');
INSERT INTO `t_text_content` VALUES (147, '{\"titleContent\":\"管理的主体可以是任何组织成员。\",\"analyze\":\"管理的主体是具有专门知识、利用专门技术和方法来进行专门活动的管理者，并非任何组织成员都能成为管理主体。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 12:43:20');
INSERT INTO `t_text_content` VALUES (148, '{\"titleContent\":\"管理的客体仅包括组织中的人力资源。\",\"analyze\":\"管理的客体是组织活动及其参与要素，包括人力资源在内的一切可以调用的资源，并非仅有人力资源。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 12:56:16');
INSERT INTO `t_text_content` VALUES (149, '{\"titleContent\":\"管理只具有社会属性，不具有自然属性。\",\"analyze\":\"管理具有二重性，即自然属性和社会属性。自然属性与生产力相关，社会属性与生产关系相关，二者缺一不可。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 12:57:15');
INSERT INTO `t_text_content` VALUES (150, '[{\"name\":\"管理学\",\"questionItems\":[{\"id\":128,\"itemOrder\":1},{\"id\":126,\"itemOrder\":2},{\"id\":124,\"itemOrder\":3},{\"id\":127,\"itemOrder\":4},{\"id\":129,\"itemOrder\":5},{\"id\":125,\"itemOrder\":6},{\"id\":132,\"itemOrder\":7},{\"id\":130,\"itemOrder\":8},{\"id\":131,\"itemOrder\":9},{\"id\":134,\"itemOrder\":10},{\"id\":135,\"itemOrder\":11},{\"id\":133,\"itemOrder\":12},{\"id\":136,\"itemOrder\":13},{\"id\":137,\"itemOrder\":14},{\"id\":138,\"itemOrder\":15}]}]', '2026-07-20 13:00:00');
INSERT INTO `t_text_content` VALUES (151, '{\"titleContent\":\"宏观经济学与微观经济学的核心区别在于（）\",\"analyze\":\"宏观研究整体经济，微观研究个体单位。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"研究对象的范围不同\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"研究方法的差异\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"是否考虑时间因素\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"是否使用数学模型\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 15:16:36');
INSERT INTO `t_text_content` VALUES (152, '{\"titleContent\":\"资源稀缺性的本质是（）\",\"analyze\":\"稀缺性源于欲望无限与资源有限的矛盾。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"资源数量不足\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"人类欲望无限性与资源有限性的矛盾\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"资源分布不均\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"资源不可再生\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 15:18:35');
INSERT INTO `t_text_content` VALUES (153, '{\"titleContent\":\"经济学的基本假设“理性人”是指（）\",\"analyze\":\"理性人假设指效用/利润最大化，而非“不犯错误”\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"消费者追求效用最大化，生产者追求利润最大化\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"人们总是做出最优决策，不犯错误\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"所有人的偏好相同\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"市场完全竞争\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 15:22:14');
INSERT INTO `t_text_content` VALUES (154, '{\"titleContent\":\"下列属于实证分析的是（）\",\"analyze\":\"实证分析陈述事实，规范分析涉及“应该”类价值判断。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"政府应提高最低工资保障民生\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"失业率与通货膨胀率呈负相关\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"垄断企业应当被拆分\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"税收政策应向低收入群体倾斜\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 15:24:16');
INSERT INTO `t_text_content` VALUES (155, '{\"titleContent\":\"资源稀缺性导致经济学研究的核心问题是（）\",\"analyze\":\"资源稀缺性要求研究资源配置效率。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"如何平衡供需关系\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"如何提高生产效率\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"如何优化资源配置\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"如何平衡供需关系\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 15:33:01');
INSERT INTO `t_text_content` VALUES (156, '{\"titleContent\":\"规范分析的特点是（）\",\"analyze\":\"规范分析包含“应当如何”的价值判断。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"基于事实判断\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"得出客观结论\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"包含价值判断\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"依赖统计数据\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 15:34:53');
INSERT INTO `t_text_content` VALUES (157, '{\"titleContent\":\"经济学假设中“完全信息”是指（）\",\"analyze\":\"完全信息假设包括掌握全部信息、无成本、对称。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"消费者和生产者掌握所有市场信息\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"信息传递无成本\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"信息对称\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"以上都是\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 15:36:34');
INSERT INTO `t_text_content` VALUES (158, '{\"titleContent\":\"实证分析的结论可以通过____验证。\",\"analyze\":\"实证结论可通过数据验证，规范结论不可。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"逻辑推理\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"统计数据\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"价值判断\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"政策效果\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 15:38:47');
INSERT INTO `t_text_content` VALUES (159, '{\"titleContent\":\"若某农产品市场长期存在谷贱伤农现象，从需求弹性角度分析，其主要原因可能是（）\",\"analyze\":\"农产品需求价格弹性小，丰收时供给增加带来的价格下降多，而数量增加少，所以农民收入减少。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"农产品需求价格弹性大，丰收时需求量增加幅度大\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"农产品需求价格弹性小，丰收时需求量增加幅度小\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"农产品需求价格弹性大，丰收时需求量减少幅度大\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"农产品需求价格弹性小，丰时需求量减少幅度小\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 15:41:34');
INSERT INTO `t_text_content` VALUES (160, '{\"titleContent\":\"某品牌手机价格从5000元降至4500元时，其配件供给量从10000件增加到12000件，该手机配件的供给价格弹性（中点弹性）及所属弹性类型为（）\",\"analyze\":\"Es=△Q/ (Q1+Q2)/△P/ (P1+P2)=(2000/22000) /(500/9500)=19/11，属于富有弹性。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"富有弹性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"缺乏弹性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"单位弹性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"完全弹性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 15:51:17');
INSERT INTO `t_text_content` VALUES (161, '{\"titleContent\":\"政府为扶持新能源汽车产业，对新能源汽车实施支持价格。已知新能源汽车市场需求函数Qd=2000-2P，供给函<p class=\\\"ueditor-p\\\">数Qs=-400+4P，支持价格设定为P=600，则支持价格政策实施后，市场上新能源汽车的过剩数量是（）</p>\",\"analyze\":\"将支持价格P=600代入需求函数Qd=2000-2P，得Qd=2000-2x600=800；代入供给函数Qs=-400+4P，得Qs=-400+4x600=2000，则过剩数量为2000-800=1200。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"400\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"600\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"1200\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"1000\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 16:00:10');
INSERT INTO `t_text_content` VALUES (162, '{\"titleContent\":\"下列关于供求定理的表述，错误的是（）\",\"analyze\":\"需求变动引起均衡价格和均衡数量同向变动；供给变动引起均衡价格反向变动，均衡数量同向变动。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"需求增加，供给不变，均衡价格上升\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"需求减少，供给不变，均衡价格下降\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"供给增加，需求不变，均衡价格上升\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"供给减少，需求不变，均衡价格上升\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 16:04:42');
INSERT INTO `t_text_content` VALUES (163, '{\"titleContent\":\"当市场需求不变，供给减少时，均衡价格和均衡数量的变化是（）\",\"analyze\":\"供给变动引起均衡价格反向变动，均衡数量同向变动。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"均衡价格上升，均衡数量上升\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"均衡价格上升，均衡数量下降\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"均衡价格下降，均衡数量上升\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"均衡价格下降，均衡数量下降\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 16:06:52');
INSERT INTO `t_text_content` VALUES (164, '{\"titleContent\":\"影响某农产品供给弹性的因素中，最主要的是（）\",\"analyze\":\"生产周期长短是影响农产品供给弹性最主要的因素，生产周期长，调整产量困难，供给弹性小；生产周期短，可及时调整产量，供给弹性大。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"生产周期长短\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"生产成本高低\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"消费者偏好变化\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"替代品数量多少\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 16:08:33');
INSERT INTO `t_text_content` VALUES (165, '{\"titleContent\":\"某商品在价格为10元时，供给量为50单位；价格上升到12元时，供给量变为70单位。若采用弧弹性公式计算，该商品的供给价格弹性为（）\",\"analyze\":\"根据弧弹性公式Es=△Q/(Q1+Q2)/△P/(P1+P2)=(20/120)/(2/22)=11/6\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"1.2\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"1.5\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"1.8\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"2.0\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 16:11:36');
INSERT INTO `t_text_content` VALUES (166, '[{\"name\":\"经济学\",\"questionItems\":[{\"id\":153,\"itemOrder\":1},{\"id\":150,\"itemOrder\":2},{\"id\":152,\"itemOrder\":3},{\"id\":149,\"itemOrder\":4},{\"id\":148,\"itemOrder\":5},{\"id\":151,\"itemOrder\":6},{\"id\":147,\"itemOrder\":7},{\"id\":144,\"itemOrder\":8},{\"id\":146,\"itemOrder\":9},{\"id\":145,\"itemOrder\":10},{\"id\":143,\"itemOrder\":11},{\"id\":142,\"itemOrder\":12},{\"id\":141,\"itemOrder\":13},{\"id\":140,\"itemOrder\":14},{\"id\":139,\"itemOrder\":15}]}]', '2026-07-20 16:12:40');
INSERT INTO `t_text_content` VALUES (167, '{\"titleContent\":\"作用在任何物体上的力沿着作用线移动时，均不改变其作用效应。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 16:15:53');
INSERT INTO `t_text_content` VALUES (168, '{\"titleContent\":\"作用在刚体上的力可以沿作用线移动，对刚体的作用效果不变。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 16:17:13');
INSERT INTO `t_text_content` VALUES (169, '{\"titleContent\":\"二カ杆一定是直杆。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 16:18:15');
INSERT INTO `t_text_content` VALUES (170, '{\"titleContent\":\"固定端约束通常有____个约束反力。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"一\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"二\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"三\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"四\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 16:22:01');
INSERT INTO `t_text_content` VALUES (171, '{\"titleContent\":\"物体受平面内三个互不平行的力作用而平衡，三个力的作用线（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"必交于一点\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"必交于二点\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"必交于三点\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"交于一点、二点、三点都可能\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 16:24:52');
INSERT INTO `t_text_content` VALUES (172, '{\"titleContent\":\"刚体A在外力作用下保持平衡，以下说法中错误的是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"刚体A在大小相等、方向相反且沿同一直线作用的两个外力作用下必平衡\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"刚体A在作用力与反作用力作用下必平衡\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"刚体A在汇交与一点且力三角形封闭的三个外力作用下必平衡\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"刚体A在两个力偶矩大小相等且转向相反的力偶作用下必平衡\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 16:27:52');
INSERT INTO `t_text_content` VALUES (173, '{\"titleContent\":\"柔性体约束的约束反力，其作用线沿柔索的中心线（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"其指向在标示时可以先任意假设\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"其指向在标示时有的情况可任意假设\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"其指向必定是背离被约束物体\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"其指向也可能是指向被约束物体\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 16:30:07');
INSERT INTO `t_text_content` VALUES (174, '{\"titleContent\":\"光滑面约束的约束反力，其指向是（）\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"在标示时可以先任意假设\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"在标示时有的情况可任意假设\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"必定是背离被约束物体\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"必定是指向被约束物体\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 16:32:07');
INSERT INTO `t_text_content` VALUES (175, '{\"titleContent\":\"平衡是指物体相对地球处于____的状态。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"静止\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"匀速运动\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"加速运动\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"静止或匀速直线运动\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 16:33:59');
INSERT INTO `t_text_content` VALUES (176, '{\"titleContent\":\"既限物体任何方向移动，又限制物体转动的支座称____支座。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"固定铰\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"可动铰\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"固定端\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"光滑面\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 16:37:59');
INSERT INTO `t_text_content` VALUES (177, '{\"titleContent\":\"只限物体任何方向移动，不限制物体转动的支座称____支座。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"固定铰\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"可动铰\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"固定端\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"光滑面\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 16:40:00');
INSERT INTO `t_text_content` VALUES (178, '{\"titleContent\":\"只限物体垂直于支承面的移动，不限制物体其它方向运动的支座称____支座。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"固定铰\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"可动铰\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"固定端\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"光滑面\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 16:41:55');
INSERT INTO `t_text_content` VALUES (179, '{\"titleContent\":\"平衡是物体相对于____保持静止状态或匀速直线运动。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"地球\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"参照物\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"太阳\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"月亮\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 16:43:24');
INSERT INTO `t_text_content` VALUES (180, '{\"titleContent\":\"二力平衡是作用在（）个物体上的一对等值、反向、共线的力。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"一\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"二\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"三\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"四\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 16:45:05');
INSERT INTO `t_text_content` VALUES (181, '{\"titleContent\":\"可动铰支座的约束反力有两个。\",\"analyze\":\"略\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"否\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 16:47:52');
INSERT INTO `t_text_content` VALUES (182, '[{\"name\":\"工程力学\",\"questionItems\":[{\"id\":162,\"itemOrder\":1},{\"id\":163,\"itemOrder\":2},{\"id\":167,\"itemOrder\":3},{\"id\":165,\"itemOrder\":4},{\"id\":164,\"itemOrder\":5},{\"id\":166,\"itemOrder\":6},{\"id\":160,\"itemOrder\":7},{\"id\":159,\"itemOrder\":8},{\"id\":161,\"itemOrder\":9},{\"id\":158,\"itemOrder\":10},{\"id\":154,\"itemOrder\":11},{\"id\":157,\"itemOrder\":12},{\"id\":155,\"itemOrder\":13},{\"id\":168,\"itemOrder\":14},{\"id\":156,\"itemOrder\":15}]}]', '2026-07-20 16:49:52');
INSERT INTO `t_text_content` VALUES (183, '{\"titleContent\":\"教育心理学的创始人是（）\",\"analyze\":\"1903年，美国心理学家爱德华・桑代克出版了《教育心理学》一书，这是西方第一本以“教育心理学”命名的专著。他通过“猫开笼取食实验”提出了联结主义学习理论，系统阐述了刺激-反应(S-R)联结的学习规律，奠定了教育心理学的学科基础，因此被公认为“教育心理学之父”\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"华生\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"桑代克\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"布鲁纳\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"加涅\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 17:42:36');
INSERT INTO `t_text_content` VALUES (184, '{\"titleContent\":\"1903年，美国心理学家()编著出版了《教育心理学》，这是西方第一部以教育心理学命名的专著。\",\"analyze\":\"1903年，美国心理学家桑代克(E.L.Thorndike)出版了《教育心理学》，这是西方第一本以“教育心理学”命名的专著，标志着教育心理学的诞生。桑代克被称为“教育心理学之父”\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"斯金纳\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"布鲁纳\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"华生\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"桑代克\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 17:45:56');
INSERT INTO `t_text_content` VALUES (185, '{\"titleContent\":\"1924年我国第一本《教育心理学》教科书出版，它的作者是（）\",\"analyze\":\"1924年，廖世承编写了我国第一本《教育心理学》教科书，该书主要参考了桑代克的教育心理学体系，结合了中国当时的教育实践。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"陶行知\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"蔡元培\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"潘菽\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"廖世承\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 17:48:54');
INSERT INTO `t_text_content` VALUES (186, '{\"titleContent\":\"俄国著名教育家乌申斯基于1867-1869年出版了____，对当时的心理学发展成果进行了总结，乌申斯基因此被称为“俄罗斯教育心理学的奠基人”\",\"analyze\":\"乌申斯基是19世纪俄国著名教育家，被誉为“俄罗斯教育心理学的奠基人”。他在1867~1869年出版的《人是教育的对象》(又译《教育人类学》)一书，系统总结了当时心理学的发展成果，强调教育应以人为本，依据人的心理规律进行。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《大教学论》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《人是教育的对象》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《教育心理学》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《教育心理学大纲》\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 17:51:46');
INSERT INTO `t_text_content` VALUES (187, '{\"titleContent\":\"__是教学内容的载体，是教学内容的表现形式，是师生之间传递信息的工具。\",\"analyze\":\"教学媒体是指在教学过程中承载和传递教学信息的工具，如书本、图片、投影仪、多媒体设备等。它是教学内容的物质载体和表现形式，帮助师生实现信息交互。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"教学环境\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"教学过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"教学媒体\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"教学手段\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 17:54:05');
INSERT INTO `t_text_content` VALUES (188, '{\"titleContent\":\"教育心理学研究的核心内容是（）\",\"analyze\":\"教育心理学的研究对象包括学习心理、教学心理、学生心理和教师心理等，其中学习过程是核心内容。它聚焦于学生如何获取知识、技能及形成态度的心理机制(如认知、记忆、迁移等)，是教学设计和评价的基础。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"教学过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"学习过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"评价过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"反思过程\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 17:56:27');
INSERT INTO `t_text_content` VALUES (189, '{\"titleContent\":\"主张把教育心理学作为一门独立科学的分支来进行研究，反对把普通心理学的成果简单的移植到教育心理学，并<p class=\\\"ueditor-p\\\">创立了心理学的“文化一历史发展理论”，并从这一理论出发提出了“最近发展区”的观点，他是前苏联著名的心理学家（）</p>\",\"analyze\":\"维果斯基是前苏联心理学家，创立了“文化一历史发展理论”，提出“最近发展区”概念，强调社会文化对认知发展的影响，主张教育心理学应独立研究。布隆斯基是苏联教育学家，主要研究儿童心理学；鲁宾斯坦是苏联哲学家、心理学家，侧重意识与活动的关系。因此，正确答案为维果斯基。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"维果斯基\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"布隆斯基\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"鲁宾斯坦\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"列昂节夫\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 18:03:59');
INSERT INTO `t_text_content` VALUES (190, '{\"titleContent\":\"教育心理学研究的核心内容是（）\",\"analyze\":\"教育心理学研究的核心内容是学习过程。学习过程是指学生在教学情境中，通过与教师、同学以及教学信息的相互作用获得知识、技能和态度的过程。教学过程(A)、评价过程(C)、反思过程(D)都是学与教相互作用过程中的重要环节,但它们围绕学习过程展开，服务于学习过程，因此核心内容是学习过程。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"教学过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"学习过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"评价过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"反思过程\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 18:06:39');
INSERT INTO `t_text_content` VALUES (191, '{\"titleContent\":\"教育心理学作为一门独立的学科，一般被认为产生于（）\",\"analyze\":\"教育心理学作为一门独立的学科，其诞生通常与19世纪末的学术发展密切相关。1903年，美国心理学家桑代克出版了《教育心理学》一书，该书首次系统地阐述了教育心理学的研究内容和理论体系，被公认为教育心理学成为独立学科的里程碑。从时间节点来看，桑代克的著作出版于20世纪初，但学科的独立是一个渐进过程，其奠基和形成阶段主要在19世纪末。因此，教育心理学作为独立学科一般被认为产生于19世纪末。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"18世纪末\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"19世纪末\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"18世纪中期\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"19世纪中期\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 18:09:00');
INSERT INTO `t_text_content` VALUES (192, '{\"titleContent\":\"确立了心理与活动相统一的原理，认为心理过程不但在活动中表现出来，而且也是在活动中形成的，是前苏联著名的教育心理学家（）\",\"analyze\":\"鲁宾斯坦:主张心理与活动统一，认为心理不仅在活动中表现，更在活动中形成，是该理论的核心提出者。维果斯基:以“最近发展区”理论闻名，强调社会文化对认知发展的影响。布隆斯基:侧重儿童心理发展阶段研究，与活动统一原理关联较弱。列昂节夫:虽研究活动理论,但更关注活动的结构与功能，并非该原理的确立者。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"鲁宾斯坦\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"维果斯基\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"布隆斯基\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"列昂节夫\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 18:11:33');
INSERT INTO `t_text_content` VALUES (193, '{\"titleContent\":\"世界上第一部以《教育心理学》命名的著作是俄国的____1877年出版的《教育心理学》\",\"analyze\":\"1877年，俄国的卡普杰列夫出版了《教育心理学》，这是世界上第一部以“教育心理学”命名的著作。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"卡普杰列夫\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"乌申斯基\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"维果斯基\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"布隆斯基\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 18:13:54');
INSERT INTO `t_text_content` VALUES (194, '{\"titleContent\":\"在教育心理学中，____不仅是课堂管理研究的主要范畴，也是学习过程研究和教学设计研究所不能忽视的重要内容。\",\"analyze\":\"教学环境是课堂管理的核心要素，同时影响学习过程和教学设计，是三者共通的重要内容。教学内容:侧重知识传递的核心信息，与课堂管理关联度低。教学媒体:是教学工具，主要影响信息呈现方式，并非管理或设计的核心。教学环境:包括物理环境(如教室布置)和心理环境(如师生互动)，直接影响课堂秩序、学习效率和教学设计的实施，是三者的交叉范畴。评价/反思过程:属于教学后的反馈环节，与课堂管理的实时性无关。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"教学内容\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"教学媒体\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"教学环境\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"评价/反思过程\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 18:16:18');
INSERT INTO `t_text_content` VALUES (195, '{\"titleContent\":\"在学与教的过程中，要有意传递的主要信息是（）\",\"analyze\":\"教学内容是教师有意传递、学生需要掌握的核心知识与技能，是学教过程的核心。教学过程:是传递信息的流程，而非信息本身。教学手段:是传递信息的工具(如课件、实验)，而非信息内容。教学内容:包括教材知识、技能要求等，是学与教中有意传递的主要信息。教学媒体:是信息的载体(如书本、视频)，并非信息本身。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"教学过程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"教学手段\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"教学内容\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"教学媒体\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 18:18:50');
INSERT INTO `t_text_content` VALUES (196, '{\"titleContent\":\"学习的主体因素是____，任何教学都必须通过它起作用。\",\"analyze\":\"学习是学习者主动建构知识和经验的过程，学生作为学习活动的发起者和执行者，是学习的核心主体。A选项“教师”是教学的引导者和组织者,属于主导因素而非主体;B选项“教学环境”是学习的外部条件，起影响作用而非主体作用;D选项“教材”是教学内容的载体，是学生学习的对象，而非主体。因此，任何教学活动的效果都需通过学生的参与和内化才能实现，学生是学习的主体因素。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"教师\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"教学环境\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"学生\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"教材\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 18:22:03');
INSERT INTO `t_text_content` VALUES (197, '{\"titleContent\":\"以下属于学校教与学情境中的心理现象研究领域的有（）\",\"analyze\":\"从研究领域来看，学校教与学情境中的心理现象主要指教师如何教和学生如何学的基本心理规律，主要包括:基本理论、学习心理、教学心理、德育心理和教育社会心理。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"学习心理\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"教学心理\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"社会心理\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"德育心理\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"E\",\"content\":\"体育心理\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-07-20 18:24:48');
INSERT INTO `t_text_content` VALUES (198, '[{\"name\":\"教育心理\",\"questionItems\":[{\"id\":179,\"itemOrder\":1},{\"id\":180,\"itemOrder\":2},{\"id\":183,\"itemOrder\":3},{\"id\":178,\"itemOrder\":4},{\"id\":181,\"itemOrder\":5},{\"id\":182,\"itemOrder\":6},{\"id\":177,\"itemOrder\":7},{\"id\":176,\"itemOrder\":8},{\"id\":175,\"itemOrder\":9},{\"id\":172,\"itemOrder\":10},{\"id\":173,\"itemOrder\":11},{\"id\":174,\"itemOrder\":12},{\"id\":170,\"itemOrder\":13},{\"id\":169,\"itemOrder\":14},{\"id\":171,\"itemOrder\":15}]}]', '2026-07-20 18:26:06');
INSERT INTO `t_text_content` VALUES (199, '{\"titleContent\":\"以下关于《战国策》的表述，错误的是（）\",\"analyze\":\"《战国策》是国别体史书，不是编年体，以纵横家活动为中心，语言铺张，由刘向编订，D表述错误。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"以纵横家的活动为中心，展现战国时期的政治斗争\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"语言铺张扬厉，善用寓言故事增强说服\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"由西汉刘向编订成册\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"是一部编年体史书\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 21:29:07');
INSERT INTO `t_text_content` VALUES (200, '{\"titleContent\":\"被清人方玉润评价为“诗三百篇，言乐者多，言哀者少，惟此篇最悲”的作品是（）\",\"analyze\":\"《诗经・王风・黍离》写周室东迁后故都荒芜，表达兴亡之叹，情感悲怆，符合方玉润评价，其他选项不符，选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《诗经・王风・黍离》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《诗经・小雅・采薇》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《诗经・邶风・击鼓》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《诗经・魏风・硕鼠》\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 21:32:07');
INSERT INTO `t_text_content` VALUES (201, '{\"titleContent\":\"下列不属于《老子》哲学范畴的命题是（）\",\"analyze\":\"“兼相爱，交相利”是墨家思想,“道法自然”“无为而治”“反者道之动”属于《老子》哲学范畴，选C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"道法自然\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"无为而治\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"兼相爱，交相利\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"反者道之动\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 21:35:04');
INSERT INTO `t_text_content` VALUES (202, '{\"titleContent\":\"战国时期，以“辩说”著称，提出“白马非马”逻辑命题的学派代表人物是（）\",\"analyze\":\"公孙龙是名家代表，提出“白马非马”逻辑命题；惠施也是名家,但无此命题；尹文、钎思想与该命题无关，选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"公孙龙\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"惠施\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"尹文\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"宋钘\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 21:41:26');
INSERT INTO `t_text_content` VALUES (203, '{\"titleContent\":\"先秦文学中,“春秋笔法”的主要特点是（）\",\"analyze\":\"“春秋笔法”指在记录历史时,通过用词、记事方式暗含褒贬，微言大义，并非追求文辞华美等，选B。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"文辞华美，铺陈排比\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"微言大义，暗含褒贬\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"直抒胸臆，情感浓烈\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"奇幻瑰丽，想象丰富\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 21:43:49');
INSERT INTO `t_text_content` VALUES (204, '{\"titleContent\":\"下列____作品开创了我国政治抒情诗的先河。\",\"analyze\":\"屈原《离骚》以自身经历为线索，抒发政治理想与遭际，开创政治抒情诗先河;其他选项作品不具备此特征，选B。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《诗经・大雅・生民》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《楚辞・离骚》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《诗经・秦风・蒹葭》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《庄子・逍遥游》\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 21:46:03');
INSERT INTO `t_text_content` VALUES (205, '{\"titleContent\":\"先秦时期“赋诗言志”活动中，赋诗者常通过《诗经》作品表达外交意图，这种用诗方式属于（）\",\"analyze\":\"先秦“赋诗言志”常不顾《诗经》作品原意，截取片段表达意图，属于断章取义;“以意逆志”“知人论世”是解读诗歌方法,“美刺讽谏”与题干不符，选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"断章取义\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"以意逆志\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"知人论世\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"美刺讽谏\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 21:48:17');
INSERT INTO `t_text_content` VALUES (206, '{\"titleContent\":\"以下____典籍被认为保存了中国古代最早的“神话地理学”体系。\",\"analyze\":\"《山海经》记载众多神话，同时包含地理信息，构建起古代“神话地理学”体系；其他典籍不具备此特征，选B。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《尚书・禹贡》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《山海经》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《穆天子传》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《逸周书》\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 21:50:44');
INSERT INTO `t_text_content` VALUES (207, '{\"titleContent\":\"荀子《劝学》中“锲而不舍，金石可镂”体现的思想，与下列____作品的核心观念最为接近。\",\"analyze\":\"荀子“锲而不舍，金石可镂”强调学习坚持;《论语》“学而不已，阖棺乃止”同样倡导终身学习、坚持学习，二者思想相近，选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《论语》“学而不已，阖棺乃止”\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《老子》“大巧若拙，大辩若讷”\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《庄子》“至人无己，神人无功”\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《韩非子》“法不阿贵，绳不挠曲”\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 21:53:25');
INSERT INTO `t_text_content` VALUES (208, '{\"titleContent\":\"关于《诗经》“四家诗”，以下表述正确的是（）\",\"analyze\":\"毛诗为古文经学，A错误;四家对《诗经》解读有差异，C错误;毛诗由毛亨、毛苌所传,D错误;毛诗最晚立博士却独传，B正确。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"齐、鲁、韩、毛四家均为今文经学\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"毛诗最晚立为博士，却最终独传\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"四家对《诗经》的解读完全相同\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"齐诗创始人是西汉经学家毛亨\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 21:55:42');
INSERT INTO `t_text_content` VALUES (209, '{\"titleContent\":\"下列先秦寓言故事，出自《韩非子》且讽刺守旧思想的是（）\",\"analyze\":\"“守株待兔”出自《韩非子》，讽刺因循守旧、不知变通;“刻舟求剑”出自《吕氏春秋》，“揠苗助长”出自《孟子》，“庖丁解牛”出自《庄子》，选B。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"刻舟求剑\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"守株待兔\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"揠苗助长\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"庖丁解牛\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 21:57:56');
INSERT INTO `t_text_content` VALUES (211, '{\"titleContent\":\"《周易》卦爻辞中“无平不陂，无往不复”体现的哲学思想是（）\",\"analyze\":\"“无平不陂，无往不复”意思是平坦会转为险阻,前行会返回，体现阴阳转化哲学思想，与中庸、知行、天人感应无关，选B。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"中庸之道\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"阴阳转化\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"知行合一\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"天人感应\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 22:01:41');
INSERT INTO `t_text_content` VALUES (212, '{\"titleContent\":\"战国时期，提出“人性本恶”主张通过礼法教化改造人性的思想家是（）\",\"analyze\":\"荀子提出“人性本恶”，主张通过礼法教化规范人的行为;孟子主张性善论，告子主张性无善无恶，韩非子主张法治，选C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"孟子\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"告子\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"荀子\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"韩非子\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:03:27');
INSERT INTO `t_text_content` VALUES (213, '{\"titleContent\":\"以下____作品被认为是中国最早的“士阶层”独立宣言。\",\"analyze\":\"《孟子・滕文公下》“富贵不能淫”论述体现士的气节与独立人格，可视为“士阶层”独立宣言;其他选项未充分体现，选C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《论语·微子》中“楚狂接舆歌而过孔子”\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《庄子・秋水》中“鸱得腐鼠”的寓言\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《孟子・滕文公下》“富贵不能淫”的论述\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《战国策・齐策》“冯谖客孟尝君”的故事\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:07:07');
INSERT INTO `t_text_content` VALUES (214, '{\"titleContent\":\"先秦时期,“楚辞”这一文体名称最早见于（）\",\"analyze\":\"“楚辞”这一文体名称最早见于司马迁的《史记・酷吏列传》，其中提到“庄生疾楚王不足为谋，复为《笑府》一篇，虽极天地之变，终不失其正，谓之‘楚辞’”。班固《汉书》、王逸《楚辞章句》、刘向编订的《楚辞》成书均晚于《史记》，对“楚辞”的记录和阐释也是基于早期文献，所以答案选A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"司马迁《史记》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"班固《汉书》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"王逸《楚辞章句》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"刘向《楚辞》\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 22:09:34');
INSERT INTO `t_text_content` VALUES (215, '[{\"name\":\"文史基础\",\"questionItems\":[{\"id\":198,\"itemOrder\":1},{\"id\":197,\"itemOrder\":2},{\"id\":194,\"itemOrder\":3},{\"id\":195,\"itemOrder\":4},{\"id\":193,\"itemOrder\":5},{\"id\":196,\"itemOrder\":6},{\"id\":192,\"itemOrder\":7},{\"id\":191,\"itemOrder\":8},{\"id\":190,\"itemOrder\":9},{\"id\":189,\"itemOrder\":10},{\"id\":188,\"itemOrder\":11},{\"id\":187,\"itemOrder\":12},{\"id\":186,\"itemOrder\":13},{\"id\":185,\"itemOrder\":14},{\"id\":184,\"itemOrder\":15}]}]', '2026-07-20 22:12:05');
INSERT INTO `t_text_content` VALUES (216, '{\"titleContent\":\"中国近现代史的时间跨度是（）\",\"analyze\":\"中国近现代史的时间跨度通常以1949年为界。1840年鸦片战争是中国近代史的开端，1949年新中国成立标志着近代史结束、现代史开始。因此正确答案为B选项(1840年一1949年)。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"1840年一1919年\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"1840年一1949年\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"1840年一1978年\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"1840年一至今\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 22:19:02');
INSERT INTO `t_text_content` VALUES (217, '{\"titleContent\":\"1843年，魏源编成____，提出了“师夷长技以制夷”的思想。\",\"analyze\":\"1843年，魏源在林则徐《四洲志》的基础上编成《海国图志》,提出“师夷长技以制夷”的思想，主张学习西方技术以抵御侵略。A选项《四洲志》为林则徐编译，C选项《盛世危言》为郑观应所著，D选项《天演论》为严复译著。故正确答案为B。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《四洲志》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《海国图志》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《盛世危言》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《天演论》\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 22:21:37');
INSERT INTO `t_text_content` VALUES (218, '{\"titleContent\":\"中国进入近代社会的标志性事件是（）\",\"analyze\":\"1840年鸦片战争后，中国被迫打开国门，签订不平等条约，社会性质开始从封建社会转变为半殖民地半封建社会，标志着中国进入近代社会。A选项虎门销烟是鸦片战争的导火索，C选项洋务运动是近代化尝试，D选项辛亥革命推翻封建帝制。因此正确答案为B。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"虎门销烟\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"鸦片战争\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"洋务运动\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"辛亥革命\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 22:23:49');
INSERT INTO `t_text_content` VALUES (219, '{\"titleContent\":\"鸦片战争爆发的根本原因是（）\",\"analyze\":\"鸦片战争爆发的根本原因是英国为打开中国市场，进行殖民扩张和商品输出。B选项中国禁烟运动(虎门销烟)是直接原因，C、D选项是具体表现或借口。故正确答案为A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"英国企图打开中国市场\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"中国禁烟运动影响英国利益\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"英国想侵占中国领土\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"中英贸易逆差过大\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 22:25:51');
INSERT INTO `t_text_content` VALUES (220, '{\"titleContent\":\"中国近代史上第一个不平等条约是（）\",\"analyze\":\"1842年签订的《南京条约》是中国近代史上第一个不平等条约，标志着中国开始沦为半殖民地半封建社会。A选项《北京条约》签订于1860年，B选项《天津条约》签订于1858年，D选项《马关条约》签订于1895年。因此正确答案为C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"《北京条约》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"《天津条约》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"《南京条约》\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"《马关条约》\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:27:44');
INSERT INTO `t_text_content` VALUES (221, '{\"titleContent\":\"《南京条约》中割让给英国的领土是（）\",\"analyze\":\"《南京条约》规定将香港岛永久割让给英国。A选项九龙通过1860年《北京条约》割让，B选项新界通过1898年《展拓香港界址专条》租借，D选项澳门是葡萄牙通过1553年起逐步占据的领土。故正确答案为C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"九龙\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"新界\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"香港岛\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"澳门\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:31:21');
INSERT INTO `t_text_content` VALUES (222, '{\"titleContent\":\"鸦片战争后，中国社会的性质开始转变为（）\",\"analyze\":\"鸦片战争后，中国主权遭到破坏，自然经济逐步解体，社会性质开始转变为半殖民地半封建社会。A选项封建主义社会是鸦片战争前的性质，B、C选项不符合史实。因此正确答案为D。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"封建主义社会\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"资本主义社会\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"社会主义社会\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"半殖民地半封建社会\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 22:33:27');
INSERT INTO `t_text_content` VALUES (223, '{\"titleContent\":\"近代中国第一个系统介绍西方资产阶级文化的启蒙思想家是（）\",\"analyze\":\"严复是近代中国第一个系统介绍西方资产阶级文化的启蒙思想家，他翻译《天演论》等著作，引入“物竞天择，适者生存”的进化论思想。A选项林则徐、B选项魏源主要提倡学习西方技术，D选项康有为是维新派代表，晚于严复。故正确答案为C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"林则徐\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"魏源\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"严复\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"康有为\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:37:30');
INSERT INTO `t_text_content` VALUES (224, '{\"titleContent\":\"近代中国社会最主要的矛盾是（）\",\"analyze\":\"近代中国社会的主要矛盾包括帝国主义和中华民族的矛盾、封建主义和人民大众的矛盾，其中最主要的矛盾是帝国主义和中华民族的矛盾。A选项是封建社会的主要矛盾，B选项是资本主义社会的主要矛盾，D选项是次要矛盾。因此正确答案为C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"地主阶级和农民阶级的矛盾\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"资产阶级和无产阶级的矛盾\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"帝国主义和中华民族的矛盾\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"封建主义和人民大众的矛盾\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:41:07');
INSERT INTO `t_text_content` VALUES (225, '{\"titleContent\":\"近代中国的历史任务是（）\",\"analyze\":\"近代中国的历史任务是双重的:一是争取民族独立、人民解放，二是实现国家富强、人民幸福。A选项发展资本主义、D选项建立民主共和国是资产阶级革命的目标，B选项实现工业化是现代化的内容之一。故正确答案为C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"发展资本主义\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"实现工业化\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"争取民族独立、人民解放和实现国家富强、人民幸福\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"建立民主共和国\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:42:57');
INSERT INTO `t_text_content` VALUES (226, '{\"titleContent\":\"帝国主义列强对中国进行经济侵略的方式不包括（）\",\"analyze\":\"帝国主义列强对中国的经济侵略包括控制通商口岸、剥夺关税自主权、在华设厂(如《马关条约》后)等，目的是掠夺资源和压制中国民族工业,而非“帮助发展民族工业”。因此正确答案为D。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"控制中国的通商口岸\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"剥夺中国的关税自主权\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"在中国设立工厂\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"帮助中国发展民族工业\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 22:46:25');
INSERT INTO `t_text_content` VALUES (227, '{\"titleContent\":\"帝国主义列强对中国进行经济侵略的方式不包括（）\",\"analyze\":\"帝国主义列强对中国的经济侵略包括控制通商口岸、剥夺关税自主权、在华设厂(如《马关条约》后)等，目的是掠夺资源和压制中国民族工业,而非“帮助发展民族工业”。因此正确答案为D。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"控制中国的通商口岸\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"剥夺中国的关税自主权\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"在中国设立工厂\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"帮助中国发展民族工业\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 22:47:02');
INSERT INTO `t_text_content` VALUES (228, '{\"titleContent\":\"帝国主义列强对中国进行政治控制的手段不包括（）\",\"analyze\":\"帝国主义对中国的政治控制手段包括控制内政外交(如总理衙门改为外务部)、镇压反抗(如联合镇压义和团)、扶植代理人(如清政府、袁世凯)等。D选项“在华开办工厂”属于经济侵略，而非政治控制。故正确答案为D。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"控制中国的内政、外交\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"镇压中国人民的反抗\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"扶植、收买代理人\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"在中国开办工厂\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 22:47:51');
INSERT INTO `t_text_content` VALUES (229, '{\"titleContent\":\"沙俄通过一系列不平等条约，共割占中国东北和西北领土（）\",\"analyze\":\"沙俄通过《瑗珲条约》《北京条约》等不平等条约，共割占中国东北和西北领土约150多万平方公里，是近代割占中国领土最多的国家。因此正确答案为C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"40多万平方公里\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"60多万平方公里\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"150多万平方公里\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"200多万平方公里\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:49:37');
INSERT INTO `t_text_content` VALUES (230, '{\"titleContent\":\"列强对中国进行文化渗透的目的是（）\",\"analyze\":\"列强对中国的文化渗透目的是宣扬殖民主义奴化思想，麻痹中国人民的反抗意识，而非传播先进文化或促进交流。A、B、D选项均为表面借口，不符合本质目的。故正确答案为C。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"传播先进文化\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"帮助中国教育发展\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"宣扬殖民主义奴化思想\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"促进中西文化交流\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:51:18');
INSERT INTO `t_text_content` VALUES (231, '{\"titleContent\":\"中国近代史上人民群众第一次大规模的反侵略武装斗争是（）\",\"analyze\":\"1841年三元里人民抗英斗争是中国近代史上人民群众第一次大规模的反侵略武装斗争，反抗英国侵略者的暴行。B选项太平天国抗击洋枪队发生于19世纪60年代，C选项义和团运动发生于19世纪末，D选项台湾人民反割台斗争发生于1895年。因此正确答案为A。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"三元里人民抗英斗争\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"太平天国抗击洋枪队\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"义和团运动\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"台湾人民反割台斗争\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-07-20 22:52:57');
INSERT INTO `t_text_content` VALUES (232, '[{\"name\":\"近现代史\",\"questionItems\":[{\"id\":214,\"itemOrder\":1},{\"id\":213,\"itemOrder\":2},{\"id\":209,\"itemOrder\":3},{\"id\":211,\"itemOrder\":4},{\"id\":206,\"itemOrder\":5},{\"id\":208,\"itemOrder\":6},{\"id\":212,\"itemOrder\":7},{\"id\":207,\"itemOrder\":8},{\"id\":210,\"itemOrder\":9},{\"id\":205,\"itemOrder\":10},{\"id\":204,\"itemOrder\":11},{\"id\":202,\"itemOrder\":12},{\"id\":203,\"itemOrder\":13},{\"id\":201,\"itemOrder\":14},{\"id\":199,\"itemOrder\":15},{\"id\":200,\"itemOrder\":16}]}]', '2026-07-20 22:54:25');
INSERT INTO `t_text_content` VALUES (233, '{\"titleContent\":\"以下属于新媒体的是（）\",\"analyze\":\"微信公众号基于数字技术，具备互动性等新媒体特征，其他选项为传统媒体。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"纸质报纸\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"调频广播\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"微信公众号\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"电视直播（传统电视台）\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 22:58:33');
INSERT INTO `t_text_content` VALUES (234, '{\"titleContent\":\"新媒体传播的主要优势不包括（）\",\"analyze\":\"新媒体依托数字技术，传播成本相对传统媒体更低，并非优势。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"传播速度快\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"信息反馈及时\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"传播成本高\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"覆盖范围广\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 23:00:23');
INSERT INTO `t_text_content` VALUES (235, '{\"titleContent\":\"新媒体时代的媒介素养不包括以下____能力。\",\"analyze\":\"媒介素养要求具备辨别、生产、规范使用信息的能力，而非盲目接受。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"信息辨别能力\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"信息生产与传播能力\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"盲目接受信息的能力\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"媒介使用规范意识\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 23:02:22');
INSERT INTO `t_text_content` VALUES (236, '{\"titleContent\":\"新媒体产业发展模式的核心是（）\",\"analyze\":\"新媒体产业发展模式强调多元化，围绕用户需求拓展盈利渠道，并非单一或封闭。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"单一盈利模式\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"基于用户需求的多元化盈利与发展\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"仅依赖广告收入\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"封闭化发展\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 23:04:05');
INSERT INTO `t_text_content` VALUES (237, '{\"titleContent\":\"新媒体产业发展趋势不包括（）\",\"analyze\":\"新媒体产业发展会提升用户参与度，用户参与度降低与发展趋势相悖，C符合题意。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"智能化水平提升\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"跨界融合加深\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"用户参与度降低\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"场景化应用拓展\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 23:05:46');
INSERT INTO `t_text_content` VALUES (238, '{\"titleContent\":\"以下关于新媒体法律规范的作用，说法错误的是（）\",\"analyze\":\"新媒体法律规范的作用是保障行业发展、保护权益、规范运营，并非限制用户合法使用，B错误。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"保障新媒体行业健康发展\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"限制用户合法使用新媒体\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"保护用户合法权益\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"规范平台运营行为\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 23:07:34');
INSERT INTO `t_text_content` VALUES (239, '{\"titleContent\":\"新媒体时代媒介素养的具体表现不包括（）\",\"analyze\":\"随意泄露隐私是违反媒介素养和法律规范的行为，A、B、D均为媒介素养的正面表现。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"能够辨别虚假信息\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"主动创作优质内容\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"随意泄露他人隐私\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"遵守网络传播规则\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 23:09:42');
INSERT INTO `t_text_content` VALUES (240, '{\"titleContent\":\"新媒体构成要素中，核心技术支撑是（）\",\"analyze\":\"新媒体的核心技术支撑是数字技术与网各技术，A、C、D均为传统媒体相关技术。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"传统印刷技术\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"数字技术与网络技术\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"手工制作技术\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"模拟信号技术\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 23:13:37');
INSERT INTO `t_text_content` VALUES (241, '{\"titleContent\":\"传播媒介的类型按载体形态划分，不包括（）\",\"analyze\":\"传播媒介按载体形态可分为数字、纸质、电子媒介等，情感媒介不属于该分类。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"数字媒介\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"纸质媒介\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"电子媒介\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"情感媒介\",\"score\":null,\"itemUuid\":null}],\"correct\":\"D\"}', '2026-07-20 23:19:29');
INSERT INTO `t_text_content` VALUES (242, '{\"titleContent\":\"新媒体的核心理念与传统媒体的核心区别在于（）\",\"analyze\":\"传统媒体多以传播者为中心，新媒体核心理念是“以用户为中心”，这是两者核心区别，A、C、D为共性或次要差异。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"是否重视技术\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"是否以用户为中心\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"是否传递信息\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"是否需要传播者\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 23:21:24');
INSERT INTO `t_text_content` VALUES (243, '{\"titleContent\":\"新媒体产业的盈利模式不包括（）\",\"analyze\":\"农产品种植销售属于传统农业盈利模式，与新媒体产业无关，C符合题意。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"广告收入\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"用户付费\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"农产品种植销售\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"平台服务费\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 23:23:25');
INSERT INTO `t_text_content` VALUES (244, '{\"titleContent\":\"新媒体发展的技术基础不包括（）\",\"analyze\":\"新媒体发展的技术基础是数字相关技术，传统农耕技术与之无关，C符合题意。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"大数据技术\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"人工智能技术\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"传统农耕技术\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"移动通信技术\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 23:24:55');
INSERT INTO `t_text_content` VALUES (245, '{\"titleContent\":\"新媒体与传统媒体在传播速度上的区别是（）\",\"analyze\":\"依托数字网络技术，新媒体传播速度远于传统媒体.A、B、D表述错误。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"新媒体传播速度更慢\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"传统媒体传播速度更快\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"新媒体传播速度远快于传统媒体\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"两者传播速度完全一致\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 23:26:38');
INSERT INTO `t_text_content` VALUES (246, '{\"titleContent\":\"新媒体传播的基本理论中,“议程设置”理论在新媒体环境下的变化是（）\",\"analyze\":\"新媒体环境下，用户可通过互动参与议程设置，议程设置理论并未失效，周期更短,A、C、D错误。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"完全失效\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"用户参与议程设置的能力提升\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"仅媒体能设置议程\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"议程设置周期更长\",\"score\":null,\"itemUuid\":null}],\"correct\":\"B\"}', '2026-07-20 23:29:00');
INSERT INTO `t_text_content` VALUES (247, '{\"titleContent\":\"以下关于新媒体产业特征的说法，错误的是（）\",\"analyze\":\"新媒体产业具备高创新性、强互动性、高成长性、高技术依赖性,低成长性说法错误，C符合题意。\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"高创新性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"强互动性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"低成长性\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"高技术依赖性\",\"score\":null,\"itemUuid\":null}],\"correct\":\"C\"}', '2026-07-20 23:30:25');
INSERT INTO `t_text_content` VALUES (248, '[{\"name\":\"新媒体\",\"questionItems\":[{\"id\":226,\"itemOrder\":1},{\"id\":225,\"itemOrder\":2},{\"id\":229,\"itemOrder\":3},{\"id\":224,\"itemOrder\":4},{\"id\":228,\"itemOrder\":5},{\"id\":223,\"itemOrder\":6},{\"id\":222,\"itemOrder\":7},{\"id\":221,\"itemOrder\":8},{\"id\":220,\"itemOrder\":9},{\"id\":227,\"itemOrder\":10},{\"id\":218,\"itemOrder\":11},{\"id\":219,\"itemOrder\":12},{\"id\":217,\"itemOrder\":13},{\"id\":216,\"itemOrder\":14},{\"id\":215,\"itemOrder\":15}]}]', '2026-07-20 23:32:23');

-- ----------------------------
-- Table structure for t_user
-- ----------------------------
DROP TABLE IF EXISTS `t_user`;
CREATE TABLE `t_user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_uuid` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `age` int NULL DEFAULT NULL,
  `sex` int NULL DEFAULT NULL,
  `birth_day` datetime NULL DEFAULT NULL,
  `user_level` int NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `role` int NULL DEFAULT NULL,
  `status` int NULL DEFAULT NULL,
  `image_path` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `modify_time` datetime NULL DEFAULT NULL,
  `last_active_time` datetime NULL DEFAULT NULL,
  `deleted` bit(1) NULL DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `points` int NULL DEFAULT 0 COMMENT '用户总积分',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user
-- ----------------------------
INSERT INTO `t_user` VALUES (1, 'd2d29da2-dcb3-4013-b874-727626236f47', 'student', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '学生', 18, 1, '2019-09-01 00:00:00', 1, '19171171610', 1, 1, 'https://www.mindskip.net:9008/image/ba607a75-83ba-4530-8e23-660b72dc4953/头像.jpg', '2019-09-07 18:55:02', '2026-03-04 11:31:00', NULL, b'0', NULL, 0);
INSERT INTO `t_user` VALUES (2, '52045f5f-a13f-4ccc-93dd-f7ee8270ad4c', 'admin', 'D1AGFL+Gx37t0NPG4d6biYP5Z31cNbwhK5w1lUeiHB2zagqbk8efYfSjYoh1Z/j1dkiRjHU+b0EpwzCh8IGsksJjzD65ci5LsnodQVf4Uj6D3pwoscXGqmkjjpzvSJbx42swwNTA+QoDU8YLo7JhtbUK2X0qCjFGpd+8eJ5BGvk=', '管理员', 30, 1, '2019-09-07 18:56:07', NULL, NULL, 3, 1, NULL, '2019-09-07 18:56:21', NULL, NULL, b'0', NULL, 0);
INSERT INTO `t_user` VALUES (3, '8a922c77-0579-439c-8ac4-40a8a80650b7', 'test', 'EoeuUmh0oL3EpZ0Eanx3QsAqaxAu39B8VocrLysaQmhyw5TOrERjX5Kk8l3CqUPXSkXBz1AlVMGM483drJT89HclXTif+fvVAM59u4FzqHllFd0JhYV6iABaMNfijoQjJxhaLFsEgxGg0gyXOz90VNV1DFQo6sQ9F8td06koZh8=', '旧城新月', NULL, NULL, NULL, 1, NULL, 1, 1, 'file/2026/02/25/d28cdbec78fb44d8966ca30295721977.1765009614-157d8d4c.jpg', '2025-07-11 22:23:24', '2026-05-13 13:50:40', '2025-07-11 22:23:24', b'0', NULL, 2);
INSERT INTO `t_user` VALUES (4, '5cc542db-d5d2-421d-b790-9fab8895c4c2', '15079681786', 'ebNG+JWYNKabN+/3hS0ZpCRWdpzeGmZsF41zOSH+a1fRfXo5i7OwfKshhzqUPR9R9Qdjopp07S1Y5KYsENPKdC6R24i/dn9yUMNGTemKhfY0k6VsFc4VH5MRACRhXzSs3bnYKzN2D7vzaHtl+W+8K5dff1LAqp9oPrRr5eqY6zU=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-02-26 15:55:30', '2026-02-26 15:57:27', '2026-02-26 15:55:30', b'0', NULL, 0);
INSERT INTO `t_user` VALUES (5, 'f6e6c233-07ec-4bee-9cd4-25feff0ba3cd', 'shmshm', 'XTOlxKw1ZrjZpjmMjMyoEcO3no3M655/4Tmy2DT9kzLMd91QD+A1sDEzxcDDbgLh/HOUCKx3EjxAuOjLDlNoDPw00tjDYdLeAVSm98jTWwp4qwRj06KIkdPBEnrhupz3sIhXYbaYUxkuCf6B2OGVAytcbH4nUmZ9LX1yeaS7NgE=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-05 08:07:52', '2026-03-05 08:08:48', '2026-03-05 08:07:52', b'0', NULL, 0);
INSERT INTO `t_user` VALUES (6, 'dc7f439b-b627-4a1a-ab28-881ae2ad789e', '2023114060331', 'RrfcmW/0aSZudMwXXTgPBiEIcpJWIwZm06NG6Yo2Mnv+J/bnp5zbVQzisuPGcxY/BO8jE3lPlxxcE5OY2a54KzDI5ZEH+vrO6A2siXVt1c2EGeiHI8oLt3BYiZ3w59joDMr+68m64Og3NOuQ7nQLMupVWxMpVfjwVmEMwL5QvhQ=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-05 08:22:53', NULL, '2026-03-05 08:22:53', b'0', NULL, 0);
INSERT INTO `t_user` VALUES (7, '38e3f706-aa42-4492-8e6b-6de84d99997a', '王琳', 'pLYl0MLlpDR3hEVu8BulRuje96j590ndH+a4V8TZFB4BCpSXtUg9tiZ7LEhs9CcA0SG4gNDZk9IvA5e29cwybR2PKmhDiwi43E9GzalaAyyo2+98L8RyXYtBVpEluG/AVQJWLWd1Ox4wypuCK00Ead1dil9RQ4BlGs2jhqmafdE=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-05 11:32:58', NULL, '2026-03-05 11:32:58', b'0', NULL, 0);
INSERT INTO `t_user` VALUES (8, '431009e7-bf6e-4ae8-ba42-38bde51ca7c2', '123456', 'i0VDbK4W38r3M6Rx6mR40pux6tj4fLe3RcxWOer3Icikgbh97X9q5j4ZT9ti7uUJ8ZxfchdX0l0oxTNLAk/b+egedfhODFsqZ5JXwO/Iq9QYzXcp5ztu3wM+tNeBx72Y641srr7gjrypNW+cR/Kz2iP8/N8XLoRHXljszsH46JE=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-05 12:12:06', '2026-03-05 12:12:13', '2026-03-05 12:12:06', b'0', 'oJ4Ty6_DDPAFGVTG6AASKahRcBMg', 0);
INSERT INTO `t_user` VALUES (9, '03dc0b06-a6ee-4966-8d0f-9ea6d95b61fd', '17736202814', 'CiT19/umMw0z9YZJPsgpJrJoXsSRDWrOAjsXLrggafUsSOSp/A9oRIExZbfTNNVU0m3PLTv7bmu1Koquo0YUICTZp9XZM9m+kYNiwYqQo0Segg0jICcyB1o6E5x5RHkkBz8AAY6A2vVel0xnsECfqyi9/4tgQ0k5rSxw9JG+V6E=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-05 12:47:04', '2026-03-05 12:47:18', '2026-03-05 12:47:04', b'0', 'oJ4Ty6yIY49c_ZpRmya1UNTYaMr8', 0);
INSERT INTO `t_user` VALUES (10, 'd8905844-0102-4023-989b-c6971b5f486e', 'Tongyahui', 'ApRvUYNJtLLUqddZq0ll74fJlu1/NZArgmFgdlnn9kt2aVff5M1p5t753xKHYPf4+PbP5VUCEG3ztv1T9Cob0+sUvIDaTY7E4wHKeTfGeX799+vVX3b9H/UoCtj9LfZKQ0iIaQIhX62fdCinoY4msCUTwaxXYUmQ4blaancdc0I=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-05 12:49:01', NULL, '2026-03-05 12:49:01', b'0', NULL, 0);
INSERT INTO `t_user` VALUES (11, '75ba745b-810c-49dd-ae2c-9ade667544a4', 'zyzy', 'kkajqf4zICspwDLVuJxE0WMNku1W4aa7brHzLee0ax2msRW8vQGYYRnH7b8BGQ4T9WOArRyQWTYPpqj7csV8hSDnimJr9U3HE3VYs1+C6s7lmmMVZBiDv+tYBp3rz8dZJOdHddQ5yrRPJjEYwYDhF3vMtTQyg/nTz0wplBwZUbc=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-05 14:09:25', '2026-03-05 14:10:00', '2026-03-05 14:09:25', b'0', 'oJ4Ty6yH0dGOKxFWI8fPDEGNR3ws', 0);
INSERT INTO `t_user` VALUES (12, 'e0ad26e2-49f1-4bed-9ea8-f3669cddc507', '123456789', 'D/r9muUNkqn29olzO7/r5BtYj5bxaguXH65ljI2j5+ufYll31JHfzg6e4hCHSQXOuLY1dQC8ZMBfWhtv0pWwsTjoz+spw51gVCBwi29sRt5WqrGLxEvkjaD/WEjn2JLk5n0MbZfmjV6iyIv631h37QKQaLz6kWZehwqVIZGvZYI=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-05 21:39:19', '2026-03-05 21:39:26', '2026-03-05 21:39:19', b'0', 'oJ4Ty6ze7wiBmq5IyYfDhV5BYouM', 0);
INSERT INTO `t_user` VALUES (13, '627babbf-c7ef-42d2-99ee-d4cdb45dd954', '1155889', 'MeOBewT2XF9dsqEGo1Gd/HvLfYKSQs+6fKqnQn4UvcpDIEf7ZDIrgPVitZJvqYO7d/EJFULlNQXehfbZ5bqRCBLY305f+bD9H14soEKT/LTepjKDm8Cc2S4xCxpiMTeUdvyGRw2EduXP3fGDe2g4aL4vp0+Akfcw5bD1qRmZHX0=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-06 20:26:53', '2026-03-06 20:27:01', '2026-03-06 20:26:53', b'0', 'oJ4Ty6wyP4Ir9Xyrl-2R7Bi2l8TU', 0);
INSERT INTO `t_user` VALUES (14, 'e9ca2fcc-4252-44a9-94fd-3be107bcd317', 'aaa123', 'OpwSTrJDBQgD+DFFMwavAhiPJdlRpF7xjybJ1ESGeKfWlABw2dqOxQGQRxuojZ60eE+/TnzbLN9ef1AhDc/1atpKAmmKYusopaZhjZPArzySH8ALEPDKzRE32kSdpafuWY7E3VQKESlzvC6iduGR6Ii2hoZYpVmN3ruFVxYaR5s=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-03-07 18:48:50', '2026-03-07 18:48:58', '2026-03-07 18:48:50', b'0', 'oJ4Ty65JbVrk0Qrdc5Yk_FexCObk', 0);
INSERT INTO `t_user` VALUES (15, 'eb207bec-f408-4216-8616-7e3eb4a5099c', '15770643487', 'CJdUzG3xamVkzm/4SRRjFbGS90G8M1rCMh4uOK7R+uqpBU9NXckWjQHu2+YhnXvTD8tzgrO86PYlQLcvOHSzFXeZVhVrlP2ipIdcmUBiyq9cYxO7Yhl3Hy89IWsnIdKCMlTQwBkfRf7Bi48fwxnOIkDiyXSrFvgUsyzClQafU3s=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 'file/2026/05/09/7b2d263b89d64a468d02307315576933.image_download_1762865386953.jpg', '2026-05-08 21:43:40', '2026-07-31 15:28:33', '2026-05-08 21:43:40', b'0', 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', 5);
INSERT INTO `t_user` VALUES (16, '73fa4a67-0d0f-4797-b7a0-ce97a762f5b4', '13395740108', 'A+GGdIY/v8lF0uS9tSLdIzgJPOIqGQfcDIh1CYwBPWI+bVtG6Gwb9i5WzQIm4+I0GEBZcrYPs3h3jYrtt9rGUoeAVutZCiqYKHpL+ppOsLkezghZWxY3N6Ec44Zh/wuncspWDH5U56eT87jqSfjYzi7A0Zrh2A+KkSA+sMymKHA=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 'file/2026/05/09/c7dfb8ac037c4ca0b69092f975c814e9.image_download_1762866391051.jpg', '2026-05-09 12:31:34', NULL, '2026-05-09 12:31:34', b'0', NULL, 124);
INSERT INTO `t_user` VALUES (17, '0530db4b-6f79-47d2-a0aa-8c099b713439', '13700000001', 'QBMMyZzPK2qY2u4uPvHFEg06SeSAUlclrirRt74vGhJa4FQmiSlQJDQYjyN1wybPNTZ2LJmwA6n97uJrA5s72ZxJ0fde7Ax2KDsQhTVs1L/nkEfPUb6W1wJSOxQWiNEPQtPEnODh1+guvLgLhvVKIVpjWSbdcPNK+keGmmq9ZNg=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, NULL, '2026-05-14 22:49:35', NULL, '2026-05-14 22:49:35', b'0', NULL, 0);

-- ----------------------------
-- Table structure for t_user_event_log
-- ----------------------------
DROP TABLE IF EXISTS `t_user_event_log`;
CREATE TABLE `t_user_event_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `real_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `create_time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 174 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user_event_log
-- ----------------------------
INSERT INTO `t_user_event_log` VALUES (1, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-07-11 22:21:57');
INSERT INTO `t_user_event_log` VALUES (2, 3, 'test', NULL, '欢迎 test 注册来到温故阁', '2025-07-11 22:23:24');
INSERT INTO `t_user_event_log` VALUES (3, 3, 'test', NULL, 'test 登录了温故阁', '2025-07-11 22:23:33');
INSERT INTO `t_user_event_log` VALUES (4, 3, 'test', NULL, 'test 登出了温故阁', '2025-07-11 22:24:38');
INSERT INTO `t_user_event_log` VALUES (5, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-07-11 22:32:53');
INSERT INTO `t_user_event_log` VALUES (6, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-07-11 22:33:15');
INSERT INTO `t_user_event_log` VALUES (7, 3, 'test', NULL, 'test 登录了温故阁', '2025-07-11 22:34:18');
INSERT INTO `t_user_event_log` VALUES (8, 3, 'test', NULL, 'test 登出了温故阁', '2025-07-11 22:34:40');
INSERT INTO `t_user_event_log` VALUES (9, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2025-07-11 22:34:54');
INSERT INTO `t_user_event_log` VALUES (10, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-07-11 22:35:42');
INSERT INTO `t_user_event_log` VALUES (11, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2025-07-11 22:39:55');
INSERT INTO `t_user_event_log` VALUES (12, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-07-11 23:05:09');
INSERT INTO `t_user_event_log` VALUES (13, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-07-11 23:16:13');
INSERT INTO `t_user_event_log` VALUES (14, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-07-11 23:16:27');
INSERT INTO `t_user_event_log` VALUES (15, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2025-07-11 23:16:37');
INSERT INTO `t_user_event_log` VALUES (16, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2025-07-12 08:21:14');
INSERT INTO `t_user_event_log` VALUES (17, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2025-07-13 22:31:07');
INSERT INTO `t_user_event_log` VALUES (18, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-07-13 23:00:14');
INSERT INTO `t_user_event_log` VALUES (19, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2025-07-13 23:00:46');
INSERT INTO `t_user_event_log` VALUES (20, 1, 'student', '学生', 'student 登出了学之思开源考试系统', '2025-07-13 23:09:48');
INSERT INTO `t_user_event_log` VALUES (21, 3, 'test', NULL, 'test 登录了温故阁', '2025-07-13 23:10:02');
INSERT INTO `t_user_event_log` VALUES (22, 3, 'test', NULL, 'test 登出了温故阁', '2025-07-13 23:10:26');
INSERT INTO `t_user_event_log` VALUES (23, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2025-07-13 23:10:40');
INSERT INTO `t_user_event_log` VALUES (24, 1, 'student', '学生', 'student 登录了学之思开源考试系统', '2025-07-13 23:12:57');
INSERT INTO `t_user_event_log` VALUES (25, 1, 'student', '学生', 'student 登出了学之思开源考试系统', '2025-07-13 23:13:22');
INSERT INTO `t_user_event_log` VALUES (26, 3, 'test', NULL, 'test 登录了温故阁', '2025-07-13 23:13:29');
INSERT INTO `t_user_event_log` VALUES (27, 3, 'test', NULL, 'test 提交试卷：test 得分：1 耗时：3 秒', '2025-07-13 23:13:41');
INSERT INTO `t_user_event_log` VALUES (28, 3, 'test', NULL, 'test 提交试卷：test 得分：0 耗时：3 秒', '2025-07-13 23:25:39');
INSERT INTO `t_user_event_log` VALUES (29, 3, 'test', NULL, 'test 提交试卷：test 得分：0 耗时：1分 0秒', '2025-07-14 17:56:45');
INSERT INTO `t_user_event_log` VALUES (30, 3, 'test', NULL, 'test 登录了温故阁', '2025-10-05 11:41:32');
INSERT INTO `t_user_event_log` VALUES (31, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-10-06 11:23:43');
INSERT INTO `t_user_event_log` VALUES (32, 3, 'test', NULL, 'test 登录了温故阁', '2025-10-06 11:24:16');
INSERT INTO `t_user_event_log` VALUES (33, 3, 'test', NULL, 'test 登录了温故阁', '2025-10-06 11:51:34');
INSERT INTO `t_user_event_log` VALUES (34, 3, 'test', NULL, 'test 登录了温故阁', '2025-10-06 11:51:34');
INSERT INTO `t_user_event_log` VALUES (35, 3, 'test', NULL, 'test 登录了温故阁', '2025-10-06 11:51:36');
INSERT INTO `t_user_event_log` VALUES (36, 3, 'test', NULL, 'test 登录了温故阁', '2025-10-06 17:24:06');
INSERT INTO `t_user_event_log` VALUES (37, 3, 'test', NULL, 'test 登出了温故阁', '2025-10-06 17:30:03');
INSERT INTO `t_user_event_log` VALUES (38, 3, 'test', NULL, 'test 登录了温故阁', '2025-10-06 17:30:09');
INSERT INTO `t_user_event_log` VALUES (39, 3, 'test', NULL, 'test 登录了温故阁', '2025-12-20 12:14:53');
INSERT INTO `t_user_event_log` VALUES (40, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-12-20 12:15:42');
INSERT INTO `t_user_event_log` VALUES (41, 3, 'test', NULL, 'test 登录了温故阁', '2025-12-26 22:27:15');
INSERT INTO `t_user_event_log` VALUES (42, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2025-12-26 22:28:33');
INSERT INTO `t_user_event_log` VALUES (43, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-16 15:45:41');
INSERT INTO `t_user_event_log` VALUES (44, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2026-02-16 15:47:21');
INSERT INTO `t_user_event_log` VALUES (45, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-16 15:49:15');
INSERT INTO `t_user_event_log` VALUES (46, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2026-02-16 16:02:32');
INSERT INTO `t_user_event_log` VALUES (47, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-16 19:53:35');
INSERT INTO `t_user_event_log` VALUES (48, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-17 14:57:31');
INSERT INTO `t_user_event_log` VALUES (49, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2026-02-17 15:18:30');
INSERT INTO `t_user_event_log` VALUES (50, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-17 15:53:59');
INSERT INTO `t_user_event_log` VALUES (51, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-17 20:54:33');
INSERT INTO `t_user_event_log` VALUES (52, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-22 09:32:28');
INSERT INTO `t_user_event_log` VALUES (53, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2026-02-22 09:38:01');
INSERT INTO `t_user_event_log` VALUES (54, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-24 12:48:42');
INSERT INTO `t_user_event_log` VALUES (55, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-24 15:16:46');
INSERT INTO `t_user_event_log` VALUES (56, 3, 'test', NULL, 'test 登出了温故阁', '2026-02-24 15:17:49');
INSERT INTO `t_user_event_log` VALUES (57, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-24 15:17:54');
INSERT INTO `t_user_event_log` VALUES (58, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-24 18:31:29');
INSERT INTO `t_user_event_log` VALUES (59, 2, 'admin', '管理员', 'admin 登录了学之思开源考试系统', '2026-02-24 18:48:12');
INSERT INTO `t_user_event_log` VALUES (60, 3, 'test', NULL, 'test 登录了温故阁', '2026-02-25 18:32:47');
INSERT INTO `t_user_event_log` VALUES (61, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-02-26 15:03:48');
INSERT INTO `t_user_event_log` VALUES (62, 4, '15079681786', NULL, '欢迎 15079681786 注册来到温故阁', '2026-02-26 15:55:30');
INSERT INTO `t_user_event_log` VALUES (63, 3, 'test', '旧城新月', 'test 提交试卷：基础试题测试 得分：1 耗时：34 秒', '2026-02-26 15:59:46');
INSERT INTO `t_user_event_log` VALUES (64, 3, 'test', '旧城新月', 'test 提交试卷：模拟试卷测试 得分：1 耗时：34 秒', '2026-02-26 16:00:53');
INSERT INTO `t_user_event_log` VALUES (65, 3, 'test', '旧城新月', 'test 登录了温故阁', '2026-03-01 22:02:52');
INSERT INTO `t_user_event_log` VALUES (66, 3, 'test', '旧城新月', 'test 登出了温故阁', '2026-03-01 22:07:30');
INSERT INTO `t_user_event_log` VALUES (67, 3, 'test', '旧城新月', 'test 登录了温故阁', '2026-03-01 22:09:15');
INSERT INTO `t_user_event_log` VALUES (68, 3, 'test', '旧城新月', 'test 登录了温故阁', '2026-03-03 09:41:00');
INSERT INTO `t_user_event_log` VALUES (69, 1, 'student', '学生', 'student 登录了温故阁', '2026-03-03 12:37:50');
INSERT INTO `t_user_event_log` VALUES (70, 1, 'student', '学生', 'student 登录了温故阁', '2026-03-03 22:16:20');
INSERT INTO `t_user_event_log` VALUES (71, 1, 'student', '学生', 'student 登出了温故阁', '2026-03-03 22:16:43');
INSERT INTO `t_user_event_log` VALUES (72, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-03-04 11:07:58');
INSERT INTO `t_user_event_log` VALUES (73, 1, 'student', '学生', 'student 登录了温故阁', '2026-03-04 11:30:10');
INSERT INTO `t_user_event_log` VALUES (74, 1, 'student', '学生', 'student 更新了个人资料', '2026-03-04 11:31:00');
INSERT INTO `t_user_event_log` VALUES (75, 1, 'student', '学生', 'student 登出了温故阁', '2026-03-04 11:33:25');
INSERT INTO `t_user_event_log` VALUES (76, 5, 'shmshm', NULL, '欢迎 shmshm 注册来到温故阁', '2026-03-05 08:07:52');
INSERT INTO `t_user_event_log` VALUES (77, 6, '2023114060331', NULL, '欢迎 2023114060331 注册来到温故阁', '2026-03-05 08:22:53');
INSERT INTO `t_user_event_log` VALUES (78, 7, '王琳', NULL, '欢迎 王琳 注册来到温故阁', '2026-03-05 11:32:58');
INSERT INTO `t_user_event_log` VALUES (79, 7, '王琳', NULL, '王琳 登录了温故阁', '2026-03-05 11:33:05');
INSERT INTO `t_user_event_log` VALUES (80, 7, '王琳', NULL, '王琳 登录了温故阁', '2026-03-05 11:35:45');
INSERT INTO `t_user_event_log` VALUES (81, 8, '123456', NULL, '欢迎 123456 注册来到温故阁', '2026-03-05 12:12:06');
INSERT INTO `t_user_event_log` VALUES (82, 9, '17736202814', NULL, '欢迎 17736202814 注册来到温故阁', '2026-03-05 12:47:04');
INSERT INTO `t_user_event_log` VALUES (83, 10, 'Tongyahui', NULL, '欢迎 Tongyahui 注册来到温故阁', '2026-03-05 12:49:01');
INSERT INTO `t_user_event_log` VALUES (84, 10, 'Tongyahui', NULL, 'Tongyahui 登录了温故阁', '2026-03-05 12:49:05');
INSERT INTO `t_user_event_log` VALUES (85, 11, 'zyzy', NULL, '欢迎 zyzy 注册来到温故阁', '2026-03-05 14:09:25');
INSERT INTO `t_user_event_log` VALUES (86, 11, 'zyzy', NULL, 'zyzy 登录了温故阁', '2026-03-05 14:09:34');
INSERT INTO `t_user_event_log` VALUES (87, 12, '123456789', NULL, '欢迎 123456789 注册来到温故阁', '2026-03-05 21:39:19');
INSERT INTO `t_user_event_log` VALUES (88, 12, '123456789', NULL, '123456789 提交试卷：基础试题测试 得分：0 耗时：6 秒', '2026-03-05 21:39:46');
INSERT INTO `t_user_event_log` VALUES (89, 12, '123456789', NULL, '123456789 提交试卷：模拟试卷测试 得分：1 耗时：23 秒', '2026-03-05 21:40:26');
INSERT INTO `t_user_event_log` VALUES (90, 13, '1155889', NULL, '欢迎 1155889 注册来到温故阁', '2026-03-06 20:26:53');
INSERT INTO `t_user_event_log` VALUES (91, 14, 'aaa123', NULL, '欢迎 aaa123 注册来到温故阁', '2026-03-07 18:48:50');
INSERT INTO `t_user_event_log` VALUES (92, 14, 'aaa123', NULL, 'aaa123 登录了温故阁', '2026-03-07 18:50:17');
INSERT INTO `t_user_event_log` VALUES (93, 3, 'test', '旧城新月', 'test 登录了温故阁', '2026-05-07 15:04:19');
INSERT INTO `t_user_event_log` VALUES (94, 3, 'test', '旧城新月', 'test 登录了温故阁', '2026-05-07 15:50:23');
INSERT INTO `t_user_event_log` VALUES (95, 15, '15770643487', NULL, '欢迎 15770643487 注册来到温故阁', '2026-05-08 21:43:40');
INSERT INTO `t_user_event_log` VALUES (96, 3, 'test', '旧城新月', 'test 登录了温故阁', '2026-05-08 23:59:34');
INSERT INTO `t_user_event_log` VALUES (97, 3, 'test', '旧城新月', 'test 登出了温故阁', '2026-05-08 23:59:40');
INSERT INTO `t_user_event_log` VALUES (98, 15, '15770643487', NULL, '15770643487 登录了温故阁', '2026-05-08 23:59:55');
INSERT INTO `t_user_event_log` VALUES (99, 15, '15770643487', NULL, '15770643487 登录了温故阁', '2026-05-09 10:50:20');
INSERT INTO `t_user_event_log` VALUES (100, 15, '15770643487', NULL, '15770643487 登出了温故阁', '2026-05-09 10:51:30');
INSERT INTO `t_user_event_log` VALUES (101, 15, '15770643487', NULL, '15770643487 登录了温故阁', '2026-05-09 11:02:02');
INSERT INTO `t_user_event_log` VALUES (102, 15, '15770643487', NULL, '15770643487 登出了温故阁', '2026-05-09 11:02:11');
INSERT INTO `t_user_event_log` VALUES (103, 15, '15770643487', NULL, '15770643487 登录了温故阁', '2026-05-09 11:54:34');
INSERT INTO `t_user_event_log` VALUES (104, 15, '15770643487', NULL, '15770643487 登出了温故阁', '2026-05-09 11:54:39');
INSERT INTO `t_user_event_log` VALUES (105, 16, '13395740108', NULL, '欢迎 13395740108 注册来到温故阁', '2026-05-09 12:31:35');
INSERT INTO `t_user_event_log` VALUES (106, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-09 12:32:26');
INSERT INTO `t_user_event_log` VALUES (107, 15, '15770643487', NULL, '15770643487 提交试卷：模拟试卷测试 得分：1 耗时：1分 41秒', '2026-05-09 17:11:26');
INSERT INTO `t_user_event_log` VALUES (108, 15, '15770643487', NULL, '15770643487 提交试卷：基础试题测试 得分：1 耗时：56 秒', '2026-05-09 17:14:09');
INSERT INTO `t_user_event_log` VALUES (109, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-09 17:20:49');
INSERT INTO `t_user_event_log` VALUES (110, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-10 16:57:57');
INSERT INTO `t_user_event_log` VALUES (111, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-10 17:58:02');
INSERT INTO `t_user_event_log` VALUES (112, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-10 18:05:00');
INSERT INTO `t_user_event_log` VALUES (113, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-10 20:38:58');
INSERT INTO `t_user_event_log` VALUES (114, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-11 12:19:14');
INSERT INTO `t_user_event_log` VALUES (115, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 20:21:01');
INSERT INTO `t_user_event_log` VALUES (116, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 20:46:43');
INSERT INTO `t_user_event_log` VALUES (117, 16, '13395740108', NULL, '13395740108 登出了温故阁', '2026-05-12 20:47:23');
INSERT INTO `t_user_event_log` VALUES (118, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 20:47:26');
INSERT INTO `t_user_event_log` VALUES (119, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 21:55:16');
INSERT INTO `t_user_event_log` VALUES (120, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 22:38:29');
INSERT INTO `t_user_event_log` VALUES (121, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 23:15:26');
INSERT INTO `t_user_event_log` VALUES (122, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 23:15:36');
INSERT INTO `t_user_event_log` VALUES (123, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 23:18:41');
INSERT INTO `t_user_event_log` VALUES (124, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 23:20:39');
INSERT INTO `t_user_event_log` VALUES (125, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 23:32:11');
INSERT INTO `t_user_event_log` VALUES (126, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 23:37:57');
INSERT INTO `t_user_event_log` VALUES (127, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 23:38:12');
INSERT INTO `t_user_event_log` VALUES (128, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-12 23:38:17');
INSERT INTO `t_user_event_log` VALUES (129, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 10:26:22');
INSERT INTO `t_user_event_log` VALUES (130, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 10:28:49');
INSERT INTO `t_user_event_log` VALUES (131, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 10:29:45');
INSERT INTO `t_user_event_log` VALUES (132, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 10:45:56');
INSERT INTO `t_user_event_log` VALUES (133, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 10:46:42');
INSERT INTO `t_user_event_log` VALUES (134, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 10:58:04');
INSERT INTO `t_user_event_log` VALUES (135, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 11:28:12');
INSERT INTO `t_user_event_log` VALUES (136, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 11:54:22');
INSERT INTO `t_user_event_log` VALUES (137, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 13:34:46');
INSERT INTO `t_user_event_log` VALUES (138, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 13:47:46');
INSERT INTO `t_user_event_log` VALUES (139, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 14:10:52');
INSERT INTO `t_user_event_log` VALUES (140, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-13 14:41:02');
INSERT INTO `t_user_event_log` VALUES (141, 3, 'test', '旧城新月', 'test 登录了温故阁', '2026-05-14 00:23:15');
INSERT INTO `t_user_event_log` VALUES (142, 17, '13700000001', NULL, '欢迎 13700000001 注册来到温故阁', '2026-05-14 22:49:35');
INSERT INTO `t_user_event_log` VALUES (143, 17, '13700000001', NULL, '13700000001 登录了温故阁', '2026-05-14 22:49:50');
INSERT INTO `t_user_event_log` VALUES (144, 17, '13700000001', NULL, '13700000001 登出了温故阁', '2026-05-14 22:51:56');
INSERT INTO `t_user_event_log` VALUES (145, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-14 22:57:00');
INSERT INTO `t_user_event_log` VALUES (146, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-15 19:46:16');
INSERT INTO `t_user_event_log` VALUES (147, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-16 14:49:04');
INSERT INTO `t_user_event_log` VALUES (148, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-18 21:52:56');
INSERT INTO `t_user_event_log` VALUES (149, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-19 09:23:07');
INSERT INTO `t_user_event_log` VALUES (150, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-20 10:35:41');
INSERT INTO `t_user_event_log` VALUES (151, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-21 21:34:48');
INSERT INTO `t_user_event_log` VALUES (152, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-22 10:49:59');
INSERT INTO `t_user_event_log` VALUES (153, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-23 11:10:11');
INSERT INTO `t_user_event_log` VALUES (154, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-24 09:25:57');
INSERT INTO `t_user_event_log` VALUES (155, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-05-25 08:45:14');
INSERT INTO `t_user_event_log` VALUES (156, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-06-01 15:33:20');
INSERT INTO `t_user_event_log` VALUES (157, 2, 'admin', '管理员', 'admin 登出了温故阁', '2026-06-01 15:59:54');
INSERT INTO `t_user_event_log` VALUES (158, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-18 15:07:49');
INSERT INTO `t_user_event_log` VALUES (159, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-18 18:26:17');
INSERT INTO `t_user_event_log` VALUES (160, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-18 20:37:44');
INSERT INTO `t_user_event_log` VALUES (161, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-18 22:56:00');
INSERT INTO `t_user_event_log` VALUES (162, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-19 11:39:51');
INSERT INTO `t_user_event_log` VALUES (163, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-19 17:00:29');
INSERT INTO `t_user_event_log` VALUES (164, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-19 21:18:44');
INSERT INTO `t_user_event_log` VALUES (165, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-20 08:14:01');
INSERT INTO `t_user_event_log` VALUES (166, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-20 12:12:33');
INSERT INTO `t_user_event_log` VALUES (167, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-20 15:11:27');
INSERT INTO `t_user_event_log` VALUES (168, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-20 17:38:29');
INSERT INTO `t_user_event_log` VALUES (169, 2, 'admin', '管理员', 'admin 登录了温故阁', '2026-07-20 21:16:38');
INSERT INTO `t_user_event_log` VALUES (170, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-07-30 21:53:27');
INSERT INTO `t_user_event_log` VALUES (171, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-07-30 22:38:37');
INSERT INTO `t_user_event_log` VALUES (172, 16, '13395740108', NULL, '13395740108 登出了温故阁', '2026-07-30 22:41:46');
INSERT INTO `t_user_event_log` VALUES (173, 16, '13395740108', NULL, '13395740108 登录了温故阁', '2026-07-30 22:44:03');

-- ----------------------------
-- Table structure for t_user_token
-- ----------------------------
DROP TABLE IF EXISTS `t_user_token`;
CREATE TABLE `t_user_token`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `token` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `wx_open_id` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime NULL DEFAULT NULL,
  `end_time` datetime NULL DEFAULT NULL,
  `user_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 73 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_user_token
-- ----------------------------
INSERT INTO `t_user_token` VALUES (2, '77f49d2b-8928-41c7-a062-8eea7bd48d51', 1, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2025-07-13 23:21:52', '2025-07-14 11:21:52', 'student');
INSERT INTO `t_user_token` VALUES (4, '59e5b322-bf36-4e3b-beb5-4f8ac8e5c641', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2025-07-13 23:25:30', '2025-07-14 11:25:30', 'test');
INSERT INTO `t_user_token` VALUES (5, 'a3fc5b2d-099a-4fb0-8831-16822433e24a', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2025-07-14 17:55:38', '2025-07-15 05:55:38', 'test');
INSERT INTO `t_user_token` VALUES (6, '26ca2a1c-ab05-433c-944d-cb475f6302c8', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2025-07-16 21:41:57', '2025-07-17 09:41:57', 'test');
INSERT INTO `t_user_token` VALUES (7, 'd295b4af-29fd-401d-8874-10327c1690aa', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2025-07-21 20:58:25', '2025-07-22 08:58:25', 'test');
INSERT INTO `t_user_token` VALUES (8, 'aad4a502-ab02-4f09-9887-27c8ffd8760e', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2025-12-20 12:40:50', '2025-12-21 12:40:50', 'test');
INSERT INTO `t_user_token` VALUES (9, '4b008976-79f6-456e-96b7-deeb6bb75f32', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-02-16 15:51:59', '2026-02-17 15:51:59', 'test');
INSERT INTO `t_user_token` VALUES (11, '7244dd6d-821a-4eda-a1ed-338673d8f880', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-02-16 20:44:47', '2026-02-17 20:44:47', 'test');
INSERT INTO `t_user_token` VALUES (13, 'dd4b6967-e9e5-4653-837f-3b8be73e791e', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-02-25 10:44:19', '2026-02-26 10:44:19', 'test');
INSERT INTO `t_user_token` VALUES (14, '60303e88-36d1-4957-b048-6b781d34bd13', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-02-26 11:17:19', '2026-02-27 11:17:19', 'test');
INSERT INTO `t_user_token` VALUES (17, 'b3629d3c-8bfe-4527-9951-bb621203f0f5', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-02-26 15:57:43', '2026-02-27 15:57:43', 'test');
INSERT INTO `t_user_token` VALUES (18, '73b2ee78-d64c-428d-a1cd-8ed31ed74352', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-02-26 16:25:57', '2026-02-27 16:25:57', 'test');
INSERT INTO `t_user_token` VALUES (19, 'e9a47f05-6a25-4080-ae6d-eac3927e4926', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-03-02 12:26:55', '2026-03-03 12:26:55', 'test');
INSERT INTO `t_user_token` VALUES (20, '943a29f5-fdf9-439b-a87b-74b12f006ad0', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-03-02 12:26:55', '2026-03-03 12:26:55', 'test');
INSERT INTO `t_user_token` VALUES (21, '4ecc8ffb-a044-457c-b365-7c5fad43ce00', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-03-02 17:09:00', '2026-03-03 17:09:00', 'test');
INSERT INTO `t_user_token` VALUES (22, 'b072b729-0865-474c-9e6b-94386a2784ec', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-03-02 17:09:00', '2026-03-03 17:09:00', 'test');
INSERT INTO `t_user_token` VALUES (23, '15c1bd68-27b5-4885-840d-5df6c0c809b0', 3, 'oJ4Ty65xjvadh7h0tLS5BgCq6k0U', '2026-03-02 17:21:18', '2026-03-03 17:21:18', 'test');
INSERT INTO `t_user_token` VALUES (24, '8dcab073-0eb2-4f8b-b147-d6c6e83057a7', 3, 'oJ4Ty65xjvadh7h0tLS5BgCq6k0U', '2026-03-03 21:22:15', '2026-03-04 21:22:15', 'test');
INSERT INTO `t_user_token` VALUES (25, '9feba26e-fc06-4f78-96fb-3d5660644a6f', 3, 'oJ4Ty65xjvadh7h0tLS5BgCq6k0U', '2026-03-03 21:22:15', '2026-03-04 21:22:15', 'test');
INSERT INTO `t_user_token` VALUES (26, '6561f181-b11b-4f3f-bfe6-9ec9c38d2a92', 3, 'oJ4Ty65xjvadh7h0tLS5BgCq6k0U', '2026-03-05 00:09:21', '2026-03-06 00:09:21', 'test');
INSERT INTO `t_user_token` VALUES (27, '97f488de-dc2a-4e43-a02f-0c8176cbbdcc', 3, 'oJ4Ty65xjvadh7h0tLS5BgCq6k0U', '2026-03-05 00:09:21', '2026-03-06 00:09:21', 'test');
INSERT INTO `t_user_token` VALUES (29, '35f37b90-c3eb-49c4-9c13-60bc54f3acb1', 8, 'oJ4Ty6_DDPAFGVTG6AASKahRcBMg', '2026-03-05 12:12:13', '2026-03-06 12:12:13', '123456');
INSERT INTO `t_user_token` VALUES (30, 'd23e12f8-5c06-4846-a42a-1dae0d137da9', 9, 'oJ4Ty6yIY49c_ZpRmya1UNTYaMr8', '2026-03-05 12:47:18', '2026-03-06 12:47:18', '17736202814');
INSERT INTO `t_user_token` VALUES (31, '4ad91110-2521-49b8-a602-af817f902aa1', 11, 'oJ4Ty6yH0dGOKxFWI8fPDEGNR3ws', '2026-03-05 14:10:00', '2026-03-06 14:10:00', 'zyzy');
INSERT INTO `t_user_token` VALUES (32, 'cdea2a8f-8fc9-4db0-8d5e-cd44870391bf', 12, 'oJ4Ty6ze7wiBmq5IyYfDhV5BYouM', '2026-03-05 21:39:26', '2026-03-06 21:39:26', '123456789');
INSERT INTO `t_user_token` VALUES (33, 'd0abc996-0243-47b6-9606-2a009540d4dd', 13, 'oJ4Ty6wyP4Ir9Xyrl-2R7Bi2l8TU', '2026-03-06 20:27:01', '2026-03-07 20:27:01', '1155889');
INSERT INTO `t_user_token` VALUES (34, 'e2f20288-84fb-4f53-8efd-1fb0495afac3', 14, 'oJ4Ty65JbVrk0Qrdc5Yk_FexCObk', '2026-03-07 18:48:58', '2026-03-08 18:48:58', 'aaa123');
INSERT INTO `t_user_token` VALUES (35, '2f466f25-908d-4ad0-bc0b-167b5c14b077', 3, 'oJ4Ty65xjvadh7h0tLS5BgCq6k0U', '2026-03-15 07:36:44', '2026-03-16 07:36:44', 'test');
INSERT INTO `t_user_token` VALUES (36, 'cdba3c31-a352-49ec-91c9-52fb7281df1f', 3, 'oJ4Ty65xjvadh7h0tLS5BgCq6k0U', '2026-03-15 07:36:44', '2026-03-16 07:36:44', 'test');
INSERT INTO `t_user_token` VALUES (38, 'd31352f9-32d2-4968-a0c2-4b59d5e2e15e', 3, 'oJ4Ty65xjvadh7h0tLS5BgCq6k0U', '2026-05-07 15:28:16', '2026-05-08 15:28:16', 'test');
INSERT INTO `t_user_token` VALUES (42, '1603fcbb-eee9-47d9-8549-81c6a9386d05', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-09 12:30:37', '2026-05-10 12:30:37', '15770643487');
INSERT INTO `t_user_token` VALUES (43, '800317b1-6e0e-4f80-b63a-fc3d5f55f804', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 12:49:09', '2026-05-12 12:49:09', '15770643487');
INSERT INTO `t_user_token` VALUES (44, 'b8638955-e1be-4c70-8f10-1549b0faa527', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 12:49:09', '2026-05-12 12:49:09', '15770643487');
INSERT INTO `t_user_token` VALUES (45, 'aadbdb63-560e-43e4-aaaf-c0b621019121', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 13:52:01', '2026-05-12 13:52:01', '15770643487');
INSERT INTO `t_user_token` VALUES (46, 'e99e32bb-36f4-4381-894a-bb7f5441f088', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 20:19:57', '2026-05-12 20:19:57', '15770643487');
INSERT INTO `t_user_token` VALUES (47, 'df57d98f-bc54-493d-abfa-5f0159007d0a', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 20:25:32', '2026-05-12 20:25:32', '15770643487');
INSERT INTO `t_user_token` VALUES (48, '8e455401-9880-4aa4-99d7-6a26efb63327', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 20:45:23', '2026-05-12 20:45:23', '15770643487');
INSERT INTO `t_user_token` VALUES (49, '17dbc3eb-76d4-4873-8471-a63bb76828e5', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 20:50:57', '2026-05-12 20:50:57', 'test');
INSERT INTO `t_user_token` VALUES (50, '637943dc-fb64-4261-b0af-a04015006c4c', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 20:51:23', '2026-05-12 20:51:23', 'test');
INSERT INTO `t_user_token` VALUES (51, '771656ef-2e89-4db8-8957-7c215bd566dd', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 21:00:24', '2026-05-12 21:00:24', 'test');
INSERT INTO `t_user_token` VALUES (52, 'abee1fd2-4f6a-4334-89cc-12e0bd50393c', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 21:46:20', '2026-05-12 21:46:20', '15770643487');
INSERT INTO `t_user_token` VALUES (53, '348841f8-5830-4a7c-b139-40c85c64081b', 3, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 21:51:26', '2026-05-12 21:51:26', 'test');
INSERT INTO `t_user_token` VALUES (55, '6265ec76-dbd5-4d44-8f4e-57349e00e162', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 22:19:19', '2026-05-12 22:19:19', '15770643487');
INSERT INTO `t_user_token` VALUES (56, '18724422-21c2-4fd9-aac0-4ec4697463e0', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 22:21:44', '2026-05-12 22:21:44', '15770643487');
INSERT INTO `t_user_token` VALUES (57, '3a4eb4ab-f805-4f58-ac71-70f16862ec9d', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 22:24:39', '2026-05-12 22:24:39', '15770643487');
INSERT INTO `t_user_token` VALUES (58, 'ef025741-c827-4da7-9198-02e9c2701ef7', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-11 22:33:35', '2026-05-12 22:33:35', '15770643487');
INSERT INTO `t_user_token` VALUES (64, 'bd7e5939-9443-41cf-9395-cf9e5bfafa7d', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-14 00:28:30', '2026-05-15 00:28:30', '15770643487');
INSERT INTO `t_user_token` VALUES (65, '535fa4db-d64c-494e-b457-a01fc9464749', 3, NULL, '2026-05-14 13:43:38', '2026-05-15 13:43:38', 'test');
INSERT INTO `t_user_token` VALUES (66, 'eea6e20a-38d7-49cc-8bb6-cdc3074491e6', 3, NULL, '2026-05-14 13:43:38', '2026-05-15 13:43:38', 'test');
INSERT INTO `t_user_token` VALUES (67, '88e90134-b01a-4e9c-8ec9-402c51423f0b', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-15 19:42:17', '2026-05-16 19:42:17', '15770643487');
INSERT INTO `t_user_token` VALUES (68, '8ca9f26e-7b45-4a2a-bf97-55bc1bd50bec', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-15 19:42:17', '2026-05-16 19:42:17', '15770643487');
INSERT INTO `t_user_token` VALUES (69, 'e99afb19-87b7-4393-8e0e-d38f3f78b739', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-18 21:57:04', '2026-05-19 21:57:04', '15770643487');
INSERT INTO `t_user_token` VALUES (70, '0cb19a69-8704-4143-8c78-0b64b611e708', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-05-18 21:57:05', '2026-05-19 21:57:05', '15770643487');
INSERT INTO `t_user_token` VALUES (72, '6236ea89-f194-4350-bb99-6ce3ff137f7e', 15, 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', '2026-07-31 15:28:33', '2026-08-01 15:28:33', '15770643487');

-- ----------------------------
-- Table structure for ucenter_notice_read
-- ----------------------------
DROP TABLE IF EXISTS `ucenter_notice_read`;
CREATE TABLE `ucenter_notice_read`  (
  `id` bigint NOT NULL COMMENT '主键ID',
  `member_id` bigint NOT NULL COMMENT '会员ID',
  `notice_id` bigint NOT NULL COMMENT '公告ID',
  `read_time` datetime NOT NULL COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `idx_member_id`(`member_id` ASC) USING BTREE,
  INDEX `idx_notice_id`(`notice_id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci COMMENT = '用户公告已读记录' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of ucenter_notice_read
-- ----------------------------
INSERT INTO `ucenter_notice_read` VALUES (2082101420224008193, 2025395129279934465, 1, '2026-07-28 23:23:33');
INSERT INTO `ucenter_notice_read` VALUES (2082103167038377985, 2025395129279934465, 2, '2026-07-28 23:20:57');

SET FOREIGN_KEY_CHECKS = 1;
