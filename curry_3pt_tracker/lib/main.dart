import "package:curry_3pt_tracker/classes/api_service.dart";
import "package:curry_3pt_tracker/classes/stats.dart";
import 'package:curry_3pt_tracker/pages/home.dart';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider<APIService>(
  (ref) => APIService(),
);

final statsDataProvider = FutureProvider<Stats>(
  (ref) {
    return ref.read(apiProvider).fetchStats();
  },
);
void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute: '/',
      // routes: {
      //   '/':(context) => const Home(),
      //   '/second':(context) => const StatsPage(),
      // },
      home: const Home(),
      title: 'Steph Curry 3pt Streak & Stats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 255, 199, 44),
            primary: const Color.fromARGB(255, 255, 199, 44),
            secondary: const Color.fromARGB(255, 29, 66, 138),
            primaryContainer: const Color.fromARGB(255, 204, 154, 0)),
      ),
    );
  }
}