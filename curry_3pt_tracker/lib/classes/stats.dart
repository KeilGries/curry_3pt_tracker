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