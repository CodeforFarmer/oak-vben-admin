/*
 Navicat Premium Data Transfer

 Source Server         : docker_pg
 Source Server Type    : PostgreSQL
 Source Server Version : 140002
 Source Host           : localhost:57057
 Source Catalog        : nessie
 Source Schema         : public

 Target Server Type    : PostgreSQL
 Target Server Version : 140002
 File Encoding         : 65001

 Date: 28/04/2022 15:41:02
*/


-- ----------------------------
-- Sequence structure for nessie_migrations_id_seq
-- ----------------------------
DROP SEQUENCE IF EXISTS "public"."nessie_migrations_id_seq";
CREATE SEQUENCE "public"."nessie_migrations_id_seq" 
INCREMENT 1
MINVALUE  1
MAXVALUE 9223372036854775807
START 1
CACHE 1;

-- ----------------------------
-- Table structure for nessie_migrations
-- ----------------------------
DROP TABLE IF EXISTS "public"."nessie_migrations";
CREATE TABLE "public"."nessie_migrations" (
  "id" int8 NOT NULL DEFAULT nextval('nessie_migrations_id_seq'::regclass),
  "file_name" varchar(100) COLLATE "pg_catalog"."default",
  "created_at" timestamp(0) DEFAULT CURRENT_TIMESTAMP
)
;

-- ----------------------------
-- Records of nessie_migrations
-- ----------------------------
INSERT INTO "public"."nessie_migrations" VALUES (1, '20220419152546_sys_user.ts', '2022-04-27 15:31:34');
INSERT INTO "public"."nessie_migrations" VALUES (2, '20220427164126_sys_role.ts', '2022-04-27 15:31:44');
INSERT INTO "public"."nessie_migrations" VALUES (3, '20220427164200_sys_dept.ts', '2022-04-27 15:31:54');
INSERT INTO "public"."nessie_migrations" VALUES (4, '20220427164213_sys_permission.ts', '2022-04-27 15:32:05');
INSERT INTO "public"."nessie_migrations" VALUES (5, '20220427225630_sys_tenant.ts', '2022-04-27 15:32:16');
INSERT INTO "public"."nessie_migrations" VALUES (6, '20220427230049_rel_dept_user.ts', '2022-04-27 15:32:26');
INSERT INTO "public"."nessie_migrations" VALUES (7, '20220427230323_rel_permission_role.ts', '2022-04-27 15:32:37');
INSERT INTO "public"."nessie_migrations" VALUES (8, '20220427230550_rel_role_user.ts', '2022-04-27 15:32:50');
INSERT INTO "public"."nessie_migrations" VALUES (9, '20220427230721_sys_user_info.ts', '2022-04-27 15:33:01');
INSERT INTO "public"."nessie_migrations" VALUES (10, '20220427230831_sys_login_log.ts', '2022-04-27 15:33:13');
INSERT INTO "public"."nessie_migrations" VALUES (11, '20220427231033_sys_banner.ts', '2022-04-27 15:33:24');
INSERT INTO "public"."nessie_migrations" VALUES (12, '20220427231116_sys_big_text.ts', '2022-04-27 15:38:32');
INSERT INTO "public"."nessie_migrations" VALUES (13, '20220427231213_sys_city_area.ts', '2022-04-27 15:38:41');
INSERT INTO "public"."nessie_migrations" VALUES (14, '20220427231249_sys_dict.ts', '2022-04-27 15:38:51');
INSERT INTO "public"."nessie_migrations" VALUES (15, '20220427231348_sys_dict_item.ts', '2022-04-27 15:39:01');
INSERT INTO "public"."nessie_migrations" VALUES (16, '20220427231435_sys_employee.ts', '2022-04-27 15:39:13');
INSERT INTO "public"."nessie_migrations" VALUES (17, '20220427231534_sys_event_log.ts', '2022-04-27 15:39:24');
INSERT INTO "public"."nessie_migrations" VALUES (18, '20220427231642_sys_file_info.ts', '2022-04-27 15:39:35');
INSERT INTO "public"."nessie_migrations" VALUES (19, '20220427231719_sys_folder_info.ts', '2022-04-27 15:39:46');
INSERT INTO "public"."nessie_migrations" VALUES (20, '20220427231759_sys_job.ts', '2022-04-27 15:40:56');
INSERT INTO "public"."nessie_migrations" VALUES (21, '20220427231852_sys_job_log.ts', '2022-04-27 15:41:06');
INSERT INTO "public"."nessie_migrations" VALUES (22, '20220427231930_sys_message_log.ts', '2022-04-27 15:42:02');
INSERT INTO "public"."nessie_migrations" VALUES (23, '20220427231936_sys_message_template.ts', '2022-04-27 15:42:12');
INSERT INTO "public"."nessie_migrations" VALUES (24, '20220427231945_sys_param.ts', '2022-04-27 15:42:23');
INSERT INTO "public"."nessie_migrations" VALUES (25, '20220427232007_sys_param_type.ts', '2022-04-27 15:42:34');
INSERT INTO "public"."nessie_migrations" VALUES (26, '20220427232024_sys_search_log.ts', '2022-04-27 15:42:46');
INSERT INTO "public"."nessie_migrations" VALUES (27, '20220427232036_sys_search_recommend.ts', '2022-04-27 15:42:57');
INSERT INTO "public"."nessie_migrations" VALUES (28, '20220427232052_sys_sms_login_log.ts', '2022-04-27 15:43:07');

