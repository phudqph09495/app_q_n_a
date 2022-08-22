class ModelAnswer {
  Question? question;
  List<Images>? images;
  List<Answer>? answer;
  String? countAnswer;
  List<String>? listUseridAnswer;

  ModelAnswer({this.question, this.images, this.answer, this.countAnswer, this.listUseridAnswer});

  ModelAnswer.fromJson(Map<String, dynamic> json) {
    images = <Images>[];
    answer = <Answer>[];
    listUseridAnswer = <String>[];
    question = json['question'] != null
        ? Question.fromJson(json['question'])
        : null;
    if (json['images'] != null) {
      json['images'].forEach((v) {
        images!.add(Images.fromJson(v));
      });
    }
    if (json['answer'] != null) {
      json['answer'].forEach((v) {
        answer!.add(Answer.fromJson(v));
        listUseridAnswer!.add(v["user_id"]);
      });
    }
    countAnswer = json['count_answer'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.question != null) {
      data['question'] = this.question!.toJson();
    }
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.answer != null) {
      data['answer'] = this.answer!.map((v) => v.toJson()).toList();
    }
    data['count_answer'] = this.countAnswer;
    data['list_user_id_answer'] = this.listUseridAnswer;
    return data;
  }
}

class Question {
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

  Question(
      {this.id,
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
      this.priceGift});

  Question.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['cat_id'] = this.catId;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['is_complete'] = this.isComplete;
    data['description'] = this.description;
    data['deadline'] = this.deadline;
    data['is_image'] = this.isImage;
    data['class_id'] = this.classId;
    data['subject_id'] = this.subjectId;
    data['price'] = this.price;
    data['price_gift'] = this.priceGift;
    return data;
  }
}

class Images {
  int? id;
  int? questionId;
  String? path;
  String? name;
  String? displayName;
  int? height;
  int? width;
  int? order;
  int? createdAt;
  int? isAvatar;
  String? answerId;

  Images(
      {this.id,
      this.questionId,
      this.path,
      this.name,
      this.displayName,
      this.height,
      this.width,
      this.order,
      this.createdAt,
      this.isAvatar,
      this.answerId});

  Images.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_id'] = this.questionId;
    data['path'] = this.path;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['height'] = this.height;
    data['width'] = this.width;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['is_avatar'] = this.isAvatar;
    data['answer_id'] = this.answerId;
    return data;
  }
}

class Answer {
  String? id;
  String? answer;
  String? createdAt;
  String? updatedAt;
  String? questionId;
  String? status;
  String? userId;
  String? isImages;
  String? countReport;
  String? parentId;
  String? username;
  String? ratings;
  List<Images2>? images;
  List<Items>? items;


  Answer(
      {this.id,
      this.answer,
      this.createdAt,
      this.updatedAt,
      this.questionId,
      this.status,
      this.userId,
      this.isImages,
      this.countReport,
      this.parentId,
      this.username,
        this.ratings,
      this.images,
      this.items});

  Answer.fromJson(Map<String, dynamic> json) {
    images = <Images2>[];
    items = <Items>[];
    id = json['id'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    questionId = json['question_id'];
    status = json['status'];
    userId = json['user_id'];
    isImages = json['is_images'];
    ratings=json['ratings'];
    countReport = json['count_report'];
    parentId = json['parent_id'];
    username = json['username'];
    if (json['images'] != null) {

      json['images'].forEach((v) {
        images!.add(new Images2.fromJson(v));
      });
    }
    if (json['items'] != null) {

      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['question_id'] = this.questionId;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['ratings']=this.ratings;
    data['is_images'] = this.isImages;
    data['count_report'] = this.countReport;
    data['parent_id'] = this.parentId;
    data['username'] = this.username;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Images2 {
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
  String? answerId;

  Images2(
      {this.id,
      this.questionId,
      this.path,
      this.name,
      this.displayName,
      this.height,
      this.width,
      this.order,
      this.createdAt,
      this.isAvatar,
      this.answerId});

  Images2.fromJson(Map<String, dynamic> json) {
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

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question_id'] = this.questionId;
    data['path'] = this.path;
    data['name'] = this.name;
    data['display_name'] = this.displayName;
    data['height'] = this.height;
    data['width'] = this.width;
    data['order'] = this.order;
    data['created_at'] = this.createdAt;
    data['is_avatar'] = this.isAvatar;
    data['answer_id'] = this.answerId;
    return data;
  }
}

class Items {
  String? id;
  String? answer;
  String? createdAt;
  String? updatedAt;
  String? questionId;
  String? status;
  String? userId;
  String? isImages;
  String? countReport;
  String? parentId;
  String? username;

  Items(
      {this.id,
      this.answer,
      this.createdAt,
      this.updatedAt,
      this.questionId,
      this.status,
      this.userId,
      this.isImages,
      this.countReport,
      this.parentId,
      this.username});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    answer = json['answer'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    questionId = json['question_id'];
    status = json['status'];
    userId = json['user_id'];
    isImages = json['is_images'];
    countReport = json['count_report'];
    parentId = json['parent_id'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['answer'] = this.answer;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['question_id'] = this.questionId;
    data['status'] = this.status;
    data['user_id'] = this.userId;
    data['is_images'] = this.isImages;
    data['count_report'] = this.countReport;
    data['parent_id'] = this.parentId;
    data['username'] = this.username;
    return data;
  }
}
