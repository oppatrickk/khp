import 'package:flutter/material.dart';
import 'package:khp/features/home/home_page.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'KHP Sample Project',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
