/// id : "580"
/// user_id : "7433"
/// admin_id : "16"
/// type : "1"
/// money : "100000000"
/// image_path : ""
/// money_before : "600000000.00"
/// money_after : "700000000.00"
/// accountant_id : "16"
/// accountant_username : "admin_test"
/// status : "1"
/// admin_username : "admin_test"
/// created_at : "1657870925"
/// updated_at : "1657871372"
/// status_cancel : "0"
/// note : null

class ModelWalletAdd {
  ModelWalletAdd({
      this.id, 
      this.userId, 
      this.adminId, 
      this.type, 
      this.money, 
      this.imagePath, 
      this.moneyBefore, 
      this.moneyAfter, 
      this.accountantId, 
      this.accountantUsername, 
      this.status, 
      this.adminUsername, 
      this.createdAt, 
      this.updatedAt, 
      this.statusCancel, 
      this.note,});

  ModelWalletAdd.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    adminId = json['admin_id'];
    type = json['type'];
    money = json['money'];
    imagePath = json['image_path'];
    moneyBefore = json['money_before'];
    moneyAfter = json['money_after'];
    accountantId = json['accountant_id'];
    accountantUsername = json['accountant_username'];
    status = json['status'];
    adminUsername = json['admin_username'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    statusCancel = json['status_cancel'];
    note = json['note'];
  }
  String? id;
  String? userId;
  String? adminId;
  String? type;
  String? money;
  String? imagePath;
  String? moneyBefore;
  String? moneyAfter;
  String? accountantId;
  String? accountantUsername;
  String? status;
  String? adminUsername;
  String? createdAt;
  String? updatedAt;
  String? statusCancel;
  dynamic note;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['admin_id'] = adminId;
    map['type'] = type;
    map['money'] = money;
    map['image_path'] = imagePath;
    map['money_before'] = moneyBefore;
    map['money_after'] = moneyAfter;
    map['accountant_id'] = accountantId;
    map['accountant_username'] = accountantUsername;
    map['status'] = status;
    map['admin_username'] = adminUsername;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['status_cancel'] = statusCancel;
    map['note'] = note;
    return map;
  }

}