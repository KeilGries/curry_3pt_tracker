import 'package:curry_3pt_tracker/pages/home.dart';
import 'package:curry_3pt_tracker/pages/last_game_stats.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Steph Curry 3pt Streak & Stats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 199, 44),
            primary: const Color.fromARGB(255, 255, 199, 44),
            secondary: const Color.fromARGB(255, 29, 66, 138),
            primaryContainer: const Color.fromARGB(255, 204, 154, 0)),
      ),
      home: const Home(),
    );
  }
}
