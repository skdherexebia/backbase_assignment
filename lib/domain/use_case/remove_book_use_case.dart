import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:backbase/domain/repository/book_details_repository.dart';

class RemoveBookUseCase
    extends UseCase<bool, DocsEntity> {
  final BookDetailsRepository _repository;

  RemoveBookUseCase(this._repository);

  @override
  Future<bool> call(
      {required DocsEntity params}) async {
    return await _repository.removeBook(params);
  }
}
