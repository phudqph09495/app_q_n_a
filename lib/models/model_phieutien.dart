class PhieuTien {
  Data? data;

  PhieuTien({this.data});

  PhieuTien.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? money;
  Null? adminId;
  int? status;
  Null? imagePath;
  int? createdAt;
  int? updatedAt;
  Null? type;

  Data(
      {this.id,
      this.userId,
      this.money,
      this.adminId,
      this.status,
      this.imagePath,
      this.createdAt,
      this.updatedAt,
      this.type});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    money = json['money'];
    adminId = json['admin_id'];
    status = json['status'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['money'] = this.money;
    data['admin_id'] = this.adminId;
    data['status'] = this.status;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['type'] = this.type;
    return data;
  }
}
