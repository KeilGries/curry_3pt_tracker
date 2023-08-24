import "package:flutter/material.dart";
import "package:lottie/lottie.dart";

class StatsPage extends StatelessWidget {
  const StatsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Theme.of(context).colorScheme.primary,
          width: double.infinity,
          child: SafeArea(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/images/animations/ball.json',
                  alignment: Alignment.center,
                  height: 200,
                  width: 200,
                  fit: BoxFit.fill)
            ],
          )),
        ),
      ),
    );
  }
}
