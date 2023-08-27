import "package:curry_3pt_tracker/icon_files/app_icons.dart";
import "package:curry_3pt_tracker/pages/home.dart";
import "package:curry_3pt_tracker/widgets/large_stat_card.dart";
import "package:curry_3pt_tracker/widgets/points_stat_card.dart";
import "package:flutter/material.dart";
// import "package:lottie/lottie.dart";

class StatsPage extends StatefulWidget {
  const StatsPage({
    super.key,
  });

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/nba_assets/Teams/western_conference/golden-state-warriors-logo-2020.png',
                          width: 120,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              height: 30,
                            ),
                            Icon(
                              AppIcons.roadSolid,
                              size: 12,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Column(
                      children: [
                        Text(
                          '123 - 98',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          '6/6/6',
                          style: TextStyle(
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/nba_assets/Teams/western_conference/los-angeles-lakers-logo.png',
                          width: 120,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 102,
                              height: 30,
                            ),
                            Icon(
                              Icons.home,
                              size: 18,
                              color: Colors.white.withOpacity(.5),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Spacer(),
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Home(),
                          ),
                        );
                      },
                    ),
                    const Spacer(),
                    const Column(
                      children: [
                        PointsStatCard(
                          icon: AppIcons.pts,
                          boxHeight: 4,
                          text1: 'PTS: ',
                          text2: '99',
                          iconSize: 62,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const SizedBox(width: 48),
                    const Spacer(),
                  ],
                ),
                const Spacer(),
                const Row(
                  children: [
                    StatCard(
                      icon: AppIcons.fg,
                      boxHeight: 4,
                      text1: 'FG: ',
                      text2: '19-33',
                      iconSize: 50,
                    ),
                    StatCard(
                      icon: AppIcons.fg3,
                      boxHeight: 6,
                      text1: '3PT: ',
                      text2: '9-15',
                      iconSize: 48,
                    ),
                  ],
                ),
                const Spacer(),
                const Row(
                  children: [
                    StatCard(
                      icon: AppIcons.ft,
                      boxHeight: 4,
                      text1: 'FT: ',
                      text2: '9-9',
                      iconSize: 60,
                    ),
                    StatCard(
                      icon: AppIcons.rebb,
                      boxHeight: 4,
                      text1: 'REB: ',
                      text2: '6',
                      iconSize: 60,
                    ),
                  ],
                ),
                const Spacer(),
                const Row(
                  children: [
                    StatCard(
                      icon: AppIcons.ast,
                      boxHeight: 4,
                      text1: 'AST: ',
                      text2: '6',
                      iconSize: 45,
                    ),
                    StatCard(
                      icon: AppIcons.blk,
                      boxHeight: 4,
                      text1: 'BLK: ',
                      text2: '0',
                      iconSize: 45,
                    ),
                    StatCard(
                      icon: AppIcons.stl,
                      boxHeight: 4,
                      text1: 'STL: ',
                      text2: '2',
                      iconSize: 45,
                    ),
                  ],
                ),
                const Spacer(),
                const Row(
                  children: [
                    StatCard(
                      icon: AppIcons.pf,
                      boxHeight: 4,
                      text1: 'PF: ',
                      text2: '3',
                      iconSize: 45,
                    ),
                    StatCard(
                      icon: AppIcons.to,
                      boxHeight: 4,
                      text1: 'TO: ',
                      text2: '1',
                      iconSize: 45,
                    ),
                    StatCard(
                      icon: Icons.timer,
                      boxHeight: 4,
                      text1: 'MIN: ',
                      text2: '38',
                      iconSize: 45,
                    ),
                  ],
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
