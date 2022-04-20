// import { Context as OakContext } from "../../deps.ts";
import { AuthUser } from "../type/auth_user.ts";

/**
 *   const app = new Application<{ foo: string }>();
 *   const app = new Application({ state: { foo: "bar" } });
 */
export interface Context {
  cur_user: AuthUser;
}
