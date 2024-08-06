import 'package:flutter/material.dart';
import 'package:khp/components/navigation/top_app_bar.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/features/camera/widgets/camera_button.dart';
import 'package:khp/features/camera/widgets/camera_null.dart';

class CameraPage extends StatelessWidget {
  const CameraPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: 'Camera',
        icon: Icons.camera_alt_rounded,
      ),
      backgroundColor: lightColorScheme.primary,
      body: Expanded(
        child: Container(
          decoration: BoxDecoration(
            color: lightColorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              CameraNull(),
              CameraButton(),
            ],
          ),
        ),
      ),
    );
  }
}
