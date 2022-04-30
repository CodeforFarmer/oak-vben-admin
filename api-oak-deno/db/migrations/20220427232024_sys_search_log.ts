import { AbstractMigration, ClientPostgreSQL } from "../../deps.ts";

export default class extends AbstractMigration<ClientPostgreSQL> {
  /** Runs on migrate */
  async up(): Promise<void> {
    await this.client.queryObject(`
    DROP TABLE IF EXISTS SYS_SEARCH_LOG;
    CREATE TABLE SYS_SEARCH_LOG(
        ID BIGINT NOT NULL,
        USER_ID BIGINT NOT NULL,
        SEARCH_CONTENT VARCHAR(250) NOT NULL,
        DELETE_ENUM SMALLINT NOT NULL DEFAULT  '1',
        TENANT_ID BIGINT NOT NULL DEFAULT  '1',
        CREATE_DATE BIGINT NOT NULL,
        CREATE_USER_ID BIGINT NOT NULL,
        DELETE_DATE BIGINT,
        DELETE_USER_ID BIGINT,
        PRIMARY KEY (ID)
    );
    
    COMMENT ON TABLE SYS_SEARCH_LOG IS '';
    COMMENT ON COLUMN SYS_SEARCH_LOG.ID IS '主键ID';
    COMMENT ON COLUMN SYS_SEARCH_LOG.USER_ID IS '搜索用户ID:foreignKey';
    COMMENT ON COLUMN SYS_SEARCH_LOG.SEARCH_CONTENT IS '搜索内容';
    COMMENT ON COLUMN SYS_SEARCH_LOG.DELETE_ENUM IS '删除状态:[1=未删除=NOT_DELETED,;2=已删除=DELETED]max=2';
    COMMENT ON COLUMN SYS_SEARCH_LOG.TENANT_ID IS '所属租户';
    COMMENT ON COLUMN SYS_SEARCH_LOG.CREATE_DATE IS '创建时间';
    COMMENT ON COLUMN SYS_SEARCH_LOG.CREATE_USER_ID IS '创建人';
    COMMENT ON COLUMN SYS_SEARCH_LOG.DELETE_DATE IS '删除时间';
    COMMENT ON COLUMN SYS_SEARCH_LOG.DELETE_USER_ID IS '删除人';
    
    `);
  }

  /** Runs on rollback */
  async down(): Promise<void> {
    await this.client.queryObject(`
            DROP table SYS_SEARCH_LOG
        `);
  }
}
