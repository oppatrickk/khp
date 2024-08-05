import 'package:flutter/material.dart';
import 'package:khp/features/home/widgets/home_card.dart';
import 'package:khp/features/home/widgets/home_content.dart';

class HomeView extends StatelessWidget {
  const HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: <Widget>[
        HomeCard(),
        HomeContent(),
      ],
    );
  }
}
