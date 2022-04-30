import { AbstractMigration, ClientPostgreSQL } from "../../deps.ts";

export default class extends AbstractMigration<ClientPostgreSQL> {
  /** Runs on migrate */
  async up(): Promise<void> {
    await this.client.queryObject(`
    DROP TABLE IF EXISTS SYS_PARAM;
    CREATE TABLE SYS_PARAM(
        ID BIGINT NOT NULL,
        TYPE_ID BIGINT NOT NULL,
        TYPE_CODE VARCHAR(100) NOT NULL,
        PARAM_NAME VARCHAR(50) NOT NULL,
        PARAM_CODE VARCHAR(100) NOT NULL,
        PARAM_VALUE VARCHAR(500),
        RANKING SMALLINT NOT NULL DEFAULT  '100',
        DESCRIPTION VARCHAR(500),
        PARAM_VALUE_TYPE_ENUM SMALLINT NOT NULL DEFAULT  '1',
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
    
    COMMENT ON TABLE SYS_PARAM IS '';
    COMMENT ON COLUMN SYS_PARAM.ID IS '主键ID';
    COMMENT ON COLUMN SYS_PARAM.TYPE_ID IS '参数类型ID:foreignKey';
    COMMENT ON COLUMN SYS_PARAM.TYPE_CODE IS '参数类型编码:oneParam;listParam';
    COMMENT ON COLUMN SYS_PARAM.PARAM_NAME IS '参数名称';
    COMMENT ON COLUMN SYS_PARAM.PARAM_CODE IS '参数编码:oneParam;listParam';
    COMMENT ON COLUMN SYS_PARAM.PARAM_VALUE IS '参数值';
    COMMENT ON COLUMN SYS_PARAM.RANKING IS '排序:排序值越小越排前;max=100';
    COMMENT ON COLUMN SYS_PARAM.DESCRIPTION IS '备注';
    COMMENT ON COLUMN SYS_PARAM.PARAM_VALUE_TYPE_ENUM IS '参数值类型:[1=java.lang.String=String,;2=java.lang.Boolean=Boolean, 3=java.lang.Integer=Integer, 4=java.lang.Long=Long, 5=java.lang.Double=Double]max=5';
    COMMENT ON COLUMN SYS_PARAM.STATE_ENUM IS '启用状态:[1=启用=ENABLE,;2=禁用=DISABLE]max=2';
    COMMENT ON COLUMN SYS_PARAM.DELETE_ENUM IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
    COMMENT ON COLUMN SYS_PARAM.TENANT_ID IS '所属租户';
    COMMENT ON COLUMN SYS_PARAM.CREATE_DATE IS '创建时间';
    COMMENT ON COLUMN SYS_PARAM.CREATE_USER_ID IS '创建人';
    COMMENT ON COLUMN SYS_PARAM.UPDATE_DATE IS '更新时间';
    COMMENT ON COLUMN SYS_PARAM.UPDATE_USER_ID IS '更新人';
    COMMENT ON COLUMN SYS_PARAM.DELETE_DATE IS '删除时间';
    COMMENT ON COLUMN SYS_PARAM.DELETE_USER_ID IS '删除人';
    
    `);
  }

  /** Runs on rollback */
  async down(): Promise<void> {
    await this.client.queryObject(`
            DROP table SYS_PARAM
        `);
  }
}
