

part of 'dashboard_cubit.dart';

sealed class DashboardState {
  const DashboardState();
}

final class DashboardInitial extends DashboardState {}

final class BatteryPercentage extends DashboardState {
  String percentage;
  BatteryPercentage(this.percentage);
  
}

final class DeviceName extends DashboardState {
  String deviceName;
  DeviceName(this.deviceName);
}


