class ModelTreo {
  ModelTreo({
      this.id, 
      this.userId, 
      this.money, 
      this.adminId, 
      this.status, 
      this.imagePath, 
      this.createdAt, 
      this.updatedAt, 
      this.type, 
      this.tradingId, 
      this.note, 
      this.questionId,});

  ModelTreo.fromJson(dynamic json) {
    id = json['id'];
    userId = json['user_id'];
    money = json['money'];
    adminId = json['admin_id'];
    status = json['status'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
    tradingId = json['trading_id'];
    note = json['note'];
    questionId = json['question_id'];
  }
  String? id;
  String? userId;
  String? money;
  dynamic adminId;
  String? status;
  dynamic imagePath;
  String? createdAt;
  String? updatedAt;
  String? type;
  dynamic tradingId;
  String? note;
  String? questionId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['user_id'] = userId;
    map['money'] = money;
    map['admin_id'] = adminId;
    map['status'] = status;
    map['image_path'] = imagePath;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['type'] = type;
    map['trading_id'] = tradingId;
    map['note'] = note;
    map['question_id'] = questionId;
    return map;
  }

}