import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/data/books/endpoint/books_endpoint.dart';

void setupEndpoints() {
  locator.registerFactory(
    () => BooksEndpoint(
      locator.get(instanceName: 'DefaultRestClient'),
    ),
  );
}