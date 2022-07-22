class ModelAnswer {
  ModelAnswer({
      this.question, 
      this.images, 
      this.answer, 
      this.countAnswer,});

  ModelAnswer.fromJson(dynamic json) {
    question = json['question'] != null ? Question.fromJson(json['question']) : null;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images?.add(Images.fromJson(v));
      });
    }
    if (json['answer'] != null) {
      answer = [];
      json['answer'].forEach((v) {
        answer?.add(Answer.fromJson(v));
      });
    }
    countAnswer = json['count_answer'];
  }
  Question? question;
  List<Images>? images;
  List<Answer>? answer;
  String? countAnswer;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (question != null) {
      map['question'] = question?.toJson();
    }
    if (images != null) {
      map['images'] = images?.map((v) => v.toJson()).toList();
    }
    if (answer != null) {
      map['answer'] = answer?.map((v) => v.toJson()).toList();
    }
    map['count_answer'] = countAnswer;
    return map;
  }

}

class Answer {
  Answer({
      this.id, 
      this.answer, 
      this.createdAt, 
      this.updatedAt, 
      this.questionId, 
      this.status, 
      this.userId, 
      this.isImages, 
      this.countReport, 
      this.username,});

  Answer.fromJson(dynamic json) {
    id = json['id'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    questionId = json['question_id'];
    status = json['status'];
    userId = json['user_id'];
    isImages = json['is_images'];
    countReport = json['count_report'];
    username = json['username'];
  }
  String? id;
  String? answer;
  String? createdAt;
  String? updatedAt;
  String? questionId;
  String? status;
  String? userId;
  String? isImages;
  dynamic countReport;
  String? username;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['answer'] = answer;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['question_id'] = questionId;
    map['status'] = status;
    map['user_id'] = userId;
    map['is_images'] = isImages;
    map['count_report'] = countReport;
    map['username'] = username;
    return map;
  }

}

class Images {
  Images({
      this.id, 
      this.questionId, 
      this.path, 
      this.name, 
      this.displayName, 
      this.height, 
      this.width, 
      this.order, 
      this.createdAt, 
      this.isAvatar, 
      this.answerId,});

  Images.fromJson(dynamic json) {
    id = json['id'];
    questionId = json['question_id'];
    path = json['path'];
    name = json['name'];
    displayName = json['display_name'];
    height = json['height'];
    width = json['width'];
    order = json['order'];
    createdAt = json['created_at'];
    isAvatar = json['is_avatar'];
    answerId = json['answer_id'];
  }
  String? id;
  String? questionId;
  String? path;
  String? name;
  String? displayName;
  String? height;
  String? width;
  String? order;
  String? createdAt;
  String? isAvatar;
  dynamic answerId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['question_id'] = questionId;
    map['path'] = path;
    map['name'] = name;
    map['display_name'] = displayName;
    map['height'] = height;
    map['width'] = width;
    map['order'] = order;
    map['created_at'] = createdAt;
    map['is_avatar'] = isAvatar;
    map['answer_id'] = answerId;
    return map;
  }

}

class Question {
  Question({
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
      this.classId, 
      this.subjectId, 
      this.price, 
      this.priceGift,});

  Question.fromJson(dynamic json) {
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
    classId = json['class_id'];
    subjectId = json['subject_id'];
    price = json['price'];
    priceGift = json['price_gift'];
  }
  int? id;
  String? question;
  int? createdAt;
  int? updatedAt;
  int? catId;
  int? status;
  int? userId;
  int? isComplete;
  String? description;
  int? deadline;
  int? isImage;
  int? classId;
  int? subjectId;
  String? price;
  String? priceGift;

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
    map['class_id'] = classId;
    map['subject_id'] = subjectId;
    map['price'] = price;
    map['price_gift'] = priceGift;
    return map;
  }

}