import 'package:flutter/material.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(const UnionRepsDeadPoolApp());
}

class UnionRepsDeadPoolApp extends StatelessWidget {
  const UnionRepsDeadPoolApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Union Reps Dead Pool',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomeScreen(),
    );
  }
}
