
import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/data/book_details/book_details_repository_impl.dart';
import 'package:backbase/data/books/repository/books_repository_impl.dart';
import 'package:backbase/data/device_information/repository/device_info_repository_impl.dart';
import 'package:backbase/data/flashlight/repository/flashlight_repository_impl.dart';
import 'package:backbase/data/my_books/repository/my_book_repositry_impl.dart';
import 'package:backbase/domain/my_books/repository/my_book_repository.dart';
import 'package:backbase/domain/repository/book_details_repository.dart';
import 'package:backbase/domain/repository/books_repository.dart';
import 'package:backbase/domain/repository/device_infomation_repository.dart';
import 'package:backbase/domain/repository/flashlight_repository.dart';

void setupRepositories() async {
  locator.registerFactory<BooksRepository>(
    () => BooksRepositoryImpl(
      locator.get(),
    ),
  );
  locator.registerFactory<BookDetailsRepository>(
    () => BookDetailsRepositoryImpl(
    ),
  );

  locator.registerFactory<DeviceInfomationRepository>(
    () => DeviceInfoRepositoryImpl(
    ),
  );

  locator.registerFactory<FlashlightRepository>(
    () => FlashlightRepositoryImpl(
    ),
  );

  locator.registerFactory<MyBookRepository>(
    () => MyBookRepositryImpl(
    ),
  );
}