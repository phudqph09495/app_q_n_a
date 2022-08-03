// class ModelWallet {
//   ModelWallet({
//     this.wallet,
//   });
//   ModelWallet.fromJson(dynamic json) {
//     wallet = json['wallet'];
//   }
//   String? wallet;
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['wallet'] = wallet;
//     return map;
//   }
// }
class ModelWallet {
  ModelHistory? data;
  int? code;
  String? message;

  ModelWallet({this.data, this.code, this.message});

  ModelWallet.fromJson(Map<String, dynamic> json) {
    data =
        json['data'] != null ? new ModelHistory.fromJson(json['data']) : null;
    code = json['code'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['code'] = this.code;
    data['message'] = this.message;
    return data;
  }
}

class Data {
  int? wallet;

  Data({this.wallet});

  Data.fromJson(Map<String, dynamic> json) {
    wallet = json['wallet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['wallet'] = this.wallet;
    return data;
  }
}

// class ModelHistory {
//   ModelHistory({
//     this.data,
//     this.today,
//   });
//
//   ModelHistory.fromJson(dynamic json) {
//     if (json['data'] != null) {
//       data = [];
//       json['data'].forEach((v) {
//         data?.add(Datas.fromJson(v));
//       });
//     }
//     today = json['today'];
//   }
//   List<Datas>? data;
//   String? today;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     if (data != null) {
//       map['answer'] = data?.map((v) => v.toJson()).toList();
//     }
//     map['today'] = today;
//     return map;
//   }
// }
//
// class Datas {
//   Datas({
//     this.id,
//     this.question_id,
//     this.user_id_sell,
//     this.user_id_buy,
//     this.price,
//     this.product_id,
//     this.created_at_sell,
//     this.created_at_buy,
//     this.created_at,
//     this.user_buy_money_before,
//     this.user_buy_money_after,
//     this.user_sell_money_before,
//     this.user_sell_money_after,
//     this.day,
//     this.month,
//     this.year,
//     this.week,
//     this.type,
//     this.admin_id,
//     this.email_buy,
//     this.email_sell,
//     this.note,
//     this.answer_id,
//     this.username,
//     this.money_text,
//     this.type_text,
//     this.content,
//   });
//
//   Datas.fromJson(dynamic json) {
//     id = json['id'];
//     question_id = json['question_id'];
//     user_id_sell = json['user_id_sell'];
//     user_id_buy = json['user_id_buy'];
//     price = json['price'];
//     product_id = json['product_id'];
//     created_at_sell = json['created_at_sell'];
//     created_at_buy = json['created_at_buy'];
//     created_at = json['created_at'];
//     user_buy_money_before = json['user_buy_money_before'];
//     user_buy_money_after = json['user_buy_money_after'];
//     user_sell_money_before = json['user_sell_money_before'];
//     user_sell_money_after = json['user_sell_money_after'];
//     day = json['day'];
//     month = json['month'];
//     year = json['year'];
//     week = json['week'];
//     type = json['type'];
//     admin_id = json['admin_id'];
//     email_buy = json['email_buy'];
//     email_sell = json['email_sell'];
//     note = json['note'];
//     answer_id = json['answer_id'];
//     username = json['username'];
//     money_text = json['money_text'];
//     type_text = json['type_text'];
//     content = json['content'];
//   }
//   String? id;
//   String? question_id;
//   String? user_id_sell;
//   String? user_id_buy;
//   String? price;
//   String? product_id;
//   String? created_at_sell;
//   String? created_at_buy;
//   String? created_at;
//   String? user_buy_money_before;
//   String? user_buy_money_after;
//   String? user_sell_money_before;
//   String? user_sell_money_after;
//   String? day;
//   String? month;
//   String? year;
//   String? week;
//   String? type;
//   String? admin_id;
//   String? email_buy;
//   String? email_sell;
//   String? note;
//   String? answer_id;
//   String? username;
//   String? money_text;
//   String? type_text;
//   String? content;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['question_id'] = question_id;
//     map['user_id_sell'] = user_id_sell;
//     map['user_id_buy'] = user_id_buy;
//     map['price'] = price;
//     map['product_id'] = product_id;
//     map['created_at_sell'] = created_at_sell;
//     map['created_at_buy'] = created_at_buy;
//     map['created_at'] = created_at;
//     map['user_buy_money_before'] = user_buy_money_before;
//     map['user_buy_money_after'] = user_buy_money_after;
//     map['user_sell_money_before'] = user_sell_money_before;
//     map['user_sell_money_after'] = user_sell_money_after;
//     map['day'] = day;
//     map['month'] = month;
//     map['year'] = year;
//     map['type'] = type;
//     map['admin_id'] = admin_id;
//     map['email_buy'] = email_buy;
//     map['email_sell'] = email_sell;
//     map['note'] = note;
//     map['answer_id'] = answer_id;
//     map['username'] = username;
//     map['money_text'] = money_text;
//     map['type_text'] = type_text;
//     map['content'] = content;
//     return map;
//   }
// }

// class ModelHistory {
//   Datas? data;
//   int? code;
//   String? message;
//
//   ModelHistory({this.data, this.code, this.message});
//
//   ModelHistory.fromJson(Map<String, dynamic> json) {
//     data = json['data'] != null ? new Datas.fromJson(json['data']) : null;
//     code = json['code'];
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['code'] = this.code;
//     data['message'] = this.message;
//     return data;
//   }
// }

class ModelHistory {
  List<DataHistory>? data;
  int? today;

