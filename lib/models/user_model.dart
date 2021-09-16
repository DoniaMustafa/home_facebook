import 'dart:convert';

// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.data,
    this.total,
    this.page,
    this.limit,
  });

  List<UserData>? data;
  int? total;
  int? page;
  int? limit;

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
    data: List<UserData>.from(json["data"].map((x) => UserData.fromJson(x))),
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

class UserData {
  UserData({
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

  factory UserData.fromJson(Map<String, dynamic> json) => UserData(
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
