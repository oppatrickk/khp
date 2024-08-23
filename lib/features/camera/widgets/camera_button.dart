import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/constants/app_text.dart';
// import 'package:khp/features/camera/camera_app.dart';
import 'package:khp/features/camera/camera_barcode.dart';

class CameraButton extends StatelessWidget {
  const CameraButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: lightColorScheme.surface,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: FilledButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const CameraBarcodeApp(),
              ),
            );
          },
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(lightColorScheme.secondary),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(Icons.camera_rounded),
              const SizedBox(width: 8),
              Text(
                'Use the Camera',
                style: heading1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
