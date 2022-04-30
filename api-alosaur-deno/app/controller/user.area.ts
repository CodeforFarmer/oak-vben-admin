import { Controller, Get,Area,ResponseCache } from "../../deps.ts";
import { UserService } from "../service/user.service.ts";

@Controller("/user")
export class UserController {
  constructor(private service: UserService) {}

  @ResponseCache({ duration: 2000 })
  @Get("/list")
  async text() {
    return await this.service.getUsers();
  }
}


@Area({
  controllers: [UserController],
})
export class UserArea {
}
