import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:jaljayo/constants/gaps.dart';
import 'package:jaljayo/constants/sizes.dart';
import 'package:jaljayo/feature/today_sleep/widgets/circle_widget.dart';

class TodaySleepState extends ConsumerStatefulWidget {
  const TodaySleepState({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodaySleepStateState();
}

class _TodaySleepStateState extends ConsumerState<TodaySleepState> {
  String getToday() {
    DateTime now = DateTime.now();
    DateFormat formatter = DateFormat('yyyy-MM-dd');
    String strToday = formatter.format(now);
    return strToday;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xff3E434D),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 3,
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: [
                  Text(
                    "<${getToday()}>",
                    style: const TextStyle(
                      color: Color(0xffAEA898),
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const Text(
                    "오늘의 수면",
                    style: TextStyle(
                      color: Color(0xffF4EEE0),
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        FontAwesomeIcons.heartPulse,
                        size: Sizes.size36,
                        color: Color(0xffE94F4F),
                      ),
                      Gaps.h10,
                      Column(
                        children: [
                          Text(
                            "64",
                            style: TextStyle(
                              color: Color(0xfff4eee0),
                              fontSize: Sizes.size14,
                            ),
                          ),
                          Text(
                            "bpm",
                            style: TextStyle(
                              color: Color(0xfff4eee0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Text(
                    "수면 중 평균 bpm",
                    style: TextStyle(
                      color: Color(0xfff4eee0),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gaps.v32,
          const Stack(
            alignment: Alignment.center,
            children: [
              CircleAvatar(
                radius: 48,
                backgroundColor: Color(0xffFA5858),
              ),
              Column(
                children: [
                  Text(
                    "수면시간",
                    style: TextStyle(
                      color: Color(0xffF4EEE0),
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "4H 3M",
                    style: TextStyle(
                      color: Color(0xffF4EEE0),
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gaps.v24,
          const Text(
            '수면 효율 90점',
            style: TextStyle(
              color: Colors.white,
              fontSize: Sizes.size24,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Text(
            '오늘도 좋은 밤 되셨군요?',
            style: TextStyle(
              color: Colors.white,
              fontSize: Sizes.size16,
              fontWeight: FontWeight.w500,
            ),
          ),
          Gaps.v36,
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff4A5365), // 배경색
                      borderRadius: BorderRadius.circular(15),
                    ), // 배경색
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          CirCleWidget(
                            mainText: "REM 수면",
                            mainCircleColor: Color(0xff2A2F4F),
                            mainTextColor: Color(0xffeeeeee),
                            mainCircleSize: Sizes.size36,
                            mainTextSize: Sizes.size14,
                          ),
                          Gaps.v10,
                          Text(
                            "2H 2M",
                            style: TextStyle(
                              color: Color(0xfff4eee0),
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff4A5365), // 배경색
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          CirCleWidget(
                            mainText: "얕은 수면",
                            mainCircleColor: Color(0xff444C85),
                            mainTextColor: Color(0xffeeeeee),
                            mainCircleSize: Sizes.size36,
                            mainTextSize: Sizes.size14,
                          ),
                          Gaps.v10,
                          Text(
                            "1H 13M",
                            style: TextStyle(
                              color: Color(0xfff4eee0),
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color(0xff4A5365), // 배경색
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        children: [
                          CirCleWidget(
                            mainText: "깊은 수면",
                            mainCircleColor: Color(0xff5D69B0),
                            mainTextColor: Color(0xffeeeeee),
                            mainCircleSize: Sizes.size36,
                            mainTextSize: Sizes.size14,
                          ),
                          Gaps.v10,
                          Text(
                            "48M",
                            style: TextStyle(
                              color: Color(0xfff4eee0),
                              fontSize: Sizes.size20,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Gaps.v20,
        ],
      ),
    );
  }
}
