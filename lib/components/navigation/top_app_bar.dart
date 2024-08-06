import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';

class TopAppBar extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBar({
    super.key,
    this.appBarHeight,
    required this.title,
    required this.icon,
  });

  final double? appBarHeight;
  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w700,
          fontFamily: 'Mont',
        ),
      ),
      leading: Icon(icon),
      backgroundColor: lightColorScheme.primary,
      foregroundColor: Colors.white,
      titleSpacing: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(appBarHeight ?? kToolbarHeight);
}
