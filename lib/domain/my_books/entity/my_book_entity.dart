

class MyBookEntity {
  List<String>? authorKey;
  List<String>? authorName;
  String? coverEditionKey;
  String key;
  int? coverI;
  String title;
  String? subtitle;

  MyBookEntity({
    this.authorKey,
    this.authorName,
    this.coverEditionKey,
    this.coverI,
    required this.title,
    required this.key,
    this.subtitle,
  });

}