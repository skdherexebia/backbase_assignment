import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/device_information/repository/device_infomation_repository.dart';

class GetDeviceNameUseCase
    extends UseCase<String, NoParams> {
  final DeviceInfomationRepository _repository;

  GetDeviceNameUseCase(this._repository);
  
  @override
  Future<String> call({required NoParams params})async{
     return await _repository.getDeviceName();
  }
}
