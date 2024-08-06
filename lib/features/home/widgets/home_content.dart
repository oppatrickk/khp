import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/constants/app_text.dart';

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          color: lightColorScheme.background,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(32),
            topRight: Radius.circular(32),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Welcome',
                style: heading1(),
              ),
              const SizedBox(height: 8),
              Text(
                'This is the home page.',
                style: body1(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
