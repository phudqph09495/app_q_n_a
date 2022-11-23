/// id : "462118"
/// title : "Admin test chức năng"
/// description : "<p>Admin test chức năng</p>\r\n"
/// link : ""
/// type : "1"
/// recipient_id : "7434"
/// sender_id : "16"
/// unread : "0"
/// created_at : "1653553081"
/// updated_at : "1653553081"
/// recipient_real_id : null

class ModelNotifi {
  ModelNotifi({
      this.id, 
      this.title, 
      this.description, 
      this.link, 
      this.type, 
      this.recipientId, 
      this.senderId, 
      this.unread, 
      this.createdAt, 
      this.updatedAt, 
      this.object_id,
      this.recipientRealId,});

  ModelNotifi.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    link = json['link'];
    type = json['type'];
    recipientId = json['recipient_id'];
    senderId = json['sender_id'];
    unread = json['unread'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    object_id = json['object_id'];
    recipientRealId = json['recipient_real_id'];
  }
  String? id;
  String? title;
  String? description;
  String? link;
  String? type;
  String? recipientId;
  String? senderId;
  String? unread;
  String? createdAt;
  String? updatedAt;
  String? object_id;
  dynamic recipientRealId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['link'] = link;
    map['type'] = type;
    map['recipient_id'] = recipientId;
    map['sender_id'] = senderId;
    map['unread'] = unread;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    map['object_id'] = object_id;
    map['recipient_real_id'] = recipientRealId;
    return map;
  }

}