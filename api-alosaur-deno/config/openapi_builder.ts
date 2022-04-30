import { AlosaurOpenApiBuilder } from "../deps.ts";
import { settings } from "../app/app_settings.ts";

const docs = await AlosaurOpenApiBuilder.parseDenoDoc(
  "app/app_settings.ts",
);

// Register without add deno doc
export const OpenApiBuilder = AlosaurOpenApiBuilder.create(settings)
  .addDenoDocs(docs)
  .registerControllers()
  .addSchemeComponents()
  .addTitle("Basic Application")
  .addVersion("1.0.0")
  .addDescription("We All Gonna Make It")
  .addServer({
    url: "http://localhost:18848",
    description: "Local server",
  });
