import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jaljayo/constants/gaps.dart';
import 'package:jaljayo/constants/sizes.dart';
import 'package:jaljayo/feature/registration/view/birthday_screen.dart';
import 'package:jaljayo/feature/registration/view_model/registration_view_model.dart';
import 'package:jaljayo/feature/registration/widgets/form_button.dart';

class NameScreen extends ConsumerStatefulWidget {
  static String routeURL = '/username';
  static String routeName = 'username';
  const NameScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NameScreenState();
}

class _NameScreenState extends ConsumerState<NameScreen> {
  final TextEditingController _usernameController = TextEditingController();

  String _username = "";

  void _onNextTap() {
    if (_username.isEmpty) return;
    ref.read(registrationForm.notifier).state = {"name": _username};
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => BirthdayScreen(username: _username),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _usernameController.addListener(
      () {
        setState(() {
          _username = _usernameController.text;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Gaps.v60,
            Row(
              children: [
                Text(
                  "이름을 알려주세요 :)",
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size24),
                ),
              ],
            ),
            Gaps.v5,
            Row(
              children: [
                Text(
                  "처음에 시작시에 필요합니다",
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            Gaps.v36,
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: 'JalJaYo',
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v36,
            GestureDetector(
              onTap: _onNextTap,
              child: FormButton(
                isDisabled: _username.isEmpty,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: null,
    );
  }
}
