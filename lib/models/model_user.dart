/// id : 7442
/// username : "qq"
/// auth_key : "mpUwUP-0ANb7RgpzKBxXPAbZjpd_Krq_"
/// password_hash : "$2y$13$lhahFiSMkUnInU93xDTNaucv.lvw4QKX.d.EDSgsSQy70gbPoLkca"
/// password_reset_token : null
/// phone : "0123456789"
/// email : "asfa2@gmail.com"
/// status : 1
/// created_at : 1657774845
/// updated_at : 1657774845
/// address : null
/// province_id : null
/// district_id : null
/// facebook : null
/// link_facebook : null
/// type_social : null
/// id_social : null
/// is_notification : null
/// sex : null
/// birthday : null
/// image_path : null
/// image_name : null
/// avatar_path : null
/// avatar_name : null
/// member_privatekey : ""
/// member_username : ""
/// last_request_time : null
/// user_before : null
/// getfly_id : 0
/// password_hash2 : null
/// user_gt_app : 1
/// verify_email : null
/// cmt : null
/// token_otp : null
/// token_app : "aa1ca14f05538db52fd3e51210f286b636e28e5c"

class ModelUser {
  ModelUser({
      this.id, 
      this.username, 
      this.authKey, 
      this.passwordHash, 
      this.passwordResetToken, 
      this.phone, 
      this.email, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.address, 
      this.provinceId, 
      this.districtId, 
      this.facebook, 
      this.linkFacebook, 
      this.typeSocial, 
      this.idSocial, 
      this.isNotification, 
      this.sex, 
      this.birthday, 
      this.imagePath, 
      this.imageName, 
      this.avatarPath, 
      this.avatarName, 
      this.memberPrivatekey, 
      this.memberUsername, 
      this.lastRequestTime, 
      this.userBefore, 
      this.getflyId, 
      this.passwordHash2, 
      this.userGtApp, 
      this.verifyEmail, 
      this.cmt,
      this.tokenOtp, 
      this.tokenApp,});

  ModelUser.fromJson(dynamic json) {
    id = json['id'];
    username = json['username'];
    authKey = json['auth_key'];
    passwordHash = json['password_hash'];
    passwordResetToken = json['password_reset_token'];
    phone = json['phone'];
    email = json['email'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    address = json['address'];
    provinceId = json['province_id'];
    districtId = json['district_id'];
    facebook = json['facebook'];
    linkFacebook = json['link_facebook'];
    typeSocial = json['type_social'];
    idSocial = json['id_social'];
    isNotification = json['is_notification'];
    sex = json['sex'];
    birthday = json['birthday'];
    imagePath = json['image_path'];
    imageName = json['image_name'];
    avatarPath = json['avatar_path'];
    avatarName = json['avatar_name'];
    memberPrivatekey = json['member_privatekey'];
    memberUsername = json['member_username'];
    lastRequestTime = json['last_request_time'];
    userBefore = json['user_before'];
    getflyId = json['getfly_id'];
    passwordHash2 = json['password_hash2'];
    userGtApp = json['user_gt_app'];
    verifyEmail = json['verify_email'];
    cmt = json['cmt'];
    tokenOtp = json['token_otp'];
    tokenApp = json['token_app'];
  }
  int? id;
  String? username;
  String? authKey;
  String? passwordHash;
  dynamic passwordResetToken;
  String? phone;
  String? email;
  int? status;
  int? createdAt;
  int? updatedAt;
  dynamic address;
  dynamic provinceId;
  dynamic districtId;
  dynamic facebook;
  dynamic linkFacebook;
  dynamic typeSocial;
  dynamic idSocial;
  dynamic isNotification;
  dynamic sex;
  dynamic birthday;
  dynamic imagePath;
  dynamic imageName;
  dynamic avatarPath;
  dynamic avatarName;
  String? memberPrivatekey;
  String? memberUsername;
  dynamic lastRequestTime;
  dynamic userBefore;
  int? getflyId;
  dynamic passwordHash2;
  int? userGtApp;
  dynamic verifyEmail;
  dynamic cmt;
  dynamic tokenOtp;
  String? tokenApp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['username'] = username;
    map['auth_key'] = authKey;
    map['password_hash'] = passwordHash;
    map['password_reset_token'] = passwordResetToken;
    map['phone'] = phone;
    map['email'] = email;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['address'] = address;
    map['province_id'] = provinceId;
    map['district_id'] = districtId;
    map['facebook'] = facebook;
    map['link_facebook'] = linkFacebook;
    map['type_social'] = typeSocial;
    map['id_social'] = idSocial;
    map['is_notification'] = isNotification;
    map['sex'] = sex;
    map['birthday'] = birthday;
    map['image_path'] = imagePath;
    map['image_name'] = imageName;
    map['avatar_path'] = avatarPath;
    map['avatar_name'] = avatarName;
    map['member_privatekey'] = memberPrivatekey;
    map['member_username'] = memberUsername;
    map['last_request_time'] = lastRequestTime;
    map['user_before'] = userBefore;
    map['getfly_id'] = getflyId;
    map['password_hash2'] = passwordHash2;
    map['user_gt_app'] = userGtApp;
    map['verify_email'] = verifyEmail;
    map['cmt'] = cmt;
    map['token_otp'] = tokenOtp;
    map['token_app'] = tokenApp;
    return map;
  }

}