import { isHttpError, Middleware, Status } from "../../deps.ts";
import { config } from "../../config/config.ts";
export const errorMiddleware: Middleware = async function (ctx, next) {
  try {
    await next();
  } catch (err) {
    let message = err.message;
    const status = err.status || err.statusCode || Status.InternalServerError;

    /**
     * considering all unhandled errors as internal server error,
     * do not want to share internal server errors to
     * end user in non "prod" mode
     */
    if (!isHttpError(err)) {
      message = config.ENV === "test" ? message : "Internal Server Error";
    }

    if (config.ENV === "test") {
      console.log(err);
    }

    ctx.response.status = status;
    ctx.response.body = { status, message };
  }
};
