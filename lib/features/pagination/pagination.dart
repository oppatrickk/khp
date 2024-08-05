import 'package:flutter/material.dart';
import 'package:khp/components/navigation/bottom_navigation_bar.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/features/calendar/calendar_page.dart';
import 'package:khp/features/camera/camera_page.dart';
import 'package:khp/features/gallery/gallery_page.dart';
import 'package:khp/features/home/home_page.dart';

class Pagination extends StatefulWidget {
  const Pagination({super.key});

  @override
  State<Pagination> createState() => _PaginationState();
}

class _PaginationState extends State<Pagination> {
  final PageController _pageController = PageController(initialPage: 0);
  int _selectedPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: (int value) => setState(() => _selectedPage = value),
        children: const <Widget>[
          HomePage(),
          GalleryPage(),
          CalendarPage(),
          CameraPage(),
        ],
      ),
      backgroundColor: AppColors.primary,
      bottomNavigationBar: BottomNavBar(
        selectedIndex: _selectedPage,
        onDestinationSelected: (int index) {
          setState(() {
            _selectedPage = index;
          });
          _pageController.jumpToPage(index);
        },
      ),

      // TODO(): Add animation
    );
  }
}
