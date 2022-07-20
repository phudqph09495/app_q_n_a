class ModelQuestion {
  ModelQuestion({
      this.id, 
      this.question, 
      this.createdAt, 
      this.updatedAt, 
      this.catId, 
      this.status, 
      this.userId, 
      this.isComplete, 
      this.description, 
      this.deadline, 
      this.isImage, 
      this.username,});

  ModelQuestion.fromJson(dynamic json) {
    id = json['id'];
    question = json['question'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    catId = json['cat_id'];
    status = json['status'];
    userId = json['user_id'];
    isComplete = json['is_complete'];
    description = json['description'];
    deadline = json['deadline'];
    isImage = json['is_image'];
    username = json['username'];
  }
  String? id;
  String? question;
  String? createdAt;
  String? updatedAt;
  String? catId;
  String? status;
  String? userId;
  String? isComplete;
  String? description;
  String? deadline;
  String? isImage;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['question'] = question;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['cat_id'] = catId;
    map['status'] = status;
    map['user_id'] = userId;
    map['is_complete'] = isComplete;
    map['description'] = description;
    map['deadline'] = deadline;
    map['is_image'] = isImage;
    map['username'] = username;
    return map;
  }

}