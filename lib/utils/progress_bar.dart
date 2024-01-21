import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class MyProgressBar extends StatelessWidget {
   MyProgressBar({Key? key, required this.percentWatched}) : super(key: key);
   double percentWatched = 0;

  @override
  Widget build(BuildContext context) {
    return LinearPercentIndicator(
      lineHeight: 15,
      percent: percentWatched,
      progressColor: Colors.grey[400],
      backgroundColor: Colors.grey[600],
      barRadius: Radius.circular(30),
    );
  }
}
