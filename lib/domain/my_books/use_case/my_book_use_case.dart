import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/my_books/entity/my_book_entity.dart';
import 'package:backbase/domain/my_books/repository/my_book_repository.dart';

class MyBookUseCase
    extends UseCase<List<MyBookEntity>, NoParams> {
  final MyBookRepository _repository;

  MyBookUseCase(this._repository);
  
  @override
  Future<List<MyBookEntity>> call({required NoParams params}) async{
    return await _repository.getBooks();
  }

 
  
}
