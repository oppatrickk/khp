import 'dart:io';
import 'package:flutter/material.dart';
import 'package:khp/constants/app_text.dart';
import 'package:khp/features/gallery/widgets/gallery_preview.dart';
import 'package:khp/constants/app_colors.dart';

class GalleryImages extends StatefulWidget {
  const GalleryImages({
    super.key,
    required this.images,
    required this.onSelectionChanged,
  });

  final List<FileSystemEntity> images;
  final ValueChanged<List<FileSystemEntity>> onSelectionChanged;

  @override
  State<GalleryImages> createState() => _GalleryImagesState();
}

class _GalleryImagesState extends State<GalleryImages> {
  List<FileSystemEntity> selectedImages = <FileSystemEntity>[];

  void _toggleSelection(FileSystemEntity image) {
    setState(() {
      if (selectedImages.contains(image)) {
        selectedImages.remove(image);
      } else {
        selectedImages.add(image);
      }
      widget.onSelectionChanged(selectedImages);
    });
  }

  @override
  Widget build(BuildContext context) {
    final double devicePixelRatio = MediaQuery.of(context).devicePixelRatio;

    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 32.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'Images',
                  style: heading1(),
                ),
                Text(
                  widget.images.length != 1 ? ' ${widget.images.length} photos' : '1 photo',
                  style: body1(),
                ),
              ],
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
              final FileSystemEntity image = widget.images[index];
              final bool isSelected = selectedImages.contains(image);

              return GestureDetector(
                onTap: () {
                  if (selectedImages.isEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute<dynamic>(
                        builder: (BuildContext context) => ImagePreview(
                          imagePath: image.path,
                          title: 'Image ${index + 1}',
                        ),
                      ),
                    );
                  } else {
                    _toggleSelection(image);
                  }
                },
                onLongPress: () => _toggleSelection(image),
                child: Container(
                  decoration: BoxDecoration(
                    border: isSelected ? Border.all(color: lightColorScheme.secondary, width: 4.0) : null,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.file(
                      File(image.path),
                      fit: BoxFit.cover,
                      cacheWidth: (350 * devicePixelRatio).round(),
                    ),
                  ),
                ),
              );
            },
            childCount: widget.images.length,
          ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(height: 32.0),
        ),
      ],
    );
  }
}
