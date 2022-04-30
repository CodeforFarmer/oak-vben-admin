import { AbstractMigration, ClientPostgreSQL } from "../../deps.ts";

export default class extends AbstractMigration<ClientPostgreSQL> {
  /** Runs on migrate */
  async up(): Promise<void> {
    await this.client.queryObject(`
    DROP TABLE IF EXISTS SYS_CITY_AREA;
    CREATE TABLE SYS_CITY_AREA(
        ID BIGINT NOT NULL,
        PARENT_ID BIGINT NOT NULL,
        PARENT_IDS VARCHAR(250) NOT NULL,
        AREA_NAME VARCHAR(100) NOT NULL,
        RANKING SMALLINT NOT NULL DEFAULT  '100',
        TENANT_ID BIGINT NOT NULL DEFAULT  '1',
        CREATE_DATE BIGINT NOT NULL,
        CREATE_USER_ID BIGINT NOT NULL,
        PRIMARY KEY (ID)
    );
    
    COMMENT ON TABLE SYS_CITY_AREA IS '';
    COMMENT ON COLUMN SYS_CITY_AREA.ID IS '主键ID:也是地区编码';
    COMMENT ON COLUMN SYS_CITY_AREA.PARENT_ID IS '父ID';
    COMMENT ON COLUMN SYS_CITY_AREA.PARENT_IDS IS '父ID集:多个层级用英文逗号隔开';
    COMMENT ON COLUMN SYS_CITY_AREA.AREA_NAME IS '地区名称:treeName';
    COMMENT ON COLUMN SYS_CITY_AREA.RANKING IS '排序:排序值越小越排前;max=100';
    COMMENT ON COLUMN SYS_CITY_AREA.TENANT_ID IS '所属租户';
    COMMENT ON COLUMN SYS_CITY_AREA.CREATE_DATE IS '创建时间';
    COMMENT ON COLUMN SYS_CITY_AREA.CREATE_USER_ID IS '创建人';
     
    `);
  }

  /** Runs on rollback */
  async down(): Promise<void> {
    await this.client.queryObject(`
            DROP table SYS_CITY_AREA
        `);
  }
}
