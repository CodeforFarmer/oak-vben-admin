import { AbstractMigration, ClientPostgreSQL } from "../../deps.ts";

export default class extends AbstractMigration<ClientPostgreSQL> {
  /** Runs on migrate */
  async up(): Promise<void> {
    await this.client.queryObject(`
    DROP TABLE IF EXISTS REL_DEPT_USER;
    CREATE TABLE REL_DEPT_USER(
        ID BIGINT NOT NULL,
        DEPT_ID BIGINT NOT NULL,
        USER_ID BIGINT NOT NULL,
        TENANT_ID BIGINT NOT NULL DEFAULT  '1',
        CREATE_DATE BIGINT NOT NULL,
        CREATE_USER_ID BIGINT NOT NULL,
        PRIMARY KEY (ID)
    );
    
    COMMENT ON TABLE REL_DEPT_USER IS '';
    COMMENT ON COLUMN REL_DEPT_USER.ID IS '主键ID';
    COMMENT ON COLUMN REL_DEPT_USER.DEPT_ID IS '部门ID:foreignKey';
    COMMENT ON COLUMN REL_DEPT_USER.USER_ID IS '用户ID:foreignKey';
    COMMENT ON COLUMN REL_DEPT_USER.TENANT_ID IS '所属租户';
    COMMENT ON COLUMN REL_DEPT_USER.CREATE_DATE IS '创建时间';
    COMMENT ON COLUMN REL_DEPT_USER.CREATE_USER_ID IS '创建人';
    

    `);
  }

  /** Runs on rollback */
  async down(): Promise<void> {
    await this.client.queryObject(`
            DROP table REL_DEPT_USER
        `);
  }
}
