import 'package:backbase/domain/books/entity/books_request_entity.dart';
import 'package:backbase/domain/books/entity/books_response_entity.dart';

abstract class BooksRepository {
  Future<BooksResponseEntity> getBooks(BooksRequestEntity param);

}