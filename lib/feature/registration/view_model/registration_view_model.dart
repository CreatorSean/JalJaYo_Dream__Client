import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegistrationViewModel extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}
}

final registrationForm = StateProvider((ref) => {});

final registrationProvider = AsyncNotifierProvider<RegistrationViewModel, void>(
  () => RegistrationViewModel(),
);
