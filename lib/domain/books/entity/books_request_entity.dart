
class BooksRequestEntity {
    String title;
    int limit;
    int offset;

    BooksRequestEntity({
        required this.title,
        required this.limit,
        required this.offset,
    });
}
