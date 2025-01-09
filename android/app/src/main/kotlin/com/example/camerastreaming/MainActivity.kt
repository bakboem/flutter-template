package com.codera.template
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.codera.template/channel"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        flutterEngine.plugins.add(/* plugin = */ CameraCapturePlugin())
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                "startRecording" -> {
                    result.success(null) // Notify Flutter that the call was successful
                }
                "stopRecording" -> {
                    stopCameraRecording()
                    result.success(null)
                }
                else -> {
                    result.notImplemented() // Notify Flutter that the method is not implemented
                }
            }
        }
    }

    private fun startCameraRecording() {
        // Implement the logic to start camera recording
        println("Starting camera recording...")
    }

    private fun stopCameraRecording() {
        // Implement the logic to stop camera recording
        println("Stopping camera recording...")
    }
}
