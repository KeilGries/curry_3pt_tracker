import "package:assorted_layout_widgets/assorted_layout_widgets.dart";
import "package:curry_3pt_tracker/global_variables.dart";
import "package:flutter/material.dart";

class LongElevatedButtonLeft extends StatefulWidget {
  final IconData icon;
  const LongElevatedButtonLeft({
    super.key,
    required this.icon,
  });

  @override
  State<LongElevatedButtonLeft> createState() => _LongElevatedButtonLeftState();
}

class _LongElevatedButtonLeftState extends State<LongElevatedButtonLeft> {
  String buttonText = 'Show Upcoming Game';
  double fontSize = 18;
  String indent = '         ';

  void buttonClicked() {
    final date = fetchUpcomingGame()?.$1;
    final matchup = fetchUpcomingGame()?.$2;
    final time = fetchUpcomingGame()?.$3;
    final channel = fetchUpcomingGame()?.$4;

    setState(() {
      buttonText =
          '$matchup                               $date - $time - $channel';
      fontSize = 13;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: ElevatedButton.icon(
          icon: Icon(
            widget.icon,
            size: 28,
          ),
          onPressed: buttonClicked,
          label: Text(
            buttonText,
            style: TextStyle(
              fontSize: fontSize,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          style: ElevatedButton.styleFrom(
            side: const BorderSide(
              color: Colors.white,
              width: 1.5,
            ),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            shadowColor: Colors.black,
            elevation: 6,
            shape: const NonUniformRoundedRectangleBorder(
              hideLeftSide: true,
              borderRadius: BorderRadius.horizontal(right: Radius.circular(20)),
            ),
          ),
        ),
      ),
    );
  }
}
