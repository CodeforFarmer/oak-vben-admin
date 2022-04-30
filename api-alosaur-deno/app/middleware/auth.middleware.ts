import { JWTSchema } from "../extend/jwt.ts";
import { AuthMiddleware } from "../../deps.ts";

export const authMiddleware = new AuthMiddleware(
  [JWTSchema],
);
