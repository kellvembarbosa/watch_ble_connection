import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'watch_connection_method_channel.dart';

abstract class WatchConnectionFlutterPlatform extends PlatformInterface {
  /// Constructs a WatchConnectionFlutterPlatform.
  WatchConnectionFlutterPlatform() : super(token: _token);

  static final Object _token = Object();

  static WatchConnectionFlutterPlatform _instance = MethodChannelWatchConnection();

  /// The default instance of [WatchConnectionFlutterPlatform] to use.
  ///
  /// Defaults to [WatchConnectionFlutterPlatform].
  static WatchConnectionFlutterPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WatchConnectionFlutterPlatform] when
  /// they register themselves.
  static set instance(WatchConnectionFlutterPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> sendWatchface(String path) {
    throw UnimplementedError('sendWatchface() has not been implemented.');
  }

  void sendMessage(Map<String, dynamic> message) {
    throw UnimplementedError('sendMessage() has not been implemented.');
  }

  void setData(String path, Map<String, dynamic> data) {
    throw UnimplementedError('setData() has not been implemented.');
  }
}
