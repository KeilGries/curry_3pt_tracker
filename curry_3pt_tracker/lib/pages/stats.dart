import "package:curry_3pt_tracker/global_variables.dart";
import "package:curry_3pt_tracker/icon_files/app_icons.dart";
import "package:curry_3pt_tracker/pages/home.dart";
import 'package:curry_3pt_tracker/widgets/stat_card.dart';
import "package:curry_3pt_tracker/widgets/points_stat_card.dart";
import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";
import "package:intl/intl.dart";
import "package:lottie/lottie.dart";
import "package:http/http.dart" as http;

import 'dart:async';
import 'dart:convert';

Future<Stats> fetchStats() async {
  await Future.delayed(const Duration(milliseconds: 1000));
  final response = await http.get(Uri.parse(
      'https://balldontlie.io/api/v1/stats?seasons[]=2022&player_ids[]=115&per_page=100'));

  if (response.statusCode == 200) {
    // print(response.statusCode);
    final stats = jsonDecode(response.body);

    return Stats.fromJson(stats);
  } else {
    throw Exception('Failed to load stats');
  }
}

class Stats {
  final int? pts;
  final int? fga;
  final int? fgm;
  final double? fgPct;
  final int? fg3a;
  final int? fg3m;
  final double? fg3Pct;
  final int? fta;
  final int? ftm;
  final double? ftPct;
  final int? dReb;
  final int? oReb;
  final int? ast;
  final int? blk;
  final int? stl;
  final int? pf;
  final int? to;
  final String? min;
  final String? date;
  final int homeID;
  final int homeScore;
  final int visitingID;
  final int visitingScore;

  const Stats({
    required this.pts,
    required this.fga,
    required this.fgm,
    required this.fgPct,
    required this.fg3a,
    required this.fg3m,
    required this.fg3Pct,
    required this.fta,
    required this.ftm,
    required this.ftPct,
    required this.dReb,
    required this.oReb,
    required this.ast,
    required this.blk,
    required this.stl,
    required this.pf,
    required this.to,
    required this.min,
    required this.date,
    required this.homeID,
    required this.homeScore,
    required this.visitingID,
    required this.visitingScore,
  });

  factory Stats.fromJson(Map<String, dynamic> json) {
    final statsData = json['data'];
    final recentGame = statsData.length - 1;

    // List<Map<String, dynamic>> statsList = [];
    // List<dynamic> entries = statsData as List<dynamic>;

    return Stats(
      pts: json['data'][recentGame]['pts'],
      fga: json['data'][recentGame]['fga'],
      fgm: json['data'][recentGame]['fgm'],
      fgPct: json['data'][recentGame]['fg_pct'],
      fg3a: json['data'][recentGame]['fg3a'],
      fg3m: json['data'][recentGame]['fg3m'],
      fg3Pct: json['data'][recentGame]['fg3_pct'],
      fta: json['data'][recentGame]['fta'],
      ftm: json['data'][recentGame]['ftm'],
      ftPct: json['data'][recentGame]['ft_pct'],
      dReb: json['data'][recentGame]['dreb'],
      oReb: json['data'][recentGame]['oreb'],
      ast: json['data'][recentGame]['ast'],
      blk: json['data'][recentGame]['blk'],
      stl: json['data'][recentGame]['stl'],
      pf: json['data'][recentGame]['pf'],
      to: json['data'][recentGame]['turnover'],
      min: json['data'][recentGame]['min'],
      date: json['data'][recentGame]['game']['date'],
      homeID: json['data'][recentGame]['game']['home_team_id'],
      homeScore: json['data'][recentGame]['game']['home_team_score'],
      visitingID: json['data'][recentGame]['game']['visitor_team_id'],
      visitingScore: json['data'][recentGame]['game']['visitor_team_score'],
    );
  }
}

class StatsPage extends StatefulWidget {
  // final Stats stats;
  const StatsPage({
    super.key,
    // required this.stats,
  });

  @override
  State<StatsPage> createState() => _StatsPageState();
}

