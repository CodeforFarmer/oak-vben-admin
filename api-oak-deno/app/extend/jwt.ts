import { Algorithm, create, Header, Payload, verify } from "../../deps.ts";
import { config } from "../../config/config.ts";
import { JwtMiddlewareOptions } from "../middleware/jwt.middleware.ts";

const SECRET = await crypto.subtle.generateKey(
  { name: "HMAC", hash: "SHA-512" },
  true,
  ["sign", "verify"],
);
const ALGORITHM: Algorithm = "HS512";
const jwtOptions: JwtMiddlewareOptions = {
  key: SECRET,
  algorithm: ALGORITHM,
};
const header: Header = {
  alg: ALGORITHM,
  typ: "jwt",
};

const getAuthToken = async (user: any) => {
  const payload: Payload = {
    iss: "deno-api",
    id: user.id,
    name: user.name,
    email: user.email,
    roles: user.roles,
    exp: new Date().getTime() + parseInt(config.JWT_ACCESS_TOKEN_EXP),
  };

  return await create(header, payload, SECRET);
};

const getRefreshToken = async (user: any) => {
  const payload: Payload = {
    iss: "deno-api",
    id: user.id,
    exp: new Date().getTime() + parseInt(config.JWT_REFRESH_TOKEN_EXP),
  };
  return await create(header, payload, SECRET);
};

const getJwtPayload = async (token: string): Promise<any | null> => {
  try {
    const jwtObject = await verify(token, SECRET);
    if (jwtObject && jwtObject.payload) {
      return jwtObject.payload;
    }
  } catch (err) {}
  return null;
};

const getHash = async (src: string) => {
  const strBytes = new TextEncoder().encode(src);
  const rawHash = await crypto.subtle.digest("SHA-1", strBytes);
  const bufArr = new Uint8Array(rawHash);
  const hexString = Array.from(bufArr).map((b) =>
    b.toString(16).padStart(2, "0")
  ).join("");
  return hexString;
};


//Cleanup expired JWTs
setInterval(async () => {
  for (let i = 0; i < localStorage.length; i++) {
    const token = localStorage.key(i);
    if (!token) continue;
    try {
      await verify(token, SECRET);
    } catch (e) {
      localStorage.removeItem(token);
    }
  }
}, 100000);

export { getAuthToken, getHash, getJwtPayload, getRefreshToken, jwtOptions };
