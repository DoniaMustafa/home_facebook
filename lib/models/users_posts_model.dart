// To parse this JSON data, do
//
//     final usersPostsModel = usersPostsModelFromJson(jsonString);

import 'dart:convert';

UsersPostsModel usersPostsModelFromJson(String str) => UsersPostsModel.fromJson(json.decode(str));

String usersPostsModelToJson(UsersPostsModel data) => json.encode(data.toJson());

class UsersPostsModel {
  UsersPostsModel({
    this.data,
    this.total,
    this.page,
    this.limit,
  });

  List<PostsData>? data;
  int? total;
  int? page;
  int? limit;

  factory UsersPostsModel.fromJson(Map<String, dynamic> json) => UsersPostsModel(
    data: List<PostsData>.from(json["data"].map((x) => PostsData.fromJson(x))),
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

class PostsData {
  PostsData({
    this.id,
    this.image,
    this.likes,
    this.tags,
    this.text,
    this.publishDate,
    this.owner,
  });

  String? id;
  String? image;
  int? likes;
  List<String>? tags;
  String? text;
  String? publishDate;
  Owner? owner;

  factory PostsData.fromJson(Map<String, dynamic> json) => PostsData(
    id: json["id"],
    image: json["image"],
    likes: json["likes"],
    tags: List<String>.from(json["tags"].map((x) => x)),
    text: json["text"],
    publishDate: json["publishDate"],
    owner: Owner.fromJson(json["owner"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image": image,
    "likes": likes,
    "tags": List<String>.from(tags!.map((x) => x)),
    "text": text,
    "publishDate": publishDate,
    "owner": owner?.toJson(),
  };
}

class Owner {
  Owner({
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

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
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
