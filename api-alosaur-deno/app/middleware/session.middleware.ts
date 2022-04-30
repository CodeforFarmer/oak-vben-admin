import { DAYS_30 } from "../extend/jwt.ts";
import { SessionMiddleware } from "../../deps.ts";
import { config } from "../../config/index.ts";
import { RedisSession } from "../../db/redis_session.ts";

const sessionStore = new RedisSession(
  config.REDIS_HOST,
  parseInt(config.REDIS_PORT),
);
await sessionStore.init();

export const sessionMiddleware = new SessionMiddleware(
  sessionStore,
  { secret: 1122n, maxAge: DAYS_30, path: "/" },
);
