package com.codera.template
import android.app.Activity
import android.view.TextureView
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.embedding.engine.plugins.activity.ActivityAware
import io.flutter.embedding.engine.plugins.activity.ActivityPluginBinding
import io.flutter.plugin.common.MethodChannel

class CameraCapturePlugin : FlutterPlugin, ActivityAware {
    private lateinit var channel: MethodChannel
    private var cameraCapture: CameraVideoCapture? = null
    private var textureView: TextureView? = null
    private var activity: Activity? = null
    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "camera_capture_plugin")
        channel.setMethodCallHandler { call, result ->
            when (call.method) {
                "startCamera" -> {
                    if (activity == null) {
                        result.error("NO_ACTIVITY", "CameraCapturePlugin requires an Activity.", null)
                        return@setMethodCallHandler
                    }
                    val context = flutterPluginBinding.applicationContext
                    if (textureView == null) {
                        textureView = TextureView(context)
                    }
                    if (cameraCapture == null) {
                        cameraCapture = CameraVideoCapture(context, textureView!!)
                    }
                    cameraCapture?.startCapture(activity!!)
                    result.success("Camera started")
                }
                "stopCamera" -> {
                    cameraCapture?.stopCapture()
                    cameraCapture = null
                    textureView = null
                    result.success("Camera stopped")
                }
                else -> {
                    result.notImplemented()
                }
            }
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    override fun onAttachedToActivity(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivityForConfigChanges() {
        activity = null
    }

    override fun onReattachedToActivityForConfigChanges(binding: ActivityPluginBinding) {
        activity = binding.activity
    }

    override fun onDetachedFromActivity() {
        activity = null
    }
}
