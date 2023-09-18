import "package:curry_3pt_tracker/global_variables.dart";
import "package:curry_3pt_tracker/pages/stats.dart";
import "package:curry_3pt_tracker/widgets/info_slider.dart";
import "package:curry_3pt_tracker/widgets/long_elevated_button_left.dart";
import "package:curry_3pt_tracker/widgets/long_elevated_button_right.dart";
import "package:flutter/material.dart";
import "package:flutter_animate/flutter_animate.dart";

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
  final int dataLength;
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
    required this.dataLength,
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
      dataLength: statsData.length,
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

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
