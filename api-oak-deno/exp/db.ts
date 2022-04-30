import postgres from 'https://deno.land/x/postgresjs/mod.js'
// import { config } from "../config/config.ts";

const sql = postgres( {
  host                 : "127.0.0.1",            // Postgres ip address[s] or domain name[s]
  port                 : 57057,       // Postgres server port[s]
  database             : "nessie",           // Name of database to connect to
  username             : "root",           // Username of database user
  password             : "123456",          // Password of database user
  ssl                  : false,
  transform: { column: { to: postgres.fromCamel, from: postgres.toCamel } }
})
export default sql