class ModelSiteInfo {
  int? id;
  String? title;
  String? logo;
  String? favicon;
  String? footerLogo;
  String? avatar;
  String? email;
  String? phone;
  String? hotline;
  String? address;
  String? metaKeywords;
  String? metaDescription;
  int? createdAt;
  int? updatedAt;
  dynamic goldPrice;
  String? iframe;
  dynamic liveChat;
  String? company;
  String? numberAuth;
  String? emailRif;
  int? otp;
  String? copyright;
  String? questionPrice;
  String? bankAdmin;

  ModelSiteInfo(
      {this.id,
      this.title,
      this.logo,
      this.favicon,
      this.footerLogo,
      this.avatar,
      this.email,
      this.phone,
      this.hotline,
      this.address,
      this.metaKeywords,
      this.metaDescription,
      this.createdAt,
      this.updatedAt,
      this.goldPrice,
      this.iframe,
      this.liveChat,
      this.company,
      this.numberAuth,
      this.emailRif,
      this.otp,
      this.copyright,
      this.questionPrice,
      this.bankAdmin});

  ModelSiteInfo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    logo = json['logo'];
    favicon = json['favicon'];
    footerLogo = json['footer_logo'];
    avatar = json['avatar'];
    email = json['email'];
    phone = json['phone'];
    hotline = json['hotline'];
    address = json['address'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    goldPrice = json['gold_price'];
    iframe = json['iframe'];
    liveChat = json['live_chat'];
    company = json['company'];
    numberAuth = json['number_auth'];
    emailRif = json['email_rif'];
    otp = json['otp'];
    copyright = json['copyright'];
    questionPrice = json['question_price'];
    bankAdmin = json['bank_admin'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['logo'] = this.logo;
    data['favicon'] = this.favicon;
    data['footer_logo'] = this.footerLogo;
    data['avatar'] = this.avatar;
    data['email'] = this.email;
    data['phone'] = this.phone;
    data['hotline'] = this.hotline;
    data['address'] = this.address;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['gold_price'] = this.goldPrice;
    data['iframe'] = this.iframe;
    data['live_chat'] = this.liveChat;
    data['company'] = this.company;
    data['number_auth'] = this.numberAuth;
    data['email_rif'] = this.emailRif;
    data['otp'] = this.otp;
    data['copyright'] = this.copyright;
    data['question_price'] = this.questionPrice;
    data['bank_admin'] = this.bankAdmin;
    return data;
  }
}
