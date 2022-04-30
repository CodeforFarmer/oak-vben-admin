import { RateLimiter } from "../deps.ts";

export const rateLimit = RateLimiter({
    //store: STORE, // Using MapStore by default.
    windowMs: 1000, // Window for the requests that can be made in miliseconds.
    max: 10, // Max requests within the predefined window.
    headers: true, // Default true, it will add the headers X-RateLimit-Limit, X-RateLimit-Remaining.
    message: "Too many requests, please try again later.", // Default message if rate limit reached.
    statusCode: 429, // Default status code if rate limit reached.
  });
  