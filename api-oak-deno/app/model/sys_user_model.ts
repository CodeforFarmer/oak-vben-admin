import BaseModel from "./base_model.ts";

export type SysUserEntity = {
   id: number;
   username: string;
   nickname: string;
   realName: string;
   userPassword: string;
   passwordSalt: string;
   userEmail: string;
   telephone: string;
   mobilePhone: string;
   avatarUrl: string;
   genderEnum: number;
   userTypeEnum: number;
   tenantId: number;
   registerTypeEnum: number;
   registerOriginEnum: number;
   stateEnum: number;
   deleteEnum: number;
   createDate: number;
   createUserId: number;
   updateDate: number;
   updateUserId: number;
   deleteDate: number;
   deleteUserId: number;
};

/**
 * @description
 * Creates a instance of the SysUser model with the properties populated
 *
 * @param object obj
 * @param number obj.id: number,
 * @param string obj.username: string,
 * @param string obj.nickname: string,
 * @param string obj.realName: string,
 * @param string obj.userPassword: string,
 * @param string obj.passwordSalt: string,
 * @param string obj.userEmail: string,
 * @param string obj.telephone: string,
 * @param string obj.mobilePhone: string,
 * @param string obj.avatarUrl: string,
 * @param number obj.genderEnum: number,
 * @param number obj.userTypeEnum: number,
 * @param number obj.tenantId: number,
 * @param number obj.registerTypeEnum: number,
 * @param number obj.registerOriginEnum: number,
 * @param number obj.stateEnum: number,
 * @param number obj.deleteEnum: number,
 * @param number obj.createDate: number,
 * @param number obj.createUserId: number,
 * @param number obj.updateDate: number,
 * @param number obj.updateUserId: number,
 * @param number obj.deleteDate: number,
 * @param number obj.deleteUserId: number,
 *
 * @return SysUserModel
 */
export function createSysUserModelObject(obj: {
   id: number,
   username: string,
   nickname: string,
   realName: string,
   userPassword: string,
   passwordSalt: string,
   userEmail: string,
   telephone: string,
   mobilePhone: string,
   avatarUrl: string,
   genderEnum: number,
   userTypeEnum: number,
   tenantId: number,
   registerTypeEnum: number,
   registerOriginEnum: number,
   stateEnum: number,
   deleteEnum: number,
   createDate: number,
   createUserId: number,
   updateDate: number,
   updateUserId: number,
   deleteDate: number,
   deleteUserId: number,
}): SysUserModel {
  return new SysUserModel(
   obj.id,
   obj.username,
   obj.nickname,
   obj.realName,
   obj.userPassword,
   obj.passwordSalt,
   obj.userEmail,
   obj.telephone,
   obj.mobilePhone,
   obj.avatarUrl,
   obj.genderEnum,
   obj.userTypeEnum,
   obj.tenantId,
   obj.registerTypeEnum,
   obj.registerOriginEnum,
   obj.stateEnum,
   obj.deleteEnum,
   obj.createDate,
   obj.createUserId,
   obj.updateDate,
   obj.updateUserId,
   obj.deleteDate,
   obj.deleteUserId,
  );
}

//@ts-ignore SysUserModel defines a where method that has different params than base models
// where method. Might need to investigate the naming usage
export class SysUserModel extends BaseModel {
  //////////////////////////////////////////////////////////////////////////////
  // FILE MARKER - PROPERTIES //////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////
  /** 主键ID */
  public id: number;
  /** 用户账号:oneParam */
  public username: string;
  /** 昵称:oneParam */
  public nickname: string;
  /** 真实姓名:likeParam */
  public realName: string;
  /** 登录密码 */
  public userPassword: string;
  /** 密码盐:放于密码后面 */
  public passwordSalt: string;
  /** 邮箱地址:oneParam */
  public userEmail: string;
  /** 固话 */
  public telephone: string;
  /** 手机号:oneParam */
  public mobilePhone: string;
  /** 头像 */
  public avatarUrl: string;
  /** 性别:[1=保密=PRIVACY,;2=男性=MALE,;3=女性=FEMALE]max=3 */
  public genderEnum: number;
  /** 用户类型:[1=普通用户=USER,;2=后台管理员=ADMIN,;3=租户主账号=TENANT_ADMIN, 4=租户子账号=TENANT_SUB_ACCOUNT]max=4 */
  public userTypeEnum: number;
  /** 所属租户 */
  public tenantId: number;
  /** 注册方式:[1=系统预置=SYSTEM_INIT,;2=后台管理系统新增=MANAGEMENT_ADD,;3=主动注册=REGISTER, 4=被邀请注册=INVITE]max=4 */
  public registerTypeEnum: number;
  /** 注册来源:[1=WEB方式=WEB,;2=安卓APP=ANDROID,;3=苹果APP=IOS, 4=H5=H5, 5=微信小程序=WEIXIN_MINI_PROGRAM, 6=微信公众号=WEIXIN_OFFICIAL_ACCOUNT]max=6 */
  public registerOriginEnum: number;
  /** 启用状态:[1=启用=ENABLE;;2=禁用=DISABLE]max=2 */
  public stateEnum: number;
  /** 删除状态:[1=未删除=NOT_DELETED;;2=已删除=DELETED]max=2 */
  public deleteEnum: number;
  /** 创建时间 */
  public createDate: number;
  /** 创建人 */
  public createUserId: number;
  /** 更新时间 */
  public updateDate: number;
  /** 更新人 */
  public updateUserId: number;
  /** 删除时间 */
  public deleteDate: number;
  /** 删除人 */
  public deleteUserId: number;

