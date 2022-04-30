import sql from "../../db/index.ts";
import { Injectable } from "../../deps.ts";

export interface User {
  name: string;
  age: number;
}

@Injectable()
export class UserService {
  async getUsers() {
    const users = await sql`SELECT * FROM sys_user`;
    return users;
  }
}
