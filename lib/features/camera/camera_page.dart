import 'package:flutter/material.dart';
import 'package:khp/components/navigation/top_app_bar.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/constants/app_text.dart';

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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
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
                          width: 0.5,
                        ),
                        borderRadius: const BorderRadius.all(Radius.circular(16)),
                      ),
                      height: 256,
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Icon(Icons.landscape_rounded, size: 128, color: lightColorScheme.tertiary),
                          Text(
                            'No Recent Images',
                            style: heading2(),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 32),
                    Text(
                      'Take your first picture now! Use the button below to get started.',
                      style: body1(),
                    )
                  ],
                ),
              ),
              Container(
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
                    onPressed: () {},
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
