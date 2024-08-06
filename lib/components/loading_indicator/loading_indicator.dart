import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingIndicator extends StatelessWidget {
  const LoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return LoadingAnimationWidget.staggeredDotsWave(
      color: lightColorScheme.secondary,
      size: 48,
    );
  }
}
