

part of 'flashlight_cubit.dart';

sealed class FlashlightState {
  const FlashlightState();
}

final class FlashlightInitial extends FlashlightState {}

final class TurnOnFlashlight extends FlashlightState {}

final class TurnOffFlashlight extends FlashlightState {}


