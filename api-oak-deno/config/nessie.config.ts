import { ClientPostgreSQL, NessieConfig } from "../deps.ts";
import { config as SysConfig } from "./config.ts";

/** Select one of the supported clients */
const client = new ClientPostgreSQL({
  database: SysConfig.DB_NAME,
  hostname: SysConfig.DB_HOST,
  port: parseInt(SysConfig.DB_PORT),
  user: SysConfig.DB_USER,
  password: SysConfig.DB_PASS,
});

// const client = new ClientMySQL({
//     hostname: "localhost",
//     port: 3306,
//     username: "root",
//     // password: "pwd", // uncomment this line for <8
//     db: "nessie",
// });

// const client = new ClientSQLite("./sqlite.db");

/** This is the final config object */
const config: NessieConfig = {
  client,
  migrationFolders: [SysConfig.NESSIE_MIGRATION_FOLDERS],
  seedFolders: [SysConfig.NESSIE_SEED_FOLDERS],
};

export default config;
