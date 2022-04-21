import { AbstractSeed, ClientPostgreSQL, Info } from "../../deps.ts";

export default class extends AbstractSeed<ClientPostgreSQL> {
  /** Runs on seed */
  async run(info: Info): Promise<void> {
    let count = 1;
    while (count !== 100) {
      await this.client.queryObject(
        `
            INSERT INTO sys_user (
                username,
                password,
                email,
                created_on,
                last_login,
                avatar,
                bio,
                wallet,
                realname
            ) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9);
          `,
        `user${count}`,
        "$2a$10$Ha7shP2TNTmTR9tC8xdXg.Vta3w6IaHYnMNOxxfl5EG.cdwVFnTlW",
        "user${count}@hotmail.com",
        "2020-05-14 20:03:56.025651",
        null,
        "https://static.productionready.io/images/smiley-cyrus.jpg",
        null,
        "0x0000000000000000000000000000000000000000",
        `namee${count}`,
      );
      count++;
    }
  }
}
