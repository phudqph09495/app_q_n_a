// class ModelNganHang {
//   Data? data;
//   String? message;
//   int? code;
//
//   ModelNganHang({this.data, this.message, this.code});
//
//   ModelNganHang.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//     code = json['code'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     data['code'] = this.code;
//     return data;
//   }
// }

class ModelNganHang {
  String? userId;
  String? name;
  String? bankName;
  String? number;
  int? createdAt;
  int? updatedAt;

  ModelNganHang(
      {this.userId,
      this.name,
      this.bankName,
      this.number,
      this.createdAt,
      this.updatedAt});

  ModelNganHang.fromJson(Map<String, dynamic> json) {
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
