import 'dart:io';
import 'package:flutter/material.dart';
import 'package:khp/components/loading_indicator/loading_indicator.dart';
import 'package:khp/components/navigation/top_app_bar.dart';
import 'package:khp/features/camera/widgets/camera_recent.dart';
import 'package:path_provider/path_provider.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/features/camera/widgets/camera_button.dart';
import 'package:khp/features/camera/widgets/camera_null.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  late Future<File?> _recentImage;

  @override
  void initState() {
    super.initState();
    _recentImage = _loadRecentImage();
  }

  Future<File?> _loadRecentImage() async {
    final Directory extDir = await getTemporaryDirectory();
    final Directory dir = Directory('${extDir.path}/camerawesome');
    List<FileSystemEntity> files = <FileSystemEntity>[];

    if (await dir.exists()) {
      files = dir.listSync();
      files = files.where((FileSystemEntity file) => file.path.endsWith('.jpg')).toList();
      if (files.isNotEmpty) {
        files.sort((FileSystemEntity a, FileSystemEntity b) => b.statSync().modified.compareTo(a.statSync().modified));
        File recentFile = File(files.first.path);

        await Future<dynamic>.delayed(const Duration(seconds: 1));
        return recentFile;
      }
    }

    await Future<dynamic>.delayed(const Duration(seconds: 1));
    return null;
  }

  Future<void> _refresh() async {
    setState(() {
      _recentImage = _loadRecentImage();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopAppBar(
        title: 'Camera',
        icon: Icons.camera_alt_rounded,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _refresh,
          ),
        ],
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: FutureBuilder<File?>(
                future: _recentImage,
                builder: (BuildContext context, AsyncSnapshot<File?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: LoadingIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else if (!snapshot.hasData || snapshot.data == null) {
                    return const CameraNull();
                  } else {
                    return CameraRecent(
                      image: snapshot.data!,
                    );
                  }
                },
              ),
            ),
            const CameraButton(),
          ],
        ),
      ),
    );
  }
}
