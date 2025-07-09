import 'package:backbase/network/http_client/network_manager.dart' as network_manager;
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'bloc_module.dart' as block_module;
import 'endpoint_module.dart' as endpoints;
import 'repository_module.dart' as repository;



GetIt locator = GetIt.instance;

Future configurePreRequisites({required Function() completion}) async {
    
  block_module.setUpBloc();
  endpoints.setupEndpoints();
  repository.setupRepositories();

  _setupDefaultDio();
  completion();
}

void _setupDefaultDio() {
  locator.registerLazySingleton<Dio>(
      () => network_manager.initialiseDefaultDio(),
      instanceName: 'DefaultRestClient');
}