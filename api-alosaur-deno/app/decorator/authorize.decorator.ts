// import {
//     BusinessType,
//     container,
//     Content,
//     HttpContext,
//     getMetadataArgsStorage,
//     HookTarget,
//     getQueryParams
//   } from "../../deps.ts";


//   type AuthorizeRoleType = string | undefined;
  
//   /**
//    * Authorize decorator with role
//    */
//   export function CustomAuthorize(role?: AuthorizeRoleType): Function {
//     return function (object: any, methodName: string) {
//       // add hook to global metadata
//       getMetadataArgsStorage().hooks.push({
//         type: methodName ? BusinessType.Action : BusinessType.Controller,
//         object,
//         target: object.constructor,
//         method: methodName,
//         instance: container.resolve(AutorizeHook),
//         payload: role,
//       });
//     };
//   }
  
//   export class AutorizeHook implements HookTarget<unknown, AuthorizeRoleType> {
//     onPreAction(context: HttpContext<unknown>, role: AuthorizeRoleType) {
//       const queryParams = getQueryParams(context.request.url);
  
//       if (queryParams == undefined || queryParams.get("role") !== role) {
//         context.response.result = Content({ error: { token: false } }, 403);
//         context.response.setImmediately();
//       }
//     }
//   }