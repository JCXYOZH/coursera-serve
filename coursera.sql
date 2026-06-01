/*
 Navicat Premium Dump SQL

 Source Server         : MySQL80
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : 192.168.188.3:3306
 Source Schema         : coursera

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 01/06/2026 16:46:43
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
INSERT INTO `app_version` VALUES ('1', '1.0.1', 101, 'http://localhost:8500/apk/知新堂_100_1.0.0.apk', '修复已知问题，提升稳定性', 1, '2026-02-28 23:56:56', '2026-02-28 23:56:56', 0);

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
INSERT INTO `edu_course` VALUES (2025585730432540673, '大学英语', 2025536880044941313, 'image/2026/03/05/d99c61046d4e4c7bb168f66501684bf8.png', '<p>专升本英语河北公共课课程</p>', '2025539126535135233', '2025539176237637634', 0.00, 76, 0, 36, 1, 1, NULL, '2026-02-22 22:57:26', '2026-04-22 20:26:57');
INSERT INTO `edu_course` VALUES (2029245760411631618, '支付测试', 2029210279116374017, 'image/2026/03/05/8e40b9e78aa24edfa87bd4a75a79e2f1.jpg', '<p>微信扫码支付功能测试</p>', '2025539126535135233', '2025539176237637634', 0.01, 5, 0, 23, 1, 1, NULL, '2026-03-05 01:21:06', '2026-03-05 01:57:02');
INSERT INTO `edu_course` VALUES (2029516298644193281, '大学政治', 2029210279116374017, 'image/2026/03/05/48da5d1b0cff4876895c9dfb69dba277.png', '<p>专升本政治河北公共课程</p>', '2029235591539687425', '2029235691242487810', 0.00, 5, 0, 16, 1, 1, NULL, '2026-03-05 19:16:07', '2026-04-22 00:06:34');
INSERT INTO `edu_course` VALUES (2046890290522718210, '大学数学', 2046889071838330881, 'image/2026/04/22/47ab87b39d344e27b72a0a4ce7ad6f7a.png', '<p>专升本数学全国通用课程</p>', '2046889416069054466', '2046889472566329345', 0.00, 48, 0, 0, 1, 1, NULL, '2026-04-22 17:54:09', '2026-05-14 22:53:50');
INSERT INTO `edu_course` VALUES (2046957172130938881, '信息技术', 2046955607940759553, 'image/2026/04/22/95b9171ea4304df9b94c14f0e4e36cc6.png', '<p>专升本信息全国通用课程</p>', '2046955719584743425', '2046956023256547329', 0.00, 56, 0, 0, 1, 1, NULL, '2026-04-22 22:19:55', '2026-04-22 23:12:42');

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_exam_paper
-- ----------------------------
INSERT INTO `t_exam_paper` VALUES (1, 'test', 1, 1, 12, 10, 1, 1, NULL, NULL, 2, 2, '2025-07-11 23:15:37', b'1', NULL);
INSERT INTO `t_exam_paper` VALUES (2, '基础试题测试', 2, 1, 1, 10, 1, 2, NULL, NULL, 6, 2, '2026-02-26 15:45:05', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (3, '模拟试卷测试', 3, 4, 1, 20, 2, 5, '2026-02-26 00:00:00', '2026-04-19 00:00:00', 7, 2, '2026-02-26 15:47:55', b'0', NULL);
INSERT INTO `t_exam_paper` VALUES (4, '大学英语模拟试题', 4, 6, 3, 10, 1, 2, NULL, NULL, 9, 2, '2026-03-04 11:18:39', b'0', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_exchange_item
-- ----------------------------
INSERT INTO `t_exchange_item` VALUES (1, '信息技术概论考纲', 0, '/file/pdf/xxjsgl.pdf', '2026-05-12 18:43:27');

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
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_question
-- ----------------------------
INSERT INTO `t_question` VALUES (1, 1, 1, 10, 12, 1, 'A', 1, 2, 1, '2025-07-11 23:14:12', b'1');
INSERT INTO `t_question` VALUES (2, 2, 2, 10, 1, 3, 'A,B,D', 3, 2, 1, '2026-02-26 15:19:12', b'0');
INSERT INTO `t_question` VALUES (3, 1, 3, 10, 1, 3, 'A', 4, 2, 1, '2026-02-26 15:29:51', b'0');
INSERT INTO `t_question` VALUES (4, 1, 3, 10, 1, 3, 'A', 5, 2, 1, '2026-02-26 15:34:14', b'0');
INSERT INTO `t_question` VALUES (5, 1, 4, 10, 3, 3, 'A', 8, 2, 1, '2026-03-04 11:16:53', b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_subject
-- ----------------------------
INSERT INTO `t_subject` VALUES (1, 'test', 12, '高三', NULL, b'1');
INSERT INTO `t_subject` VALUES (2, '大学政治', 1, '一年级', NULL, b'0');
INSERT INTO `t_subject` VALUES (3, '大学英语', 1, '一年级', NULL, b'0');
INSERT INTO `t_subject` VALUES (4, '大学英语', 3, '三年级', NULL, b'0');

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
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of t_text_content
-- ----------------------------
INSERT INTO `t_text_content` VALUES (1, '{\"titleContent\":\"test\",\"analyze\":\"test\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<p>t</p>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<p>f</p><br/>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"f\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"f\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2025-07-11 23:14:12');
INSERT INTO `t_text_content` VALUES (2, '[{\"name\":\"test\",\"questionItems\":[{\"id\":1,\"itemOrder\":1}]}]', '2025-07-11 23:15:37');
INSERT INTO `t_text_content` VALUES (3, '{\"titleContent\":\"<span style=\\\"font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; color: black;\\\">推进绿色发展，加快形成节约资源和保护环境的空间格局、产业结构、生产和生活方式，要坚持（）为主。</span>\",\"analyze\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">推进绿色发展，坚持节约优先、保护优先、自然恢复为主，加快形成节约资源和保护环境的空间格局、产业结构、生产和生活方式。C 项效率优先与保护优先相悖。故本题选 ABD。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\\\">节约优先</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\\\">保护优先</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\\\">效率优先</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap;\\\">自然恢复</span>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"\"}', '2026-02-26 15:19:12');
INSERT INTO `t_text_content` VALUES (4, '{\"titleContent\":\"__<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">is way to school, he found a mobile phone and handed it to the teacher.</span>\",\"analyze\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">【选项释义】A. On 在...…上；B. In 在……内；C. At 在；D. By 通过。【解题思路】本题考查固定搭配，on one&#39;s way to +地点，意为在去某地的路上；in the way 意为阻碍；the way to do 意为做某事的方法。故本题选A。【句意】在上学的路上，他发现了一个手机，并把它交给了老师。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"On\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"In\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"At\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"By\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-02-26 15:29:51');
INSERT INTO `t_text_content` VALUES (5, '{\"titleContent\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">That was the situation ____ sellers were going to either get rich or go bankrupt.</span>\",\"analyze\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: white;\\\">【选项释义】A. where 在…...地方；B. this 这个；C. which 哪一个；D. on which 在......上。<br/>【解题思路】分析句子结构可知，空处引导一个定语从句，修饰表示抽象地点的先行词 situation，所以应用 where 引导，where 在从句中作地点状语。in a(n) …... situation 为固定搭配，意为“在…...情况下”，所以这里也可以用 in which，但不能用 on which。故本题选 A。<br/>【干扰项排除】B、C、D 选项引导词均不正确。<br/>【句意】那种情况下卖方要么变得富有要么破产。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"where\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"this\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"which\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"on which\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-02-26 15:34:14');
INSERT INTO `t_text_content` VALUES (6, '[{\"name\":\"基础试题\",\"questionItems\":[{\"id\":2,\"itemOrder\":1}]}]', '2026-02-26 15:45:05');
INSERT INTO `t_text_content` VALUES (7, '[{\"name\":\"模拟试卷\",\"questionItems\":[{\"id\":3,\"itemOrder\":1},{\"id\":4,\"itemOrder\":2}]}]', '2026-02-26 15:47:55');
INSERT INTO `t_text_content` VALUES (8, '{\"titleContent\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">That was the situation ____ sellers were going to either get rich or go bankrupt.</span>\",\"analyze\":\"<span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">【选项释义】A. where 在…...地方；B. this 这个；C. which 哪一个；D. on which 在......上。</span><br/><span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">【解题思路】分析句子结构可知，空处引导一个定语从句，修饰表示抽象地点的先行词 situation，所以应用 where 引导，where 在从句中作地点状语。in a(n) …... situation 为固定搭配，意为“在…...情况下”，所以这里也可以用 in which，但不能用 on which。故本题选 A。</span><br/><span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">【干扰项排除】B、C、D 选项引导词均不正确。</span><br/><span style=\\\"color: #353535; font-family: mp-quote, -apple-system-font, BlinkMacSystemFont, &quot;Helvetica Neue&quot;, &quot;PingFang SC&quot;, &quot;Hiragino Sans GB&quot;, &quot;Microsoft YaHei UI&quot;, &quot;Microsoft YaHei&quot;, Arial, sans-serif; font-size: 14px; white-space: pre-wrap; background-color: #FFFFFF;\\\">【句意】那种情况下卖方要么变得富有要么破产。</span>\",\"questionItemObjects\":[{\"prefix\":\"A\",\"content\":\"<span style=\\\"text-wrap-mode: wrap;\\\"></span><span style=\\\"text-wrap-mode: wrap;\\\">where</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"B\",\"content\":\"<span style=\\\"text-wrap-mode: wrap;\\\"></span><span style=\\\"text-wrap-mode: wrap;\\\">this</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"C\",\"content\":\"<span style=\\\"text-wrap-mode: wrap;\\\"></span><span style=\\\"text-wrap-mode: wrap;\\\">which</span>\",\"score\":null,\"itemUuid\":null},{\"prefix\":\"D\",\"content\":\"<span style=\\\"text-wrap-mode: wrap;\\\"></span><span style=\\\"text-wrap-mode: wrap;\\\">on which</span>\",\"score\":null,\"itemUuid\":null}],\"correct\":\"A\"}', '2026-03-04 11:16:53');
INSERT INTO `t_text_content` VALUES (9, '[{\"name\":\"大学英语模拟题\",\"questionItems\":[{\"id\":5,\"itemOrder\":1}]}]', '2026-03-04 11:18:39');

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
INSERT INTO `t_user` VALUES (15, 'eb207bec-f408-4216-8616-7e3eb4a5099c', '15770643487', 'CJdUzG3xamVkzm/4SRRjFbGS90G8M1rCMh4uOK7R+uqpBU9NXckWjQHu2+YhnXvTD8tzgrO86PYlQLcvOHSzFXeZVhVrlP2ipIdcmUBiyq9cYxO7Yhl3Hy89IWsnIdKCMlTQwBkfRf7Bi48fwxnOIkDiyXSrFvgUsyzClQafU3s=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 'file/2026/05/09/7b2d263b89d64a468d02307315576933.image_download_1762865386953.jpg', '2026-05-08 21:43:40', '2026-05-14 00:28:30', '2026-05-08 21:43:40', b'0', 'oJ4Ty63VrOkHk9Ft8O6cAhuYBbHo', 3);
INSERT INTO `t_user` VALUES (16, '73fa4a67-0d0f-4797-b7a0-ce97a762f5b4', '13395740108', 'A+GGdIY/v8lF0uS9tSLdIzgJPOIqGQfcDIh1CYwBPWI+bVtG6Gwb9i5WzQIm4+I0GEBZcrYPs3h3jYrtt9rGUoeAVutZCiqYKHpL+ppOsLkezghZWxY3N6Ec44Zh/wuncspWDH5U56eT87jqSfjYzi7A0Zrh2A+KkSA+sMymKHA=', NULL, NULL, NULL, NULL, 1, NULL, 1, 1, 'file/2026/05/09/c7dfb8ac037c4ca0b69092f975c814e9.image_download_1762866391051.jpg', '2026-05-09 12:31:34', NULL, '2026-05-09 12:31:34', b'0', NULL, 122);
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
) ENGINE = InnoDB AUTO_INCREMENT = 158 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

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
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = COMPACT;

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

SET FOREIGN_KEY_CHECKS = 1;
