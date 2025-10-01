import 'package:flutter/services.dart';

class PlatformService {
  static const MethodChannel _channel = MethodChannel('com.example/platform');

  Future<String?> getPlatformVersion() async {
    try {
      final String? version = await _channel.invokeMethod('getPlatformVersion');
      return version;
    } on PlatformException catch (e) {
      print("Failed to get platform version: '${e.message}'.");
      return null;
    }
  }

  Future<String?> getBatteryLevel() async {
    try {

      final double? level = await _channel.invokeMethod('getBatteryLevel');

      return level.toString();
    } on PlatformException catch (e) {
    print("================================$e");
      return null;
    }
  }




}