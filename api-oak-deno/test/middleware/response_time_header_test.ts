// Copyright 2020 the oak authors. All rights reserved. MIT license.

import { assert, assertEquals, Context } from "../../deps.ts";
import { responseTimeHeader } from "../../app/middleware/response_time_header.ts";

Deno.test({
  name: "responseTimeHeader",
  async fn() {
    const mockContext = {
      response: {
        headers: new Headers(),
      },
    } as Context;
    const mockNext = () => {
      return new Promise<void>((resolve) => {
        setTimeout(() => {
          resolve();
        }, 50);
      });
    };
    await responseTimeHeader(mockContext, mockNext);
    assertEquals(mockContext.response.headers.has("x-response-time"), true);
    const value = parseInt(
      mockContext.response.headers.get("x-response-time")!,
      10,
    );
    assert(value >= 50);
  },
});
