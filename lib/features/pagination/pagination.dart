import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:khp/components/navigation/bottom_navigation_bar.dart';
import 'package:khp/constants/app_colors.dart';

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
          Center(
            child: Text('Page 1'),
          ),
          Center(
            child: Text('Page 2'),
          ),
          Center(
            child: Text('Page 3'),
          ),
          Center(
            child: Text('Page 3'),
          ),
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
    );
  }
}
