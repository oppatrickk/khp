import 'package:flutter/material.dart';
import 'package:khp/components/navigation/bottom_navigation_bar.dart';
import 'package:khp/components/navigation/top_app_bar.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/features/home/widgets/home_view.dart';

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
      // TODO(): Add fonts
      appBar: const TopAppBar(
        title: 'Home',
        icon: Icons.home_rounded,
      ),
      backgroundColor: AppColors.primary,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
      body: const HomeView(),
    );
  }
}
