import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final IconData icon;
  final double? iconSize;
  final double boxHeight;
  final String text1;
  final String text2;
  const StatCard({
    super.key,
    this.iconSize,
    required this.boxHeight,
    required this.icon,
    required this.text1,
    required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        shadowColor: Theme.of(context).colorScheme.secondary,
        color: Theme.of(context).colorScheme.secondary,
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.primary.withOpacity(.5),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Theme.of(context).colorScheme.secondary,
                Colors.blueAccent,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Icon(
                icon,
                size: iconSize,
                color: Theme.of(context).colorScheme.primary,
              ),
              SizedBox(height: boxHeight),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    text1,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    text2,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
