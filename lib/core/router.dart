import 'package:demo/core/app_router/route_constant.dart';
import 'package:demo/presentation/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
       GoRoute(
        name: AppRouteConstants.splashRouteName,
        path: AppRouteConstants.splashRouteName,
        builder: (context, state) => const SplashScreen(),
      ),
    ]);

  GoRouter get  router =>_router;
}