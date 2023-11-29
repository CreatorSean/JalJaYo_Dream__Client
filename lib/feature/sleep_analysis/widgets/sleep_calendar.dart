import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../flutter_heatmap_calendar.dart';

class SleepCalendar extends ConsumerStatefulWidget {
  const SleepCalendar({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SleepCalendarState();
}

DateTime userDate = DateTime.now();
int selectedColor = -1;

class _SleepCalendarState extends ConsumerState<SleepCalendar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xff3E434D), //ff3E434D
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 0.5,
            blurRadius: 7,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            HeatMapCalendar(
              monthFontSize: 18,
              weekTextColor: const Color(0xfff4eee0),
              defaultColor: const Color(0xff3E434D),
              flexible: true,
              colorMode: ColorMode.color,
              textColor: const Color(0xffeeeeee),
              showColorTip: false,
              datasets: {
                DateTime(2023, 10, 6): 1,
                DateTime(2023, 10, 7): 2,
                DateTime(2023, 10, 8): 3,
                DateTime(2023, 10, 9): 4,
                DateTime(2023, 10, 13): 4,
                DateTime(2023, 10, 14): 1,
                DateTime(2023, 10, 15): 2,
                DateTime(2023, 10, 18): 3,
                DateTime(2023, 10, 19): 4,
                DateTime(2023, 10, 20): 4,
                DateTime(2023, 10, 21): 1,
                DateTime(2023, 10, 22): 2,
                DateTime(2023, 10, 23): 3,
                DateTime(2023, 10, 25): 4,
                DateTime(2023, 10, 26): 4,
                DateTime(2023, 10, 28): 1,
                DateTime(2023, 10, 30): 2,
                DateTime(2023, 10, 31): 3,
                DateTime(userDate.year, userDate.month, userDate.day):
                    selectedColor,
              },
              colorsets: const {
                1: Color(0xffa9d4f4),
                2: Color(0xff7bc1b2),
                3: Color(0xfffed081),
                4: Color(0xfff96c6c),
              },
              onClick: (value) {
                userDate = value;
                setState(() {});
              },
            ),
          ],
        ),
      ),
    );
  }
}
