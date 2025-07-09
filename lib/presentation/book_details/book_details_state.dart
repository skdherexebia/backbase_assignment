

part of 'book_details_cubit.dart';

sealed class BooksDetailsState {
  const BooksDetailsState();
}

final class BooksDetailsInitial extends BooksDetailsState {}

final class DataSet extends BooksDetailsState {}

final class BookDetails extends BooksDetailsState {
  final String id;

  BookDetails(this.id);

}

final class AddToMyBookSuccessState extends BooksDetailsState {
  final String message;
  AddToMyBookSuccessState(this.message);
}

final class AddToMyBookSFailState extends BooksDetailsState {
  final String message;
  AddToMyBookSFailState(this.message);
}

final class BookExistInMyBookState extends BooksDetailsState {}
final class BookNotExistInMyBookState extends BooksDetailsState {}


