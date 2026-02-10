import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/login_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pet Shop App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: const Color(0xFFFE7D55), // Custom orange-ish color
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFFFE7D55),
          primary: const Color(0xFFFE7D55),
          secondary: const Color(0xFFE9F0F4),
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
         useMaterial3: true,
      ),
      home: const LoginScreen(),
    );
  }
}
