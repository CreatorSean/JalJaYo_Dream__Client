import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jaljayo/feature/onboarding/tutorial_screen.dart';

class RegistrationViewModel extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> addUser(BuildContext context) async {
    context.goNamed(TutorialScreen.routeName);
  }
}

final registrationForm = StateProvider((ref) => {});

final registrationProvider = AsyncNotifierProvider<RegistrationViewModel, void>(
  () => RegistrationViewModel(),
);
