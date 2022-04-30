import postgres from "https://deno.land/x/postgresjs/mod.js";

const sql = postgres({
  host: "127.0.0.1", // Postgres ip address[s] or domain name[s]
  port: 57057, // Postgres server port[s]
  database: "nessie", // Name of database to connect to
  username: "root", // Username of database user
  password: "123456", // Password of database user
  ssl: false,
  max: 10, // Max number of connections  Pool
  idle_timeout: 1, // Idle connection timeout in seconds
  connect_timeout: 30, // Connect timeout in seconds
  prepare: true,      // sql.unsafe(query,{prepare:true})
  transform: { column: { to: postgres.fromCamel, from: postgres.toCamel } },
});
export default sql;
