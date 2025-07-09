import 'package:dio/dio.dart';


Dio initialiseDefaultDio() {
  final dio = Dio();
  dio.options = _initialiseGlobalDefaults();

  return dio;
}

BaseOptions _initialiseGlobalDefaults() {
  final BaseOptions baseOptions = BaseOptions()
    ..contentType = Headers.jsonContentType
    ..receiveDataWhenStatusError = true
    ..connectTimeout = const Duration(seconds: 10)
    ..headers = _getHeaders();

  return baseOptions;
}

Map<String, String> _getHeaders() {
  return {
    'Content-Type': 'application/json; charset=UTF-8',
  };
}
