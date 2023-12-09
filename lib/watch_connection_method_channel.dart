import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:watch_ble_connection/watch_ble_flutter_platform_interface.dart';

/// Class WatchConnection for connect like sendMessage & setData with Watch
class MethodChannelWatchConnection extends WatchConnectionFlutterPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('watchface_manager_flutter');

  /// Get Platform Version
  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  /// Send a message to all connected watches
  Future<bool> sendWatchface(String path) async {
    final isWatchfaceInstalled = await methodChannel.invokeMethod<bool>('sendWatchface', {'path': path});
    return isWatchfaceInstalled ?? false;
  }

  /// send message to watch
  /// the message must conform to https://api.flutter.dev/flutter/services/StandardMessageCodec-class.html
  ///
  /// android consideration: message will be converted to a json string and send on a channel name "MessageChannel"
  @override
  void sendMessage(Map<String, dynamic> message) async {
    await methodChannel.invokeMethod('sendMessage', message);
  }

  /// set constant data
  /// the data must conform to https://api.flutter.dev/flutter/services/StandardMessageCodec-class.html
  /// android: sets data on data layer by the name
  @override
  void setData(String path, Map<String, dynamic> data) async {
    if (!path.startsWith("/")) {
      path = "/" + path;
    }
    await methodChannel.invokeListMethod('setData', {"path": path, "data": data});
  }
}
