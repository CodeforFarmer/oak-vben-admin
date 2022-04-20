import { httpErrors } from "../../deps.ts";
import * as encription from "../extend/encription.ts";
import * as jwt from "../extend/jwt.ts";
import {
  CreateUser,
  LoginCredential,
  UserInfo,
  UserRole,
} from "../type/index.ts";
import { UserModel } from "../model/user_model.ts";

/**
 * register user
 */
export const registerUser = async (userData: CreateUser) => {
  try {
    /** encript user's plain password */
    const { password } = userData;
    userData.password = await encription.encript(password);
    /** add default user role */
    const userInfo: UserInfo = { roles: [UserRole.USER], ...userData };
    
    const user = new UserModel(
      userInfo.username,
      userInfo.password,
      userInfo.email,
    );
    return await user.save();
  } catch (err) {
    /** handle duplicate email issue */
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
 * login user
 */
export const loginUser = async (credential: LoginCredential) => {
  /** find user by email */
  const { email, password } = credential;
  const userModels = await UserModel.where({ email: email });

  if (userModels.length !== 0) {
    /** check user active status */
    // if (user["is_active"]) {
    /** check password */
    const user = userModels[0];
    const passHash = user.password;
    const isValidPass = await encription.compare(password, passHash);
    /** return token */
    if (isValidPass) {
      return {
        "access_token": jwt.getAuthToken(user),
        "refresh_token": jwt.getRefreshToken(user),
      };
    }
    // }
  }

  throw new httpErrors.Unauthorized("Wrong credential");
};

export const refreshToken = async (token: string) => {
  try {
    // todo: check token intention
    const payload = await jwt.getJwtPayload(token);
    if (payload) {
      /** get user from token */
      const id = payload.id as number;
      const userModels = await UserModel.where({ id: id });
      if (userModels.length !== 0) {
        /** check user active status */
        const user = userModels[0];
        // if (!user["is_active"]) {
        //   throw new httpErrors.Unauthorized("Inactive user status");
        // }
        return {
          "access_token": jwt.getAuthToken(user),
          "refresh_token": jwt.getRefreshToken(user),
        };
      }
    }
  } catch (err) {
    throw new httpErrors.Unauthorized("Invalid token object");
  }
};
