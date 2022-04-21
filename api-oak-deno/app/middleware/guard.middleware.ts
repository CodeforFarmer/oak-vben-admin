import { Context, httpErrors } from "../../deps.ts";
import { hasUserRole } from "../extend/roles.ts";
import { UserRole } from "../type/user_role.ts";

/**
 * has user role middleware
 * checks authorization for context user, user roles
 */
const userGuard = (roles?: UserRole | UserRole[]) => {
  return async (ctx: Context, next: () => Promise<void>) => {
    // if auth user not found, throw error
    const user = ctx.state.cur_user;
    if (!user) {
      throw new httpErrors.Unauthorized("Unauthorized user");
    }

    //if roles specified, then check auth user's roles
    if (roles) {
      const isRoleMatched = hasUserRole(user, roles);

      //if no role mached throw forbidden error
      if (!isRoleMatched) {
        throw new httpErrors.Forbidden("Forbidden user role");
      }
    }

    await next();
  };
};

export { userGuard };
