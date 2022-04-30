import { HomeArea } from "./controller/home.area.ts";
import { AuthenticationArea } from "./controller/auth.area.ts";
import { ProductArea } from "./controller/product.area.ts";
import { UserArea } from "./controller/user.area.ts";
import { Log } from "./middleware/log.middleware.ts";
import { SecurityContext,HttpContext,AppSettings,MemoryResponseCacheStore, ResponseCacheStoreToken } from "../deps.ts";

export const settings: AppSettings = {
  areas: [HomeArea, AuthenticationArea, ProductArea,UserArea],
  middlewares: [Log],
  logging: false,
  providers: [{
    token: ResponseCacheStoreToken,
    useClass: MemoryResponseCacheStore,
  },{
    token: HttpContext,
    useClass: SecurityContext,
  }],
};
