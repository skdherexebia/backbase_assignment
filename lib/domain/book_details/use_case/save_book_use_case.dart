import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/books/entity/books_response_entity.dart';
import 'package:backbase/domain/book_details/repository/book_details_repository.dart';

class SaveBookUseCase
    extends UseCase<bool, DocsEntity> {
  final BookDetailsRepository _repository;

  SaveBookUseCase(this._repository);

  @override
  Future<bool> call(
      {required DocsEntity params}) async {
    return await _repository.saveBook(params);
  }
}
