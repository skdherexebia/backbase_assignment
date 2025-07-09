// To parse this JSON data, do
//
//     final booksRequestModel = booksRequestModelFromJson(jsonString);

import 'dart:convert';

BooksRequestModel booksRequestModelFromJson(String str) => BooksRequestModel.fromJson(json.decode(str));

String booksRequestModelToJson(BooksRequestModel data) => json.encode(data.toJson());

class BooksRequestModel {
    String title;
    int limit;
    int offset;

    BooksRequestModel({
        required this.title,
        required this.limit,
        required this.offset,
    });

    factory BooksRequestModel.fromJson(Map<String, dynamic> json) => BooksRequestModel(
        title: json["title"],
        limit: json["limit"],
        offset: json["offset"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "limit": limit,
        "offset": offset,
    };
}