  ModelHistory({this.data, this.today});

  ModelHistory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataHistory>[];
      json['data'].forEach((v) {
        data!.add(new DataHistory.fromJson(v));
      });
    }
    today = json['today'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['today'] = this.today;
    return data;
  }
}

class DataHistory {
  String? id;
  String? questionId;
  dynamic userIdSell;
  String? userIdBuy;
  String? price;
  dynamic productId;
  dynamic createdAtSell;
  dynamic createdAtBuy;
  String? createdAt;
  String? userBuyMoneyBefore;
  String? userBuyMoneyAfter;
  dynamic userSellMoneyBefore;
  dynamic userSellMoneyAfter;
  String? day;
  String? month;
  String? year;
  String? week;
  String? type;
  dynamic adminId;
  String? emailBuy;
  dynamic emailSell;
  dynamic note;
  String? answerId;
  dynamic username;
  String? moneyText;
  String? typeText;
  String? content;

  DataHistory(
      {this.id,
      this.questionId,
      this.userIdSell,
      this.userIdBuy,
      this.price,
      this.productId,
      this.createdAtSell,
      this.createdAtBuy,
      this.createdAt,
      this.userBuyMoneyBefore,
      this.userBuyMoneyAfter,
      this.userSellMoneyBefore,
      this.userSellMoneyAfter,
      this.day,
      this.month,
      this.year,
      this.week,
      this.type,
      this.adminId,
      this.emailBuy,
      this.emailSell,
      this.note,
      this.answerId,
      this.username,
      this.moneyText,
      this.typeText,
      this.content});

  DataHistory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    questionId = json['question_id'];
    userIdSell = json['user_id_sell'];
    userIdBuy = json['user_id_buy'];
    price = json['price'];
    productId = json['product_id'];
    createdAtSell = json['created_at_sell'];
    createdAtBuy = json['created_at_buy'];
    createdAt = json['created_at'];
    userBuyMoneyBefore = json['user_buy_money_before'];
    userBuyMoneyAfter = json['user_buy_money_after'];
    userSellMoneyBefore = json['user_sell_money_before'];
    userSellMoneyAfter = json['user_sell_money_after'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    week = json['week'];
    type = json['type'];
    adminId = json['admin_id'];
    emailBuy = json['email_buy'];
    emailSell = json['email_sell'];
    note = json['note'];
    answerId = json['answer_id'];
    username = json['username'];
    moneyText = json['money_text'];
    typeText = json['type_text'];
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_id'] = this.questionId;
    data['user_id_sell'] = this.userIdSell;
    data['user_id_buy'] = this.userIdBuy;
    data['price'] = this.price;
    data['product_id'] = this.productId;
    data['created_at_sell'] = this.createdAtSell;
    data['created_at_buy'] = this.createdAtBuy;
    data['created_at'] = this.createdAt;
    data['user_buy_money_before'] = this.userBuyMoneyBefore;
    data['user_buy_money_after'] = this.userBuyMoneyAfter;
    data['user_sell_money_before'] = this.userSellMoneyBefore;
    data['user_sell_money_after'] = this.userSellMoneyAfter;
    data['day'] = this.day;
    data['month'] = this.month;
    data['year'] = this.year;
    data['week'] = this.week;
    data['type'] = this.type;
    data['admin_id'] = this.adminId;
    data['email_buy'] = this.emailBuy;
    data['email_sell'] = this.emailSell;
    data['note'] = this.note;
    data['answer_id'] = this.answerId;
    data['username'] = this.username;
    data['money_text'] = this.moneyText;
    data['type_text'] = this.typeText;
    data['content'] = this.content;
    return data;
  }
}
