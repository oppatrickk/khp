import 'package:flutter/material.dart';
import 'package:khp/components/navigation/top_app_bar.dart';
import 'package:khp/constants/app_colors.dart';

class CalendarPage extends StatelessWidget {
  const CalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const TopAppBar(
        title: 'Calendar',
        icon: Icons.calendar_month_rounded,
      ),
      backgroundColor: AppColors.primary,
      body: Expanded(
        child: Container(
          decoration: const BoxDecoration(
            color: AppColors.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          width: MediaQuery.of(context).size.width,
          child: const Padding(
            padding: EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'This is the Calendar page.',
                  style: TextStyle(
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
