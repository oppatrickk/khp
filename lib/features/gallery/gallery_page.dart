import 'dart:io';

import 'package:flutter/material.dart';
import 'package:khp/components/navigation/top_app_bar.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/features/gallery/widgets/gallery_null.dart';
import 'package:khp/features/gallery/widgets/gallery_images.dart';
import 'package:path_provider/path_provider.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({super.key});

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  late Future<List<FileSystemEntity>> _imageFiles;
  List<FileSystemEntity> selectedImages = <FileSystemEntity>[];

  @override
  void initState() {
    super.initState();
    _imageFiles = _loadImages();
  }

  Future<List<FileSystemEntity>> _loadImages() async {
    final Directory extDir = await getTemporaryDirectory();
    final Directory dir = Directory('${extDir.path}/camerawesome');
    List<FileSystemEntity> files = <FileSystemEntity>[];

    if (await dir.exists()) {
      files = dir.listSync();
      files = files.where((FileSystemEntity file) => file.path.endsWith('.jpg')).toList();
    }

    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return files;
  }

  void _onSelectionChanged(List<FileSystemEntity> selected) {
    setState(() {
      selectedImages = selected;
    });
  }

  void _deleteSelectedImages() {
    for (final FileSystemEntity image in selectedImages) {
      image.deleteSync();
    }
    setState(() {
      _imageFiles = _loadImages();
      selectedImages.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        title: 'Gallery',
        icon: Icons.photo_size_select_actual_rounded,
        actions: selectedImages.isNotEmpty
            ? <Widget>[
                IconButton(
                  icon: const Icon(Icons.delete_rounded),
                  onPressed: _deleteSelectedImages,
                ),
              ]
            : null,
      ),
      backgroundColor: lightColorScheme.primary,
      body: Container(
        decoration: BoxDecoration(
          color: lightColorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: <Widget>[
                Flexible(
                  child: FutureBuilder<List<FileSystemEntity>>(
                    future: _imageFiles,
                    builder: (BuildContext context, AsyncSnapshot<List<FileSystemEntity>> snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const GalleryNull();
                      } else {
                        return GalleryImages(
                          images: snapshot.data!,
                          onSelectionChanged: _onSelectionChanged,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        // GalleryNull(),
      ),
    );
  }
}
