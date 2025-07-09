import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/books/entity/books_request_entity.dart';
import 'package:backbase/domain/books/entity/books_response_entity.dart';
import 'package:backbase/domain/books/repository/books_repository.dart';

class BooksUseCase
    extends UseCase<BooksResponseEntity, BooksRequestEntity> {
  final BooksRepository _repository;

  BooksUseCase(this._repository);

  @override
  Future<BooksResponseEntity> call(
      {required BooksRequestEntity params}) async {
    return await _repository.getBooks(params);
  }
}