  //////////////////////////////////////////////////////////////////////////////
  // FILE MARKER - CONSTRCUTOR /////////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  constructor(
   id: number,
   username: string,
   nickname: string,
   realName: string,
   userPassword: string,
   passwordSalt: string,
   userEmail: string,
   telephone: string,
   mobilePhone: string,
   avatarUrl: string,
   genderEnum: number,
   userTypeEnum: number,
   tenantId: number,
   registerTypeEnum: number,
   registerOriginEnum: number,
   stateEnum: number,
   deleteEnum: number,
   createDate: number,
   createUserId: number,
   updateDate: number,
   updateUserId: number,
   deleteDate: number,
   deleteUserId: number,
  ) {
    super();
    this.id = id;
    this.username = username;
    this.nickname = nickname;
    this.realName = realName;
    this.userPassword = userPassword;
    this.passwordSalt = passwordSalt;
    this.userEmail = userEmail;
    this.telephone = telephone;
    this.mobilePhone = mobilePhone;
    this.avatarUrl = avatarUrl;
    this.genderEnum = genderEnum;
    this.userTypeEnum = userTypeEnum;
    this.tenantId = tenantId;
    this.registerTypeEnum = registerTypeEnum;
    this.registerOriginEnum = registerOriginEnum;
    this.stateEnum = stateEnum;
    this.deleteEnum = deleteEnum;
    this.createDate = createDate;
    this.createUserId = createUserId;
    this.updateDate = updateDate;
    this.updateUserId = updateUserId;
    this.deleteDate = deleteDate;
    this.deleteUserId = deleteUserId;
  }

  //////////////////////////////////////////////////////////////////////////////
  // FILE MARKER - METHODS - CRUD //////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  /**
   * Delete this model.
   *
   * @return Promise<boolean> False if the query failed to delete
   */
  public async delete(): Promise<boolean> {
    const query = `DELETE FROM sys_user WHERE id = $1`;
    const dbResult = await BaseModel.query(query, this.id);
    if (dbResult.rowCount! < 1) {
      return false;
    }
    return true;
  }

  /**
   * Save this model.
   *
   * @return Promise<SysUserModel|null> Empty array if no data was found
   */
  public async save(): Promise<SysUserModel | null> {
    // If this model already has an ID, then that means we're updating the model
    if (this.id != -1) {
      return this.update();
    }
    const query =
      `INSERT INTO sys_user (
      id,
      username,
      nickname,
      real_name,
      user_password,
      password_salt,
      user_email,
      telephone,
      mobile_phone,
      avatar_url,
      gender_enum,
      user_type_enum,
      tenant_id,
      register_type_enum,
      register_origin_enum,
      state_enum,
      delete_enum,
      create_date,
      create_user_id,
      update_date,
      update_user_id,
      delete_date,
      delete_user_id,
      ) VALUES (
      $1,
      $2,
      $3,
      $4,
      $5,
      $6,
      $7,
      $8,
      $9,
      $10,
      $11,
      $12,
      $13,
      $14,
      $15,
      $16,
      $17,
      $18,
      $19,
      $20,
      $21,
      $22,
      $23,
      );`;
    const dbResult = await BaseModel.query(
      query,
      this.id,
      this.username,
      this.nickname,
      this.realName,
      this.userPassword,
      this.passwordSalt,
      this.userEmail,
      this.telephone,
      this.mobilePhone,
      this.avatarUrl,
      this.genderEnum,
      this.userTypeEnum,
      this.tenantId,
      this.registerTypeEnum,
      this.registerOriginEnum,
      this.stateEnum,
      this.deleteEnum,
      this.createDate,
      this.createUserId,
      this.updateDate,
      this.updateUserId,
      this.deleteDate,
      this.deleteUserId,
    );
    if (dbResult.rowCount < 1) {
      return null;
    }
    // (crookse) We ignore this because this will never return null.
    const savedResult = await SysUserModel.where({ id: this.id });
    if (savedResult.length === 0) {
      return null;
    }
    return savedResult[0];
  }

  /**
   * Update this model.
   *
   * @return Promise<SysUserModel|null> False if no results were found
   */
  public async update(): Promise<SysUserModel | null> {
    const query = `UPDATE sys_user SET
      id = $1,
      username = $2,
      nickname = $3,
      realName = $4,
      userPassword = $5,
      passwordSalt = $6,
      userEmail = $7,
      telephone = $8,
      mobilePhone = $9,
      avatarUrl = $10,
      genderEnum = $11,
      userTypeEnum = $12,
      tenantId = $13,
      registerTypeEnum = $14,
      registerOriginEnum = $15,
      stateEnum = $16,
      deleteEnum = $17,
      createDate = $18,
      createUserId = $19,
      updateDate = $20,
      updateUserId = $21,
      deleteDate = $22,
      deleteUserId = $23,
      WHERE id = $100;`;
    const dbResult = await BaseModel.query(
      query,
      this.id,
      this.username,
      this.nickname,
      this.realName,
      this.userPassword,
      this.passwordSalt,
      this.userEmail,
      this.telephone,
      this.mobilePhone,
      this.avatarUrl,
      this.genderEnum,
      this.userTypeEnum,
      this.tenantId,
      this.registerTypeEnum,
      this.registerOriginEnum,
      this.stateEnum,
      this.deleteEnum,
      this.createDate,
      this.createUserId,
      this.updateDate,
      this.updateUserId,
      this.deleteDate,
      this.deleteUserId,
    );
    if (dbResult.rowCount! < 1) {
      return null;
    }
    const updatedResult = await SysUserModel.where({ id: this.id });
    if (updatedResult.length === 0) {
      return null;
    }
    return updatedResult[0];
  }

  //////////////////////////////////////////////////////////////////////////////
  // FILE MARKER - METHODS - STATIC ////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  /**
   * @description
   *     See BaseModel.Where()
   *
   * @param {[key: string]: string} fields
   *
   * @return Promise<SysUserModel[]|[]>
   */
  static async where(
    fields: { [key: string]: string | number },
  ): Promise<SysUserModel[] | []> {
    const results = await BaseModel.Where("sys_user", fields);
    if (results.length <= 0) {
      return [];
    }
    //@ts-ignore Nothing we can do about this.. the createSysUserModelObject expect
    // a SysUser object type, but there's no way to type it like that the return type of whereIn can't be SysUser
    return results.map((result) => {
      return createSysUserModelObject(
        result as {
        id: number ;
        username: string ;
        nickname: string ;
        realName: string ;
        userPassword: string ;
        passwordSalt: string ;
        userEmail: string ;
        telephone: string ;
        mobilePhone: string ;
        avatarUrl: string ;
        genderEnum: number ;
        userTypeEnum: number ;
        tenantId: number ;
        registerTypeEnum: number ;
        registerOriginEnum: number ;
        stateEnum: number ;
        deleteEnum: number ;
        createDate: number ;
        createUserId: number ;
        updateDate: number ;
        updateUserId: number ;
        deleteDate: number ;
        deleteUserId: number ;
        },
      );
    });
  }

  /**
   * @description
   *     See BaseModel.WhereIn()
   *
   * @param string column
   * @param any values
   *
   * @return Promise<SysUserModel[]> | []
   */
  static async whereIn(
    column: string,
    values: string[] | number[],
  ): Promise<SysUserModel[] | []> {
    const results = await BaseModel.WhereIn("sys_user", {
      column,
      values,
    });
    if (results.length <= 0) {
      return [];
    }
    //@ts-ignore Nothing we can do about this.. the createSysUserModelObject expect
    // a SysUser object type, but there's no way to type it like that the return type of whereIn can't be SysUser
    return results.map((result) => {
      return createSysUserModelObject(
        result as {
           id: number ;
           username: string ;
           nickname: string ;
           realName: string ;
           userPassword: string ;
           passwordSalt: string ;
           userEmail: string ;
           telephone: string ;
           mobilePhone: string ;
           avatarUrl: string ;
           genderEnum: number ;
           userTypeEnum: number ;
           tenantId: number ;
           registerTypeEnum: number ;
           registerOriginEnum: number ;
           stateEnum: number ;
           deleteEnum: number ;
           createDate: number ;
           createUserId: number ;
           updateDate: number ;
           updateUserId: number ;
           deleteDate: number ;
           deleteUserId: number ;
        },
      );
    });
  }

  //////////////////////////////////////////////////////////////////////////////
  // FILE MARKER - METHODS - PUBLIC ////////////////////////////////////////////
  //////////////////////////////////////////////////////////////////////////////

  /**
   * @return SysUserEntity
   */
  public toEntity(): SysUserEntity {
    return {
     id: this.id,
     username: this.username,
     nickname: this.nickname,
     realName: this.realName,
     userPassword: this.userPassword,
     passwordSalt: this.passwordSalt,
     userEmail: this.userEmail,
     telephone: this.telephone,
     mobilePhone: this.mobilePhone,
     avatarUrl: this.avatarUrl,
     genderEnum: this.genderEnum,
     userTypeEnum: this.userTypeEnum,
     tenantId: this.tenantId,
     registerTypeEnum: this.registerTypeEnum,
     registerOriginEnum: this.registerOriginEnum,
     stateEnum: this.stateEnum,
     deleteEnum: this.deleteEnum,
     createDate: this.createDate,
     createUserId: this.createUserId,
     updateDate: this.updateDate,
     updateUserId: this.updateUserId,
     deleteDate: this.deleteDate,
     deleteUserId: this.deleteUserId,
    };
  }
}

export default SysUserModel;