-- ----------------------------
-- Table structure for rel_dept_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."rel_dept_user";
CREATE TABLE "public"."rel_dept_user" (
  "id" int8 NOT NULL,
  "dept_id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."rel_dept_user"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rel_dept_user"."dept_id" IS '部门ID:foreignKey';
COMMENT ON COLUMN "public"."rel_dept_user"."user_id" IS '用户ID:foreignKey';
COMMENT ON COLUMN "public"."rel_dept_user"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."rel_dept_user"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."rel_dept_user"."create_user_id" IS '创建人';

-- ----------------------------
-- Records of rel_dept_user
-- ----------------------------
INSERT INTO "public"."rel_dept_user" VALUES (111111111111111111, 111111111111111111, 111111111111111111, 1, 1574739347804, 111111111111111111);
INSERT INTO "public"."rel_dept_user" VALUES (222222222222222222, 222222222222222222, 111111111111111111, 1, 1574739347804, 111111111111111111);
INSERT INTO "public"."rel_dept_user" VALUES (333333333333333333, 222222222222222222, 222222222222222222, 1, 1574739347804, 111111111111111111);
INSERT INTO "public"."rel_dept_user" VALUES (444444444444444441, 333333333333333333, 333333333333333331, 1, 1574739347804, 111111111111111111);

-- ----------------------------
-- Table structure for rel_permission_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."rel_permission_role";
CREATE TABLE "public"."rel_permission_role" (
  "id" int8 NOT NULL,
  "permission_id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."rel_permission_role"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rel_permission_role"."permission_id" IS '权限ID:foreignKey';
COMMENT ON COLUMN "public"."rel_permission_role"."role_id" IS '角色ID:foreignKey';
COMMENT ON COLUMN "public"."rel_permission_role"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."rel_permission_role"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."rel_permission_role"."create_user_id" IS '创建人';

-- ----------------------------
-- Records of rel_permission_role
-- ----------------------------
INSERT INTO "public"."rel_permission_role" VALUES (111111111111112001, 111111111111112001, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114001, 111111111111114001, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111115001, 111111111111115001, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111123001, 111111111111123001, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991616, 111111111111112001, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991617, 111111111111114001, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991623, 111111111111115001, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991634, 111111111111123001, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114002, 111111111111114002, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114005, 111111111111114005, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114006, 111111111111114006, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111115002, 111111111111115002, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111115003, 111111111111115003, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111116002, 111111111111116002, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111117002, 111111111111117002, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111117003, 111111111111117003, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111117006, 111111111111117006, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111117007, 111111111111117007, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111117008, 111111111111117008, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991618, 111111111111114002, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991621, 111111111111114005, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991622, 111111111111114006, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991624, 111111111111115002, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991625, 111111111111115003, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991627, 111111111111117002, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991628, 111111111111117003, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991629, 111111111111117006, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (657230839850991630, 111111111111117008, 222222222222222222, 1, 1576737642979, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662477281297432576, 662477281297432576, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662480693388902400, 662480693388902400, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662491172605788160, 662491172605788160, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (666370908344025088, 666370908344025088, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (670059556541300736, 670059556541300736, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (676959888483549184, 676959888483549184, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (677155596427853824, 677155596427853824, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (680321751011295232, 680321751011295232, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (680323494054985728, 680323494054985728, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (696090184323694592, 696090184323694592, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (700040348436529152, 700040348436529152, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (700040349334110208, 700040349334110208, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114102, 111111111111114102, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114103, 111111111111114103, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114104, 111111111111114104, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114105, 111111111111114105, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114106, 111111111111114106, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114202, 111111111111114202, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114203, 111111111111114203, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114204, 111111111111114204, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114205, 111111111111114205, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114206, 111111111111114206, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114302, 111111111111114302, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114303, 111111111111114303, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114304, 111111111111114304, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114305, 111111111111114305, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111114306, 111111111111114306, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111115102, 111111111111115102, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111115103, 111111111111115103, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111115202, 111111111111115202, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111115203, 111111111111115203, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111115302, 111111111111115302, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111115303, 111111111111115303, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111116102, 111111111111116102, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111116202, 111111111111116202, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111116302, 111111111111116302, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111116402, 111111111111116402, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111116502, 111111111111116502, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (111111111111116602, 111111111111116602, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662477281297432577, 662477281297432577, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662477281297432578, 662477281297432578, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662477281297432579, 662477281297432579, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662480693388902401, 662480693388902401, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662480693388902402, 662480693388902402, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662480693388902403, 662480693388902403, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662491172605788161, 662491172605788161, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662491172605788162, 662491172605788162, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (662491172605788163, 662491172605788163, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (666370908344025089, 666370908344025089, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (666370908344025090, 666370908344025090, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (666370908344025091, 666370908344025091, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (670059556541300737, 670059556541300737, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (670059556541300738, 670059556541300738, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (670059556541300739, 670059556541300739, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (676959888483549185, 676959888483549185, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (676959888483549186, 676959888483549186, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (676959888483549187, 676959888483549187, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (677155596427853825, 677155596427853825, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (677155596427853826, 677155596427853826, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (677155596427853827, 677155596427853827, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (680321751011295233, 680321751011295233, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (680321751011295234, 680321751011295234, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (680321751011295235, 680321751011295235, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (680323494054985729, 680323494054985729, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (680323494054985730, 680323494054985730, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (680323494054985731, 680323494054985731, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (695758145351319553, 695758145351319553, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (695758145351319554, 695758145351319554, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (695758145351319555, 695758145351319555, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (696090184323694593, 696090184323694593, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (696090184323694594, 696090184323694594, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (696090184323694595, 696090184323694595, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (700040348436529153, 700040348436529153, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (700040348436529154, 700040348436529154, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (700040348436529155, 700040348436529155, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (700040349334110209, 700040349334110209, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (700040349334110210, 700040349334110210, 111111111111111111, 1, 1574663813780, 111111111111111111);
INSERT INTO "public"."rel_permission_role" VALUES (700040349334110211, 700040349334110211, 111111111111111111, 1, 1574663813780, 111111111111111111);

-- ----------------------------
-- Table structure for rel_role_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."rel_role_user";
CREATE TABLE "public"."rel_role_user" (
  "id" int8 NOT NULL,
  "role_id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."rel_role_user"."id" IS '主键ID';
COMMENT ON COLUMN "public"."rel_role_user"."role_id" IS '角色ID:foreignKey';
COMMENT ON COLUMN "public"."rel_role_user"."user_id" IS '用户ID:foreignKey';
COMMENT ON COLUMN "public"."rel_role_user"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."rel_role_user"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."rel_role_user"."create_user_id" IS '创建人';

-- ----------------------------
-- Records of rel_role_user
-- ----------------------------
INSERT INTO "public"."rel_role_user" VALUES (111111111111111111, 111111111111111111, 111111111111111111, 1, 1574663798481, 111111111111111111);
INSERT INTO "public"."rel_role_user" VALUES (222222222222222222, 222222222222222222, 222222222222222222, 1, 1574663798481, 111111111111111111);
INSERT INTO "public"."rel_role_user" VALUES (333333333333333331, 333333333333333333, 333333333333333331, 1, 1574663798481, 111111111111111111);

-- ----------------------------
-- Table structure for sys_banner
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_banner";
CREATE TABLE "public"."sys_banner" (
  "id" int8 NOT NULL,
  "banner_title" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "banner_description" varchar(250) COLLATE "pg_catalog"."default",
  "banner_code" varchar(100) COLLATE "pg_catalog"."default",
  "cover_pc_image_url" varchar(500) COLLATE "pg_catalog"."default",
  "cover_h5_image_url" varchar(500) COLLATE "pg_catalog"."default",
  "banner_stand_date" numeric(18,2) NOT NULL DEFAULT 2.5,
  "banner_jump_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "jump_h5_url" varchar(500) COLLATE "pg_catalog"."default",
  "jump_pc_url" varchar(500) COLLATE "pg_catalog"."default",
  "jump_type_code" varchar(50) COLLATE "pg_catalog"."default",
  "jump_object_id" int8,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_banner"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_banner"."banner_title" IS '标题:likeParam';
COMMENT ON COLUMN "public"."sys_banner"."banner_description" IS '介绍';
COMMENT ON COLUMN "public"."sys_banner"."banner_code" IS '编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_banner"."cover_pc_image_url" IS 'PC封面图片';
COMMENT ON COLUMN "public"."sys_banner"."cover_h5_image_url" IS '移动端封面图片';
COMMENT ON COLUMN "public"."sys_banner"."banner_stand_date" IS '停留时间:支持小数';
COMMENT ON COLUMN "public"."sys_banner"."banner_jump_type_enum" IS '跳转类型:[1=对象ID=OBJECT_ID,;2=URL=URL]max=2';
COMMENT ON COLUMN "public"."sys_banner"."jump_h5_url" IS '移动端跳转url地址';
COMMENT ON COLUMN "public"."sys_banner"."jump_pc_url" IS 'PC端跳转url地址';
COMMENT ON COLUMN "public"."sys_banner"."jump_type_code" IS '跳转业务类型编码:oneParam';
COMMENT ON COLUMN "public"."sys_banner"."jump_object_id" IS '跳转业务ID:foreignKey';
COMMENT ON COLUMN "public"."sys_banner"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_banner"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_banner"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_banner"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_banner"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_banner"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_banner"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_banner"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_banner"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_banner
-- ----------------------------

-- ----------------------------
-- Table structure for sys_big_text
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_big_text";
CREATE TABLE "public"."sys_big_text" (
  "id" int8 NOT NULL,
  "text_title" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "text_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "text_content" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_big_text"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_big_text"."text_title" IS '文本标题:likeParam';
COMMENT ON COLUMN "public"."sys_big_text"."text_code" IS '文本编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_big_text"."text_content" IS '内容';
COMMENT ON COLUMN "public"."sys_big_text"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_big_text"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_big_text"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_big_text"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_big_text"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_big_text"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_big_text"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_big_text"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_big_text"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_big_text
-- ----------------------------

-- ----------------------------
-- Table structure for sys_city_area
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_city_area";
CREATE TABLE "public"."sys_city_area" (
  "id" int8 NOT NULL,
  "parent_id" int8 NOT NULL,
  "parent_ids" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "area_name" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_city_area"."id" IS '主键ID:也是地区编码';
COMMENT ON COLUMN "public"."sys_city_area"."parent_id" IS '父ID';
COMMENT ON COLUMN "public"."sys_city_area"."parent_ids" IS '父ID集:多个层级用英文逗号隔开';
COMMENT ON COLUMN "public"."sys_city_area"."area_name" IS '地区名称:treeName';
COMMENT ON COLUMN "public"."sys_city_area"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_city_area"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_city_area"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_city_area"."create_user_id" IS '创建人';

-- ----------------------------
-- Records of sys_city_area
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dept";
CREATE TABLE "public"."sys_dept" (
  "id" int8 NOT NULL,
  "dept_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "dept_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "parent_id" int8 NOT NULL,
  "parent_ids" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "leader_user_id" int8,
  "telephone" varchar(50) COLLATE "pg_catalog"."default",
  "mobile_phone" varchar(50) COLLATE "pg_catalog"."default",
  "dept_fax" varchar(50) COLLATE "pg_catalog"."default",
  "dept_address" varchar(250) COLLATE "pg_catalog"."default",
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_dept"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_dept"."dept_name" IS '部门名称:treeName';
COMMENT ON COLUMN "public"."sys_dept"."dept_code" IS '部门编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_dept"."parent_id" IS '父ID';
COMMENT ON COLUMN "public"."sys_dept"."parent_ids" IS '父ID集:多个层级用英文逗号隔开';
COMMENT ON COLUMN "public"."sys_dept"."leader_user_id" IS '部门领导用户ID';
COMMENT ON COLUMN "public"."sys_dept"."telephone" IS '固话';
COMMENT ON COLUMN "public"."sys_dept"."mobile_phone" IS '手机号';
COMMENT ON COLUMN "public"."sys_dept"."dept_fax" IS '传真';
COMMENT ON COLUMN "public"."sys_dept"."dept_address" IS '地址';
COMMENT ON COLUMN "public"."sys_dept"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_dept"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_dept"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_dept"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_dept"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_dept"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dept"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_dept"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dept"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_dept"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_dept"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO "public"."sys_dept" VALUES (111111111111111111, '超级管理员部门', 'top_admin_dept', 1, '1', 111111111111111111, '87600771', '13800000000', '87600772', '广东广州', 1, '这是描述', 1, 1, 1, 1574739322708, 111111111111111111, 1574739322708, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES (222222222222222222, '演示用户部门', 'demo_user_dept', 1, '1', 111111111111111111, '87600771', '13800000000', '87600772', '广东广州', 1, '这是描述', 1, 1, 1, 1574739322708, 111111111111111111, 1574739322708, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_dept" VALUES (333333333333333333, '普通用户部门', 'normal_user_dept', 1, '1', 111111111111111111, '87600771', '13800000000', '87600772', '广东广州', 1, '这是描述', 1, 1, 1, 1574739322708, 111111111111111111, 1574739322708, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict";
CREATE TABLE "public"."sys_dict" (
  "id" int8 NOT NULL,
  "dict_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "dict_value_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_dict"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_dict"."dict_name" IS '字典名称';
COMMENT ON COLUMN "public"."sys_dict"."dict_code" IS '字典编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_dict"."dict_value_type_enum" IS '字典值类型:[1=java.lang.String=String,;2=java.lang.Boolean=Boolean, 3=java.lang.Integer=Integer, 4=java.lang.Long=Long, 5=java.lang.Double=Double]max=5';
COMMENT ON COLUMN "public"."sys_dict"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_dict"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_dict"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_dict"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_dict"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_dict"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_dict"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_dict"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_dict"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_dict
-- ----------------------------
INSERT INTO "public"."sys_dict" VALUES (111111111111111111, '职称', 'job_title', 1, 100, '公司内部职称', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_dict_item
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_dict_item";
CREATE TABLE "public"."sys_dict_item" (
  "id" int8 NOT NULL,
  "dict_id" int8 NOT NULL,
  "dict_code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "item_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "item_code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "item_value" varchar(250) COLLATE "pg_catalog"."default",
  "dict_value_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_dict_item"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_dict_item"."dict_id" IS '字典ID:foreignKey';
COMMENT ON COLUMN "public"."sys_dict_item"."dict_code" IS '字典编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_dict_item"."item_name" IS '字典子项名称';
COMMENT ON COLUMN "public"."sys_dict_item"."item_code" IS '字典子项编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_dict_item"."item_value" IS '字典子项值';
COMMENT ON COLUMN "public"."sys_dict_item"."dict_value_type_enum" IS '字典值类型:[1=java.lang.String=String,;2=java.lang.Boolean=Boolean, 3=java.lang.Integer=Integer, 4=java.lang.Long=Long, 5=java.lang.Double=Double]max=5';
COMMENT ON COLUMN "public"."sys_dict_item"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_dict_item"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_dict_item"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_dict_item"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_dict_item"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_dict_item"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_dict_item"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_dict_item"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_dict_item"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_dict_item"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_dict_item"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_dict_item
-- ----------------------------
INSERT INTO "public"."sys_dict_item" VALUES (111111111111111111, 111111111111111111, 'job_title', '初级', 'beginner_level', '1', 1, 100, '初级', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_dict_item" VALUES (222222222222222222, 111111111111111111, 'job_title', '中级', 'intermediate_level', '2', 1, 100, '中级', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_dict_item" VALUES (333333333333333333, 111111111111111111, 'job_title', '高级', 'advanced_level', '3', 1, 100, '高级', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_employee
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_employee";
CREATE TABLE "public"."sys_employee" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "work_card_id" varchar(50) COLLATE "pg_catalog"."default",
  "job_position" varchar(50) COLLATE "pg_catalog"."default",
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_employee"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_employee"."user_id" IS '用户ID:foreignKey';
COMMENT ON COLUMN "public"."sys_employee"."work_card_id" IS '工号';
COMMENT ON COLUMN "public"."sys_employee"."job_position" IS '职位';
COMMENT ON COLUMN "public"."sys_employee"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_employee"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_employee"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_employee"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_employee"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_employee"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_employee"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_employee"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_employee
-- ----------------------------
INSERT INTO "public"."sys_employee" VALUES (111111111111111111, 111111111111111111, '11', '总裁', 1, 1, 1514736123456, 111111111111111111, 1514736123456, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_employee" VALUES (222222222222222222, 222222222222222222, '22', '员工', 1, 1, 1514736123456, 111111111111111111, 1514736123456, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_employee" VALUES (333333333333333331, 333333333333333331, '31', '员工', 1, 1, 1514736123456, 111111111111111111, 1514736123456, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_event_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_event_log";
CREATE TABLE "public"."sys_event_log" (
  "id" int8 NOT NULL,
  "user_id" int8,
  "username" varchar(50) COLLATE "pg_catalog"."default",
  "message" varchar(250) COLLATE "pg_catalog"."default",
  "execute_time" int8,
  "request_date" int8,
  "request_url" varchar(500) COLLATE "pg_catalog"."default",
  "request_method" varchar(50) COLLATE "pg_catalog"."default",
  "request_param" varchar(500) COLLATE "pg_catalog"."default",
  "bool_execute_success_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "operate_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "exception_msg" varchar(250) COLLATE "pg_catalog"."default",
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "ip_address" varchar(50) COLLATE "pg_catalog"."default",
  "ip_region" varchar(100) COLLATE "pg_catalog"."default",
  "ip_region_country" varchar(50) COLLATE "pg_catalog"."default",
  "ip_region_province" varchar(50) COLLATE "pg_catalog"."default",
  "ip_region_city" varchar(50) COLLATE "pg_catalog"."default",
  "ip_region_isp" varchar(50) COLLATE "pg_catalog"."default",
  "user_agent" varchar(500) COLLATE "pg_catalog"."default",
  "device_name" varchar(50) COLLATE "pg_catalog"."default",
  "os_name" varchar(50) COLLATE "pg_catalog"."default",
  "browser_name" varchar(50) COLLATE "pg_catalog"."default",
  "browser_locale" varchar(50) COLLATE "pg_catalog"."default",
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_event_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_event_log"."user_id" IS '用户ID:foreignKey';
COMMENT ON COLUMN "public"."sys_event_log"."username" IS '用户账号:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_event_log"."message" IS '记录信息';
COMMENT ON COLUMN "public"."sys_event_log"."execute_time" IS '执行时间:单位毫秒';
COMMENT ON COLUMN "public"."sys_event_log"."request_date" IS '访问时间';
COMMENT ON COLUMN "public"."sys_event_log"."request_url" IS '请求;URL';
COMMENT ON COLUMN "public"."sys_event_log"."request_method" IS '请求方法名';
COMMENT ON COLUMN "public"."sys_event_log"."request_param" IS '请求参数';
COMMENT ON COLUMN "public"."sys_event_log"."bool_execute_success_enum" IS '是否执行成功:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_event_log"."operate_type_enum" IS '事件类型:[1=查询=QUERY,;2=创建=CREATE, 3=修改对象=UPDATE_INFO,4=修改状态=UPDATE_STATE,5=删除=DELETE,6=导入=IMPORT,7=导出=EXPORT]max=7';
COMMENT ON COLUMN "public"."sys_event_log"."exception_msg" IS '失败异常信息';
COMMENT ON COLUMN "public"."sys_event_log"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_event_log"."ip_address" IS 'IP;地址';
COMMENT ON COLUMN "public"."sys_event_log"."ip_region" IS 'IP;信息';
COMMENT ON COLUMN "public"."sys_event_log"."ip_region_country" IS 'IP;地址对应的国家';
COMMENT ON COLUMN "public"."sys_event_log"."ip_region_province" IS 'IP;地址对应的省';
COMMENT ON COLUMN "public"."sys_event_log"."ip_region_city" IS 'IP;地址对应的市';
COMMENT ON COLUMN "public"."sys_event_log"."ip_region_isp" IS 'IP;地址对应的网络提供商';
COMMENT ON COLUMN "public"."sys_event_log"."user_agent" IS '浏览器;UserAgent';
COMMENT ON COLUMN "public"."sys_event_log"."device_name" IS '设备名称';
COMMENT ON COLUMN "public"."sys_event_log"."os_name" IS '系统名称';
COMMENT ON COLUMN "public"."sys_event_log"."browser_name" IS '浏览器';
COMMENT ON COLUMN "public"."sys_event_log"."browser_locale" IS '语言区域';
COMMENT ON COLUMN "public"."sys_event_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_event_log"."create_user_id" IS '创建人';

-- ----------------------------
-- Records of sys_event_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_file_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_file_info";
CREATE TABLE "public"."sys_file_info" (
  "id" int8 NOT NULL,
  "folder_id" int8 NOT NULL,
  "file_show_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "file_storage_name" varchar(200) COLLATE "pg_catalog"."default" NOT NULL,
  "file_suffix" varchar(20) COLLATE "pg_catalog"."default",
  "file_storage_path" varchar(300) COLLATE "pg_catalog"."default" NOT NULL,
  "file_full_url" varchar(500) COLLATE "pg_catalog"."default",
  "file_storage_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "file_size" int8 NOT NULL,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "bool_top_enum" int2 NOT NULL DEFAULT '2'::smallint,
  "bool_oss_complete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "bool_oss_delete_enum" int2 NOT NULL DEFAULT '2'::smallint,
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_file_info"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_file_info"."folder_id" IS '文件夹ID:foreignKey';
COMMENT ON COLUMN "public"."sys_file_info"."file_show_name" IS '文件显示名称:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_file_info"."file_storage_name" IS '文件存储名称:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_file_info"."file_suffix" IS '文件后缀:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_file_info"."file_storage_path" IS '文件存储路径';
COMMENT ON COLUMN "public"."sys_file_info"."file_full_url" IS '文件完整url路径';
COMMENT ON COLUMN "public"."sys_file_info"."file_storage_type_enum" IS '存储渠道:[1=阿里云=ALIYUN,;2=又拍云=UPYUN]max=2';
COMMENT ON COLUMN "public"."sys_file_info"."file_size" IS '文件大小:单位字节byte';
COMMENT ON COLUMN "public"."sys_file_info"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_file_info"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_file_info"."bool_top_enum" IS '是否置顶:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_file_info"."bool_oss_complete_enum" IS '是否完成上传:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_file_info"."bool_oss_delete_enum" IS 'OSS真实删除状态:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_file_info"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_file_info"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_file_info"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_file_info"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_file_info"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_file_info"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_file_info"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_file_info"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_file_info"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_file_info
-- ----------------------------
INSERT INTO "public"."sys_file_info" VALUES (111111111111111111, 111111111111111111, '这是文件中文名11.png', 'def4b804d91c4775b206a94d248d63dd.png', 'png', '/code-upload/2019-12/30/17', 'https://cdk8s.oss-cn-shenzhen.aliyuncs.com/code-upload/2019-12/30/17/def4b804d91c4775b206a94d248d63dd.png', 1, 394, 100, NULL, 2, 1, 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_file_info" VALUES (111111111111111112, 111111111111111112, '这是文件中文名12.png', 'def4b804d91c4775b206a94d248d63dd.png', 'png', '/code-upload/2019-12/30/17', 'https://cdk8s.oss-cn-shenzhen.aliyuncs.com/code-upload/2019-12/30/17/def4b804d91c4775b206a94d248d63dd.png', 1, 394, 100, NULL, 2, 1, 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_file_info" VALUES (111111111111111113, 111111111111111112, '这是文件中文名13.png', 'def4b804d91c4775b206a94d248d63dd.png', 'png', '/code-upload/2019-12/30/17', 'https://cdk8s.oss-cn-shenzhen.aliyuncs.com/code-upload/2019-12/30/17/def4b804d91c4775b206a94d248d63dd.png', 1, 394, 100, NULL, 2, 1, 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_folder_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_folder_info";
CREATE TABLE "public"."sys_folder_info" (
  "id" int8 NOT NULL,
  "parent_id" int8 NOT NULL,
  "parent_ids" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "folder_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "bool_top_enum" int2 NOT NULL DEFAULT '2'::smallint,
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_folder_info"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_folder_info"."parent_id" IS '父ID';
COMMENT ON COLUMN "public"."sys_folder_info"."parent_ids" IS '父ID集:多个层级用英文逗号隔开';
COMMENT ON COLUMN "public"."sys_folder_info"."folder_name" IS '文件夹名称:treeName:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_folder_info"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_folder_info"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_folder_info"."bool_top_enum" IS '是否置顶:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_folder_info"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_folder_info"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_folder_info"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_folder_info"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_folder_info"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_folder_info"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_folder_info"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_folder_info"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_folder_info"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_folder_info
-- ----------------------------
INSERT INTO "public"."sys_folder_info" VALUES (111111111111111111, 1, '1', '文件夹1', 100, '文件夹1', 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_folder_info" VALUES (111111111111111112, 111111111111111111, '1,111111111111111111', '文件夹11', 100, '文件夹1', 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_folder_info" VALUES (111111111111111113, 111111111111111111, '1,111111111111111111', '文件夹12', 100, '文件夹1', 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_folder_info" VALUES (111111111111111114, 111111111111111111, '1,111111111111111111', '文件夹13', 100, '文件夹1', 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_folder_info" VALUES (111111111111111115, 1, '1', '文件夹2', 100, '文件夹1', 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_folder_info" VALUES (111111111111111116, 111111111111111115, '1,111111111111111115', '文件夹21', 100, '文件夹1', 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_folder_info" VALUES (111111111111111117, 111111111111111115, '1,111111111111111115', '文件夹3', 100, '文件夹1', 2, 1, 1, 1, 1574663813780, 111111111111111111, 1574663813780, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_job";
CREATE TABLE "public"."sys_job" (
  "id" int8 NOT NULL,
  "job_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "job_group" varchar(50) COLLATE "pg_catalog"."default" NOT NULL DEFAULT 'DEFAULT'::character varying,
  "invoke_target" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "cron_expression" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "misfire_policy_enum" int2 NOT NULL DEFAULT '4'::smallint,
  "bool_support_concurrent_enum" int2 NOT NULL DEFAULT '2'::smallint,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_job"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_job"."job_name" IS '任务名称:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_job"."job_group" IS '任务组名';
COMMENT ON COLUMN "public"."sys_job"."invoke_target" IS '调用目标字符串';
COMMENT ON COLUMN "public"."sys_job"."cron_expression" IS 'cron;执行表达式';
COMMENT ON COLUMN "public"."sys_job"."misfire_policy_enum" IS '计划执行错误策略:[1=默认=DEFAULT,;2=立即执行=NOW_RUN, 3=执行一次=ONLY_RUN, 4=放弃执行=SUSPEND_RUN]max=4';
COMMENT ON COLUMN "public"."sys_job"."bool_support_concurrent_enum" IS '是否并发执行:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_job"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_job"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_job"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_job"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_job"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_job"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_job"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_job"."update_user_id" IS '更新人';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO "public"."sys_job" VALUES (111111111111111111, '无参任务名称', '默认任务组', 'myTestTask.ryNoParams', '0 0 10 * * ?', 4, 2, 100, NULL, 1, 1, 1573839167674, 111111111111111111, 1573839167674, 111111111111111111);
INSERT INTO "public"."sys_job" VALUES (222222222222222222, '有参任务名称', '默认任务组', 'myTestTask.ryParams(\"ry\")', '0 0 10 * * ?', 4, 2, 100, NULL, 1, 1, 1573839167674, 111111111111111111, 1573839167674, 111111111111111111);
INSERT INTO "public"."sys_job" VALUES (333333333333333333, '多参任务名称', '默认任务组', 'myTestTask.ryMultipleParams(\"ry\", true, 2000L, 316.50D, 100)', '0 0 10 * * ?', 4, 2, 100, NULL, 1, 1, 1573839167674, 111111111111111111, 1573839167674, 111111111111111111);

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_job_log";
CREATE TABLE "public"."sys_job_log" (
  "id" int8 NOT NULL,
  "job_id" int8 NOT NULL,
  "job_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "job_group" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "invoke_target" varchar(500) COLLATE "pg_catalog"."default" NOT NULL,
  "cron_expression" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "job_message" varchar(250) COLLATE "pg_catalog"."default",
  "exception_msg" varchar(250) COLLATE "pg_catalog"."default",
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "bool_execute_success_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "job_start_date" int8,
  "job_end_date" int8,
  "execute_time" int8,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_job_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_job_log"."job_id" IS '任务ID:oneToManyKey:foreignKey';
COMMENT ON COLUMN "public"."sys_job_log"."job_name" IS '任务名称:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_job_log"."job_group" IS '任务组名';
COMMENT ON COLUMN "public"."sys_job_log"."invoke_target" IS '调用目标字符串';
COMMENT ON COLUMN "public"."sys_job_log"."cron_expression" IS 'cron;执行表达式';
COMMENT ON COLUMN "public"."sys_job_log"."job_message" IS '日志信息';
COMMENT ON COLUMN "public"."sys_job_log"."exception_msg" IS '异常信息';
COMMENT ON COLUMN "public"."sys_job_log"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_job_log"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_job_log"."bool_execute_success_enum" IS '是否执行成功:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_job_log"."job_start_date" IS '任务开始时间';
COMMENT ON COLUMN "public"."sys_job_log"."job_end_date" IS '任务结束时间';
COMMENT ON COLUMN "public"."sys_job_log"."execute_time" IS '执行时间:单位毫秒';
COMMENT ON COLUMN "public"."sys_job_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_job_log"."create_user_id" IS '创建人';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_login_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_login_log";
CREATE TABLE "public"."sys_login_log" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "client_id" varchar(50) COLLATE "pg_catalog"."default",
  "token" varchar(50) COLLATE "pg_catalog"."default",
  "message" varchar(250) COLLATE "pg_catalog"."default",
  "login_date" int8,
  "logout_date" int8,
  "request_url" varchar(500) COLLATE "pg_catalog"."default",
  "bool_login_success_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "bool_now_online_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "offline_type_enum" int2,
  "exception_msg" varchar(250) COLLATE "pg_catalog"."default",
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "ip_address" varchar(50) COLLATE "pg_catalog"."default",
  "ip_region" varchar(100) COLLATE "pg_catalog"."default",
  "ip_region_country" varchar(50) COLLATE "pg_catalog"."default",
  "ip_region_province" varchar(50) COLLATE "pg_catalog"."default",
  "ip_region_city" varchar(50) COLLATE "pg_catalog"."default",
  "ip_region_isp" varchar(50) COLLATE "pg_catalog"."default",
  "user_agent" varchar(500) COLLATE "pg_catalog"."default",
  "device_name" varchar(50) COLLATE "pg_catalog"."default",
  "os_name" varchar(50) COLLATE "pg_catalog"."default",
  "browser_name" varchar(50) COLLATE "pg_catalog"."default",
  "browser_locale" varchar(50) COLLATE "pg_catalog"."default",
  "bool_new_user_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "login_origin_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_login_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_login_log"."user_id" IS '用户ID:foreignKey';
COMMENT ON COLUMN "public"."sys_login_log"."username" IS '用户账号:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_login_log"."client_id" IS '客户端账号';
COMMENT ON COLUMN "public"."sys_login_log"."token" IS '登录成功令牌:oneParam';
COMMENT ON COLUMN "public"."sys_login_log"."message" IS '记录信息';
COMMENT ON COLUMN "public"."sys_login_log"."login_date" IS '登录时间';
COMMENT ON COLUMN "public"."sys_login_log"."logout_date" IS '登出时间';
COMMENT ON COLUMN "public"."sys_login_log"."request_url" IS '请求;URL';
COMMENT ON COLUMN "public"."sys_login_log"."bool_login_success_enum" IS '是否登录成功:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_login_log"."bool_now_online_enum" IS '当前是否在线:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_login_log"."offline_type_enum" IS '登出方式:[1=主动登出=PEOPLE_LOGOUT,;2=过期登出=EXPIRE_LOGOUT, 3=后台踢出=BACKEND_LOGOUT]max=2';
COMMENT ON COLUMN "public"."sys_login_log"."exception_msg" IS '失败异常信息';
COMMENT ON COLUMN "public"."sys_login_log"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_login_log"."ip_address" IS 'IP;地址';
COMMENT ON COLUMN "public"."sys_login_log"."ip_region" IS 'IP;信息';
COMMENT ON COLUMN "public"."sys_login_log"."ip_region_country" IS 'IP;地址对应的国家';
COMMENT ON COLUMN "public"."sys_login_log"."ip_region_province" IS 'IP;地址对应的省';
COMMENT ON COLUMN "public"."sys_login_log"."ip_region_city" IS 'IP;地址对应的市';
COMMENT ON COLUMN "public"."sys_login_log"."ip_region_isp" IS 'IP;地址对应的网络提供商';
COMMENT ON COLUMN "public"."sys_login_log"."user_agent" IS '浏览器;UserAgent';
COMMENT ON COLUMN "public"."sys_login_log"."device_name" IS '设备名称';
COMMENT ON COLUMN "public"."sys_login_log"."os_name" IS '系统名称';
COMMENT ON COLUMN "public"."sys_login_log"."browser_name" IS '浏览器';
COMMENT ON COLUMN "public"."sys_login_log"."browser_locale" IS '语言区域';
COMMENT ON COLUMN "public"."sys_login_log"."bool_new_user_enum" IS '是否是新用户:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_login_log"."login_origin_enum" IS '登录来源:[1=WEB方式=WEB,;2=安卓APP=ANDROID, 3=苹果APP=IOS, 4=H5=H5, 5=微信小程序=WEIXIN_MINI_PROGRAM, 6=微信公众号=WEIXIN_OFFICIAL_ACCOUNT]max=6';
COMMENT ON COLUMN "public"."sys_login_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_login_log"."create_user_id" IS '创建人';

-- ----------------------------
-- Records of sys_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_message_log";
CREATE TABLE "public"."sys_message_log" (
  "id" int8 NOT NULL,
  "receive_user_id" int8 NOT NULL,
  "send_user_id" int8 NOT NULL,
  "dict_item_id" int8 NOT NULL,
  "template_id" int8 NOT NULL,
  "message_title" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "message_content" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "bool_send_success_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "bool_receive_success_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "bool_job_send_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "job_send_date" int8,
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_message_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_message_log"."receive_user_id" IS '接收者ID:foreignKey';
COMMENT ON COLUMN "public"."sys_message_log"."send_user_id" IS '发送者ID:foreignKey';
COMMENT ON COLUMN "public"."sys_message_log"."dict_item_id" IS '模板类型字典ID:foreignKey';
COMMENT ON COLUMN "public"."sys_message_log"."template_id" IS '模板ID:foreignKey';
COMMENT ON COLUMN "public"."sys_message_log"."message_title" IS '消息名称';
COMMENT ON COLUMN "public"."sys_message_log"."message_content" IS '消息内容';
COMMENT ON COLUMN "public"."sys_message_log"."bool_send_success_enum" IS '是否发送成功:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_message_log"."bool_receive_success_enum" IS '是否接收成功:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_message_log"."bool_job_send_enum" IS '是否定时发送:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_message_log"."job_send_date" IS '定时发送时间';
COMMENT ON COLUMN "public"."sys_message_log"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_message_log"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_message_log"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_message_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_message_log"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_message_log"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_message_log"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_message_log"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_message_log"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_message_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_message_template
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_message_template";
CREATE TABLE "public"."sys_message_template" (
  "id" int8 NOT NULL,
  "dict_item_id" int8 NOT NULL,
  "template_name" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "template_code" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "template_content" varchar COLLATE "pg_catalog"."default" NOT NULL,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_message_template"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_message_template"."dict_item_id" IS '模板类型字典ID';
COMMENT ON COLUMN "public"."sys_message_template"."template_name" IS '模板名称';
COMMENT ON COLUMN "public"."sys_message_template"."template_code" IS '模板编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_message_template"."template_content" IS '模板内容';
COMMENT ON COLUMN "public"."sys_message_template"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_message_template"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_message_template"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_message_template"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_message_template"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_message_template"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_message_template"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_message_template"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_message_template"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_message_template"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_message_template"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_message_template
-- ----------------------------

-- ----------------------------
-- Table structure for sys_param
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_param";
CREATE TABLE "public"."sys_param" (
  "id" int8 NOT NULL,
  "type_id" int8 NOT NULL,
  "type_code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "param_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "param_code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "param_value" varchar(500) COLLATE "pg_catalog"."default",
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "param_value_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_param"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_param"."type_id" IS '参数类型ID:foreignKey';
COMMENT ON COLUMN "public"."sys_param"."type_code" IS '参数类型编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_param"."param_name" IS '参数名称';
COMMENT ON COLUMN "public"."sys_param"."param_code" IS '参数编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_param"."param_value" IS '参数值';
COMMENT ON COLUMN "public"."sys_param"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_param"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_param"."param_value_type_enum" IS '参数值类型:[1=java.lang.String=String,;2=java.lang.Boolean=Boolean, 3=java.lang.Integer=Integer, 4=java.lang.Long=Long, 5=java.lang.Double=Double]max=5';
COMMENT ON COLUMN "public"."sys_param"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_param"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_param"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_param"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_param"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_param"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_param"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_param"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_param"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_param
-- ----------------------------
INSERT INTO "public"."sys_param" VALUES (111111111111111001, 111111111111111110, 'website_config', '网站根域名', 'url.websiteInfo.string', 'http://www.YouMeek.com', 100, '网站根域名，尾巴不带斜杠', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111002, 111111111111111110, 'website_config', '网站标题', 'title.websiteInfo.string', '这是网站标题', 100, '网站标题', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111003, 111111111111111110, 'website_config', '网站关键字', 'keyword.websiteInfo.string', '关键字1,关键字2', 100, '网站关键字，多个用英文逗号隔开', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111004, 111111111111111110, 'website_config', '网站描述', 'desc.websiteInfo.string', '这是网站描述', 100, '网站描述', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111005, 111111111111111110, 'website_config', 'PC端logo图片地址', 'url.websiteInfoPcLogoUrl.string', 'https://img.alicdn.com/tps/i4/TB1k8m3rVT7gK0jSZFpSuuTkpXa.jpg_240x240q90.jpg', 100, 'PC端logo图片地址', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111006, 111111111111111110, 'website_config', 'H5端logo图片地址', 'url.websiteInfoH5LogoUrl.string', 'https://img.alicdn.com/tps/i4/TB1k8m3rVT7gK0jSZFpSuuTkpXa.jpg_240x240q90.jpg', 100, 'H5端logo图片地址', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111007, 111111111111111110, 'website_config', '联系电话', 'telephone.websiteInfo.string', '13800000000', 100, '联系电话', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111008, 111111111111111110, 'website_config', '联系邮箱', 'email.websiteInfo.string', 'cdk8s@qq.com', 100, '联系邮箱', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111009, 111111111111111110, 'website_config', '微信二维码图片地址', 'qr.websiteInfoWeixin.string', 'https://img.alicdn.com/tps/i4/TB1k8m3rVT7gK0jSZFpSuuTkpXa.jpg_240x240q90.jpg', 100, '微信二维码图片地址', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111010, 111111111111111110, 'website_config', '联系地址', 'address.websiteInfo.string', '广东广州', 100, '联系地址', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111011, 111111111111111110, 'website_config', '公司地图代码', 'iframe.websiteInfoMapApi.string', '<iframe width=\"604\" height=\"885\" frameborder=\"0\" scrolling=\"no\" marginheight=\"0\" marginwidth=\"0\" src=\"http://j.map.baidu.com/s/iciIFb\"></iframe>', 100, '公司地图代码', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111012, 111111111111111110, 'website_config', '主题名称', 'name.websiteTheme.string', 'default', 100, '主题名称', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111111, 111111111111111111, 'system_config', '登录验证码开关', 'switch.loginCaptcha.boolean', 'true', 100, '登录过程需要输入验证码：true 需要输入', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111112, 111111111111111111, 'system_config', '演示模式编辑权限开关', 'switch.demoModeEdit.boolean', 'true', 100, '演示模式是否开启编辑功能：true 可以编辑', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111113, 111111111111111111, 'system_config', '一天错误登录多少次显示验证码', 'number.loginErrorShowCaptcha.integer', '0', 100, '如果是 0 次则表示永远显示', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111114, 111111111111111111, 'system_config', '正在维护公告开关', 'switch.underConstructionMode.boolean', 'false', 100, '开启后，所有请求都无法访问', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111115, 111111111111111111, 'system_config', '正在维护公告提示内容', 'content.underConstructionMode.string', '这是维护公告内容', 100, '正在维护公告提示内容', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111116, 111111111111111111, 'system_config', '是否开启留言功能', 'switch.guestBook.boolean', 'true', 100, '开启留言功能前台才会出现留言输入框', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (111111111111111117, 111111111111111111, 'system_config', '是否开启留言审批功能', 'switch.guestBookApproval.boolean', 'true', 100, '开启审批功能后，所有留言必须设置会显示才能再前台显示', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (222222222222222221, 111111111111111112, 'image_watermark_config', '图片上传水印图片开关', 'switch.imageWatermark.boolean', 'true', 100, '图片上传是否开启水印图片', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (222222222222222222, 111111111111111112, 'image_watermark_config', '水印图片存放路径', 'path.imageWatermark.string', '/watermark/taobao-watermark.png', 100, '水印图片必须和待处理图片在同一服务名下', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (222222222222222223, 111111111111111112, 'image_watermark_config', '水印图片放置方位', 'align.imageWatermark.string', 'southeast', 100, '一共九个方位：northwest,north,northeast,west,center,east,southwest,south,southeast', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (222222222222222224, 111111111111111112, 'image_watermark_config', '水印图片透明度', 'transparency.imageWatermark.integer', '100', 100, '文字水印透明度，取值区间[0,100]', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (222222222222222225, 111111111111111112, 'image_watermark_config', '水印图片水平边距', 'margin.imageWatermarkMarginX.integer', '10', 100, '文字水印水平边距', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (222222222222222226, 111111111111111112, 'image_watermark_config', '水印图片垂直边距', 'margin.imageWatermarkMarginY.integer', '10', 100, '文字水印垂直边距', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (222222222222222227, 111111111111111112, 'image_watermark_config', '水印图片根据主图的缩放比例', 'percent.imageWatermark.integer', '10', 100, '水印图片根据主图的缩放比例，取值区间[0,100]', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (333333333333333331, 111111111111111113, 'text_watermark_config', '图片上传文字水印开关', 'switch.textWatermark.boolean', 'true', 100, '图片上传是否开启文字水印', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (333333333333333332, 111111111111111113, 'text_watermark_config', '文字水印内容', 'content.textWatermark.string', '这是文字水印', 100, '文字水印内容', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (333333333333333333, 111111111111111113, 'text_watermark_config', '文字水印字体大小', 'size.textWatermark.integer', '30', 100, '水印文字大小', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (333333333333333334, 111111111111111113, 'text_watermark_config', '文字水印字体颜色', 'color.textWatermark.string', '000000', 100, '格式：RRGGBB', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (333333333333333335, 111111111111111113, 'text_watermark_config', '文字水印放置方位', 'align.textWatermark.string', 'northwest', 100, '一共九个方位：northwest,north,northeast,west,center,east,southwest,south,southeast', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (333333333333333336, 111111111111111113, 'text_watermark_config', '文字水印透明度', 'transparency.textWatermark.integer', '100', 100, '文字水印透明度，取值区间[0,100]', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (333333333333333337, 111111111111111113, 'text_watermark_config', '文字水印水平边距', 'margin.textWatermarkMarginX.integer', '10', 100, '文字水印水平边距', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (333333333333333338, 111111111111111113, 'text_watermark_config', '文字水印垂直边距', 'margin.textWatermarkMarginY.integer', '10', 100, '文字水印垂直边距', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (444444444444444442, 111111111111111114, 'image_upload_config', '是否开启原图保护', 'switch.originalImageProtect.boolean', 'true', 100, '是否开启原图保护', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (444444444444444443, 111111111111111114, 'image_upload_config', '本地存储图片URL前缀', 'url.localFileUrlPrefix.string', 'http://sculptor.cdk8s.com:9091/sculptor-boot-backend', 100, '本地存储图片URL前缀', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (444444444444444444, 111111111111111114, 'image_upload_config', '本地存储图片是否走Nginx访问', 'switch.localFileUrlNginx.boolean', 'false', 100, '本地存储图片是否走Nginx访问', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (555555555555555551, 111111111111111115, 'upyun_config', '用户绑定域名', 'url.upyunFileUrlPrefix.string', 'http://img.gitnavi.com', 100, '用户绑定域名，不能以斜杠结尾', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (555555555555555552, 111111111111111115, 'upyun_config', '又拍云文件上传根目录', 'path.upyunRootPath.string', 'code-upload', 100, '又拍云文件上传根目录', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (555555555555555553, 111111111111111115, 'upyun_config', '又拍云开启原图保护，没开水印下的参数', 'param.upyunOriginalImageProtect.string', '/unsharp/false', 100, '又拍云开启原图保护，没开水印下的参数，这里设置不启用锐化', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (555555555555555554, 111111111111111115, 'upyun_config', '又拍云原图保护密钥', 'secret.upyunOriginalImageProtect.string', '123456', 100, '要访问原图必须带上密钥才能访问，格式：xx.png!123456', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (622477281297432577, 111111111111111118, 'material_library_config', '素材库图片目录展示规格', 'switch.originalImageProtect.boolean', 'true', 100, '是否开启原图保护', 2, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (661477281297432571, 111111111111111118, 'material_library_config', '素材库目录缩略图宽度', 'width.materialLibraryResize.integer', '50', 100, '素材库目录缩略图宽度', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (661477281297432572, 111111111111111118, 'material_library_config', '素材库目录缩略图高度', 'height.materialLibraryResize.integer', '50', 100, '素材库目录缩略图高度', 3, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (666666666666666661, 111111111111111116, 'aliyun_oss_config', '阿里云OSS用户绑定域名', 'url.aliyunFileUrlPrefix.string', 'https://cdk8s.oss-cn-shenzhen.aliyuncs.com', 100, '阿里云OSS用户绑定域名，不能以斜杠结尾', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (666666666666666662, 111111111111111116, 'aliyun_oss_config', '阿里云OSS开启原图保护，没开水印下的参数', 'param.aliyunOriginalImageProtect.string', '/bright,0', 100, '阿里云OSS开启原图保护，没开水印下的参数，这里设置亮度为原图', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (666666666666666663, 111111111111111116, 'aliyun_oss_config', '阿里云OSS文件上传根目录', 'path.aliyunOssRootPath.string', 'code-upload', 100, '阿里云OSS文件上传根目录', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (777777777777777771, 111111111111111117, 'header_footer_code_config', 'PC端页头代码', 'code.pcHeaderImportCode.string', '', 100, 'PC端页头代码', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (777777777777777772, 111111111111111117, 'header_footer_code_config', 'PC端页尾代码', 'code.pcFooterImportCode.string', '', 100, 'PC端页尾代码', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (777777777777777773, 111111111111111117, 'header_footer_code_config', 'H5端页头代码', 'code.h5HeaderImportCode.string', '', 100, 'H5端页头代码', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (777777777777777774, 111111111111111117, 'header_footer_code_config', 'H5端页尾代码', 'code.h5FooterImportCode.string', '', 100, 'H5端页尾代码', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (777777777777777775, 111111111111111117, 'header_footer_code_config', '小程序端页头代码', 'code.weixinHeaderImportCode.string', '', 100, '小程序端页头代码', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param" VALUES (777777777777777776, 111111111111111117, 'header_footer_code_config', '小程序端页尾代码', 'code.weixinFooterImportCode.string', '', 100, '小程序端页尾代码', 1, 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_param_type
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_param_type";
CREATE TABLE "public"."sys_param_type" (
  "id" int8 NOT NULL,
  "type_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "type_code" varchar(100) COLLATE "pg_catalog"."default" NOT NULL,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_param_type"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_param_type"."type_name" IS '类型名称';
COMMENT ON COLUMN "public"."sys_param_type"."type_code" IS '类型编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_param_type"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_param_type"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_param_type"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_param_type"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_param_type"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_param_type"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_param_type"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_param_type"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_param_type"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_param_type"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_param_type"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_param_type
-- ----------------------------
INSERT INTO "public"."sys_param_type" VALUES (111111111111111110, '网站配置', 'website_config', 100, '网站配置', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param_type" VALUES (111111111111111111, '系统配置', 'system_config', 100, '系统配置', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param_type" VALUES (111111111111111112, '图片水印配置', 'image_watermark_config', 100, '图片水印配置', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param_type" VALUES (111111111111111113, '文字水印配置', 'text_watermark_config', 100, '文字水印配置', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param_type" VALUES (111111111111111114, '图片上传配置', 'image_upload_config', 100, '图片上传配置', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param_type" VALUES (111111111111111115, '又拍云配置', 'upyun_config', 100, '又拍云配置', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param_type" VALUES (111111111111111116, '阿里云OSS配置', 'aliyun_oss_config', 100, '阿里云OSS配置', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param_type" VALUES (111111111111111117, '页头页尾代码配置', 'header_footer_code_config', 100, '页头页尾代码配置', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_param_type" VALUES (111111111111111118, '素材库配置', 'material_library_config', 100, '素材库配置', 1, 1, 1, 1574853820410, 111111111111111111, 1574853820410, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_permission
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_permission";
CREATE TABLE "public"."sys_permission" (
  "id" int8 NOT NULL,
  "permission_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "permission_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "permission_url" varchar(500) COLLATE "pg_catalog"."default",
  "belong_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "permission_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "parent_id" int8 NOT NULL,
  "parent_ids" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "icon_class" varchar(250) COLLATE "pg_catalog"."default",
  "visible_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "bool_ext_link_enum" int2 NOT NULL DEFAULT '2'::smallint,
  "bool_new_tab_enum" int2 NOT NULL DEFAULT '2'::smallint,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_permission"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_permission"."permission_name" IS '权限名称:treeName';
COMMENT ON COLUMN "public"."sys_permission"."permission_code" IS '权限标识码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_permission"."permission_url" IS '路由地址:如果是外部链接则代表链接地址';
COMMENT ON COLUMN "public"."sys_permission"."belong_type_enum" IS '归属类型:[1=所以=ALL,;2=管理后台=ADMIN, 3=租户=TENANT]max=3';
COMMENT ON COLUMN "public"."sys_permission"."permission_type_enum" IS '权限类型:[1=一级目录=TOP_DIRECTORY,;2=菜单=MENU, 3=按钮=BUTTON]max=3';
COMMENT ON COLUMN "public"."sys_permission"."parent_id" IS '父ID';
COMMENT ON COLUMN "public"."sys_permission"."parent_ids" IS '父ID集';
COMMENT ON COLUMN "public"."sys_permission"."icon_class" IS '权限图标';
COMMENT ON COLUMN "public"."sys_permission"."visible_enum" IS '显示状态:[1=显示=DISPLAY,;2=隐藏=HIDDEN]max=2';
COMMENT ON COLUMN "public"."sys_permission"."bool_ext_link_enum" IS '是否外链:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_permission"."bool_new_tab_enum" IS '是否新标签打开:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_permission"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_permission"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_permission"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_permission"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_permission"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_permission"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_permission"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_permission"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_permission"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_permission"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_permission"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_permission
-- ----------------------------
INSERT INTO "public"."sys_permission" VALUES (111111111111112001, '首页概览', 'sys_index', '/index', 1, 1, 1, '1', 'home', 1, 2, 2, 10, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114001, '账号权限', 'sys_user_permission_manage', '/sysUserPermissionManage', 1, 1, 1, '1', 'safety', 1, 2, 2, 20, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111115001, '系统管理', 'sys_manage', '/sysManage', 1, 1, 1, '1', 'setting', 1, 2, 2, 30, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111123001, '系统官网', 'cdk8s_index', 'https://github.com/cdk8s/sculptor-boot-generator', 1, 1, 1, '1', 'github', 1, 1, 1, 100, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114002, '用户管理', 'sys_user', '/sysUser', 1, 2, 111111111111114001, '1,111111111111114001', 'user', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114005, '角色管理', 'sys_role', '/sysRole', 1, 2, 111111111111114001, '1,111111111111114001', 'crown', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114006, '菜单管理', 'sys_permission', '/sysPermission', 1, 2, 111111111111114001, '1,111111111111114001', 'menu', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111115002, '参数配置', 'sys_param', '/sysParam', 1, 2, 111111111111115001, '1,111111111111115001', 'block', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111115003, '数据字典', 'sys_dict', '/sysDict', 1, 2, 111111111111115001, '1,111111111111115001', 'database', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (696090184323694592, '租户管理', 'sys_tenant', '/sysTenant', 1, 2, 111111111111115001, '1,111111111111115001', 'chrome', 1, 2, 2, 100, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114102, '创建', 'sys_user_create', '', 1, 3, 111111111111114002, '1,111111111111114001,111111111111114002', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114105, '创建', 'sys_role_create', '', 1, 3, 111111111111114005, '1,111111111111114001,111111111111114005', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114106, '创建', 'sys_permission_create', '', 1, 3, 111111111111114006, '1,111111111111114001,111111111111114006', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114202, '修改', 'sys_user_update', '', 1, 3, 111111111111114002, '1,111111111111114001,111111111111114002', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114205, '修改', 'sys_role_update', '', 1, 3, 111111111111114005, '1,111111111111114001,111111111111114005', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114206, '修改', 'sys_permission_update', '', 1, 3, 111111111111114006, '1,111111111111114001,111111111111114006', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114302, '删除', 'sys_user_delete', '', 1, 3, 111111111111114002, '1,111111111111114001,111111111111114002', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114305, '删除', 'sys_role_delete', '', 1, 3, 111111111111114005, '1,111111111111114001,111111111111114005', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111114306, '删除', 'sys_permission_delete', '', 1, 3, 111111111111114006, '1,111111111111114001,111111111111114006', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111115102, '创建', 'sys_param_create', '', 1, 3, 111111111111115002, '1,111111111111115001,111111111111115002', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111115103, '创建', 'sys_dict_create', '', 1, 3, 111111111111115003, '1,111111111111115001,111111111111115003', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111115202, '修改', 'sys_param_update', '', 1, 3, 111111111111115002, '1,111111111111115001,111111111111115002', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111115203, '修改', 'sys_dict_update', '', 1, 3, 111111111111115003, '1,111111111111115001,111111111111115003', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111115302, '删除', 'sys_param_delete', '', 1, 3, 111111111111115002, '1,111111111111115001,111111111111115002', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (111111111111115303, '删除', 'sys_dict_delete', '', 1, 3, 111111111111115003, '1,111111111111115001,111111111111115003', '', 1, 2, 2, 50, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (696090184323694593, '创建', 'sys_tenant_create', '/api/sysTenant/create', 1, 3, 696090184323694592, '1,111111111111115001,696090184323694592', NULL, 1, 2, 2, 100, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (696090184323694594, '修改', 'sys_tenant_update', '/api/sysTenant/update', 1, 3, 696090184323694592, '1,111111111111115001,696090184323694592', NULL, 1, 2, 2, 100, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_permission" VALUES (696090184323694595, '删除', 'sys_tenant_delete', '/api/sysTenant/batchDelete', 1, 3, 696090184323694592, '1,111111111111115001,696090184323694592', NULL, 1, 2, 2, 100, NULL, 1, 1, 1, 1574159404580, 111111111111111111, 1574159404580, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_role";
CREATE TABLE "public"."sys_role" (
  "id" int8 NOT NULL,
  "role_name" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "role_code" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "bool_template_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_role"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_role"."role_name" IS '角色名称';
COMMENT ON COLUMN "public"."sys_role"."role_code" IS '角色编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_role"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_role"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_role"."bool_template_enum" IS '是否是租户模板角色:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_role"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_role"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_role"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_role"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_role"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_role"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_role"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_role"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_role"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO "public"."sys_role" VALUES (111111111111111111, '超级管理员', 'top_admin_role', 1, '超级管理员，预设数据，无法删除和修改', 1, 1, 1, 1, 1574663780828, 111111111111111111, 1574663780828, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_role" VALUES (222222222222222222, '演示用户', 'demo_user_role', 1, '演示用户，预设数据，无法删除和修改', 1, 1, 1, 1, 1574663780828, 111111111111111111, 1574663780828, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_role" VALUES (333333333333333333, '普通用户', 'normal_user_role', 1, '普通用户，预设数据，无法删除和修改', 1, 1, 1, 1, 1574663780828, 111111111111111111, 1574663780828, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_search_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_search_log";
CREATE TABLE "public"."sys_search_log" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "search_content" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_search_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_search_log"."user_id" IS '搜索用户ID:foreignKey';
COMMENT ON COLUMN "public"."sys_search_log"."search_content" IS '搜索内容';
COMMENT ON COLUMN "public"."sys_search_log"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_search_log"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_search_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_search_log"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_search_log"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_search_log"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_search_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_search_recommend
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_search_recommend";
CREATE TABLE "public"."sys_search_recommend" (
  "id" int8 NOT NULL,
  "search_keyword" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "ranking" int2 NOT NULL DEFAULT '100'::smallint,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_search_recommend"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_search_recommend"."search_keyword" IS '搜索推荐词';
COMMENT ON COLUMN "public"."sys_search_recommend"."ranking" IS '排序:排序值越小越排前;max=100';
COMMENT ON COLUMN "public"."sys_search_recommend"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_search_recommend"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_search_recommend"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_search_recommend"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_search_recommend"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_search_recommend"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_search_recommend"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_search_recommend"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_search_recommend"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_search_recommend"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_search_recommend
-- ----------------------------

-- ----------------------------
-- Table structure for sys_sms_login_log
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_sms_login_log";
CREATE TABLE "public"."sys_sms_login_log" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "user_mobile_phone" varchar(20) COLLATE "pg_catalog"."default" NOT NULL,
  "verification_code" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "sms_provider_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "bool_service_state_enum" int2 NOT NULL DEFAULT '2'::smallint,
  "message_content" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "bool_use_enum" int2 NOT NULL DEFAULT '2'::smallint,
  "ip_address" varchar(50) COLLATE "pg_catalog"."default",
  "user_agent" varchar(500) COLLATE "pg_catalog"."default",
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_sms_login_log"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_sms_login_log"."user_id" IS '用户ID:foreignKey';
COMMENT ON COLUMN "public"."sys_sms_login_log"."user_mobile_phone" IS '用户手机号:foreignKey';
COMMENT ON COLUMN "public"."sys_sms_login_log"."verification_code" IS '短信验证码';
COMMENT ON COLUMN "public"."sys_sms_login_log"."sms_provider_type_enum" IS '服务商类型:[1=阿里云=ALIYUN,;2=腾讯云=TENCENT]max=2';
COMMENT ON COLUMN "public"."sys_sms_login_log"."bool_service_state_enum" IS '服务商是否已验证:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_sms_login_log"."message_content" IS '短信完整内容';
COMMENT ON COLUMN "public"."sys_sms_login_log"."bool_use_enum" IS '是否已验证:[1=是=YES,;2=否=NO]max=2';
COMMENT ON COLUMN "public"."sys_sms_login_log"."ip_address" IS 'IP;地址';
COMMENT ON COLUMN "public"."sys_sms_login_log"."user_agent" IS '浏览器;UserAgent';
COMMENT ON COLUMN "public"."sys_sms_login_log"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_sms_login_log"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_sms_login_log"."create_user_id" IS '创建人';

-- ----------------------------
-- Records of sys_sms_login_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_tenant
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_tenant";
CREATE TABLE "public"."sys_tenant" (
  "id" int8 NOT NULL,
  "tenant_name" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "tenant_code" varchar(250) COLLATE "pg_catalog"."default" NOT NULL,
  "description" varchar(500) COLLATE "pg_catalog"."default",
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_tenant"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_tenant"."tenant_name" IS '租户名称';
COMMENT ON COLUMN "public"."sys_tenant"."tenant_code" IS '租户编码:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_tenant"."description" IS '备注';
COMMENT ON COLUMN "public"."sys_tenant"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_tenant"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_tenant"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_tenant"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_tenant"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_tenant"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_tenant"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_tenant"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_tenant"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_tenant
-- ----------------------------
INSERT INTO "public"."sys_tenant" VALUES (1, '默认租户', 'system', NULL, 1, 1, 1, 1574739322708, 111111111111111111, 1574739322708, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user";
CREATE TABLE "public"."sys_user" (
  "id" int8 NOT NULL,
  "username" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "nickname" varchar(100) COLLATE "pg_catalog"."default",
  "real_name" varchar(50) COLLATE "pg_catalog"."default",
  "user_password" varchar(50) COLLATE "pg_catalog"."default" NOT NULL,
  "password_salt" varchar(10) COLLATE "pg_catalog"."default" NOT NULL,
  "user_email" varchar(50) COLLATE "pg_catalog"."default",
  "telephone" varchar(20) COLLATE "pg_catalog"."default",
  "mobile_phone" varchar(20) COLLATE "pg_catalog"."default",
  "avatar_url" varchar(500) COLLATE "pg_catalog"."default",
  "gender_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "user_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "register_type_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "register_origin_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "state_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "delete_enum" int2 NOT NULL DEFAULT '1'::smallint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL,
  "delete_date" int8,
  "delete_user_id" int8
)
;
COMMENT ON COLUMN "public"."sys_user"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_user"."username" IS '用户账号:oneParam';
COMMENT ON COLUMN "public"."sys_user"."nickname" IS '昵称:oneParam';
COMMENT ON COLUMN "public"."sys_user"."real_name" IS '真实姓名:likeParam';
COMMENT ON COLUMN "public"."sys_user"."user_password" IS '登录密码';
COMMENT ON COLUMN "public"."sys_user"."password_salt" IS '密码盐:放于密码后面';
COMMENT ON COLUMN "public"."sys_user"."user_email" IS '邮箱地址:oneParam';
COMMENT ON COLUMN "public"."sys_user"."telephone" IS '固话';
COMMENT ON COLUMN "public"."sys_user"."mobile_phone" IS '手机号:oneParam';
COMMENT ON COLUMN "public"."sys_user"."avatar_url" IS '头像';
COMMENT ON COLUMN "public"."sys_user"."gender_enum" IS '性别:[1=保密=PRIVACY,;2=男性=MALE, 3=女性=FEMALE]max=3';
COMMENT ON COLUMN "public"."sys_user"."user_type_enum" IS '用户类型:[1=普通用户=USER,;2=后台管理员=ADMIN, 3=租户主账号=TENANT_ADMIN, 4=租户子账号=TENANT_SUB_ACCOUNT]max=4';
COMMENT ON COLUMN "public"."sys_user"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_user"."register_type_enum" IS '注册方式:[1=系统预置=SYSTEM_INIT,;2=后台管理系统新增=MANAGEMENT_ADD, 3=主动注册=REGISTER, 4=被邀请注册=INVITE]max=4';
COMMENT ON COLUMN "public"."sys_user"."register_origin_enum" IS '注册来源:[1=WEB方式=WEB,;2=安卓APP=ANDROID, 3=苹果APP=IOS, 4=H5=H5, 5=微信小程序=WEIXIN_MINI_PROGRAM, 6=微信公众号=WEIXIN_OFFICIAL_ACCOUNT]max=6';
COMMENT ON COLUMN "public"."sys_user"."state_enum" IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
COMMENT ON COLUMN "public"."sys_user"."delete_enum" IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
COMMENT ON COLUMN "public"."sys_user"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_user"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_user"."update_user_id" IS '更新人';
COMMENT ON COLUMN "public"."sys_user"."delete_date" IS '删除时间';
COMMENT ON COLUMN "public"."sys_user"."delete_user_id" IS '删除人';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO "public"."sys_user" VALUES (111111111111111111, 'admin', NULL, 'admin', '42c224b3c8899047460f5a6d1c041411', '1234567890', 'cdk8s@qq.com', '13800000000', '13800000000', 'https://dummyimage.com/60x60.png', 1, 2, 1, 1, 1, 1, 1, 1514736123456, 111111111111111111, 1514736123456, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_user" VALUES (222222222222222222, 'demo', NULL, 'demo', '42c224b3c8899047460f5a6d1c041411', '1234567890', 'cdk8s-demo@qq.com', '13800000011', '13800000011', 'https://dummyimage.com/60x60.png', 1, 1, 1, 1, 1, 1, 1, 1514736123457, 111111111111111111, 1514736123456, 111111111111111111, NULL, NULL);
INSERT INTO "public"."sys_user" VALUES (333333333333333331, 'demo1', NULL, '李四老师', '42c224b3c8899047460f5a6d1c041411', '1234567890', 'cdk8s-1@qq.com', '13800000001', '13800000001', 'https://dummyimage.com/60x60.png', 1, 1, 1, 1, 1, 1, 1, 1514736123458, 111111111111111111, 1514736123456, 111111111111111111, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user_info
-- ----------------------------
DROP TABLE IF EXISTS "public"."sys_user_info";
CREATE TABLE "public"."sys_user_info" (
  "id" int8 NOT NULL,
  "user_id" int8 NOT NULL,
  "weixin_openid" varchar(40) COLLATE "pg_catalog"."default",
  "weixin_unionid" varchar(40) COLLATE "pg_catalog"."default",
  "weixin_userinfo" varchar(800) COLLATE "pg_catalog"."default",
  "id_card" varchar(30) COLLATE "pg_catalog"."default",
  "tenant_id" int8 NOT NULL DEFAULT '1'::bigint,
  "create_date" int8 NOT NULL,
  "create_user_id" int8 NOT NULL,
  "update_date" int8 NOT NULL,
  "update_user_id" int8 NOT NULL
)
;
COMMENT ON COLUMN "public"."sys_user_info"."id" IS '主键ID';
COMMENT ON COLUMN "public"."sys_user_info"."user_id" IS '用户ID:foreignKey';
COMMENT ON COLUMN "public"."sys_user_info"."weixin_openid" IS '微信openid:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_user_info"."weixin_unionid" IS '微信unionid:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_user_info"."weixin_userinfo" IS '微信用户信息';
COMMENT ON COLUMN "public"."sys_user_info"."id_card" IS '身份证号:oneParam;listParam';
COMMENT ON COLUMN "public"."sys_user_info"."tenant_id" IS '所属租户';
COMMENT ON COLUMN "public"."sys_user_info"."create_date" IS '创建时间';
COMMENT ON COLUMN "public"."sys_user_info"."create_user_id" IS '创建人';
COMMENT ON COLUMN "public"."sys_user_info"."update_date" IS '更新时间';
COMMENT ON COLUMN "public"."sys_user_info"."update_user_id" IS '更新人';

-- ----------------------------
-- Records of sys_user_info
-- ----------------------------

-- ----------------------------
-- Alter sequences owned by
-- ----------------------------
ALTER SEQUENCE "public"."nessie_migrations_id_seq"
OWNED BY "public"."nessie_migrations"."id";
SELECT setval('"public"."nessie_migrations_id_seq"', 29, true);

-- ----------------------------
-- Uniques structure for table nessie_migrations
-- ----------------------------
ALTER TABLE "public"."nessie_migrations" ADD CONSTRAINT "nessie_migrations_file_name_key" UNIQUE ("file_name");

-- ----------------------------
-- Primary Key structure for table nessie_migrations
-- ----------------------------
ALTER TABLE "public"."nessie_migrations" ADD CONSTRAINT "nessie_migrations_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rel_dept_user
-- ----------------------------
ALTER TABLE "public"."rel_dept_user" ADD CONSTRAINT "rel_dept_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rel_permission_role
-- ----------------------------
ALTER TABLE "public"."rel_permission_role" ADD CONSTRAINT "rel_permission_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table rel_role_user
-- ----------------------------
ALTER TABLE "public"."rel_role_user" ADD CONSTRAINT "rel_role_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_banner
-- ----------------------------
ALTER TABLE "public"."sys_banner" ADD CONSTRAINT "sys_banner_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_big_text
-- ----------------------------
ALTER TABLE "public"."sys_big_text" ADD CONSTRAINT "sys_big_text_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_city_area
-- ----------------------------
ALTER TABLE "public"."sys_city_area" ADD CONSTRAINT "sys_city_area_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dept
-- ----------------------------
ALTER TABLE "public"."sys_dept" ADD CONSTRAINT "sys_dept_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dict
-- ----------------------------
ALTER TABLE "public"."sys_dict" ADD CONSTRAINT "sys_dict_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_dict_item
-- ----------------------------
ALTER TABLE "public"."sys_dict_item" ADD CONSTRAINT "sys_dict_item_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_employee
-- ----------------------------
ALTER TABLE "public"."sys_employee" ADD CONSTRAINT "sys_employee_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_event_log
-- ----------------------------
ALTER TABLE "public"."sys_event_log" ADD CONSTRAINT "sys_event_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_file_info
-- ----------------------------
ALTER TABLE "public"."sys_file_info" ADD CONSTRAINT "sys_file_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_folder_info
-- ----------------------------
ALTER TABLE "public"."sys_folder_info" ADD CONSTRAINT "sys_folder_info_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_job
-- ----------------------------
ALTER TABLE "public"."sys_job" ADD CONSTRAINT "sys_job_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_job_log
-- ----------------------------
ALTER TABLE "public"."sys_job_log" ADD CONSTRAINT "sys_job_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_login_log
-- ----------------------------
ALTER TABLE "public"."sys_login_log" ADD CONSTRAINT "sys_login_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_message_log
-- ----------------------------
ALTER TABLE "public"."sys_message_log" ADD CONSTRAINT "sys_message_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_message_template
-- ----------------------------
ALTER TABLE "public"."sys_message_template" ADD CONSTRAINT "sys_message_template_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_param
-- ----------------------------
ALTER TABLE "public"."sys_param" ADD CONSTRAINT "sys_param_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_param_type
-- ----------------------------
ALTER TABLE "public"."sys_param_type" ADD CONSTRAINT "sys_param_type_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_permission
-- ----------------------------
ALTER TABLE "public"."sys_permission" ADD CONSTRAINT "sys_permission_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_role
-- ----------------------------
ALTER TABLE "public"."sys_role" ADD CONSTRAINT "sys_role_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_search_log
-- ----------------------------
ALTER TABLE "public"."sys_search_log" ADD CONSTRAINT "sys_search_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_search_recommend
-- ----------------------------
ALTER TABLE "public"."sys_search_recommend" ADD CONSTRAINT "sys_search_recommend_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_sms_login_log
-- ----------------------------
ALTER TABLE "public"."sys_sms_login_log" ADD CONSTRAINT "sys_sms_login_log_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_tenant
-- ----------------------------
ALTER TABLE "public"."sys_tenant" ADD CONSTRAINT "sys_tenant_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user
-- ----------------------------
ALTER TABLE "public"."sys_user" ADD CONSTRAINT "sys_user_pkey" PRIMARY KEY ("id");

-- ----------------------------
-- Primary Key structure for table sys_user_info
-- ----------------------------
ALTER TABLE "public"."sys_user_info" ADD CONSTRAINT "sys_user_info_pkey" PRIMARY KEY ("id");
