// To parse this JSON data, do
//
//     final myBookModel = myBookModelFromJson(jsonString);

import 'dart:convert';

MyBookModel myBookModelFromJson(String str) => MyBookModel.fromJson(json.decode(str));

String myBookModelToJson(MyBookModel data) => json.encode(data.toJson());

class MyBookModel {
    List<String>? authorKey;
    List<String>? authorName;
    String? coverEditionKey;
    String key;
    int? coverI;
    String title;
    String? subtitle;

    MyBookModel({
        required this.authorKey,
        required this.authorName,
        required this.coverEditionKey,
        required this.coverI,
        required this.key,
        required this.title,
    });

    factory MyBookModel.fromJson(Map<String, dynamic> json) => MyBookModel(
        authorKey: List<String>.from(json["author_key"].map((x) => x)),
        authorName: List<String>.from(json["author_name"].map((x) => x)),
        coverEditionKey: json["cover_edition_key"],
        coverI: json["cover_i"],
        key: json["key"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "author_key": authorKey,
        "author_name": authorName,
        "cover_edition_key": coverEditionKey,
        "cover_i": coverI,
        "key": key,
        "title": title,
    };
}
