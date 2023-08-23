import "package:carousel_slider/carousel_slider.dart";
import "package:curry_3pt_tracker/global_variables.dart";
import "package:curry_3pt_tracker/widgets/streak_info.dart";
import "package:flutter/material.dart";

class InfoSlider extends StatelessWidget {
  const InfoSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        enlargeCenterPage: false,
        viewportFraction: 1,
        height: 235,
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 10),
        autoPlayAnimationDuration: const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,

      ),
      items: [0, 1].map((i) {
        return Builder(
          builder: (BuildContext context) {
            final cardData = cardDataList[i];
            return StreakInfo(
              streakQ: cardData['statQ'] as String,
              answer: cardData['answer'] as String,
              date: cardData['date'] as String,
            );
          },
        );
      }).toList(),
    );

    // return Container(
    //   child: CarouselSlider.builder(
    //     itemCount: cardDataList.length,
    //     itemBuilder: (context, index) {
    //       final cardData = cardDataList[index];
    //       return StreakInfo(streakQ: cardData['statQ'] as String,
    //        answer: cardData['answer'] as String,
    //        date: cardData['date'] as String,
    //        );
    //     },
    //     options: CarouselOptions(),
    //     ),
    // );
  }
}
