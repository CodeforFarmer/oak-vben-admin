import { AbstractMigration, ClientPostgreSQL } from "../../deps.ts";

export default class extends AbstractMigration<ClientPostgreSQL> {
  /** Runs on migrate */
  async up(): Promise<void> {
    await this.client.queryObject(`
      CREATE TABLE sys_user (
          id SERIAL PRIMARY KEY,
          username character varying(50) NOT NULL,
          password character varying(100) NOT NULL,
          realname character varying(50) NOT NULL,
          avatar character varying DEFAULT 'https://static.productionready.io/images/smiley-cyrus.jpg'::character varying NOT NULL,
          bio character varying(280),
          email character varying(355) NOT NULL,
          wallet character varying(260) NOT NULL,
          created_on timestamp without time zone,
          last_login timestamp without time zone
      );
    `);
  }

  /** Runs on rollback */
  async down(): Promise<void> {
    await this.client.queryObject(`
            DROP table sys_user
        `);
  }
}
