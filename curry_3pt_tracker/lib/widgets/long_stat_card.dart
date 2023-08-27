// import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
// import 'package:flutter/material.dart';

// class LongStatCard extends StatelessWidget {
//   final IconData icon1;
//   final IconData icon2;
//   final IconData icon3;
//   final double? iconSize1;
//   final double? iconSize2;
//   final double? iconSize3;
//   final double boxHeight1;
//   final double boxHeight2;
//   final double boxHeight3;
//   final String text1;
//   final String text2;
//   final String text3;
//   final String text4;
//   final String text5;
//   final String text6;
//   const LongStatCard({
//     super.key,
//     this.iconSize1,
//     this.iconSize2,
//     this.iconSize3,
//     required this.boxHeight1,
//     required this.boxHeight2,
//     required this.boxHeight3,
//     required this.icon1,
//     required this.icon2,
//     required this.icon3,
//     required this.text1,
//     required this.text2,
//     required this.text3,
//     required this.text4,
//     required this.text5,
//     required this.text6,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: Card(
//         shadowColor: Theme.of(context).colorScheme.secondary,
//         color: Theme.of(context).colorScheme.secondary,
//         elevation: 8,
//         clipBehavior: Clip.antiAlias,
//         shape: RoundedRectangleBorder(
//           side: BorderSide(
//             color: Theme.of(context).colorScheme.primary.withOpacity(.5),
//             width: 2,
//           ),
//           borderRadius: BorderRadius.circular(24),
//         ),
//         child: Container(
//           decoration: BoxDecoration(
//             gradient: LinearGradient(
//               colors: [
//                 Theme.of(context).colorScheme.secondary,
//                 Colors.blueAccent,
//               ],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Icon(
//                       icon1,
//                       size: iconSize1,
//                       color: Theme.of(context).colorScheme.primary,
//                     ),
//                     SizedBox(height: boxHeight1),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           text1,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                           ),
//                         ),
//                         Text(
//                           text2,
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               Center(
//                 child: Padding(
//                   padding: const EdgeInsets.all(16.0),
//                   child: Column(
//                     children: [
//                       Icon(
//                         icon2,
//                         size: iconSize2,
//                         color: Theme.of(context).colorScheme.primary,
//                       ),
//                       SizedBox(height: boxHeight1),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             text3,
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                             ),
//                           ),
//                           Text(
//                             text4,
//                             style: const TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 22,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.all(16.0),
//                 child: Column(
//                   children: [
//                     Icon(
//                       icon3,
//                       size: iconSize3,
//                       color: Theme.of(context).colorScheme.primary,
//                     ),
//                     SizedBox(height: boxHeight1),
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Text(
//                           text5,
//                           style: const TextStyle(
//                             color: Colors.white,
//                             fontSize: 22,
//                           ),
//                         ),
//                         Text(
//                           text6,
//                           style: const TextStyle(
//                               color: Colors.white,
//                               fontSize: 22,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
