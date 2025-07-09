import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/repository/device_infomation_repository.dart';

class GetBatteryPerUseCase
    extends UseCase<String, NoParams> {
  final DeviceInfomationRepository _repository;

  GetBatteryPerUseCase(this._repository);
  
  @override
  Future<String> call({required NoParams params})async{
     return await _repository.getBatteryPercentage();
  }
}
