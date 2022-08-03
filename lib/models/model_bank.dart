class ModelBank {
  int? userId;
  String? name;
  String? bankName;
  String? number;
  int? createdAt;
  int? updatedAt;

  ModelBank(
      {this.userId,
      this.name,
      this.bankName,
      this.number,
      this.createdAt,
      this.updatedAt});

  ModelBank.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    name = json['name'];
    bankName = json['bank_name'];
    number = json['number'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['name'] = this.name;
    data['bank_name'] = this.bankName;
    data['number'] = this.number;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
