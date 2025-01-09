package com.codera.template

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.pm.PackageManager
import android.graphics.SurfaceTexture
import android.hardware.camera2.*
import android.media.MediaCodec
import android.media.MediaCodecInfo
import android.media.MediaFormat
import android.os.Environment
import android.util.Log
import android.util.Size
import android.view.Surface
import android.view.TextureView
import androidx.core.app.ActivityCompat
import java.io.File
import java.io.FileOutputStream
import java.nio.ByteBuffer

class CameraVideoCapture(
    private val context: Context,
    private val textureView: TextureView // 用于展示预览画面
) {
    private lateinit var cameraDevice: CameraDevice
    private lateinit var captureSession: CameraCaptureSession
    private lateinit var mediaCodec: MediaCodec

    private var videoFile: File = File(
        Environment.getExternalStorageDirectory(),
        "play.mp4"
    )
    companion object {
        const val REQUEST_CAMERA_PERMISSION = 101
    }
    private val CHANNEL_TAG: String = "CameraVideoCapture"

    fun startCapture(activity: Activity) {
        // 检查权限
        if (ActivityCompat.checkSelfPermission(
                context,
                Manifest.permission.CAMERA
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(
                activity,
                arrayOf(Manifest.permission.CAMERA),
                REQUEST_CAMERA_PERMISSION
            )
            return
        }

        // 权限已被授予，继续初始化相机
        val cameraManager = context.getSystemService(Context.CAMERA_SERVICE) as CameraManager
        val cameraId = cameraManager.cameraIdList.first() // 默认使用第一个摄像头
        val cameraCharacteristics = cameraManager.getCameraCharacteristics(cameraId)

        val previewSize = cameraCharacteristics.get(
            CameraCharacteristics.SCALER_STREAM_CONFIGURATION_MAP
        )!!.getOutputSizes(SurfaceTexture::class.java).first()

        val surfaceTexture = textureView.surfaceTexture!!
        surfaceTexture.setDefaultBufferSize(previewSize.width, previewSize.height)
        val previewSurface = Surface(surfaceTexture)
        // 初始化 MediaCodec
        if (!::mediaCodec.isInitialized) {
            mediaCodec = setupMediaCodec(Size(1920, 1080))
        }

        cameraManager.openCamera(cameraId, object : CameraDevice.StateCallback() {
            override fun onOpened(camera: CameraDevice) {
                cameraDevice = camera
                val recordingSurface = mediaCodec.createInputSurface()

                camera.createCaptureSession(
                    listOf(previewSurface, recordingSurface),
                    object : CameraCaptureSession.StateCallback() {
                        override fun onConfigured(session: CameraCaptureSession) {
                            captureSession = session
                            val captureRequest = cameraDevice.createCaptureRequest(
                                CameraDevice.TEMPLATE_RECORD
                            ).apply {
                                addTarget(previewSurface)
                                addTarget(recordingSurface)
                            }

                            session.setRepeatingRequest(captureRequest.build(), null, null)
                            mediaCodec.start()
                        }

                        override fun onConfigureFailed(session: CameraCaptureSession) {
                            Log.e(CHANNEL_TAG, "Capture session configuration failed")
                        }
                    },
                    null
                )
            }

            override fun onDisconnected(camera: CameraDevice) {
                camera.close()
            }

            override fun onError(camera: CameraDevice, error: Int) {
                Log.e(CHANNEL_TAG, "Camera error: $error")
                camera.close()
            }
        }, null)
    }


    private fun setupMediaCodec(size: Size): MediaCodec {
        val format = MediaFormat.createVideoFormat(MediaFormat.MIMETYPE_VIDEO_AVC, size.width, size.height).apply {
            setInteger(MediaFormat.KEY_BIT_RATE, 5000000) // 比特率
            setInteger(MediaFormat.KEY_FRAME_RATE, 30) // 帧率
            setInteger(MediaFormat.KEY_COLOR_FORMAT, MediaCodecInfo.CodecCapabilities.COLOR_FormatSurface)
            setInteger(MediaFormat.KEY_I_FRAME_INTERVAL, 1) // 关键帧间隔
        }

        val codec = MediaCodec.createEncoderByType(MediaFormat.MIMETYPE_VIDEO_AVC)
        codec.configure(format, null, null, MediaCodec.CONFIGURE_FLAG_ENCODE)
        return codec
    }

    fun stopCapture() {
        try {
            captureSession.stopRepeating()
            captureSession.close()
            cameraDevice.close()
            mediaCodec.stop()
            mediaCodec.release()
        } catch (e: Exception) {
            Log.e(CHANNEL_TAG, "Error stopping capture: ${e.message}")
        }
    }

    init {
        mediaCodec.setCallback(object : MediaCodec.Callback() {
            override fun onInputBufferAvailable(codec: MediaCodec, index: Int) {
                // 不需要处理输入缓冲区，直接从 Surface 输入
            }

            override fun onOutputBufferAvailable(codec: MediaCodec, index: Int, info: MediaCodec.BufferInfo) {
                val outputBuffer: ByteBuffer = codec.getOutputBuffer(index)!!
                val bufferData = ByteArray(info.size)
                outputBuffer.get(bufferData)
                saveToFile(bufferData)
                codec.releaseOutputBuffer(index, false)
            }

            override fun onError(codec: MediaCodec, e: MediaCodec.CodecException) {
                Log.e(CHANNEL_TAG, "MediaCodec error: ${e.message}")
            }

            override fun onOutputFormatChanged(codec: MediaCodec, format: MediaFormat) {
                Log.d(CHANNEL_TAG, "Output format changed: $format")
            }
        })
    }

    private fun saveToFile(data: ByteArray) {
        FileOutputStream(videoFile, true).use { it.write(data) }
    }
}
