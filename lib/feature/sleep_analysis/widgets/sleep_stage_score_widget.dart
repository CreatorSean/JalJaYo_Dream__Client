import 'package:flutter/material.dart';
import 'package:jaljayo/constants/gaps.dart';
import 'package:jaljayo/constants/sizes.dart';

class SleepStageScoreWidget extends StatelessWidget {
  final String sleepStage;
  final int sleepLength;
  final double sleepPercentage;
  final int sleepHr;
  final int sleepMin;
  final Color sleepColor;
  const SleepStageScoreWidget({
    super.key,
    required this.sleepStage,
    required this.sleepPercentage,
    required this.sleepColor,
    required this.sleepLength,
    required this.sleepHr,
    required this.sleepMin,
  });

  @override
  Widget build(BuildContext context) {
    double barLength = MediaQuery.of(context).size.width - 100;
    return Column(
      children: [
        Row(
          children: [
            Text(
              sleepStage,
              style: TextStyle(
                color: const Color(0xfff4eee0).withOpacity(0.8),
                fontSize: Sizes.size16,
              ),
            )
          ],
        ),
        Row(
          children: [
            Stack(
              children: [
                Container(
                  width: barLength * sleepPercentage,
                  height: 36,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: sleepColor,
                  ),
                ),
                Positioned(
                  top: Sizes.size6,
                  left: Sizes.size12,
                  child: Text(
                    "${(sleepPercentage * 100).round().floor()}%",
                    style: TextStyle(
                      color: const Color(0xfff4eee0).withOpacity(0.8),
                      fontSize: Sizes.size18,
                    ),
                  ),
                )
              ],
            ),
            Gaps.h5,
            sleepLength < 60
                ? Text(
                    "$sleepMin분",
                    style: const TextStyle(
                      color: Color(0xfff4eee0),
                      fontSize: Sizes.size20,
                    ),
                  )
                : Text(
                    "${sleepLength ~/ 60}시간 ${sleepLength % 60}분",
                    style: const TextStyle(
                      color: Color(0xfff4eee0),
                      fontSize: Sizes.size20,
                    ),
                  ),
          ],
        ),
      ],
    );
  }
}
