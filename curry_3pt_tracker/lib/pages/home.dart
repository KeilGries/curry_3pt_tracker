import "package:curry_3pt_tracker/widgets/streak_info.dart";
import "package:flutter/material.dart";

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
          child: SafeArea(
            child: Column(
              children: [
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 55.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: ElevatedButton.icon(
                        icon: const Icon(
                          Icons.sports_basketball,
                          size: 28,
                        ),
                        onPressed: () {},
                        label: const Text(
                          'Show Upcoming Game',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              Theme.of(context).colorScheme.secondary,
                          shadowColor: Colors.black,
                          elevation: 6,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.horizontal(
                                right: Radius.circular(20)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 55.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(
                        Icons.query_stats,
                        size: 28,
                      ),
                      onPressed: () {},
                      label: const Text(
                        'Fetch Previous Game Stats',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Theme.of(context).colorScheme.secondary,
                        shadowColor: Colors.black,
                        elevation: 6,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.horizontal(
                              left: Radius.circular(20)),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const StreakInfo(
                  streakQ:
                      'How many games in a row has Steph Curry hit a 3pt shot?',
                  answer: 'Current Streak: 70',
                ),
                const SizedBox(height: 25),
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
