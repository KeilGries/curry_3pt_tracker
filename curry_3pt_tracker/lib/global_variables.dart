import "package:curry_3pt_tracker/gsw_schedule_23_24.dart";
import "package:flutter/widgets.dart";
import "package:intl/intl.dart";

// VARIABLES FOR ALL TEAM LOGO PATHS
const String atl =
    'assets/images/nba_assets/Teams/eastern_conference/atlanta-hawks-logo.png';

const String bos =
    'assets/images/nba_assets/Teams/eastern_conference/boston-celtics-logo.png';

const String bkn =
    'assets/images/nba_assets/Teams/eastern_conference/brooklyn-nets-logo.png';

const String cha =
    'assets/images/nba_assets/Teams/eastern_conference/charlotte-hornets-logo.png';

const String chi =
    'assets/images/nba_assets/Teams/eastern_conference/chicago-bulls-logo.png';

const String cle =
    'assets/images/nba_assets/Teams/eastern_conference/cleveland-cavaliers-logo.png';

const String dal =
    'assets/images/nba_assets/Teams/western_conference/dallas-mavericks-logo.png';

const String den =
    'assets/images/nba_assets/Teams/western_conference/denver-nuggets-logo.png';

const String det =
    'assets/images/nba_assets/Teams/eastern_conference/detroit-pistons-logo.png';

const String gsw =
    'assets/images/nba_assets/Teams/western_conference/golden-state-warriors-logo.png';

const String hou =
    'assets/images/nba_assets/Teams/western_conference/houston-rockets-logo.png';

const String ind =
    'assets/images/nba_assets/Teams/eastern_conference/indiana-pacers-logo.png';

const String lac =
    'assets/images/nba_assets/Teams/western_conference/la-clippers-logo.png';

const String lal =
    'assets/images/nba_assets/Teams/western_conference/la-lakers-logo.png';

const String mem =
    'assets/images/nba_assets/Teams/western_conference/memphis-grizzlies-logo.png';

const String mia =
    'assets/images/nba_assets/Teams/eastern_conference/miami-heat-logo.png';

const String mil =
    'assets/images/nba_assets/Teams/eastern_conference/milwaukee-bucks-logo.png';

const String min =
    'assets/images/nba_assets/Teams/western_conference/minnesota-timberwolves-logo.png';

const String nop =
    'assets/images/nba_assets/Teams/western_conference/new-orleans-pelicans-logo.png';

const String nyk =
    'assets/images/nba_assets/Teams/eastern_conference/new-york-knicks-logo.png';

const String okc =
    'assets/images/nba_assets/Teams/western_conference/oklahoma-city-thunder-logo.png';

const String orl =
    'assets/images/nba_assets/Teams/eastern_conference/orlando-magic-logo.png';

const String phi =
    'assets/images/nba_assets/Teams/eastern_conference/philadelphia-76ers-logo.png';

const String phx =
    'assets/images/nba_assets/Teams/western_conference/phoenix-suns-logo.png';

const String por =
    'assets/images/nba_assets/Teams/western_conference/portland-trail-blazers-logo.png';

const String sac =
    'assets/images/nba_assets/Teams/western_conference/sacramento-kings-logo.png';

const String sas =
    'assets/images/nba_assets/Teams/western_conference/san-antonio-spurs-logo.png';

const String tor =
    'assets/images/nba_assets/Teams/eastern_conference/toronto-raptors-logo.png';

const String uta =
    'assets/images/nba_assets/Teams/western_conference/utah-jazz-logo.png';

const String was =
    'assets/images/nba_assets/Teams/eastern_conference/washington-wizards-logo.png';

const String notFound = 'assets/images/nba_assets/misc/unknown_team.png';

// CONVERT VISITNG AND HOME 'TEAMID' INTO LOGO ASSET PATHS FROM RESPONSE
(String, String) parseTeams(int visitingID, int homeID) {
  String visitingLogo = '';
  String homeLogo = '';
  switch (visitingID) {
    case 1:
      visitingLogo = atl;
      break;
    case 2:
      visitingLogo = bos;
      break;
    case 3:
      visitingLogo = bkn;
      break;
    case 4:
      visitingLogo = cha;
      break;
    case 5:
      visitingLogo = chi;
      break;
    case 6:
      visitingLogo = cle;
      break;
    case 7:
      visitingLogo = dal;
      break;
    case 8:
      visitingLogo = den;
      break;
    case 9:
      visitingLogo = det;
      break;
    case 10:
      visitingLogo = gsw;
      break;
    case 11:
      visitingLogo = hou;
      break;
    case 12:
      visitingLogo = ind;
      break;
    case 13:
      visitingLogo = lac;
      break;
    case 14:
      visitingLogo = lal;
      break;
    case 15:
      visitingLogo = mem;
      break;
    case 16:
      visitingLogo = mia;
      break;
    case 17:
      visitingLogo = mil;
      break;
    case 18:
      visitingLogo = min;
      break;
    case 19:
      visitingLogo = nop;
      break;
    case 20:
      visitingLogo = nyk;
      break;
    case 21:
      visitingLogo = okc;
      break;
    case 22:
      visitingLogo = orl;
      break;
    case 23:
      visitingLogo = phi;
      break;
    case 24:
      visitingLogo = phx;
      break;
    case 25:
      visitingLogo = por;
      break;
    case 26:
      visitingLogo = sac;
      break;
    case 27:
      visitingLogo = sas;
      break;
    case 28:
      visitingLogo = tor;
      break;
    case 29:
      visitingLogo = uta;
      break;
    case 30:
      visitingLogo = was;
      break;
    default:
      visitingLogo = notFound;
  }
  switch (homeID) {
    case 14:
      homeLogo = lal;
      break;
  }
  return (visitingLogo, homeLogo);
}

// RETRIEVE CURRENT DATE AND CHECK SCHEDULE FOR NEXT GAME THAT HAS NO PASSED
(String, String, String, String)? fetchUpcomingGame() {
  final now = DateTime.now();
  for (int i = 0; i < schedule.length; i++) {
    var rawDate = schedule[i]['date'] ?? '6/6/6';
    var parsedDate = DateFormat('MM/dd/yy').parse(rawDate);
    final bool isUpcoming = parsedDate.isAfter(now);
    if (isUpcoming == true) {
      final String date = schedule[i]['date'].toString();
      final String matchup = schedule[i]['matchup'].toString();
      final String time = schedule[i]['time'].toString();
      final String channel = schedule[i]['channel'].toString();
      return (date, matchup, time, channel);
    }
  }
  return null;
}

// CHECK IF A GAME WAS PLAYED AND IF A 3PT SHOT WAS HIT.
// IF SO, STREAK + 1. IF NOT, STREAK = 0

checkStreak(int? streakFG3M, int? gamesPlayed) {
  debugPrint('Checking streak...');
  int currentStreak = 70;
  // if (streakFG3M! >= 1) {
  //   currentStreak = 70 + gamesPlayed!;    
  // }
  return currentStreak;
}
