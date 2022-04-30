import { AbstractMigration, ClientPostgreSQL } from "../../deps.ts";

export default class extends AbstractMigration<ClientPostgreSQL> {
  /** Runs on migrate */
  async up(): Promise<void> {
    await this.client.queryObject(`
    DROP TABLE IF EXISTS REL_PERMISSION_ROLE;
    CREATE TABLE REL_PERMISSION_ROLE(
        ID BIGINT NOT NULL,
        PERMISSION_ID BIGINT NOT NULL,
        ROLE_ID BIGINT NOT NULL,
        TENANT_ID BIGINT NOT NULL DEFAULT  '1',
        CREATE_DATE BIGINT NOT NULL,
        CREATE_USER_ID BIGINT NOT NULL,
        PRIMARY KEY (ID)
    );
    
    COMMENT ON TABLE REL_PERMISSION_ROLE IS '';
    COMMENT ON COLUMN REL_PERMISSION_ROLE.ID IS '主键ID';
    COMMENT ON COLUMN REL_PERMISSION_ROLE.PERMISSION_ID IS '权限ID:foreignKey';
    COMMENT ON COLUMN REL_PERMISSION_ROLE.ROLE_ID IS '角色ID:foreignKey';
    COMMENT ON COLUMN REL_PERMISSION_ROLE.TENANT_ID IS '所属租户';
    COMMENT ON COLUMN REL_PERMISSION_ROLE.CREATE_DATE IS '创建时间';
    COMMENT ON COLUMN REL_PERMISSION_ROLE.CREATE_USER_ID IS '创建人';
    
    `);
  }

  /** Runs on rollback */
  async down(): Promise<void> {
    await this.client.queryObject(`
            DROP table REL_PERMISSION_ROLE
        `);
  }
}
