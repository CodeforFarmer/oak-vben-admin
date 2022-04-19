import { create, Header, Payload, validateJwt } from "../../deps.ts";
import { config } from "../../config/config.test.ts";

const header: Header = {
  alg: "HS256",
  typ: "JWT",
};

const getAuthToken = async (user: any) => {
  const payload: Payload = {
    iss: "deno-api",
    id: user.id,
    name: user.name,
    email: user.email,
    roles: user.roles,
    exp: new Date().getTime() + parseInt(config.jwt.access_token_exp),
  };

  return await create(header, payload, config.jwt.secret);
};

const getRefreshToken = async (user: any) => {
  const payload: Payload = {
    iss: "deno-api",
    id: user.id,
    exp: new Date().getTime() + parseInt(config.jwt.refresh_token_exp),
  };
  return await create(header, payload, config.jwt.secret);
};

const getJwtPayload = async (token: string): Promise<any | null> => {
  try {
    const jwtObject = await validateJwt(token, config.jwt.secret);
    if (jwtObject && jwtObject.payload) {
      return jwtObject.payload;
    }
  } catch (err) {}
  return null;
};

export { getAuthToken, getJwtPayload, getRefreshToken };
