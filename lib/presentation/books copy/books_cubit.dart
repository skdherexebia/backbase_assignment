import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:backbase/domain/use_case/books_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'books_state.dart';

class BooksCubit extends Cubit<BooksState> {
  BooksCubit(this._booksUseCase) : super(BooksInitial());

  final BooksUseCase _booksUseCase;
  BooksResponseEntity? booksResponseEntity;
  String searchText = '';
  

  Future<void> onRefresh() async {
    getBooks(searchText);
  }

  Future<void> getBooks(String searchKey) async {
    emit(ShowShimmer());
    searchText = searchKey;
    booksResponseEntity = await _booksUseCase.call(params: searchKey);
    emit(HideShimmer());
    emit(BooksFetched(booksResponseEntity?.docs ?? []));

  }
}
