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
    this.tokenApp,
    this.countQuestion,
    this.birthday,
    this.countReport,
    this.provinceName,
    this.districtName,
    this.isKyc,
    this.wallet,
  });

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
    countQuestion = json['count_question'];
    birthday = json['birthday'];
    countReport = json['count_report'];
    provinceName = json['province_name'];
    districtName = json['district_name'];

    isKyc = json['is_kyc'] ?? false;
    wallet = json['wallet'];
  }

  int? id;
  String? username;
  String? authKey;
  String? passwordHash;
  dynamic passwordResetToken;
  String? phone;
  String? email;
  String? provinceName;
  String? districtName;
  int? status;
  int? createdAt;
  int? updatedAt;
  String? address;
  dynamic provinceId;
  dynamic districtId;
  String? facebook;
  String? linkFacebook;
  dynamic typeSocial;
  dynamic idSocial;
  dynamic isNotification;
  dynamic sex;
  dynamic imagePath;
  dynamic imageName;
  String? avatarPath;
  String? avatarName;
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
  int? countQuestion;
  dynamic birthday;
  int? countReport;

  bool? isKyc;
  int? wallet;

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
    map['count_question'] = countQuestion;
    map['birthday'] = birthday;
    map['count_report'] = countReport;
    map['province_name'] = provinceName;
    map['district_name'] = districtName;
    map['is_kyc'] = isKyc;
    map['wallet'] = wallet;
    return map;
  }
}
