import 'dart:io';
import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraApp extends StatelessWidget {
  const CameraApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.photo(
            pathBuilder: (List<Sensor> sensors) async {
              final Directory extDir = await getTemporaryDirectory();
              final Directory testDir = await Directory(
                '${extDir.path}/camerawesome',
              ).create(recursive: true);
              if (sensors.length == 1) {
                final String filePath = '${testDir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
                return SingleCaptureRequest(filePath, sensors.first);
              } else {
                // Separate pictures taken with front and back camera
                return MultipleCaptureRequest(
                  <Sensor, String?>{
                    for (final Sensor sensor in sensors)
                      sensor:
                          '${testDir.path}/${sensor.position == SensorPosition.front ? 'front_' : "back_"}${DateTime.now().millisecondsSinceEpoch}.jpg',
                  },
                );
              }
            },
            exifPreferences: ExifPreferences(saveGPSLocation: false),
          ),
          sensorConfig: SensorConfig.single(
            sensor: Sensor.position(SensorPosition.front),
            flashMode: FlashMode.none,
            aspectRatio: CameraAspectRatios.ratio_16_9,
            zoom: 0.0,
          ),
          enablePhysicalButton: true,
          previewAlignment: Alignment.center,
          previewFit: CameraPreviewFit.contain,
          onMediaTap: (MediaCapture mediaCapture) {
            mediaCapture.captureRequest.when(
              single: (SingleCaptureRequest single) {
                Navigator.pop(context);
              },
              multiple: (MultipleCaptureRequest multiple) {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
