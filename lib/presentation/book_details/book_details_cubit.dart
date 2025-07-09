import 'package:backbase/domain/books/entity/books_response_entity.dart';
import 'package:backbase/domain/book_details/use_case/get_book_use_case.dart';
import 'package:backbase/domain/book_details/use_case/remove_book_use_case.dart';
import 'package:backbase/domain/book_details/use_case/save_book_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BooksDetailsState> {
  BookDetailsCubit(this._saveBookUseCase, this._getBookUseCase, this._removeBookUseCase) : super(BooksDetailsInitial());

  final SaveBookUseCase _saveBookUseCase;
  final RemoveBookUseCase _removeBookUseCase;
  final GetBookUseCase _getBookUseCase;

  DocsEntity book = DocsEntity(title: '', key: '');
  goToHome() async {
    await Future.delayed(Duration(seconds: 1));
  }

  getBookStatus() async {
    bool res = await _getBookUseCase.call(params: book);
    if (res) {
       emit(BookExistInMyBookState());
    } else {
      emit(BookNotExistInMyBookState());
    }
  }

  setBookDetails(DocsEntity doc) async {
    book = doc;
    emit(DataSet());
    getBookStatus();
  }

  saveBook() async {
    bool res = await _saveBookUseCase.call(params: book);
    if (res) {
       emit(AddToMyBookSuccessState("Book saved successfully!"));
       getBookStatus();
    } else {
      emit(AddToMyBookSFailState("Something went wrong!"));
    }
  }

  removeBook() async {
    bool res = await _removeBookUseCase.call(params: book);
    if (res) {
       emit(AddToMyBookSuccessState("Book removed successfully"));
       getBookStatus();
    } else {
      emit(AddToMyBookSFailState("Something went wrong!"));
    }
  }
}
