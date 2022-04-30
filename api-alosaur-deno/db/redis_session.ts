import { connect, Redis, SessionStore } from "../deps.ts";

type StringKeyObject = { [key: string]: unknown };

export class RedisSession<T = StringKeyObject> implements SessionStore {
  private redis?: Redis;

  private allSid: string[] = [];

  constructor(protected hostname: string, protected port: number) {}

  async init(): Promise<void> {
    const redis = await connect({
      hostname: this.hostname,
      port: this.port,
    });
    this.redis = redis;
    return Promise.resolve();
  }

  async create(sid: string): Promise<void> {
    await this.redis?.set(sid, JSON.stringify({}));
    this.allSid.push(sid);
    return Promise.resolve();
  }

  async delete(sid: string): Promise<void> {
    await this.redis?.del(sid);
    return Promise.resolve();
  }

  async get(sid: string): Promise<T | StringKeyObject | undefined> {
    const itemAsString = await this.redis?.get(sid);
    if (itemAsString) {
      return JSON.parse(itemAsString);
    }
  }

  async exist(sid: string): Promise<boolean> {
    return Boolean(await this.redis?.exists(sid));
  }

  async getValue(sid: string, key: string): Promise<T | undefined> {
    const item = await this.get(sid) as StringKeyObject;
    if (item) {
      return item[key] as T;
    }
    return;
  }

  async setValue(sid: string, key: string, value: unknown): Promise<void> {
    const obj = await this.get(sid);
    if (obj) {
      await this.redis?.set(
        sid,
        JSON.stringify({
          ...obj,
          [key]: value,
        }),
      );
    }
    return Promise.resolve();
  }

  async clear(): Promise<void> {
    await Promise.all(this.allSid.map((sid) => this.delete(sid)));
  }
}
