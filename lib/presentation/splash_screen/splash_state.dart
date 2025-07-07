

part of 'splash_cubit.dart';

sealed class SplashState {
  const SplashState();
}

final class SplashInitial extends SplashState {}

final class NavigateToHome extends SplashState {}
