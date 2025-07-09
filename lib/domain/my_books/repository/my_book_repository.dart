import 'package:backbase/domain/my_books/entity/my_book_entity.dart';

abstract class MyBookRepository {
  Future<List<MyBookEntity>> getBooks();
}