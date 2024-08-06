import 'dart:io';

import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:camerawesome/pigeon.dart';
import 'package:cross_file/cross_file.dart';
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
            sensor: Sensor.position(SensorPosition.back),
            flashMode: FlashMode.none,
            aspectRatio: CameraAspectRatios.ratio_4_3,
            zoom: 0.0,
          ),
          enablePhysicalButton: true,
          previewAlignment: Alignment.center,
          previewFit: CameraPreviewFit.contain,
          onMediaTap: (MediaCapture mediaCapture) {
            mediaCapture.captureRequest.when(
              single: (SingleCaptureRequest single) {
                // debugPrint('single: ${single.file?.path}');
                // single.file?.open();

                Navigator.pop(context);
              },
              multiple: (MultipleCaptureRequest multiple) {
                multiple.fileBySensor.forEach((Sensor key, XFile? value) {
                  // debugPrint('multiple file taken: $key ${value?.path}');
                  // value?.open();
                });

                Navigator.pop(context);
              },
            );
          },
        ),
      ),
    );
  }
}
