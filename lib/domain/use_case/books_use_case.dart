import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:backbase/domain/repository/books_repository.dart';

class BooksUseCase
    extends UseCase<BooksResponseEntity, String> {
  final BooksRepository _repository;

  BooksUseCase(this._repository);

  @override
  Future<BooksResponseEntity> call(
      {required String params}) async {
    return await _repository.getBooks(params);
  }
}
