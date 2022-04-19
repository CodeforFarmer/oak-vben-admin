const { cwd, stdout } = Deno;

import { renderFile,copy } from "../deps.ts";

(async () => {
  const output = await renderFile(`${cwd()}\\index.ejs`, {
    name: "world"
  });
  await copy(output, stdout);
})();