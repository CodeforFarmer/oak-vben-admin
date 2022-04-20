import { AuthUser } from "../type/auth_user.ts";
import { UserRole } from "../type/user_role.ts";

const hasUserRole = (user: AuthUser, roles: UserRole | UserRole[]) => {
  const userRoles = user.roles.split(",")
    .map((role) => role.trim());

  if (typeof (roles) == "string") {
    roles = [roles];
  }

  let isRoleMatched = false;
  roles.forEach((role) => {
    if (userRoles.includes(role)) {
      isRoleMatched = true;
    }
  });

  return isRoleMatched;
};

export { hasUserRole };
