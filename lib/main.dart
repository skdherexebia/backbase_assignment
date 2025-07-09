import 'package:backbase/app/app.dart';
import '../core/di/service_locator.dart' as injector;

void main() async {
   await injector.configurePreRequisites(completion: () async {
    startApp();
  });
}
