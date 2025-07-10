import 'package:backbase/domain/device_information/repository/device_infomation_repository.dart';
import 'package:flutter/services.dart';

class DeviceInfoRepositoryImpl extends DeviceInfomationRepository {
  static const platform = MethodChannel('backbase/channels');
  String batteryLevel = '';
  String deviceName = '';

  @override
  Future<String> getBatteryPercentage() async {
    try {
      final int result = await platform.invokeMethod('getBatteryLevel');
      batteryLevel = ' $result%';
    } on PlatformException catch (e) {
      batteryLevel = "Failed to get battery level: '${e.message}'.";
    }

    return batteryLevel;
  }

  @override
  Future<String> getDeviceName() async {
    try {
      deviceName = await platform.invokeMethod('getDeviceName');
    } on PlatformException catch (e) {
      deviceName = "Failed to get battery level: '${e.message}'.";
    }
    return deviceName;
  }

  @override
  Future<String> getOsVersion() {
    throw UnimplementedError();
  }
}
