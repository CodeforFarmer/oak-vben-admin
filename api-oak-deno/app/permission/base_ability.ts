import { assert, log } from "../../deps.ts";
// import { config as CanCanConfig } from "../config/config.ts";

export interface CheckRecordOptions extends Record<string, any> {
  type: string;
  // ...支持动态添加属性 <string,any>
}

type LoggerObject = {
  action: string;
  type: string;
  allow: boolean;
  cache: string;
  object: any;
};

class CanCanAccessDenied extends Error {
  private _action: string;
  private _object: any;
  private _type: string;

  constructor(msg: string) {
    super(msg);
    this._action = "";
    this._object = {};
    this._type = "";
  }
  set type(type: string) {
    this._type = type;
  }
  get type() {
    return this._type;
  }
  set object(object: any) {
    this._object = object;
  }
  get object() {
    return this._object;
  }

  set action(action: string) {
    this._action = action;
  }
  get action() {
    return this._action;
  }

  get name() {
    return "CanCanAccessDenied";
  }
}

abstract class BaseAbility {
  private _cache: Record<string, any>;

  constructor(
    public ctx: any,
    public user: any,
    public logEnable: boolean = false,
    public cacheEnable: boolean = true,
  ) {
    this.ctx = ctx;
    this.user = user || null;
    this._cache = {};

    this.logEnable = logEnable;
    this.cacheEnable = cacheEnable;
    // this.logEnable = Boolean(CanCanConfig.LOG_ENABLE) || logEnable;
    // this.cacheEnable = Boolean(CanCanConfig.CACHE_ENABLE) || cacheEnable;
  }

  get CanCanAccessDenied() {
    return CanCanAccessDenied;
  }

  async authorize(action: string, obj: any, options: CheckRecordOptions) {
    const result = await this.check(action, obj, options);
    if (result.allow) return;

    const err = new CanCanAccessDenied(
      "Access denied",
    );
    err.action = result.action;
    err.object = result.object;
    err.type = result.type;

    throw err;
  }

  async abilities(obj: any, options: CheckRecordOptions) {
    const [read, update, _delete] = await Promise.all([
      this.can("read", obj, options),
      this.can("update", obj, options),
      this.can("delete", obj, options),
    ]);

    return { read, update, delete: _delete };
  }

  async can(action: string, obj: any, options: CheckRecordOptions) {
    const { allow } = await this.check(action, obj, options);
    return allow;
  }

  async check(action: string, obj: any, options: CheckRecordOptions) {
    // action must provide
    assert(action, "action required, for example: ctx.can('read', doc)");

    let { type } = options;
    // For egg-sequelize Model instance
    if (!type) {
      if (obj && obj.Model) {
        type = obj.Model.name;
      }
    }

    // can('read', null) always return false
    if (!obj) return { allow: false, action, type, object: obj };

    assert(
      type,
      "Fail get type from obj argument, please present its by options, for example: ctx.can('read', topic, { type: 'topic' })",
    );

    switch (action) {
      case "show":
        action = "read";
        break;
      case "new":
        action = "create";
        break;
      case "edit":
        action = "update";
        break;
      case "destroy":
        action = "delete";
        break;
      default:
        break;
    }
    options.type = type;

    if (!this.cacheEnable) {
      const allow = await this.rules(action, obj, options);
      this.logger({ action, type, allow, cache: "unuse", object: obj });
      return { allow, action, type, object: obj };
    }

    const cacheKey = this.cacheKey(action, obj, options);
    if (cacheKey in this._cache) {
      const allow = this._cache[cacheKey];
      this.logger({ action, type, allow, cache: "hit", object: obj });
      return { allow, action, type, object: obj };
    }

    const allow: boolean = await this.rules(action, obj, options);
    this._cache[cacheKey] = allow;
    this.logger({ action, type, allow, cache: "miss", object: obj });
    return { allow, action, type, object: obj };
  }

  logger(loggerObject: LoggerObject) {
    if (this.logEnable) {
      log.info(
        `[cancan]can ${loggerObject.action} ${loggerObject.type} result ${loggerObject.allow}, ${loggerObject.cache} cache`,
      );
    }
  }

  // must be overridden
  abstract rules(
    action: string,
    obj: any,
    options: CheckRecordOptions,
  ): boolean;

  cacheKey(action: string, obj: any, options: CheckRecordOptions) {
    return `${action}-${JSON.stringify(obj)}-${JSON.stringify(options)}`;
  }
}

export { BaseAbility };
