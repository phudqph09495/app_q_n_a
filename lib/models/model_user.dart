class ModelUser {
  ModelUser({
    this.tokenApp,
      this.username, 
      this.phone, 
      this.email, 
      this.address, 
      this.facebook, 
      this.linkFacebook, 
      this.provinceId, 
      this.typeSocial, 
      this.idSocial, 
      this.isNotification, 
      this.userBefore, 
      this.cmt, 
      this.passwordHash, 
      this.authKey, 
      this.status, 
      this.createdAt, 
      this.updatedAt, 
      this.id, 
      this.userGtApp,});

  ModelUser.fromJson(dynamic json) {
    username = json['username'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    facebook = json['facebook'];
    linkFacebook = json['link_facebook'];
    provinceId = json['province_id'];
    typeSocial = json['type_social'];
    idSocial = json['id_social'];
    isNotification = json['is_notification'];
    userBefore = json['user_before'];
    cmt = json['cmt'];
    passwordHash = json['password_hash'];
    authKey = json['auth_key'];
    status = json['status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    id = json['id'];
    userGtApp = json['user_gt_app'];
    tokenApp=json['token_app'];
  }
  String? tokenApp;
  String? username;
  String? phone;
  String? email;
  dynamic address;
  dynamic facebook;
  dynamic linkFacebook;
  dynamic provinceId;
  dynamic typeSocial;
  dynamic idSocial;
  dynamic isNotification;
  dynamic userBefore;
  dynamic cmt;
  String? passwordHash;
  String? authKey;
  int? status;
  int? createdAt;
  int? updatedAt;
  int? id;
  int? userGtApp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['token_app']=tokenApp;
    map['username'] = username;
    map['phone'] = phone;
    map['email'] = email;
    map['address'] = address;
    map['facebook'] = facebook;
    map['link_facebook'] = linkFacebook;
    map['province_id'] = provinceId;
    map['type_social'] = typeSocial;
    map['id_social'] = idSocial;
    map['is_notification'] = isNotification;
    map['user_before'] = userBefore;
    map['cmt'] = cmt;
    map['password_hash'] = passwordHash;
    map['auth_key'] = authKey;
    map['status'] = status;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['id'] = id;
    map['user_gt_app'] = userGtApp;
    return map;
  }

}