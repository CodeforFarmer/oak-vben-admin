export const config = {
  database: {
    user: "root",
    password: "pwd",
    database: "nessie",
    hostname: "127.0.0.1",
    port: 5432,
  },
  redis: {
    hostname: "127.0.0.1",
    port: 6379,
  },
  app: {
    env: "test",
    port: 18000,
  },
  jwt: {
    secret: "HEGbulKGDblAFYskBLml",
    access_token_exp: "600000",
    refresh_token_exp: "3600000"
  },
};
