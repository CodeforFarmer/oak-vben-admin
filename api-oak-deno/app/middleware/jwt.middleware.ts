import { Middleware, validateJwt } from "../../deps.ts";
import { config } from "../../config/config.test.ts";

type AuthUser = {
  /** user id */
  id: number;
  /** user email address */
  email: string;
  /** user name */
  name: string;
  /** user roles */
  roles: string;
};

/** *
 * JWTAuth middleware
 * Decode authorization bearer token
 * and attach as an user in application context
 */
export const JWTAuthMiddleware: Middleware = async function (ctx, next) {
  try {
    const authHeader = ctx.request.headers.get("Authorization");
    if (authHeader) {
      const token = authHeader.replace(/^bearer/i, "").trim();
      const user = await validateJwt(token, config.jwt.secret);

      if (user) {
        //@todo memory => redis
        ctx.user = user as AuthUser;
      }
    }
  } catch (err) {}

  await next();
};
