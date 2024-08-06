import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/constants/app_text.dart';

class GalleryNull extends StatelessWidget {
  const GalleryNull({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Images',
            style: heading1(),
          ),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: lightColorScheme.tertiary,
                width: 0.5,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(16)),
            ),
            height: 256,
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.landscape_rounded,
                  size: 128,
                  color: lightColorScheme.tertiary,
                ),
                Text(
                  'No Saved Images Yet',
                  style: heading2(),
                ),
              ],
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: Text(
              'Here you can see all the pictures you took.',
              style: body1(),
            ),
          ),
          const SizedBox(height: 32),
          Center(
            child: FilledButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Take a Picture',
                  style: body1(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
