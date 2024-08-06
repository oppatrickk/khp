import 'dart:io';

import 'package:flutter/material.dart';
import 'package:khp/components/loading_indicator/loading_indicator.dart';
import 'package:khp/constants/app_colors.dart';

class ImagePreview extends StatelessWidget {
  const ImagePreview({
    super.key,
    required this.imagePath,
    required this.title,
  });

  final String imagePath;
  final String title;

  Future<void> _loadImage() async {
    await Future<dynamic>.delayed(const Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w700,
            fontFamily: 'Mont',
          ),
        ),
        backgroundColor: lightColorScheme.primary,
        foregroundColor: Colors.white,
        titleSpacing: 0,
      ),
      backgroundColor: lightColorScheme.background,
      body: FutureBuilder<void>(
        future: _loadImage(),
        builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingIndicator();
          } else if (snapshot.hasError) {
            return Center(
              child: Text(
                'Error loading image',
                style: TextStyle(color: lightColorScheme.error),
              ),
            );
          } else {
            return Container(
              color: lightColorScheme.primary,
              width: MediaQuery.of(context).size.width,
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
                child: Image.file(
                  File(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
