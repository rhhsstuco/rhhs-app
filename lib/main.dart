import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rhhs_app/screens/navigation_screen.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromRGBO(79, 134, 75, 1),
  // seedColor: const Color.fromRGBO(79, 134, 192, 1),
  // secondary: const Color.fromRGBO(128, 160, 104, 1),
  // background: const Color.fromRGBO(230, 230, 230, 1),
  // surface: const Color.fromRGBO(255, 255, 255, 1),
  brightness: Brightness.light,
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
        scaffoldBackgroundColor: colorScheme.background,
        canvasColor: colorScheme.background,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          centerTitle: true,
          titleTextStyle: GoogleFonts.poppins().copyWith(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        textTheme: GoogleFonts.interTextTheme().copyWith(
          headlineLarge: GoogleFonts.poppins().copyWith(
            fontSize: 32.0,
            fontWeight: FontWeight.w900,
            color: Colors.black
          ),
          headlineMedium: GoogleFonts.poppins().copyWith(
            fontSize: 28.0,
            fontWeight: FontWeight.w900,
            color: Colors.black
          ),
          titleLarge: GoogleFonts.poppins().copyWith(
            fontSize: 22.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
          titleMedium: GoogleFonts.poppins().copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
            color: Colors.black
          ),
        ),
      ),
      home: const NavigationScreen(),
    );
  }
}
