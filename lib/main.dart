import 'package:demo/app/app.dart';
import '../core/di/service_locator.dart' as injector;

void main() async{
   await injector.configurePreRequisites(completion: () {
    startApp();
  });
}
