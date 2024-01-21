import 'package:flutter/material.dart';
import 'package:stories/utils/progress_bar.dart';

class MyStoryBars extends StatelessWidget {
  MyStoryBars({Key? key, required this.percentWatched}) : super(key: key);
  List<double> percentWatched = [];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 60, left: 3, right: 3),
        child: Row(children: [
      Expanded(child: MyProgressBar(percentWatched: percentWatched[0])),
      Expanded(child: MyProgressBar(percentWatched: percentWatched[1])),
      Expanded(child: MyProgressBar(percentWatched: percentWatched[2])),
          Expanded(child: MyProgressBar(percentWatched: percentWatched[3])),
          Expanded(child: MyProgressBar(percentWatched: percentWatched[4])),
          Expanded(child: MyProgressBar(percentWatched: percentWatched[5])),
    ],));
  }
}
