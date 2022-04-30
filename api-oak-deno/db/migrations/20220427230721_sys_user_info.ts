import { AbstractMigration, ClientPostgreSQL } from "../../deps.ts";

export default class extends AbstractMigration<ClientPostgreSQL> {
  /** Runs on migrate */
  async up(): Promise<void> {
    await this.client.queryObject(`
    DROP TABLE IF EXISTS SYS_USER_INFO;
    CREATE TABLE SYS_USER_INFO(
        ID BIGINT NOT NULL,
        USER_ID BIGINT NOT NULL,
        WEIXIN_OPENID VARCHAR(40),
        WEIXIN_UNIONID VARCHAR(40),
        WEIXIN_USERINFO VARCHAR(800),
        ID_CARD VARCHAR(30),
        TENANT_ID BIGINT NOT NULL DEFAULT  '1',
        CREATE_DATE BIGINT NOT NULL,
        CREATE_USER_ID BIGINT NOT NULL,
        UPDATE_DATE BIGINT NOT NULL,
        UPDATE_USER_ID BIGINT NOT NULL,
        PRIMARY KEY (ID)
    );
    
    COMMENT ON TABLE SYS_USER_INFO IS '';
    COMMENT ON COLUMN SYS_USER_INFO.ID IS '主键ID';
    COMMENT ON COLUMN SYS_USER_INFO.USER_ID IS '用户ID:foreignKey';
    COMMENT ON COLUMN SYS_USER_INFO.WEIXIN_OPENID IS '微信openid:oneParam;listParam';
    COMMENT ON COLUMN SYS_USER_INFO.WEIXIN_UNIONID IS '微信unionid:oneParam;listParam';
    COMMENT ON COLUMN SYS_USER_INFO.WEIXIN_USERINFO IS '微信用户信息';
    COMMENT ON COLUMN SYS_USER_INFO.ID_CARD IS '身份证号:oneParam;listParam';
    COMMENT ON COLUMN SYS_USER_INFO.TENANT_ID IS '所属租户';
    COMMENT ON COLUMN SYS_USER_INFO.CREATE_DATE IS '创建时间';
    COMMENT ON COLUMN SYS_USER_INFO.CREATE_USER_ID IS '创建人';
    COMMENT ON COLUMN SYS_USER_INFO.UPDATE_DATE IS '更新时间';
    COMMENT ON COLUMN SYS_USER_INFO.UPDATE_USER_ID IS '更新人';
    
    `);
  }

  /** Runs on rollback */
  async down(): Promise<void> {
    await this.client.queryObject(`
            DROP table SYS_USER_INFO
        `);
  }
}
