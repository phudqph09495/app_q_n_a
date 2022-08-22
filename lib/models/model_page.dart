class ModelPage {
  String? id;
  String? title;
  String? alias;
  String? shortDescription;
  String? description;
  String? createdAt;
  String? updatedAt;
  String? avatarPath;
  String? avatarName;
  String? metaTitle;
  String? metaKeywords;
  String? metaDescription;
  String? status;
  String? titleEn;
  String? shortDescriptionEn;
  String? descriptionEn;

  ModelPage(
      {this.id,
        this.title,
        this.alias,
        this.shortDescription,
        this.description,
        this.createdAt,
        this.updatedAt,
        this.avatarPath,
        this.avatarName,
        this.metaTitle,
        this.metaKeywords,
        this.metaDescription,
        this.status,
        this.titleEn,
        this.shortDescriptionEn,
        this.descriptionEn});

  ModelPage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    alias = json['alias'];
    shortDescription = json['short_description'];
    description = json['description'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avatarPath = json['avatar_path'];
    avatarName = json['avatar_name'];
    metaTitle = json['meta_title'];
    metaKeywords = json['meta_keywords'];
    metaDescription = json['meta_description'];
    status = json['status'];
    titleEn = json['title_en'];
    shortDescriptionEn = json['short_description_en'];
    descriptionEn = json['description_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['alias'] = this.alias;
    data['short_description'] = this.shortDescription;
    data['description'] = this.description;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['avatar_path'] = this.avatarPath;
    data['avatar_name'] = this.avatarName;
    data['meta_title'] = this.metaTitle;
    data['meta_keywords'] = this.metaKeywords;
    data['meta_description'] = this.metaDescription;
    data['status'] = this.status;
    data['title_en'] = this.titleEn;
    data['short_description_en'] = this.shortDescriptionEn;
    data['description_en'] = this.descriptionEn;
    return data;
  }
}
