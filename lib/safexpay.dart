import 'dart:async';

import 'package:flutter/services.dart';


export 'AppHeader.dart';
export 'constants/constants.dart';
export 'constants/keyword_constants.dart';
export 'constants/merchant_constants.dart';
export 'constants/utility.dart';
export 'screen_1.dart';

class Safexpay {
  static const MethodChannel _channel = const MethodChannel('safexpay');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
