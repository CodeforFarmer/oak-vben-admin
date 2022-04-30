import { getUsersOver,getUserByUnsafeApi } from "./user.ts";


// console.log( await getUsersOver(1514736123457));
await Deno.writeTextFile("./hey.json", JSON.stringify(await getUserByUnsafeApi(1514736123457,1)));