import 'package:get_it/get_it.dart';

import 'bloc_module.dart' as block_module;


GetIt locator = GetIt.instance;

Future configurePreRequisites({required Function() completion}) async {
    
  block_module.setUpBloc();
  completion();
}