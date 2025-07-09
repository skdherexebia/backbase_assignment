import 'package:backbase/domain/flashlight/repository/flashlight_repository.dart';
import 'package:flutter/services.dart';

class FlashlightRepositoryImpl extends FlashlightRepository {
  static const platform = MethodChannel('backbase/flashlight/channel');

  @override
  Future<bool> turnOff() async {
    try {
      await platform.invokeMethod('turnOff');
      return true;
    } on PlatformException catch (_) {
      return false;
    }
  }

  @override
  Future<bool> turnOn() async {
    try {
      await platform.invokeMethod('turnOn');
      return true;
    } on PlatformException {
      return false;
    }
  }
}
