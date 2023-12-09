import 'package:watch_ble_connection/watch_ble_flutter_platform_interface.dart';

/// Bearer file
export 'watch_connection_method_channel.dart';
export 'watch_listener.dart';

class WatchConnection {
  /// Get Platform Version
  /// return String
  static Future<String?> getPlatformVersion() async {
    return await WatchConnectionFlutterPlatform.instance.getPlatformVersion();
  }

  /// Send a message to all connected watches
  /// return bool
  /// path: String
  static Future<bool> sendWatchface(String path) async {
    return await WatchConnectionFlutterPlatform.instance.sendWatchface(path);
  }

  /// send message to watch
  /// the message must conform to https://api.flutter.dev/flutter/services/StandardMessageCodec-class.html
  /// return void
  /// message: Map<String, dynamic>
  /// android consideration: message will be converted to a json string and send on a channel name "MessageChannel"
  static void sendMessage(Map<String, dynamic> message) {
    WatchConnectionFlutterPlatform.instance.sendMessage(message);
  }

  /// set constant data
  /// the data must conform to https://api.flutter.dev/flutter/services/StandardMessageCodec-class.html
  /// android: sets data on data layer by the name
  /// return void
  /// path: String
  /// data: Map<String, dynamic>
  /// android: sets data on data layer by the name
  static void setData(String path, Map<String, dynamic> data) {
    WatchConnectionFlutterPlatform.instance.setData(path, data);
  }
}
