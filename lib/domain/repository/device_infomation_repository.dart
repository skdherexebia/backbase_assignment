
abstract class DeviceInfomationRepository {
  Future<String> getBatteryPercentage();
  Future<String> getDeviceName();
  Future<String> getOsVersion();
}