import { Middleware } from "../../deps.ts";

/** A middleware that will set the response time for other middleware in
 * milliseconds as `X-Response-Time` which can be used for diagnostics and other
 * instrumentation of an application.  Utilise the middleware before the "real"
 * processing occurs.
 * @param ctx
 * @param next
 */
export const responseTimeHeader: Middleware = async function (ctx, next) {
  const start = Date.now();
  await next();
  const ms = Date.now() - start;
  ctx.response.headers.set("X-Response-Time", `${ms}ms`);
};