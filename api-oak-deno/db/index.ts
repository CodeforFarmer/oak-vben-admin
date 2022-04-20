import { Pool } from "../deps.ts";
import { config } from "../config/config.ts";

export const pool = new Pool(
  {
    database: config.DB_NAME,
    hostname: config.DB_HOST,
    port: parseInt(config.DB_PORT),
    user: config.DB_USER,
    password: config.DB_PASS,
    tls: {
      enforce: false,
    },
  },
  parseInt(config.DB_CONN),
  Boolean(config.DB_LAZY),
);
