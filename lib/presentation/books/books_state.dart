

part of 'books_cubit.dart';

sealed class BooksState {
  const BooksState();
}

final class BooksInitial extends BooksState {}

final class BooksFetched extends BooksState {
   List<DocsEntity> list;

  BooksFetched(this.list);

}

final class ShowShimmer extends BooksState {}
final class HideShimmer extends BooksState {}
final class BookDetails extends BooksState {
   String id;

  BookDetails(this.id);

}

final class FailState extends BooksState {
   String message;
  FailState(this.message);
}

