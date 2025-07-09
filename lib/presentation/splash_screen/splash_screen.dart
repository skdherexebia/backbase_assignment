import 'package:backbase/common/theme/app_colors.dart';
import 'package:backbase/core/app_router/route_constant.dart';
import 'package:backbase/core/di/service_locator.dart';
import 'package:backbase/presentation/splash_screen/splash_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late SplashCubit _splashcubit;

  @override
  void initState() {
    super.initState();
    _splashcubit = locator.get<SplashCubit>();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _splashcubit.goToHome(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _splashcubit,
      child: BlocListener<SplashCubit, SplashState>(
        listener: (context, state) {
          if (state is NavigateToHome) {
            context.go(AppRouteConstants.booksRouteName);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.primary, // Use your theme color
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Backbase Demo",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 180),
                const CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
