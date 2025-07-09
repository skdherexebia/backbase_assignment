import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/books/entity/books_response_entity.dart';
import 'package:backbase/domain/my_books/entity/my_book_entity.dart';
import 'package:backbase/domain/my_books/use_case/my_book_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'my_books_state.dart';

class MyBooksCubit extends Cubit<MyBooksState> {
  MyBooksCubit(this._myBookUseCase) : super(MyBooksInitial());

  final MyBookUseCase _myBookUseCase;
  List<MyBookEntity> booksResponseEntity = [];
  

  Future<void> onRefresh() async {
    getBooks();
  }

  Future<void> getBooks() async {
    emit(ShowShimmer());
    booksResponseEntity = await _myBookUseCase.call(params: NoParams());
    emit(HideShimmer());
    emit(BooksFetched(booksResponseEntity));

  }

}
