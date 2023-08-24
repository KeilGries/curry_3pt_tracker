import "package:curry_3pt_tracker/widgets/info_slider.dart";
import "package:curry_3pt_tracker/widgets/long_elevated_button_right.dart";
import "package:flutter/material.dart";

import '../widgets/long_elevated_button_left.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          child: const SafeArea(
            child: Column(
              children: [
                Spacer(),
                InfoSlider(),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(right: 90.0),
                  child: LongElevatedButtonLeft(
                        label: 'Show Upcoming Game',
                        icon: Icons.sports_basketball,
                        ),
                    ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(left: 90.0),
                  child: LongElevatedButtonRight(
                    label: 'Get Previous Game Stats',
                    icon: Icons.query_stats,
                  )
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Image(
                    image: AssetImage('assets/images/curry_outline.png'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
