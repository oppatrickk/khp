import 'package:flutter/material.dart';
import 'package:khp/constants/app_colors.dart';
import 'package:khp/features/pagination/pagination.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'KHP Sample Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        fontFamily: 'Poppins',
        brightness: Brightness.light,
      ),
      home: const Pagination(),
    );
  }
}
