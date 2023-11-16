import 'package:fitness_time/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness Time!',
      theme: ThemeData(
        useMaterial3: false,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFDDDDDD),
          primary: const Color(0xFFFF88DC),
          secondary: const Color(0xFFA67DB8),
          tertiary: const Color(0xFF5E2BFF),
        ),
      ),
      home: const HomePage(),

      //slider, card
    );
  }
}
