import 'package:backbase/domain/repository/flashlight_repository.dart';
import 'package:flutter/services.dart';

class FlashlightRepositoryImpl extends FlashlightRepository {
  static const platform = MethodChannel('backbase/flashlight/channel');

  @override
  Future<bool> turnOff() async {
    try {
      await platform.invokeMethod('turnOff');
    } on PlatformException catch (_) {
      return false;
    }
    return false;
  }

  @override
  Future<bool> turnOn() async {
    try {
      await platform.invokeMethod('turnOn');
    } on PlatformException catch (_) {
      return false;
    }
    return false;
  }
}
