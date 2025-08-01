import 'package:backbase/data/books/endpoint/books_endpoint.dart';
import 'package:backbase/data/books/model/books_request_model.dart';
import 'package:backbase/data/books/model/books_response_model.dart';
import 'package:backbase/data/books/repository/books_repository_impl.dart';
import 'package:backbase/domain/books/entity/books_request_entity.dart';
import 'package:backbase/domain/books/entity/books_response_entity.dart';
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
    registerFallbackValue(BooksRequestModel(title: '', limit: 0, offset: 0));
  });

  final tBooksModel = BooksModel(
    numFound: 1,
    start: 0,
    numFoundExact: true,
    booksModelNumFound: 1,
    documentationUrl: 'https://openlibrary.org/dev/docs/api/search',
    offset: 0,
    docs: [
      Doc(
        title: 'The Psychopath Test',
        authorName: ['Tom Wolfe'],
        key: '/works/OL1925362W',
        coverEditionKey: 'OL14986907M',
        subtitle: 'A practical guide',
        coverI: 7240390,
        ebookAccess: '',
        editionCount: 4,
        hasFulltext: false,
        publicScanB: false,
      ),
    ],
    q: '',
  );

  group('BooksRepositoryImpl', () {
    final tRequestEntity = BooksRequestEntity(
      title: 'Test',
      limit: 10,
      offset: 0,
    );

    test('should return BooksResponseEntity on successful fetch', () async {
      when(
        () => mockBooksEndpoint.getBooks(any()),
      ).thenAnswer((_) async => tBooksModel);

      final result = await repository.getBooks(tRequestEntity);

      expect(result, isA<BooksResponseEntity>());
      expect(result.docs.length, 1);
      expect(result.docs[0].title, 'The Psychopath Test');
      verify(() => mockBooksEndpoint.getBooks(any())).called(1);
    });

    test(
      'should throw Connection Timeout error on DioExceptionType.connectionTimeout',
      () async {
        when(() => mockBooksEndpoint.getBooks(any())).thenThrow(
          DioException(
            requestOptions: RequestOptions(path: ''),
            type: DioExceptionType.connectionTimeout,
          ),
        );

        expect(
          () => repository.getBooks(tRequestEntity),
          throwsA(
            predicate((e) => e.toString().contains('Connection Timeout')),
          ),
        );
      },
    );

    test('should throw API error if DioException has response', () async {
      when(() => mockBooksEndpoint.getBooks(any())).thenThrow(
        DioException(
          response: Response(
            requestOptions: RequestOptions(path: ''),
            statusCode: 400,
            statusMessage: 'Bad Request',
          ),
          requestOptions: RequestOptions(path: ''),
        ),
      );

      expect(
        () => repository.getBooks(tRequestEntity),
        throwsA(
          predicate((e) => e.toString().contains('API Error: 400 Bad Request')),
        ),
      );
    });

    test('should throw Unexpected Error on unknown DioException', () async {
      when(() => mockBooksEndpoint.getBooks(any())).thenThrow(
        DioException(
          requestOptions: RequestOptions(path: ''),
          message: 'Something broke',
        ),
      );

      expect(
        () => repository.getBooks(tRequestEntity),
        throwsA(predicate((e) => e.toString().contains('Unexpected Error'))),
      );
    });

    test('should throw Something went wrong on non-DioException', () async {
      when(
        () => mockBooksEndpoint.getBooks(any()),
      ).thenThrow(Exception('Unknown'));

      expect(
        () => repository.getBooks(tRequestEntity),
        throwsA(
          predicate((e) => e.toString().contains('Something went wrong')),
        ),
      );
    });
  });
}
