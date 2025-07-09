
class BooksResponseEntity {
  int numFound;
  int start;
  bool numFoundExact;
  int booksModelNumFound;
  String documentationUrl;
  String q;
  dynamic offset;
  List<DocsEntity> docs;

  BooksResponseEntity({
    required this.numFound,
    required this.start,
    required this.numFoundExact,
    required this.booksModelNumFound,
    required this.documentationUrl,
    required this.q,
    required this.offset,
    required this.docs,
  });
}

class DocsEntity {
  List<String>? authorKey;
  List<String>? authorName;
  String? coverEditionKey;
  String key;
  int? coverI;
  String title;
  String? subtitle;

  DocsEntity({
    this.authorKey,
    this.authorName,
    this.coverEditionKey,
    this.coverI,
    required this.title,
    required this.key,
    this.subtitle,
  });

}