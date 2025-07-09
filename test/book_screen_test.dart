import 'package:backbase/data/books/model/books_response_model.dart';
import 'package:backbase/data/books/endpoint/books_endpoint.dart';
import 'package:backbase/data/books/repository/books_repository_impl.dart';
import 'package:backbase/domain/entity/books_response_entity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockBooksEndpoint extends Mock implements BooksEndpoint {}

void main() {
  late BooksRepositoryImpl repository;
  late MockBooksEndpoint mockBooksEndpoint;

  setUp(() {
    mockBooksEndpoint = MockBooksEndpoint();
    repository = BooksRepositoryImpl(mockBooksEndpoint);
  });

  final tBooksModel = BooksModel(
    numFound: 1,
    start: 0,
    numFoundExact: true,
    booksModelNumFound: 1,
    documentationUrl: 'https://example.com',
    offset: 0,
    docs: [
      Doc(
        title: 'Flutter Clean Architecture',
        authorName: ['John Doe'],
        key: 'key_1',
        coverEditionKey: 'edition_1',
        subtitle: 'A practical guide',
        coverI: 123, ebookAccess: '', editionCount: 4, hasFulltext: false, publicScanB: false,
      ),
    ], q: '',
  );

  group('BooksRepositoryImpl', () {
    test('should return BooksResponseEntity on successful fetch', () async {
      when(() => mockBooksEndpoint.getBooks(title: 'flutter'))
          .thenAnswer((_) async => tBooksModel);

      final result = await repository.getBooks('flutter');

      expect(result, isA<BooksResponseEntity>());
      expect(result.docs.length, 1);
      expect(result.docs[0].title, 'Flutter Clean Architecture');
      verify(() => mockBooksEndpoint.getBooks(title: 'flutter')).called(1);
    });

    test('should throw Connection Timeout error on DioExceptionType.connectionTimeout', () async {
      when(() => mockBooksEndpoint.getBooks(title: 'flutter')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      expect(() => repository.getBooks('flutter'),
          throwsA(predicate((e) => e is Exception && e.toString().contains('Connection Timeout'))));
    });

    test('should throw API error if DioException has response', () async {
      when(() => mockBooksEndpoint.getBooks(title: 'flutter')).thenThrow(
        DioException(
          response: Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 400,
            statusMessage: 'Bad Request',
          ),
          requestOptions: RequestOptions(path: ''),
        ),
      );

      expect(() => repository.getBooks('flutter'),
          throwsA(predicate((e) => e.toString().contains('API Error: 400 Bad Request'))));
    });

    test('should throw generic error on unknown DioException', () async {
      when(() => mockBooksEndpoint.getBooks(title: 'flutter')).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          message: 'Something broke',
        ),
      );

      expect(() => repository.getBooks('flutter'),
          throwsA(predicate((e) => e.toString().contains('Unexpected Error'))));
    });

    test('should throw fallback error on non-DioException', () async {
      when(() => mockBooksEndpoint.getBooks(title: 'flutter'))
          .thenThrow(Exception('Unknown'));

      expect(() => repository.getBooks('flutter'),
          throwsA(predicate((e) => e.toString().contains('Something went wrong'))));
    });
  });
}
