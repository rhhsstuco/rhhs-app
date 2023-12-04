import 'package:flutter/material.dart';
import 'package:rhhs_app/screens/navigation_screen.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(79, 134, 75, 1),
);

void main() {
  runApp(const RHHSApp());
}

class RHHSApp extends StatelessWidget {
  const RHHSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: colorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.onPrimaryContainer,
          foregroundColor: colorScheme.primaryContainer,
        ),
      ),
      home: const NavigationScreen(),
    );
  }
}
