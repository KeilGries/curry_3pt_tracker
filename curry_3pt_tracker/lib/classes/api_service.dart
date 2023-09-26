import "dart:convert";
import "package:http/http.dart" as http;

import "package:curry_3pt_tracker/classes/stats.dart";

class APIService {
  Future<Stats> fetchStats() async {
    String url =
        'https://balldontlie.io/api/v1/stats?seasons[]=2022&player_ids[]=115&per_page=100';
    // return http.get(Uri.parse(url)).then((value) => Stats.fromJson(value.body));
    await Future.delayed(const Duration(milliseconds: 1000));
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final stats = jsonDecode(response.body);
      return Stats.fromJson(stats);
    } else {
      throw Exception('Failed to load stats');
    }
  }
}
