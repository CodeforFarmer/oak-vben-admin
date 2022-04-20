/** Request body to create user */
export type CreateUser = {
  /** user name */
  username: string;
  /** user email */
  email: string;
  /** user password */
  password: string;
  /** roles */
};
