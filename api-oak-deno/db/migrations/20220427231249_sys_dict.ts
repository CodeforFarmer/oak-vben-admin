import { AbstractMigration, ClientPostgreSQL } from "../../deps.ts";

export default class extends AbstractMigration<ClientPostgreSQL> {
  /** Runs on migrate */
  async up(): Promise<void> {
    await this.client.queryObject(`
    DROP TABLE IF EXISTS SYS_DICT;
    CREATE TABLE SYS_DICT(
        ID BIGINT NOT NULL,
        DICT_NAME VARCHAR(50) NOT NULL,
        DICT_CODE VARCHAR(100) NOT NULL,
        DICT_VALUE_TYPE_ENUM SMALLINT NOT NULL DEFAULT  '1',
        RANKING SMALLINT NOT NULL DEFAULT  '100',
        DESCRIPTION VARCHAR(500),
        STATE_ENUM SMALLINT NOT NULL DEFAULT  '1',
        DELETE_ENUM SMALLINT NOT NULL DEFAULT  '1',
        TENANT_ID BIGINT NOT NULL DEFAULT  '1',
        CREATE_DATE BIGINT NOT NULL,
        CREATE_USER_ID BIGINT NOT NULL,
        UPDATE_DATE BIGINT NOT NULL,
        UPDATE_USER_ID BIGINT NOT NULL,
        DELETE_DATE BIGINT,
        DELETE_USER_ID BIGINT,
        PRIMARY KEY (ID)
    );
    
    COMMENT ON TABLE SYS_DICT IS '';
    COMMENT ON COLUMN SYS_DICT.ID IS '主键ID';
    COMMENT ON COLUMN SYS_DICT.DICT_NAME IS '字典名称';
    COMMENT ON COLUMN SYS_DICT.DICT_CODE IS '字典编码:oneParam;listParam';
    COMMENT ON COLUMN SYS_DICT.DICT_VALUE_TYPE_ENUM IS '字典值类型:[1=java.lang.String=String,;2=java.lang.Boolean=Boolean, 3=java.lang.Integer=Integer, 4=java.lang.Long=Long, 5=java.lang.Double=Double]max=5';
    COMMENT ON COLUMN SYS_DICT.RANKING IS '排序:排序值越小越排前;max=100';
    COMMENT ON COLUMN SYS_DICT.DESCRIPTION IS '备注';
    COMMENT ON COLUMN SYS_DICT.STATE_ENUM IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
    COMMENT ON COLUMN SYS_DICT.DELETE_ENUM IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
    COMMENT ON COLUMN SYS_DICT.TENANT_ID IS '所属租户';
    COMMENT ON COLUMN SYS_DICT.CREATE_DATE IS '创建时间';
    COMMENT ON COLUMN SYS_DICT.CREATE_USER_ID IS '创建人';
    COMMENT ON COLUMN SYS_DICT.UPDATE_DATE IS '更新时间';
    COMMENT ON COLUMN SYS_DICT.UPDATE_USER_ID IS '更新人';
    COMMENT ON COLUMN SYS_DICT.DELETE_DATE IS '删除时间';
    COMMENT ON COLUMN SYS_DICT.DELETE_USER_ID IS '删除人';
    
    `);
  }

  /** Runs on rollback */
  async down(): Promise<void> {
    await this.client.queryObject(`
            DROP table sys_dict
        `);
  }
}
