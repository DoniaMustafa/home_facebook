
import 'dart:convert';

CommentsModel commentsModelFromJson(String str) => CommentsModel.fromJson(json.decode(str));

String commentsModelToJson(CommentsModel data) => json.encode(data.toJson());

class CommentsModel {
  CommentsModel({
    this.data,
    this.total,
    this.page,
    this.limit,
  });

  List<Data>? data;
  int? total;
  int? page;
  int? limit;

  factory CommentsModel.fromJson(Map<String, dynamic> json) => CommentsModel(
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    total: json["total"],
    page: json["page"],
    limit: json["limit"],
  );

  Map<String, dynamic> toJson() => {
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
    "total": total,
    "page": page,
    "limit": limit,
  };
}

class Data {
  Data({
    this.id,
    this.message,
    this.owner,
    this.post,
    this.publishDate,
  });

  String? id;
  String? message;
  Users? owner;
  String? post;
  DateTime? publishDate;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    message: json["message"],
    owner: Users.fromJson(json["owner"]),
    post: json["post"],
    publishDate: DateTime.parse(json["publishDate"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "message": message,
    "owner": owner!.toJson(),
    "post": post,
    "publishDate": publishDate!.toIso8601String(),
  };
}

class Users {
  Users({
    this.id,
    this.title,
    this.firstName,
    this.lastName,
    this.picture,
  });

  String? id;
  String? title;
  String? firstName;
  String? lastName;
  String? picture;

  factory Users.fromJson(Map<String, dynamic> json) => Users(
    id: json["id"],
    title: json["title"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    picture: json["picture"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "firstName": firstName,
    "lastName": lastName,
    "picture": picture,
  };
}
