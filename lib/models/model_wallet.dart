class ModelWallet {
  ModelWallet({
    this.wallet,
  });
  ModelWallet.fromJson(dynamic json) {
    wallet = json['wallet'];
  }
  String? wallet;
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['wallet'] = wallet;
    return map;
  }
}

class ModelHistory {
  ModelHistory({
    this.content,
    this.day,
    this.month,
    this.year,
    this.money_text,
  });
  ModelHistory.fromJson(dynamic json) {
    content = json['content'];
    day = json['day'];
    month = json['month'];
    year = json['year'];
    money_text = json['money_text'];
  }
  String? content;
  String? day;
  String? month;
  String? year;
  String? money_text;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['content'] = content;
    map['day'] = day;
    map['month'] = month;
    map['year'] = year;
    map['money_text'] = money_text;
    return map;
  }
}
