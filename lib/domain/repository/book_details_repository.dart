
import 'package:backbase/domain/entity/books_response_entity.dart';

abstract class BookDetailsRepository {
  Future<bool> saveBook(DocsEntity book);
  Future<bool> getBook(DocsEntity id);
  Future<bool> removeBook(DocsEntity book);

}