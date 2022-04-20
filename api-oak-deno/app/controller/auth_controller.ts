import { Context, isEmail, lengthBetween, required } from "../../deps.ts";
import * as authService from "../service/auth.service.ts";
import { requestValidator } from "../middleware/validator.middleware.ts";

/**
 * request body schema
 * for user create/update
 */
const registrationSchema = {
  username: [required],
  email: [required, isEmail],
  password: [required, lengthBetween(6, 12)],
};

//todo: add validation alphanumeric, spechal char

/**
 * register user
 */
const register = [
  /** request validation middleware */
  requestValidator({ bodyRules: registrationSchema }),
  /** router handler */
  async (ctx: Context) => {
    const request = ctx.request;
    const body = request.body();
    const userData = await body.value;
    ctx.response.body = await authService.registerUser(userData);
  },
];

/**
 * login body schema
 * for user create/update
 */
const loginSchema = {
  email: [required, isEmail],
  password: [required, lengthBetween(6, 12)],
};

const login = [
  /** request validation middleware */
  requestValidator({ bodyRules: loginSchema }),
  /** router handler */
  async (ctx: Context) => {
    const request = ctx.request;
    const body = request.body();
    const credential = await body.value;
    const token = await authService.loginUser(credential);
    ctx.response.body = token;
  },
];

const refreshTokenSchema = {
  refresh_token: [required],
};
const refreshToken = [
  /** request validation middleware */
  requestValidator({ bodyRules: refreshTokenSchema }),
  /** router handler */
  async (ctx: Context) => {
    const request = ctx.request;
    const body = request.body();
    const data = await body.value;
    const token = await authService.refreshToken(
      data["refresh_token"],
    );
    ctx.response.body = token;
  },
];

export { login, refreshToken, register };