class _StatsPageState extends State<StatsPage> {
  late Future<Stats> futureStats;
  @override
  void initState() {
    super.initState();
    futureStats = fetchStats();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Stats>(
      future: futureStats,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final stats = snapshot.data!;
          final dReb = snapshot.data?.dReb;
          final oReb = snapshot.data?.oReb;
          final totalReb = dReb! + oReb!;

          DateTime dt1 = DateTime.parse(stats.date!);
          DateTime dt2 = dt1.add(const Duration(days: 1));

          String formattedDate = DateFormat.yMd().format(dt2);

          final teamLogos = parseTeams(stats.visitingID, stats.homeID);

          final statsAnim = Positioned(
            top: 145,
            left: 261,
            child: Image.asset(
              'assets/images/curry_shrug_4_thicker_2.png',
              width: 125,
            ),
          ).animate().fadeOut(delay: 10.seconds, duration: 1.5.seconds);
          // .then()
          // .fadeIn(delay: 10.seconds, duration: 1.5.seconds);
          // .fadeIn(delay: 8.seconds, duration: 1.5.seconds);

          final statsAnim2 = Positioned(
            top: MediaQuery.of(context).size.width / 2.75,
            left: MediaQuery.of(context).size.width / 2.25,
            child: Image.asset(
              'assets/images/curry-text-logo.png',
              width: 300,
            ),
          ).animate().fadeIn(delay: 12.seconds, duration: 1.5.seconds);

          // .fadeIn(delay: 10.seconds, duration: 1.5.seconds);

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
                    child: Stack(
                      children: [
                        statsAnim,
                        statsAnim2,
                        Column(
                          children: [
                            const Spacer(),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const Spacer(),
                                Image.asset(
                                  teamLogos.$1,
                                  width: 120,
                                ),
                                Column(
                                  children: [
                                    const Row(
                                      children: [
                                        Icon(
                                          Icons.airplanemode_active,
                                          size: 18,
                                          color: Colors.black87,
                                        ),
                                        SizedBox(
                                          width: 60,
                                        ),
                                        Icon(
                                          Icons.home,
                                          size: 18,
                                          color: Colors.black87,
                                        ),
                                      ],
                                    ),
                                    const SizedBox(height: 7),
                                    Text(
                                      '${stats.visitingScore.toString()} - ${stats.homeScore.toString()}',
                                      style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 3),
                                    Text(
                                      formattedDate,
                                      style: const TextStyle(
                                        fontSize: 22,
                                      ),
                                    ),
                                  ],
                                ),
                                Image.asset(
                                  teamLogos.$2,
                                  width: 120,
                                ),
                                const Spacer(),
                              ],
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width - 150,
                              child: Divider(
                                color: Theme.of(context).colorScheme.secondary,
                                thickness: 2.5,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                const Spacer(),
                                IconButton(
                                  icon: const Icon(
                                    Icons.arrow_back,
                                    size: 36,
                                  ),
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
                                Column(
                                  children: [
                                    PointsStatCard(
                                      icon: AppIcons.pts,
                                      boxHeight: 4,
                                      text1: 'PTS: ',
                                      text2: stats.pts.toString(),
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
                            Row(
                              children: [
                                StatCard(
                                  icon: AppIcons.fg,
                                  boxHeight: 4,
                                  text1: 'FG: ',
                                  text2:
                                      '${stats.fgm.toString()}-${stats.fga.toString()}',
                                  iconSize: 50,
                                ),
                                StatCard(
                                  icon: AppIcons.fg3,
                                  boxHeight: 6,
                                  text1: '3PT: ',
                                  text2:
                                      '${stats.fg3m.toString()}-${stats.fg3a.toString()}',
                                  iconSize: 48,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                StatCard(
                                  icon: AppIcons.ft,
                                  boxHeight: 4,
                                  text1: 'FT: ',
                                  text2:
                                      '${stats.ftm.toString()}-${stats.fta.toString()}',
                                  iconSize: 60,
                                ),
                                StatCard(
                                  icon: AppIcons.rebb,
                                  boxHeight: 4,
                                  text1: 'REB: ',
                                  text2: totalReb.toString(),
                                  iconSize: 60,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                StatCard(
                                  icon: AppIcons.ast,
                                  boxHeight: 4,
                                  text1: 'AST: ',
                                  text2: stats.ast.toString(),
                                  iconSize: 45,
                                ),
                                StatCard(
                                  icon: AppIcons.blk,
                                  boxHeight: 4,
                                  text1: 'BLK: ',
                                  text2: stats.blk.toString(),
                                  iconSize: 45,
                                ),
                                StatCard(
                                  icon: AppIcons.stl,
                                  boxHeight: 4,
                                  text1: 'STL: ',
                                  text2: stats.stl.toString(),
                                  iconSize: 45,
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                StatCard(
                                  icon: AppIcons.pf,
                                  boxHeight: 4,
                                  text1: 'PF: ',
                                  text2: stats.pf.toString(),
                                  iconSize: 45,
                                ),
                                StatCard(
                                  icon: AppIcons.to,
                                  boxHeight: 4,
                                  text1: 'TO: ',
                                  text2: stats.to.toString(),
                                  iconSize: 45,
                                ),
                                StatCard(
                                  icon: Icons.timer,
                                  boxHeight: 4,
                                  text1: 'MIN: ',
                                  text2: stats.min.toString(),
                                  iconSize: 45,
                                ),
                              ],
                            ),
                            const Spacer(),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }
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
