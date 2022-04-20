import { UserRole } from "./user_role.ts";

/** Request body to create user */
export type UserInfo = {
  /** user name */
  username: string;
  /** user email */
  email: string;
  /** user password */
  password: string;
  /** user roles */
  roles: [UserRole];
};
