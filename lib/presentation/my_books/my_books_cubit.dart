import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:backbase/domain/my_books/entity/my_book_entity.dart';
import 'package:backbase/domain/my_books/use_case/my_book_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'my_books_state.dart';

class MyBooksCubit extends Cubit<MyBooksState> {
  MyBooksCubit(this._myBookUseCase) : super(BooksInitial());

  final MyBookUseCase _myBookUseCase;
  List<MyBookEntity> booksResponseEntity = [];
  String searchText = '';
  

  Future<void> onRefresh() async {
    getBooks(searchText);
  }

  Future<void> getBooks(String searchKey) async {
    emit(ShowShimmer());
    searchText = searchKey;
    booksResponseEntity = await _myBookUseCase.call(params: NoParams());
    emit(HideShimmer());
    emit(BooksFetched(booksResponseEntity));

  }

  goToBookDetails(MyBookEntity book)async{
    // DocsEntity doc =DocsEntity(key:book.key , title: book.title,authorKey: book.authorKey,authorName: book.authorName,coverI: book.coverI,coverEditionKey: book.coverEditionKey) ;
    emit(GoToBookDetail(DocsEntity(key: "",title: "")));
  }
}
