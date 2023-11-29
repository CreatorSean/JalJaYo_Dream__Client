import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jaljayo/router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    const ProviderScope(
      child: JalJaYo(),
    ),
  );
}

class JalJaYo extends ConsumerWidget {
  const JalJaYo({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: ref.watch(routerProvier),
      title: 'Good Night',
      themeMode: ThemeMode.system,
      theme: ThemeData(
        primaryColor: const Color(0xff171A21),
        primaryTextTheme: const TextTheme(
          titleLarge: TextStyle(
            color: Color(0xfff4eee0),
          ),
        ),
      ),
    );
  }
}
