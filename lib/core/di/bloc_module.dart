import 'package:demo/core/di/service_locator.dart';
import 'package:demo/presentation/splash_screen/splash_cubit.dart';

Future<void> setUpBloc() async {
   _setupSplashCubit();
}


void _setupSplashCubit(){
  locator.registerFactory(
      () => SplashCubit());
}
