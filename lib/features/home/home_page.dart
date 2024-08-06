import 'package:flutter/material.dart';
import 'package:khp/components/navigation/top_app_bar.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/features/home/widgets/home_card.dart';
import 'package:khp/features/home/widgets/home_content.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: 'Home',
        icon: Icons.home_rounded,
      ),
      backgroundColor: lightColorScheme.primary,
      body: const Column(
        children: <Widget>[
          HomeCard(),
          HomeContent(),
        ],
      ),
    );
  }
}
