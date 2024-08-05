import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key, required this.selectedIndex, required this.onDestinationSelected});

  final int selectedIndex;
  final ValueChanged<int> onDestinationSelected;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: onDestinationSelected,
      indicatorColor: AppColors.primary.withOpacity(0.15),
      selectedIndex: selectedIndex,
      destinations: const <Widget>[
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.photo_size_select_actual_rounded),
          icon: Icon(Icons.photo_size_select_actual_outlined),
          label: 'Gallery',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.calendar_month_rounded),
          icon: Icon(Icons.calendar_month_outlined),
          label: 'Calendar',
        ),
        NavigationDestination(
          selectedIcon: Icon(Icons.camera_alt_rounded),
          icon: Icon(Icons.camera_alt_outlined),
          label: 'Camera',
        ),
      ],
    );
  }
}
