import 'package:backbase/domain/entity/books_response_entity.dart';

abstract class BooksRepository {
  Future<BooksResponseEntity> getBooks(String param);

}