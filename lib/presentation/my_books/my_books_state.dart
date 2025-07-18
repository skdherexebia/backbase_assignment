


part of 'my_books_cubit.dart';


class MyBooksState {
  const MyBooksState();
}

final class MyBooksInitial extends MyBooksState {}

final class BooksFetched extends MyBooksState {
  final List<MyBookEntity> list;

  BooksFetched(this.list);

}

final class ShowShimmer extends MyBooksState {}
final class HideShimmer extends MyBooksState {}
final class BookDetails extends MyBooksState {
  final String id;

  BookDetails(this.id);

}

final class GoToBookDetail extends MyBooksState {
  final DocsEntity doc;
  GoToBookDetail(this.doc);
}

