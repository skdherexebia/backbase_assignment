import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/repository/device_infomation_repository.dart';

class GetOsVersionUseCase
    extends UseCase<String, NoParams> {
  final DeviceInfomationRepository _repository;

  GetOsVersionUseCase(this._repository);
  
  @override
  Future<String> call({required NoParams params})async{
     return await _repository.getOsVersion();
  }
}
