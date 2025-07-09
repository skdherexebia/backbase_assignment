import 'package:backbase/core/app_router/route_constant.dart';
import 'package:backbase/domain/books/entity/books_response_entity.dart';
import 'package:backbase/presentation/book_details/book_details_screen.dart';
import 'package:backbase/presentation/books/books_screen.dart';
import 'package:backbase/presentation/dashboard/dashboard_screen.dart';
import 'package:backbase/presentation/flashlight/flashlight_screen.dart';
import 'package:backbase/presentation/my_books/my_books_screen.dart';
import 'package:backbase/presentation/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

class AppRouter {
  static final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        name: AppRouteConstants.splashRouteName,
        path: AppRouteConstants.splashRouteName,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.dashboardRouteName,
        path: AppRouteConstants.dashboardRouteName,
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.flashlightRouteName,
        path: AppRouteConstants.flashlightRouteName,
        builder: (context, state) => const FlashlightScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.booksRouteName,
        path: AppRouteConstants.booksRouteName,
        builder: (context, state) => const BooksScreen(),
      ),
      GoRoute(
        name: AppRouteConstants.bookDetailsRouteName,
        path: AppRouteConstants.bookDetailsRouteName,
        builder: (context, state) {
          final item = state.extra as DocsEntity;
          return BooksDetailsScreen(doc: item);
        },
      ),
      GoRoute(
        name: AppRouteConstants.myBooksRouteName,
        path: AppRouteConstants.myBooksRouteName,
        builder: (context, state) =>const MyBooksScreen(),
      ),


    ],
  );

  GoRouter get router => _router;
}
