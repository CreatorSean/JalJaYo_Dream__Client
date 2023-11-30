import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jaljayo/feature/home/view/home_screen.dart';
import 'package:jaljayo/feature/onboarding/tutorial_screen.dart';
import 'package:jaljayo/feature/registration/view/name_screen.dart';
import 'package:jaljayo/feature/sensors/views/sensor_screen.dart';
import 'package:jaljayo/feature/sleep_analysis/view/sleep_analysis_screen.dart';
import 'package:jaljayo/feature/today_sleep/view/today_sleep_screen.dart';

final routerProvier = Provider(
  (ref) {
    return GoRouter(
      initialLocation: "/home",
      routes: [
        GoRoute(
          path: TutorialScreen.routeURL,
          name: TutorialScreen.routeName,
          builder: (context, state) => const TutorialScreen(),
        ),
        GoRoute(
          path: HomeScreen.routeURL,
          name: HomeScreen.routeName,
          pageBuilder: (context, state) => const MaterialPage(
            child: HomeScreen(),
          ),
        ),
        GoRoute(
          path: SensorScreen.routeURL,
          name: SensorScreen.routeName,
          pageBuilder: (context, state) => const MaterialPage(
            child: SensorScreen(),
          ),
        ),
        GoRoute(
          path: SleepAnalysisScreen.routeURL,
          name: SleepAnalysisScreen.routeName,
          pageBuilder: (context, state) => const MaterialPage(
            child: SleepAnalysisScreen(),
          ),
        ),
        GoRoute(
          path: TodaySleepScreen.routeURL,
          name: TodaySleepScreen.routeName,
          pageBuilder: (context, state) => const MaterialPage(
            child: TodaySleepScreen(),
          ),
        ),
        GoRoute(
          path: NameScreen.routeURL,
          name: NameScreen.routeName,
          pageBuilder: (context, state) => const MaterialPage(
            child: NameScreen(),
          ),
        ),
      ],
    );
  },
);
