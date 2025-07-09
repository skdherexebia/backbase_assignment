import 'package:backbase/domain/books/entity/books_request_entity.dart';
import 'package:backbase/domain/books/entity/books_response_entity.dart';
import 'package:backbase/domain/books/use_case/books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this._booksUseCase) : super(BooksInitial());

  final BooksUseCase _booksUseCase;
  BooksResponseEntity? booksResponseEntity;
  List<DocsEntity>  books = [];
  String searchText = '';
  int offset = 0;
  int perPage =10;
  int currentPage =1;
  bool isLoading = false;

  Future<void> onRefresh() async {
    getBooks(searchText);
  }


  Future<void> getBooks(String key) async {
    offset = 0;
    books = [];
    callApi(key);
  }

  void callApi(String searchKey) async {
    isLoading = true;
    if(books.isEmpty){
      emit(ShowShimmer());
    }

    searchText = searchKey;
    if(searchText.isEmpty){
      emit(BooksInitial());
      return;
    }

    BooksRequestEntity params  = BooksRequestEntity(title: searchKey, limit: perPage, offset: offset);
    try {
      booksResponseEntity = await _booksUseCase.call(params: params);
      
      for(var book in booksResponseEntity?.docs ?? []){
        books.add(book);
      }
      emit(BooksFetched(books));
      isLoading = false;
    } catch (e) {
      emit(FailState("Something went wrong"));
      emit(BooksFetched(booksResponseEntity?.docs ?? []));
      isLoading = false;
    }
  }

  void loadMore(){
    offset =  offset+perPage;
    callApi(searchText);

  }
  
}
