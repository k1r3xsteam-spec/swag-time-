import 'package:flutter/material.dart';
import 'theme.dart';
import 'screens/home.dart';

void main() => runApp(const SwagTimeApp());

class SwagTimeApp extends StatelessWidget {
  const SwagTimeApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Swag/Time",
      debugShowCheckedModeBanner: false,
      theme: swagTheme(),
      home: const HomeScreen(),
    );
  }
}