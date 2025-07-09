import 'package:backbase/core/user_case/base_use_case.dart';
import 'package:backbase/domain/flashlight/use_case/turn_off_use_case.dart';
import 'package:backbase/domain/flashlight/use_case/turn_on_use_case.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'flashlight_state.dart';

class FlashlightCubit extends Cubit<FlashlightState> {
  FlashlightCubit(
    this._turnOnUseCase,
    this._turnOffUseCase,
  ) : super(TurnOffFlashlight());

  final TurnOnUseCase _turnOnUseCase;
  final TurnOffUseCase _turnOffUseCase;

  void turnOffFlashlight() async {
    await _turnOffUseCase.call(params: NoParams());
    emit(TurnOffFlashlight());
  }

  void turnOnFlashlight() async {
    await _turnOnUseCase.call(params: NoParams());
    emit(TurnOnFlashlight());
  }

}
