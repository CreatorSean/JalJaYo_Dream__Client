import 'dart:async';
import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class AccSensorWidget extends StatefulWidget {
  const AccSensorWidget({
    super.key,
  });

  @override
  State<AccSensorWidget> createState() => _AccSensorWidgetState();
}

class _AccSensorWidgetState extends State<AccSensorWidget> {
  late final Timer _timer;
  final List<double> _accX = List.filled(100, 0.0, growable: true);
  final List<double> _accY = List.filled(100, 0.0, growable: true);
  final List<double> _accZ = List.filled(100, 0.0, growable: true);

  final double plotSmoothness = 0.5;
  final double plotWidth = 2;

  List<FlSpot> generateSpotData({List<double>? accData}) {
    List<FlSpot> rtnSpots = [];

    if (accData == null) {
      accData = [];
      for (int i = 0; i < 100; i++) {
        accData.add(Random().nextDouble() * 2 - 1.0);
      }
    }

    for (int i = 0; i < accData.length; i++) {
      rtnSpots.add(FlSpot(i.toDouble(), accData[i]));
    }

    return rtnSpots;
  }

  LineChartBarData generateLineChartBarData({
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

  void initTimer() {
    _timer = Timer.periodic(
      200.ms,
      (timer) {
        setState(() {
          _accX.removeAt(0);
          _accX.add(Random().nextDouble() * 1.5 - 1.0);
          _accY.removeAt(0);
          _accY.add(Random().nextDouble() - 1.0);
          _accZ.removeAt(0);
          _accZ.add(Random().nextDouble() * 2);
        });
      },
    );
  }

  @override
  void initState() {
    super.initState();
    initTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 25.0,
            right: 25.0,
          ),
          child: Container(
            padding: const EdgeInsets.only(
              top: 40,
              bottom: 25,
            ),
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
            child: LineChart(
              duration: 0.ms,
              LineChartData(
                clipData: const FlClipData.all(),
                maxY: 2.0,
                baselineY: 0,
                minY: -2.0,
                titlesData: const FlTitlesData(
                  show: true,
                  topTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: false,
                    ),
                  ),
                ),
                gridData: FlGridData(
                  horizontalInterval: 1.0,
                  getDrawingHorizontalLine: (value) {
                    return const FlLine(
                      color: Colors.grey,
                      strokeWidth: 0.5,
                    );
                  },
                ),
                lineBarsData: [
                  generateLineChartBarData(
                    spots: generateSpotData(accData: _accX),
                    color: Colors.redAccent,
                  ),
                  generateLineChartBarData(
                    spots: generateSpotData(accData: _accY),
                    color: Colors.greenAccent,
                  ),
                  generateLineChartBarData(
                    spots: generateSpotData(accData: _accZ),
                    color: Colors.blueAccent,
                  ),
                ],
              ),
            ),
          ),
        ),
        const Positioned(
          top: 15,
          left: 45,
          child: Text(
            "Acceleation",
            style: TextStyle(
              color: Color(0xfff4eee0),
            ),
          ),
        ),
        const Positioned(
          bottom: 5,
          left: 145,
          child: Text(
            "t(s)",
            style: TextStyle(
              color: Color(0xfff4eee0),
            ),
          ),
        ),
      ],
    );
  }
}
