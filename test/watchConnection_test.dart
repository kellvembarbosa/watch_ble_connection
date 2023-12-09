import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  const MethodChannel channel = MethodChannel('watchConnection');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, (call) async {
      return '42';
    });
  });

  tearDown(() {
    TestWidgetsFlutterBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });
}
