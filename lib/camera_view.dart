import 'package:template/config/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class CameraViewComponents extends StatefulWidget {
  const CameraViewComponents({super.key});

  @override
  State<CameraViewComponents> createState() => _CameraViewComponentsState();
}

class _CameraViewComponentsState extends State<CameraViewComponents> {
  late AndroidViewController androidViewController;
  @override
  void initState() {
    androidViewController = PlatformViewsService.initSurfaceAndroidView(
      id: 1, // Assign a unique ID to your view
      viewType:
          'native_camera_view', // This should match the registered view type on the native side
      layoutDirection: TextDirection.ltr,
      creationParams: <String, dynamic>{
        // Any initial parameters you want to pass to the native view
      },
      creationParamsCodec: const StandardMessageCodec(),
    );

    androidViewController.create();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PlatformViewLink(
          viewType: 'native_camera_view',
          onCreatePlatformView: (PlatformViewCreationParams params) {
            return PlatformViewsService.initSurfaceAndroidView(
              id: params.id,
              viewType: 'native_camera_view',
              layoutDirection: TextDirection.ltr,
              creationParams: <String, dynamic>{},
              creationParamsCodec: const StandardMessageCodec(),
            )
              ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
              ..create();
          },
          surfaceFactory:
              (BuildContext context, PlatformViewController controller) {
            return AndroidViewSurface(
              controller: androidViewController,
              gestureRecognizers: const <Factory<
                  OneSequenceGestureRecognizer>>{},
              hitTestBehavior: PlatformViewHitTestBehavior.opaque,
            );
          },
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: ElevatedButton(
            onPressed: () {
              MethodChannel(AppBuildConfig.nativeChannelID)
                  .invokeMethod('startRecording');
            },
            child: Text('Start Live'),
          ),
        ),
      ],
    );
  }
}
