import { App, CorsBuilder } from "./deps.ts";
import { settings } from "./app/app_settings.ts";
import { authMiddleware } from "./app/middleware/auth.middleware.ts";
import { sessionMiddleware } from "./app/middleware/session.middleware.ts";

const app = new App(settings);

app.useCors(
  new CorsBuilder()
    .AllowAnyOrigin()
    .AllowAnyMethod()
    .AllowAnyHeader(),
);
app.use(new RegExp("/"), sessionMiddleware);
app.use(new RegExp("/"), authMiddleware);
app.listen(":18000");
