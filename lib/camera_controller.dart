// ignore_for_file: avoid_pr

import 'package:template/common/function/common_function.dart';
import 'package:flutter/services.dart';

class NativeCameraController {
  static const MethodChannel _channel = MethodChannel('camera_capture_plugin');

  static Future<void> startRecording() async {
    try {
      await _channel.invokeMethod('startCamera');
    } catch (e) {
      pr('Error starting recording: $e');
    }
  }

  static Future<void> stopRecording() async {
    try {
      await _channel.invokeMethod('stopCamera');
    } catch (e) {
      pr('Error stopping recording: $e');
    }
  }
}
