import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaljayo/common/main_app_bar.dart';
import 'package:jaljayo/constants/gaps.dart';
import 'package:jaljayo/constants/sizes.dart';
import 'package:jaljayo/feature/sleep_analysis/model/sleep_data_model.dart';
import 'package:jaljayo/feature/sleep_analysis/view_model/sleep_server_view_model.dart';
import 'package:jaljayo/feature/sleep_analysis/widgets/sleep_linechart_widget.dart';
import 'package:jaljayo/feature/sleep_analysis/widgets/sleep_piechart_widget.dart';
import 'package:jaljayo/feature/sleep_analysis/widgets/sleep_stage_score_widget.dart';

class SleepStateScreen extends StatefulWidget {
  final SleepDataModel sleep;
  static String routeURL = ':sleepID';
  static String routeName = 'sleepState';
  const SleepStateScreen({
    super.key,
    required this.sleep,
  });

  @override
  State<SleepStateScreen> createState() => _SleepStateScreenState();
}

class _SleepStateScreenState extends State<SleepStateScreen> {
  late Future<Map<String, dynamic>> sleepAnalysisData;

  @override
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SleepServerViewModel().sleepAnalysis(widget.sleep.modelName),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;

          final int tstHour = data['tst_hour'];
          final int tstMin = data['tst_minute'];
          final int wasoMin = data['waso_minute'];
          final List sleepStateData = data['sleep_list'];
          final int sleepMin = tstMin + wasoMin;
          final int extrasleepHr = sleepMin ~/ 60;
          final int extrasleepMin = sleepMin % 60 * extrasleepHr;
          final int totalsleepHr = tstHour + extrasleepHr;
          final int totalsleepLength = tstHour * 60 + sleepMin;
          final int realSleepLength = tstHour * 60 + tstMin;
          final int sleepSE = data['se: '] ~/ 1;

          return Scaffold(
            backgroundColor: const Color(0xff2B303A),
            appBar: AppBar(
              iconTheme: const IconThemeData(
                color: Color(0xffF4EEE0),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(FontAwesomeIcons.bluetooth),
                  ),
                ),
              ],
              backgroundColor: const Color(0xFF171A21),
              elevation: 3,
              title: const Text(
                "Gae GGul Sleep",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Color(0xffF4EEE0),
                ),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, bottom: 20.0),
                child: Column(
                  children: [
                    Gaps.v16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '일일 수면 기록',
                              style: TextStyle(
                                color: Color(0xFFF4EEE0),
                                fontSize: Sizes.size28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              widget.sleep.sleepDate,
                              style: const TextStyle(
                                color: Color(0xffF4EEE0),
                                fontSize: Sizes.size28,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: CustomPaint(
                                // CustomPaint를 그리고 이 안에 차트를 그려줍니다..
                                size: const Size(80,
                                    80), // CustomPaint의 크기는 가로 세로 80, 80 합니다.
                                painter: SleepPieChartWidget(
                                  percentage: sleepSE,
                                  textScaleFactor: 0.7,
                                  textColor: '0xFFF4EEE0',
                                ),
                              ),
                            ),
                            Gaps.v5,
                            const Text(
                              '수면 효율',
                              style: TextStyle(
                                  color: Color(0xFFF4EEE0),
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ],
                    ),
                    Gaps.v16,
                    const Divider(
                      color: Color(0xfff4eee0),
                      thickness: 1.0,
                    ),
                    Gaps.v16,
                    const Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '수면 차트',
                              style: TextStyle(
                                color: Color(0xffF4EEE0),
                                fontSize: Sizes.size24,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Gaps.v28,
                    Container(
                      width: double.infinity,
                      height: 270,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Gaps.h16,
                                const Column(
                                  children: [
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Color(0xff707070),
                                    ),
                                    Gaps.v32,
                                    Gaps.v16,
                                    CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Color(0xff2E4374),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 200,
                                  width: MediaQuery.of(context).size.width,
                                  child: SleepLineChart(
                                    sleepStateData: sleepStateData,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Divider(
                      color: Color(0xfff4eee0),
                      thickness: 1.0,
                    ),
                    Gaps.v16,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            const Text(
                              "총 수면 시간",
                              style: TextStyle(
                                color: Color(0xff585858),
                                fontSize: Sizes.size18,
                              ),
                            ),
                            Gaps.v8,
                            Text(
                              '$totalsleepHr시간 $extrasleepMin분',
                              style: const TextStyle(
                                color: Color(0xffF4EEE0),
                                fontSize: Sizes.size24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const Text(
                              "실제 수면 시간",
                              style: TextStyle(
                                color: Color(0xff585858),
                                fontSize: Sizes.size18,
                              ),
                            ),
                            Gaps.v8,
                            Text(
                              '$tstHour시간 $tstMin분',
                              style: const TextStyle(
                                color: Color(0xFFF4EEE0),
                                fontSize: Sizes.size24,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Gaps.v16,
                    const Divider(
                      color: Color(0xfff4eee0),
                      thickness: 1.0,
                    ),
                    Gaps.v16,
                    const Row(
                      children: [
                        Text(
                          '단계별 수면 시간',
                          style: TextStyle(
                            color: Color(0xffF4EEE0),
                            fontSize: Sizes.size24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Gaps.v16,
                    SleepStageScoreWidget(
                      sleepStage: "수면 중 깸",
                      sleepPercentage: wasoMin / totalsleepLength,
                      sleepColor: const Color(0xffE94F4F),
                      sleepLength: wasoMin,
                      sleepHr: tstHour,
                      sleepMin: wasoMin,
                    ),
                    Gaps.v16,
                    SleepStageScoreWidget(
                      sleepStage: "실제 수면",
                      sleepPercentage: realSleepLength / totalsleepLength,
                      sleepColor: const Color(0xff4D71CE),
                      sleepLength: realSleepLength,
                      sleepHr: tstHour,
                      sleepMin: tstMin,
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          return const Text('error');
        } else {
          print(snapshot.error);
          return Scaffold(
            backgroundColor: Theme.of(context).primaryColor,
            appBar: const MainAppBar(
              title: 'SleepState',
            ),
            body: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
