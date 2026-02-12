import 'package:flutter/material.dart';
import 'package:flutter_awsome_app/views/about_ui.dart';
import 'package:flutter_awsome_app/views/home_ui.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    FlutterSauHealthCalculatorApp(),
  );
}

class FlutterSauHealthCalculatorApp extends StatefulWidget {
  const FlutterSauHealthCalculatorApp({super.key});

  @override
  State<FlutterSauHealthCalculatorApp> createState() =>
      _FlutterSauHealthCalculatorAppState();
}

class _FlutterSauHealthCalculatorAppState
    extends State<FlutterSauHealthCalculatorApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
    );
  }
}
