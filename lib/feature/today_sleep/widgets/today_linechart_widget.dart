import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/sizes.dart';

class TodayLinechartWidget extends ConsumerStatefulWidget {
  const TodayLinechartWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _TodayLinechartWidgetState();
}

class _TodayLinechartWidgetState extends ConsumerState<TodayLinechartWidget> {
  //late final Timer _timer;
  final List<double> _hrData = List.filled(100, 0.0, growable: true);
  double hrDataSum = 0;
  double hrDataAvg = 0;
  int hrDataAvgInt = 0;
  String? hrDataAvgStr;
  int length = 1;

  final double plotSmoothness = 0.5;
  final double plotWidth = 2;

  List<FlSpot> generateSpotData({List<double>? hrData}) {
    List<FlSpot> rtnSpots = [];

    if (hrData == null) {
      hrData = [];
      for (int i = 0; i < 100; i++) {
        hrData.add(Random().nextDouble() * 60 + 30); // 30에서 90 사이의 난수 생성
      }
    }

    for (int i = 0; i < hrData.length; i++) {
      rtnSpots.add(FlSpot(i.toDouble(), hrData[i]));
    }

    return rtnSpots;
  }

  LineChartBarData buildLineChartBarData({
    required List<FlSpot> spots,
    required Color color,
  }) {
    return LineChartBarData(
      color: color,
      isStrokeJoinRound: true,
      barWidth: plotWidth,
      dotData: const FlDotData(
        show: false,
      ),
      isCurved: true,
      curveSmoothness: plotSmoothness,
      spots: spots,
    );
  }

  // void initTimer() {
  //   _timer = Timer.periodic(
  //     const Duration(seconds: 1),
  //     (timer) {
  //       setState(() {
  //         _hrData.removeAt(0);
  //         _hrData.add(Random().nextDouble() * 10 + 70);
  //       });
  //     },
  //   );
  // }

  // @override
  // void initState() {
  //   super.initState();
  //   initTimer();
  // }

  // @override
  // void dispose() {
  //   _timer.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
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
          Expanded(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.only(top: 20, right: 15, left: 9),
              child: LineChart(
                duration: const Duration(milliseconds: 0),
                LineChartData(
                  lineTouchData: const LineTouchData(
                    enabled: false,
                    touchTooltipData: LineTouchTooltipData(
                      tooltipBgColor: Colors.transparent,
                    ),
                    handleBuiltInTouches: false,
                  ),
                  clipData: const FlClipData.all(),
                  maxY: 6.0,
                  minY: 0.0,
                  maxX: 10.0,
                  minX: 0.0,
                  borderData: FlBorderData(
                    border: Border.all(
                      color: const Color(0xff2A2F4F),
                      width: 3,
                    ),
                  ),
                  titlesData: FlTitlesData(
                      show: true,
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: false,
                        ),
                      ),
                      leftTitles: AxisTitles(
                        sideTitles: _leftTitles,
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: _bottomTitles,
                      )),
                  gridData: FlGridData(
                      horizontalInterval: 2,
                      verticalInterval: 3.35,
                      getDrawingHorizontalLine: (value) {
                        return const FlLine(
                          color: Color(0xffA8A4A4),
                          strokeWidth: 0.5,
                        );
                      },
                      getDrawingVerticalLine: (value) {
                        return const FlLine(
                          color: Colors.grey,
                          strokeWidth: 0.5,
                        );
                      }),
                  lineBarsData: [
                    buildLineChartBarData(
                      spots: gaspot(),
                      color: Colors.redAccent,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String text = '';
  SideTitles get _leftTitles => SideTitles(
        showTitles: true,
        reservedSize: 42.0,
        getTitlesWidget: (value, meta) {
          switch (value.toInt()) {
            case 0:
              text = "";
              break;
            case 1:
              text = "깊은수면";
              break;
            case 2:
              text = "";
              break;
            case 3:
              text = '코어수면';
              break;
            case 4:
              text = "";
              break;
            case 5:
              text = '   REM';
              break;
            case 6:
              text = "";
              break;
          }
          return Text(
            text,
            style: const TextStyle(
                fontSize: Sizes.size11, color: Color(0xffF4EEE0)),
          );
        },
      );
  SideTitles get _bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 20.0,
        getTitlesWidget: (value, meta) {
          switch (value.toInt()) {
            case 0:
              text = "04:30";
              break;
            case 1:
              text = "";
              break;
            case 2:
              text = "";
              break;
            case 3:
              text = "";
              break;
            case 4:
              text = "";
              break;

            case 10:
              text = '07:30';
              break;
          }
          return Text(
            text,
            style: const TextStyle(
                fontSize: Sizes.size12, color: Color(0xffF4EEE0)),
          );
        },
      );

  List<FlSpot> gaspot() {
    List<double> data = [3, 1, 5, 4, 3, 3, 5, 4, 4, 2, 2, 1, 2];
    List<FlSpot> spots = [];
    for (int i = 0; i < data.length; i++) {
      spots.add(FlSpot(i.toDouble(), data[i]));
    }
    return spots;
  }
}
