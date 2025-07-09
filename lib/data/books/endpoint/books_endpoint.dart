import 'package:backbase/data/books/model/books_request_model.dart';
import 'package:backbase/data/books/model/books_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'books_endpoint.g.dart';

@RestApi(baseUrl: "https://openlibrary.org/search.json")
abstract class BooksEndpoint {
   factory BooksEndpoint(Dio dio, {String baseUrl}) = _BooksEndpoint;


  @GET("")
  Future<BooksModel> getBooks(
    @Queries() BooksRequestModel param,
  );

}