import { Router } from "../deps.ts";

import * as authRoutes from "./controller/auth_controller.ts";
import * as userRoutes from "./controller/user_controller.ts";

// deno-lint-ignore no-explicit-any
const router: any = new Router();

router.get("/", (ctx: any) => {
  ctx.response.body = "Hello World!";
});

router
  .post("/login", ...authRoutes.login)
  .post("/register", ...authRoutes.register)
  .post("/token", ...authRoutes.refreshToken);

router
  .get("/users", ...userRoutes.getUsers)
  .get("/users/:id", ...userRoutes.getUserById)
  .put("/users/:id", ...userRoutes.updateUser)
  .delete("/users/:id", ...userRoutes.deleteUser);

export { router };
