import { UserModel } from "../model/user_model.ts";
import { httpErrors } from "../../deps.ts";
import { encript } from "../extend/encription.ts";

/**
 * get user by id
 */
export const getUserById = async (id: number) => {
  const user = await UserModel.where({ "id": id });
  if (!user) {
    throw new httpErrors.NotFound("User not found");
  }

  return user;
};

/**
 * get users list
 */
export const getUsers = async () => {
  const users = await UserModel.where({});
  return users;
};

/**
 * update user
 */
export const updateUser = async (id: number, userData: any) => {
  // todo: validation
  try {
    const user = new UserModel(
      userData.username,
      userData.password,
      userData.email,
      userData.bio,
      userData.avatar,
      userData.wallet,
      userData.realname,
      id,
    );
    const result = await user.update();
    if (result) {
      return user;
    } else {
      throw new httpErrors.NotFound("User not found");
    }
  } catch (err) {
    const { message } = err;
    if (message.match("email_unique")) {
      throw new httpErrors.BadRequest(
        `Already user exists with email ${userData.email}`,
      );
    }
    throw err;
  }
};

/**
 * delete user
 */
export const deleteUser = async (id: number) => {
  // todo: catch db error
  const result = await new UserModel("", "", "", "", "", "", "", Number(id))
    .delete();
  if (!result) {
    throw new httpErrors.NotFound("User not found");
  }
};
