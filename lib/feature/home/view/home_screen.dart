import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:jaljayo/common/main_app_bar.dart';
import 'package:jaljayo/common/main_navigator_screen.dart';
import 'package:jaljayo/feature/myPage/view/myPage_screen.dart';
import 'package:jaljayo/feature/sensors/views/sensor_screen.dart';
import 'package:jaljayo/feature/sleep_analysis/view/sleep_analysis_screen.dart';
import 'package:jaljayo/feature/today_sleep/view/today_sleep_screen.dart';

class HomeScreen extends StatefulWidget {
  static String routeURL = '/home';
  static String routeName = 'home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  void changePage(int index) {
    _currentPage = index;
    _pageController.animateToPage(
      index,
      duration: 300.ms,
      curve: Curves.linear,
    );

    setState(() {});
  }

  String getTitle(int pageIdx) {
    if (pageIdx == 0) {
      return "Today Sleep";
    } else if (pageIdx == 1) {
      return "Sleep Analysis";
    } else {
      return "My Page";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBar(
        title: getTitle(_currentPage),
      ),
      backgroundColor: const Color(0xFF2B303A),
      body: PageView(
        controller: _pageController,
        onPageChanged: changePage,
        children: const [
          TodaySleepScreen(),
          SleepAnalysisScreen(),
          MyPageScreen(),
        ],
      ),
      bottomNavigationBar: MainNavigator(
        page: _currentPage,
        changeFunc: changePage,
      ),
    );
  }
}
