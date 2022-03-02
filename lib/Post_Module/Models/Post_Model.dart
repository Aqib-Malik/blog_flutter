// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
    Post({
        this.id,
        this.title,
        this.code,
        this.content,
        this.date,
        this.user,
        this.category,
        this.totalLikes,
        this.comment,
    });

    int? id;
    String? title;
    String? code;
    String? content;
    DateTime? date;
    User? user;
    Category? category;
    int? totalLikes;
    List<dynamic>? comment;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        code: json["code"],
        content: json["content"],
        date: DateTime.parse(json["date"]),
        user: User.fromJson(json["user"]),
        category: Category.fromJson(json["category"]),
        totalLikes: json["totalLikes"],
        comment: List<dynamic>.from(json["comment"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "code": code,
        "content": content,
        "date": "${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}",
        "user": user!.toJson(),
        "category": category!.toJson(),
        "totalLikes": totalLikes,
        "comment": List<dynamic>.from(comment!.map((x) => x)),
    };
}

class Category {
    Category({
        this.id,
        this.title,
    });

    int? id;
    String? title;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    };
}

class User {
    User({
        this.id,
        this.password,
        this.lastLogin,
        this.isSuperuser,
        this.username,
        this.firstName,
        this.lastName,
        this.email,
        this.isStaff,
        this.isActive,
        this.dateJoined,
        this.groups,
        this.userPermissions,
    });

    int? id;
    String? password;
    DateTime? lastLogin;
    bool? isSuperuser;
    String? username;
    String? firstName;
    String? lastName;
    String? email;
    bool? isStaff;
    bool? isActive;
    DateTime? dateJoined;
    List<dynamic>? groups;
    List<dynamic>? userPermissions;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        password: json["password"],
        lastLogin: DateTime.parse(json["last_login"]),
        isSuperuser: json["is_superuser"],
        username: json["username"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        email: json["email"],
        isStaff: json["is_staff"],
        isActive: json["is_active"],
        dateJoined: DateTime.parse(json["date_joined"]),
        groups: List<dynamic>.from(json["groups"].map((x) => x)),
        userPermissions: List<dynamic>.from(json["user_permissions"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "password": password,
        "last_login": lastLogin?.toIso8601String(),
        "is_superuser": isSuperuser,
        "username": username,
        "first_name": firstName,
        "last_name": lastName,
        "email": email,
        "is_staff": isStaff,
        "is_active": isActive,
        "date_joined": dateJoined!.toIso8601String(),
        "groups": List<dynamic>.from(groups!.map((x) => x)),
        "user_permissions": List<dynamic>.from(userPermissions!.map((x) => x)),
    };
}
