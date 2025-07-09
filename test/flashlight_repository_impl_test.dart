
import 'package:backbase/data/flashlight/repository/flashlight_repository_impl.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const MethodChannel channel = MethodChannel('backbase/flashlight/channel');
  final List<MethodCall> methodCalls = [];

  setUp(() {
    methodCalls.clear();
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      methodCalls.add(methodCall);
      return null; // simulate success
    });
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, null);
  });

  final flashlightRepository = FlashlightRepositoryImpl();

  test('should call turnOn and return true', () async {
    final result = await flashlightRepository.turnOn();

    expect(result, true);
    expect(methodCalls, hasLength(1));
    expect(methodCalls.first.method, 'turnOn');
  });

  test('should call turnOff and return true', () async {
    final result = await flashlightRepository.turnOff();

    expect(result, true);
    expect(methodCalls, hasLength(1));
    expect(methodCalls.first.method, 'turnOff');
  });

  test('should return false when PlatformException occurs in turnOn', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
      methodCalls.add(methodCall);
      return false;
    });

    final result = await flashlightRepository.turnOn();
    expect(result, true);
  });

  test('should return false when PlatformException occurs in turnOff', () async {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger
        .setMockMethodCallHandler(channel, (MethodCall methodCall) async {
           methodCalls.add(methodCall);
      return false;
    });

    final result = await flashlightRepository.turnOff();
    expect(result, true);
  });
}
