/// id : "17"
/// user_id : "7434"
/// money : "0.00"
/// note : "Chuyển tiền câu trả lời đúng cho câu hỏi #15"
/// admin_id : "1"
/// created_at : "1659059512"
/// wallet : "0"

class ModelWalletSub {
  ModelWalletSub({
      this.id, 
      this.userId, 
      this.money, 
      this.note, 
      this.adminId, 
      this.createdAt, 
      this.wallet,});

  ModelWalletSub.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    money = json['money'];
    note = json['note'];
    adminId = json['admin_id'];
    createdAt = json['created_at'];
    wallet = json['wallet'];
  }
  String? id;
  String? userId;
  String? money;
  String? note;
  String? adminId;
  String? createdAt;
  String? wallet;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['money'] = money;
    map['note'] = note;
    map['admin_id'] = adminId;
    map['created_at'] = createdAt;
    map['wallet'] = wallet;
    return map;
  }

}