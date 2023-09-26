import "package:curry_3pt_tracker/global_variables.dart";
import "package:curry_3pt_tracker/main.dart";
import "package:curry_3pt_tracker/pages/stats_page.dart";
import "package:curry_3pt_tracker/widgets/info_slider.dart";
import "package:curry_3pt_tracker/widgets/long_elevated_button_left.dart";
import "package:curry_3pt_tracker/widgets/long_elevated_button_right.dart";
import "package:curry_3pt_tracker/classes/stats.dart";

import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:lottie/lottie.dart";

class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ref.watch(statsDataProvider).when(      
      data: (data) {
        Stats stats = data;
        final currentStreak = checkStreak(stats.fg3m, stats.dataLength);
          debugPrint(currentStreak.toString());

          final cardDataList = [
            {
              'statQ':
                  'How many games in a row has Steph Curry hit a 3pt shot?',
              'answer': 'Current Streak: $currentStreak',
              'date': 'Began 6/17/22',
            },
            {
              'statQ':
                  'What is Curry\'s record for games in a row with a made 3pt shot?',
              'answer': 'Longest Streak: 233',
              'date': '12/2/18—6/11/22',
            },
          ]; 
          
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
                  child: Animate(
                    effects: const [
                      FadeEffect(duration: Duration(milliseconds: 500)),
                      // ScaleEffect(duration: Duration(milliseconds: 900)),
                    ],
                    child: Column(
                      children: [
                        const Spacer(),
                        InfoSlider(cardDataList: cardDataList),
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
                            image:
                                AssetImage('assets/images/curry_outline.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );

      },
      error: (error, stackTrace) {
        return Text(error.toString());
      },
      loading: () {
        return Scaffold(
          body: Center(
            child: Container(
              width: MediaQuery.of(context).size.width,
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.asset(
                    frameRate: FrameRate(75),
                    'assets/images/animations/ball.json',
                    height: 240,
                    fit: BoxFit.fill,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}