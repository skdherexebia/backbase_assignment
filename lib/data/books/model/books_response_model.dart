// To parse this JSON data, do
//
//     final booksModel = booksModelFromJson(jsonString);

import 'dart:convert';

BooksModel booksModelFromJson(String str) =>
    BooksModel.fromJson(json.decode(str));

String booksModelToJson(BooksModel data) => json.encode(data.toJson());

class BooksModel {
  int numFound;
  int start;
  bool numFoundExact;
  int booksModelNumFound;
  String documentationUrl;
  String q;
  dynamic offset;
  List<Doc> docs;

  BooksModel({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.booksModelNumFound,
    required this.documentationUrl,
    required this.q,
    required this.offset,
    required this.docs,
  });

  factory BooksModel.fromJson(Map<String, dynamic> json) => BooksModel(
    numFound: json["numFound"],
    start: json["start"],
    numFoundExact: json["numFoundExact"],
    booksModelNumFound: json["num_found"],
    documentationUrl: json["documentation_url"],
    q: json["q"],
    offset: json["offset"],
    docs: List<Doc>.from(json["docs"].map((x) => Doc.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "numFound": numFound,
    "start": start,
    "numFoundExact": numFoundExact,
    "num_found": booksModelNumFound,
    "documentation_url": documentationUrl,
    "q": q,
    "offset": offset,
    "docs": List<dynamic>.from(docs.map((x) => x.toJson())),
  };
}

class Doc {
  List<String>? authorKey;
  List<String>? authorName;
  String? coverEditionKey;
  int? coverI;
  String ebookAccess;
  int editionCount;
  int? firstPublishYear;
  bool hasFulltext;
  List<String>? ia;
  String? iaCollectionS;
  String key;
  List<String>? language;
  String? lendingEditionS;
  String? lendingIdentifierS;
  bool publicScanB;
  String title;
  String? subtitle;

  Doc({
    this.authorKey,
    this.authorName,
    this.coverEditionKey,
    this.coverI,
    required this.ebookAccess,
    required this.editionCount,
    this.firstPublishYear,
    required this.hasFulltext,
    this.ia,
    this.iaCollectionS,
    required this.key,
    this.language,
    this.lendingEditionS,
    this.lendingIdentifierS,
    required this.publicScanB,
    required this.title,
    this.subtitle,
  });

  factory Doc.fromJson(Map<String, dynamic> json) => Doc(
    authorKey:
        json["author_key"] == null
            ? []
            : List<String>.from(json["author_key"]!.map((x) => x)),
    authorName:
        json["author_name"] == null
            ? []
            : List<String>.from(json["author_name"]!.map((x) => x)),
    coverEditionKey: json["cover_edition_key"],
    coverI: json["cover_i"],
    ebookAccess: json['ebook_access'],
    editionCount: json["edition_count"],
    firstPublishYear: json["first_publish_year"],
    hasFulltext: json["has_fulltext"],
    ia: json["ia"] == null ? [] : List<String>.from(json["ia"]!.map((x) => x)),
    iaCollectionS: json["ia_collection_s"],
    key: json["key"],
    language:
        json["language"] == null
            ? []
            : List<String>.from(json["language"]!.map((x) => x)),
    lendingEditionS: json["lending_edition_s"],
    lendingIdentifierS: json["lending_identifier_s"],
    publicScanB: json["public_scan_b"],
    title: json["title"],
    subtitle: json["subtitle"],
  );

  Map<String, dynamic> toJson() => {
    "author_key":
        authorKey == null ? [] : List<dynamic>.from(authorKey!.map((x) => x)),
    "author_name":
        authorName == null ? [] : List<dynamic>.from(authorName!.map((x) => x)),
    "cover_edition_key": coverEditionKey,
    "cover_i": coverI,
    "ebook_access": ebookAccess,
    "edition_count": editionCount,
    "first_publish_year": firstPublishYear,
    "has_fulltext": hasFulltext,
    "ia": ia == null ? [] : List<dynamic>.from(ia!.map((x) => x)),
    "ia_collection_s": iaCollectionS,
    "key": key,
    "language":
        language == null ? [] : List<dynamic>.from(language!.map((x) => x)),
    "lending_edition_s": lendingEditionS,
    "lending_identifier_s": lendingIdentifierS,
    "public_scan_b": publicScanB,
    "title": title,
    "subtitle": subtitle,
  };
}