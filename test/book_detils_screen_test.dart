import 'package:backbase/domain/books/entity/books_response_entity.dart';
import 'package:backbase/presentation/book_details/book_details_cubit.dart';
import 'package:backbase/presentation/book_details/book_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:mocktail/mocktail.dart';

class MockBookDetailsCubit extends Mock implements BookDetailsCubit {}

void main() {
  late MockBookDetailsCubit mockCubit;
  late DocsEntity testDoc;
  final sl = GetIt.instance;
  setUp(() {
    mockCubit = MockBookDetailsCubit();

    sl.registerFactory<BookDetailsCubit>(() => mockCubit);
    testDoc = DocsEntity(
      title: 'The Psychopath Test',
      authorName: ['Tom Wolfe'],
      key: '/works/OL1925362W',
      coverEditionKey: 'OL14986907M',
      subtitle: 'A practical guide',
      coverI: 123,
    );
    when(() => mockCubit.state).thenReturn(DataSet());
    when(() => mockCubit.stream).thenAnswer((_) => const Stream.empty());
    when(() => mockCubit.book).thenReturn(testDoc);
    when(() => mockCubit.saveBook()).thenAnswer((_) async {});
    when(() => mockCubit.removeBook()).thenAnswer((_) async {});
    when(() => mockCubit.close()).thenAnswer((_) async {});
  });

  Widget buildTestWidget() {
    return MaterialApp(
      home: BlocProvider<BookDetailsCubit>.value(
        value: mockCubit,
        child: BooksDetailsScreen(doc: testDoc),
      ),
    );
  }

  testWidgets('calls saveBook when tapping on unselected favorite icon', (
    WidgetTester tester,
  ) async {
    when(() => mockCubit.state).thenReturn(DataSet());
    when(() => mockCubit.saveBook()).thenAnswer((_) async {});

    await tester.pumpWidget(buildTestWidget());

    await tester.tap(find.byIcon(Icons.favorite));
    await tester.pump(); 

    verify(() => mockCubit.saveBook()).called(1);
  });
}
