import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaljayo/constants/gaps.dart';
import 'package:jaljayo/constants/sizes.dart';
import 'package:jaljayo/feature/sleep_analysis/model/sleep_data_model.dart';
import 'package:jaljayo/feature/sleep_analysis/view_model/sleep_data_view_model.dart';
import 'package:jaljayo/feature/sleep_analysis/widgets/sleep_calendar.dart';
import 'package:jaljayo/feature/sleep_analysis/widgets/sleep_dialog_widget.dart';
import 'package:jaljayo/feature/sleep_analysis/widgets/sleep_linechart_widget.dart';
import 'package:jaljayo/feature/sleep_analysis/widgets/sleep_piechart_widget.dart';

class SleepAnalysisScreen extends ConsumerStatefulWidget {
  static String routeURL = '/sleep';
  static String routeName = 'sleeps';
  const SleepAnalysisScreen({super.key});

  @override
  ConsumerState<SleepAnalysisScreen> createState() =>
      _SleepAnalysisScreenState();
}

class _SleepAnalysisScreenState extends ConsumerState<SleepAnalysisScreen> {
  bool isClicked = false;
  FlutterBluePlus flutterBlue = FlutterBluePlus.instance;
  List<ScanResult> scanResultList = [];
  late Future<Map<String, dynamic>> sleepAnalysisData;

  @override
  initState() {
    super.initState();
  }

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B303A),
      body: ref.watch(sleepDataViewModelProvider).when(
        data: (sleepList) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(15),
            child: Column(
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 510,
                  child: SleepCalendar(),
                ),
                Gaps.v16,
                Row(
                  children: [
                    Expanded(
                      child: ListView.separated(
                        shrinkWrap: true,
                        primary: false,
                        itemCount: sleepList.length,
                        itemBuilder: (context, index) {
                          return dataItem(
                            index,
                            context,
                            sleepList[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const Divider(
                            color: Color(0xff2B303A),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        error: (error, stackTrace) {
          return const Padding(
            padding: EdgeInsets.all(15),
            child: SizedBox(
              width: double.infinity,
              height: 510,
              child: SleepCalendar(),
            ),
          );
          // return Center(
          //   child: Text(
          //     error.toString(),
          //     style: const TextStyle(
          //       fontSize: Sizes.size16,
          //       fontWeight: FontWeight.bold,
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}

Widget dataItem(int idx, BuildContext context, SleepDataModel sleep) {
  return GestureDetector(
    onTap: () {
      SleepDialogWidget().sleepDialog(context, sleep);
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 8.0,
        vertical: 12.0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xff3E434D),
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 12, left: 12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  '< ${sleep.sleepDate} >',
                  style: const TextStyle(
                    color: Color(0xfff4eee0),
                    fontSize: Sizes.size16,
                  ),
                ),
                Gaps.v16,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      children: [
                        Text(
                          "·  시작 시간  :",
                          style: TextStyle(
                            color: Color(0xfff4eee0),
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gaps.v10,
                        Text(
                          "·  종료 시간  :",
                          style: TextStyle(
                            color: Color(0xfff4eee0),
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Gaps.h20,
                    Column(
                      children: [
                        Text(
                          sleep.startTime,
                          style: const TextStyle(
                            color: Color(0xfff4eee0),
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Gaps.v10,
                        Text(
                          sleep.startTime,
                          style: const TextStyle(
                            color: Color(0xfff4eee0),
                            fontSize: Sizes.size16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: CustomPaint(
                    // CustomPaint를 그리고 이 안에 차트를 그려줍니다..
                    size: const Size(
                        80, 80), // CustomPaint의 크기는 가로 세로 80, 80 합니다.
                    painter: SleepPieChartWidget(
                      percentage: sleep.sleepWaso,
                      textScaleFactor: 0.7,
                      textColor: const Color(0xff0A7E0F),
                    ),
                  ),
                ),
                const Text(
                  "수면 효율",
                  style: TextStyle(
                    color: Color(0xfff4eee0),
                    fontSize: Sizes.size16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    )
        .animate()
        .then(delay: (idx * 50).ms)
        .fadeIn(
          duration: 300.ms,
          curve: Curves.easeInOut,
        )
        .flipV(
          begin: -0.25,
          end: 0,
          duration: 300.ms,
          curve: Curves.easeInOut,
        ),
  );
}
