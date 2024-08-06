import 'dart:io';
import 'package:flutter/material.dart';
import 'package:khp/constants/app_text.dart';
import 'package:khp/features/gallery/widgets/gallery_preview.dart';

class GalleryImages extends StatelessWidget {
  const GalleryImages({
    super.key,
    required this.images,
  });

  final List<FileSystemEntity> images;

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: Text(
              'Images',
              style: heading1(),
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 12.0,
            mainAxisSpacing: 12.0,
          ),
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute<dynamic>(
                      builder: (BuildContext context) => ImagePreview(imagePath: images[index].path),
                    ),
                  );
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.file(
                    File(images[index].path),
                    fit: BoxFit.cover,
                    cacheWidth: (350 * devicePixelRatio).round(),
                  ),
                ),
              );
            },
            childCount: images.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 32.0),
        ),
      ],
    );
  }
}
