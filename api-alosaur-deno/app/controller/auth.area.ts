import { AuthService, UserModel } from "../service/auth.service.ts";
import { JWTSchema } from "../extend/jwt.ts";
import {
  Area,
  Authorize,
  Body,
  Controller,
  Ctx,
  Get,
  Post,
  SecurityContext,
} from "../../deps.ts";

interface LoginModel {
  login: string;
  password: string;
}

@Controller("/account")
export class AuthenticationController {
  constructor(private service: AuthService) {}

  @Post("/login")
  async postLogin(
    @Ctx() context: SecurityContext,
    @Body() account: LoginModel,
  ) {
    const user = this.service.validate(account.login, account.password);

    if (user) {
      const result = await context.security.auth.signInAsync<
        UserModel,
        unknown
      >(JWTSchema, user);
      console.log(result);
      return result;
    }

    await context.request.serverRequest.respondWith(
      new Response(null, { status: 401 }),
    );
  }

  @Get("/logout")
  async logOut(@Ctx() context: SecurityContext) {
    await context.security.auth.signOutAsync(JWTSchema);
    await context.request.serverRequest.respondWith(
      new Response(null, { status: 401 }),
    );
  }

  @Authorize(JWTSchema)
  @Get("/protected")
  getProtectedData() {
    return "Hi! this protected info. <br>  <a href='/account/logout'>logout</a>";
  }
}

@Area({
  controllers: [AuthenticationController],
})
export class AuthenticationArea {}
