import "package:flutter/material.dart";

class StreakInfo extends StatelessWidget {
  final String streakQ;
  final String answer;
  final String date;
  const StreakInfo({
    super.key,
    required this.streakQ,
    required this.answer,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              streakQ,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 37,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Divider(
            color: Theme.of(context).colorScheme.secondary,
            thickness: 4,
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              answer,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 34,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              date,
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontSize: 26,
                // fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
