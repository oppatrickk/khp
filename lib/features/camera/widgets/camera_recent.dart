import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/constants/app_text.dart';

class CameraRecent extends StatelessWidget {
  const CameraRecent({
    super.key,
    required this.image,
  });

  final dynamic image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 32.0,
        left: 32.0,
        right: 32.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Recent',
            style: heading1(),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: lightColorScheme.tertiary,
                width: 1,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            height: 256,
            width: MediaQuery.of(context).size.width,
            child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(16)),
              child: Image.file(
                image,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: 256,
              ),
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Use the button below to capture more awesome pictures!',
              style: body1(),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
