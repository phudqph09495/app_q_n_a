class modelupdate {
  int? id;
  String? username;
  String? authKey;
  String? passwordHash;
  dynamic? passwordResetToken;
  String? phone;
  String? email;
  int? status;
  int? createdAt;
  int? updatedAt;
  dynamic? address;
  dynamic? provinceId;
  dynamic? districtId;
  dynamic? facebook;
  dynamic? linkFacebook;
  dynamic? typeSocial;
  dynamic? idSocial;
  dynamic? isNotification;
  dynamic? sex;
  dynamic? birthday;
  dynamic? imagePath;
  dynamic? imageName;
  dynamic? avatarPath;
  dynamic? avatarName;
  String? memberPrivatekey;
  String? memberUsername;
  dynamic? lastRequestTime;
  dynamic? userBefore;
  int? getflyId;
  dynamic? passwordHash2;
  int? userGtApp;
  dynamic? verifyEmail;
  String? cmt;
  dynamic? tokenOtp;
  String? tokenApp;
  int? countQuestion;

  modelupdate(
      {this.id,
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
      this.tokenApp,
      this.countQuestion});

  modelupdate.fromJson(Map<String, dynamic> json) {
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
    countQuestion = json['count_question'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['username'] = this.username;
    data['auth_key'] = this.authKey;
    data['password_hash'] = this.passwordHash;
    data['password_reset_token'] = this.passwordResetToken;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['address'] = this.address;
    data['province_id'] = this.provinceId;
    data['district_id'] = this.districtId;
    data['facebook'] = this.facebook;
    data['link_facebook'] = this.linkFacebook;
    data['type_social'] = this.typeSocial;
    data['id_social'] = this.idSocial;
    data['is_notification'] = this.isNotification;
    data['sex'] = this.sex;
    data['birthday'] = this.birthday;
    data['image_path'] = this.imagePath;
    data['image_name'] = this.imageName;
    data['avatar_path'] = this.avatarPath;
    data['avatar_name'] = this.avatarName;
    data['member_privatekey'] = this.memberPrivatekey;
    data['member_username'] = this.memberUsername;
    data['last_request_time'] = this.lastRequestTime;
    data['user_before'] = this.userBefore;
    data['getfly_id'] = this.getflyId;
    data['password_hash2'] = this.passwordHash2;
    data['user_gt_app'] = this.userGtApp;
    data['verify_email'] = this.verifyEmail;
    data['cmt'] = this.cmt;
    data['token_otp'] = this.tokenOtp;
    data['token_app'] = this.tokenApp;
    data['count_question'] = this.countQuestion;
    return data;
  }
}
