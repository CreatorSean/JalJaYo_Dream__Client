import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jaljayo/constants/gaps.dart';
import 'package:jaljayo/constants/sizes.dart';
import 'package:jaljayo/feature/sleep_analysis/model/sleep_data_model.dart';
import 'package:jaljayo/feature/sleep_analysis/view_model/sleep_data_view_model.dart';
import 'package:jaljayo/feature/sleep_analysis/widgets/sleep_calendar.dart';
import 'package:jaljayo/feature/sleep_analysis/widgets/sleep_dialog_widget.dart';

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
          return Center(
            child: Text(
              error.toString(),
              style: const TextStyle(
                fontSize: Sizes.size16,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

Widget dataItem(int idx, BuildContext context, SleepDataModel sleep) {
  int score = 75;
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 8.0,
      vertical: 12.0,
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.2),
          spreadRadius: 0.5,
          blurRadius: 7,
          offset: const Offset(0, 10),
        ),
      ],
      color: const Color(0xff3E434D),
    ),
    child: ListTile(
      onTap: () {
        SleepDialogWidget().sleepDialog(context, sleep);
      },
      title: Text(
        "< ${sleep.sleepDate} >",
        style: const TextStyle(
          color: Color(0xffF4EEE0),
        ),
      ),
      titleAlignment: ListTileTitleAlignment.center,
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  children: [
                    Text(
                      '시작 시간 : ${sleep.startTime}',
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        color: Color(0xffF4EEE0),
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      '종료 시간 : ${sleep.endTime}',
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        color: Color(0xffF4EEE0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            CircleAvatar(
              radius: 35,
              backgroundColor: const Color(0xff0D9512),
              child: CircleAvatar(
                radius: 33,
                backgroundColor: const Color(0xff4A5365),
                child: Text(
                  "수면 점수\n      $score",
                  style: const TextStyle(
                      fontSize: Sizes.size14, color: Color(0xffF4EEE0)),
                ),
              ),
            ),
          ],
        ),
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
      );
}
