import 'package:flutter_bloc/flutter_bloc.dart';
part 'splash_state.dart';

class SplashCubit extends Cubit<SplashState> {
  SplashCubit()
      : super(SplashInitial());

  goToHome() async{
    await  Future.delayed(Duration(seconds: 1));
    emit(NavigateToHome());
  }
}