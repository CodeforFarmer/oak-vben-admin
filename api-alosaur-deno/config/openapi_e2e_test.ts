import { assertEquals,readAllSync } from "../deps.ts";
import { OpenApiBuilder } from "./openapi_builder.ts";

const { test } = Deno;

test({
  name: "[openapi] snapshot test",
  fn(): void {
    const builder = OpenApiBuilder;
    assertEquals(1, 1);

    const f = Deno.openSync(
      "config/openapi.text.snapshot",
      { read: true },
    );
    const buffer = readAllSync(f);
    const snapshot = new TextDecoder().decode(buffer);
    f.close();

    assertEquals(snapshot, JSON.stringify(builder.getSpec()));
  },
});
