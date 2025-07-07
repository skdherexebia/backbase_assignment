import 'package:demo/core/di/service_locator.dart';
import 'package:demo/presentation/splash_screen/splash_cubit.dart';
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
          if(state is NavigateToHome){
            context.go('/details');
          }
        },
        child: Scaffold(
          body: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Text(""),
          ),
        ),
      ),
    );
  }
}
