import "package:curry_3pt_tracker/pages/stats.dart";
import "package:curry_3pt_tracker/widgets/info_slider.dart";
import "package:curry_3pt_tracker/widgets/long_elevated_button_left.dart";
import "package:curry_3pt_tracker/widgets/long_elevated_button_right.dart";
import "package:flutter/material.dart";

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.primaryContainer,
                Theme.of(context).colorScheme.primary,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                const Spacer(),
                const InfoSlider(),
                const Spacer(),
                const Padding(
                  padding: EdgeInsets.only(right: 105.0),
                  child: LongElevatedButtonLeft(
                    icon: Icons.sports_basketball,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 105.0),
                  child: LongElevatedButtonRight(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const StatsPage(),
                        ),
                      );
                    },
                    label: 'Get Previous Game Stats',
                    icon: Icons.query_stats,
                  ),
                ),
                const Spacer(),
                const Padding(
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
