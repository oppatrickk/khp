import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:khp/features/camera/mlkit_utils.dart';
import 'package:google_mlkit_barcode_scanning/google_mlkit_barcode_scanning.dart';
import 'package:rxdart/rxdart.dart';

class CameraBarcodeApp extends StatefulWidget {
  const CameraBarcodeApp({super.key});

  @override
  State<CameraBarcodeApp> createState() => _CameraBarcodeAppState();
}

class _CameraBarcodeAppState extends State<CameraBarcodeApp> {
  final BarcodeScanner _barcodeScanner = BarcodeScanner(formats: <BarcodeFormat>[BarcodeFormat.all]);

  final List<String> _buffer = <String>[];
  final BehaviorSubject<List<String>> _barcodesController = BehaviorSubject<List<String>>();
  late final Stream<List<String>> _barcodesStream = _barcodesController.stream;
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _barcodesController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CameraAwesomeBuilder.previewOnly(
        onImageForAnalysis: (AnalysisImage img) => _processImageBarcode(img),
        imageAnalysisConfig: AnalysisConfig(
          androidOptions: const AndroidAnalysisOptions.nv21(
            width: 1024,
          ),
          maxFramesPerSecond: 5,
          autoStart: false,
        ),
        builder: (CameraState cameraModeState, Preview preview) {
          return _BarcodeDisplayWidget(
            barcodesStream: _barcodesStream,
            scrollController: _scrollController,
            analysisController: cameraModeState.analysisController!,
          );
        },
      ),
    );
  }

  Future<dynamic> _processImageBarcode(AnalysisImage img) async {
    final InputImage inputImage = img.toInputImage();

    try {
      List<Barcode> recognizedBarCodes = await _barcodeScanner.processImage(inputImage);
      for (Barcode barcode in recognizedBarCodes) {
        debugPrint('Barcode: [${barcode.format}]: ${barcode.rawValue}');
        _addBarcode('[${barcode.format.name}]: ${barcode.rawValue}');
      }
    } catch (error) {
      debugPrint('...sending image resulted error $error');
    }
  }

  void _addBarcode(String value) {
    try {
      if (_buffer.length > 300) {
        _buffer.removeRange(_buffer.length - 300, _buffer.length);
      }
      if (_buffer.isEmpty || value != _buffer[0]) {
        _buffer.insert(0, value);
        _barcodesController.add(_buffer);
        if (!_scrollController.hasClients) {
          _scrollController.animateTo(_scrollController.position.maxScrollExtent,
              duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        }
      }
    } catch (err) {
      debugPrint('...logging error $err');
    }
  }
}

class _BarcodeDisplayWidget extends StatefulWidget {
  const _BarcodeDisplayWidget({
    // ignore: unused_element
    super.key,
    required this.barcodesStream,
    required this.scrollController,
    required this.analysisController,
  });
  final Stream<List<String>> barcodesStream;
  final ScrollController scrollController;

  final AnalysisController analysisController;

  @override
  State<_BarcodeDisplayWidget> createState() => _BarcodeDisplayWidgetState();
}

class _BarcodeDisplayWidgetState extends State<_BarcodeDisplayWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.tealAccent.withOpacity(0.7),
        ),
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          Material(
            color: Colors.transparent,
            child: CheckboxListTile(
              value: widget.analysisController.enabled,
              onChanged: (bool? newValue) async {
                if (widget.analysisController.enabled == true) {
                  await widget.analysisController.stop();
                } else {
                  await widget.analysisController.start();
                }
                setState(() {});
              },
              title: const Text(
                'Enable barcode scan',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: StreamBuilder<List<String>>(
              stream: widget.barcodesStream,
              builder: (BuildContext context, AsyncSnapshot<List<String>> value) => !value.hasData
                  ? const SizedBox.expand()
                  : ListView.separated(
                      padding: const EdgeInsets.only(top: 8),
                      controller: widget.scrollController,
                      itemCount: value.data!.length,
                      separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 4),
                      itemBuilder: (BuildContext context, int index) => Text(value.data![index]),
                    ),
            ),
          ),
        ]),
      ),
    );
  }
}
