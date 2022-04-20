import {
  Context,
  helpers,
  httpErrors,
  isEmail,
  required,
  Status,
} from "../../deps.ts";

import { requestValidator, userGuard } from "../middleware/index.ts";
import { UserRole } from "../type/user_role.ts";
import { hasUserRole } from "../extend/roles.ts";
import * as userService from "../service/user.service.ts";

/** request body schema for user create/update */
const userSchema = {
  username: [required],
  email: [required, isEmail],
};

/**
 * get list of users
 * call by ADMIN
 */
const getUsers = [
  userGuard(UserRole.ADMIN),
  async (ctx: Context) => {
    const users = await userService.getUsers();
    ctx.response.body = users;
  },
];

/**
 * get user by id
 * call by ADMIN
 */
const getUserById = [
  userGuard(UserRole.ADMIN),
  async (ctx: Context) => {
    const { id } = helpers.getQuery(ctx, { mergeParams: true });
    const user = await userService.getUserById(Number(id));
    ctx.response.body = user.length !== 0 ? user[0] : null;
  },
];

/**
 * update user
 * call by user himselft or ADMIN
 */
const updateUser = [
  userGuard(),
  /** request validation middleware */
  requestValidator({ bodyRules: userSchema }),
  /** router handler */
  async (ctx: Context) => {
    /** get user id from params */
    const params = helpers.getQuery(ctx, { mergeParams: true });
    const id = Number(params.id);

    /** auth user */
    const authUser = ctx.state.cur_user;

    if (authUser) {
      if (id === authUser.id || hasUserRole(authUser, UserRole.ADMIN)) {
        const request = ctx.request;
        const body = request.body();
        const userData = await body.value;
        const user = await userService.updateUser(id, userData);
        ctx.response.body = user;
        return;
      }
    }

    throw new httpErrors.Forbidden("Forbidden user role");
  },
];

/**
 * Delete user by admin user
 */
const deleteUser = [
  userGuard(UserRole.ADMIN),
  async (ctx: Context) => {
    const { id } = helpers.getQuery(ctx, { mergeParams: true });
    await userService.deleteUser(Number(id));
    ctx.response.status = Status.NoContent;
  },
];

export { deleteUser, getUserById, getUsers, updateUser };
