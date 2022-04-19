import { Application, oakCors } from "./deps.ts";
import * as middlewares from "./app/middleware/index.ts";
import { config } from "./config/config.test.ts";

const app = new Application();

app.use(oakCors());
// app.use(session.initMiddleware())

app.use(middlewares.loggerMiddleware);
app.use(middlewares.errorMiddleware);
app.use(middlewares.responseTimeHeader);

// app.use(middlewares.JWTAuthMiddleware);
app.use(middlewares.requestIdMiddleware);
app.addEventListener(
  "listen",
  (e) => console.log(`Listening on http://localhost:${config.app.port}`),
);

await app.listen({ port: config.app.port });
