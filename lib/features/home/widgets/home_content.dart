import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';

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
                style: TextStyle(
                  color: lightColorScheme.tertiary,
                  fontSize: 20,
                  fontWeight: FontWeight.w800,
                  fontFamily: 'Mont',
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'This is the home page.',
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
