import 'package:flutter/material.dart';
import 'package:khp/components/bottom_navigation_bar/bottom_navigation_bar.dart';
import 'package:khp/constants/app_colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    int currentPageIndex = 0;

    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: const Center(
        child: Text('This is the main page'),
      ),
    );
  }
}
