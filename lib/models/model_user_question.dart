/// id : "6"
/// question : "Tại sao bật điều hòa xong người cứ thấy lạnh?"
/// created_at : "1657102993"
/// updated_at : "1658808775"
/// cat_id : "7"
/// status : "1"
/// user_id : "7434"
/// is_complete : "0"
/// description : null
/// deadline : "0"
/// is_image : "0"
/// class_id : "5"
/// subject_id : "15"
/// price : "0.00"
/// price_gift : "0.00"
/// username : "admin"
/// avatar_path : "/media/images/user-avatar/2022_08_03/"
/// avatar_name : "df8f0cb0-f94e-47f8-b932-8ca3842027c5-1659491844.jpg"
/// class_name : "Lớp 3"
/// subject_name : null
/// count_images : "0"
/// count_answer : "0"
/// user_count_question : "1"

class ModelUserQuestion {
  ModelUserQuestion({
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
      this.priceGift, 
      this.username, 
      this.avatarPath, 
      this.avatarName, 
      this.className, 
      this.subjectName, 
      this.countImages, 
      this.countAnswer, 
      this.userCountQuestion,});

  ModelUserQuestion.fromJson(dynamic json) {
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
    username = json['username'];
    avatarPath = json['avatar_path'];
    avatarName = json['avatar_name'];
    className = json['class_name'];
    subjectName = json['subject_name'];
    countImages = json['count_images'];
    countAnswer = json['count_answer'];
    userCountQuestion = json['user_count_question'];
  }
  String? id;
  String? question;
  String? createdAt;
  String? updatedAt;
  String? catId;
  String? status;
  String? userId;
  String? isComplete;
  dynamic description;
  String? deadline;
  String? isImage;
  String? classId;
  String? subjectId;
  String? price;
  String? priceGift;
  String? username;
  String? avatarPath;
  String? avatarName;
  String? className;
  dynamic subjectName;
  String? countImages;
  String? countAnswer;
  String? userCountQuestion;

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
    map['username'] = username;
    map['avatar_path'] = avatarPath;
    map['avatar_name'] = avatarName;
    map['class_name'] = className;
    map['subject_name'] = subjectName;
    map['count_images'] = countImages;
    map['count_answer'] = countAnswer;
    map['user_count_question'] = userCountQuestion;
    return map;
  }

}