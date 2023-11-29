import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jaljayo/constants/gaps.dart';
import 'package:jaljayo/feature/today_sleep/widgets/heartRate_widget.dart';
import 'package:jaljayo/feature/today_sleep/widgets/today_linechart_widget.dart';
import 'package:jaljayo/feature/today_sleep/widgets/today_sleep_state.dart';

class TodaySleepScreen extends ConsumerStatefulWidget {
  static String routeURL = "/today";
  static String routeName = "today";
  const TodaySleepScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodaySleepScreenState();
}

class _TodaySleepScreenState extends ConsumerState<TodaySleepScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF2B303A),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            SizedBox(
              child: TodaySleepState(),
            ),
            Gaps.v16,
            SizedBox(
              width: double.infinity,
              height: 230,
              child: TodayLinechartWidget(),
            ),
            Gaps.v16,
            SizedBox(
              width: double.infinity,
              height: 180,
              child: HrSensorWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
