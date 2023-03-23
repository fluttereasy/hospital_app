import 'dart:async';

import 'package:flutter/services.dart';


export 'AppHeader.dart';
export 'screen_1.dart';

class Safexpay {
  static const MethodChannel _channel = const MethodChannel('safexpay');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
