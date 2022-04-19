import {
    ClientPostgreSQL,
    NessieConfig,
} from "../deps.ts";
import { config as DBConfig } from "./config.test.ts";

/** Select one of the supported clients */
const client = new ClientPostgreSQL({
    database: DBConfig.database.database,
    hostname: DBConfig.database.hostname,
    port: DBConfig.database.port,
    user: DBConfig.database.user,
    password: DBConfig.database.password,
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
    migrationFolders: ["./db/migrations"],
    seedFolders: ["./db/seeds"],
};

export default config;
