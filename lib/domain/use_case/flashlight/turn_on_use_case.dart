import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/repository/flashlight_repository.dart';

class TurnOnUseCase
    extends UseCase<bool, NoParams> {
  final FlashlightRepository _repository;

  TurnOnUseCase(this._repository);
  
  @override
  Future<bool> call({required NoParams params}) async {
     return await _repository.turnOn();
  }
 
}
