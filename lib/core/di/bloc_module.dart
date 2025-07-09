import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/domain/my_books/use_case/my_book_use_case.dart';
import 'package:backbase/domain/books/use_case/books_use_case.dart';
import 'package:backbase/domain/device_information/use_case/get_battery_per_use_case.dart';
import 'package:backbase/domain/device_information/use_case/get_device_name_use_case.dart';
import 'package:backbase/domain/device_information/use_case/get_os_version_use_case.dart';
import 'package:backbase/domain/flashlight/use_case/turn_off_use_case.dart';
import 'package:backbase/domain/flashlight/use_case/turn_on_use_case.dart';
import 'package:backbase/domain/book_details/use_case/get_book_use_case.dart';
import 'package:backbase/domain/book_details/use_case/remove_book_use_case.dart';
import 'package:backbase/domain/book_details/use_case/save_book_use_case.dart';
import 'package:backbase/presentation/book_details/book_details_cubit.dart';
import 'package:backbase/presentation/books/books_cubit.dart';
import 'package:backbase/presentation/dashboard/dashboard_cubit.dart';
import 'package:backbase/presentation/flashlight/flashlight_cubit.dart';
import 'package:backbase/presentation/my_books/my_books_cubit.dart';
import 'package:backbase/presentation/splash_screen/splash_cubit.dart';

Future<void> setUpBloc() async {
  _setupSplashCubit();
  _setupBooksCubit();
  _setupBookDetailsCubit();
  _setDashboardCubit();
  _setFlashlightCubit();
  _setMyBooksCubit();
}

void _setupSplashCubit() {
  locator.registerFactory(() => SplashCubit());
}

void _setupBooksCubit() {
  locator.registerFactory(() => BooksCubit(locator.get()));
  locator.registerFactory(() => BooksUseCase(locator.get()));
}

void _setupBookDetailsCubit() {
  locator.registerFactory(() => BookDetailsCubit(locator.get(),locator.get(),locator.get()));
  locator.registerFactory(() => SaveBookUseCase(locator.get()));
  locator.registerFactory(() => GetBookUseCase(locator.get()));
  locator.registerFactory(() => RemoveBookUseCase(locator.get()));
}

void _setMyBooksCubit() {
  locator.registerFactory(() => MyBooksCubit(locator.get()));
  locator.registerFactory(() => MyBookUseCase(locator.get()));
}

void _setDashboardCubit() {
  locator.registerFactory(
    () => DashboardCubit(locator.get(), locator.get()),
  );
  locator.registerFactory(() => GetBatteryPerUseCase(locator.get()));
  locator.registerFactory(() => GetDeviceNameUseCase(locator.get()));
  locator.registerFactory(() => GetOsVersionUseCase(locator.get()));
}

void _setFlashlightCubit() {
  locator.registerFactory(
    () => FlashlightCubit(locator.get(), locator.get()),
  );
  locator.registerFactory(() => TurnOnUseCase(locator.get()));
  locator.registerFactory(() => TurnOffUseCase(locator.get()));
}
