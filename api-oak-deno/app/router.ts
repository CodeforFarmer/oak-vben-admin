import { Router,Context } from "../deps.ts";
import { configure, renderFile } from "../deps.ts";
import { config as SysConfig } from "../config/config.ts";
import * as authRoutes from "./controller/auth_controller.ts";
import * as userRoutes from "./controller/user_controller.ts";

// static files
configure({ views: "./public" });
async function sendFile(ctx: Context, data: any) {
  const fileName = ctx.request.url.pathname.split(".")[0] + ".eta";
  const file = await renderFile(`${fileName}`, data) as string;
  ctx.response.body = file;
  ctx.response.headers.set("Content-Type", "text/html");
}

const router: any = new Router();

router.get("/", (ctx: any) => {
  ctx.response.body = "Hello World!";
});

router
  .post("/login", ...authRoutes.login)
  .post("/register", ...authRoutes.register)
  .post("/token", ...authRoutes.refreshToken)
  .put("/users/:id", ...userRoutes.updateUser)
  .delete("/users/:id", ...userRoutes.deleteUser)
  .get("/users", ...userRoutes.getUsers)
  .get("/users/:id", ...userRoutes.getUserById)
  .get("/(.*\..*)", (ctx: Context) => sendFile(ctx, { siteName: SysConfig.SITE_NAME }));


export { router };
