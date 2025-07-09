import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/use_case/dashboard/get_battery_per_use_case.dart';
import 'package:backbase/domain/use_case/dashboard/get_device_name_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'dashboard_state.dart';

class DashboardCubit extends Cubit<DashboardState> {
  DashboardCubit(
    this._batteryPerUseCase,
    this._deviceNameUseCase,
  ) : super(DashboardInitial());

  final GetBatteryPerUseCase _batteryPerUseCase;
  final GetDeviceNameUseCase _deviceNameUseCase;

  void getBatteryLevel() async {
     await Future.delayed(Duration(seconds: 2));
    String batteryLevel = await _batteryPerUseCase.call(params: NoParams());
    emit(BatteryPercentage(batteryLevel));
    await Future.delayed(Duration(seconds: 2));
    getDeviceName();
  }

  void getDeviceName() async {
    String deviceName = await _deviceNameUseCase.call(params: NoParams());
    emit(DeviceName(deviceName));
  }

}
