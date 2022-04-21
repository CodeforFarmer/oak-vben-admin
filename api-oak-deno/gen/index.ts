const { cwd, stdout } = Deno;

import { copy, renderFile } from "../deps.ts";

(async () => {
  const output = await renderFile(`${cwd()}\\index.ejs`, {
    name: "world",
  });
  await copy(output, stdout);
})();
