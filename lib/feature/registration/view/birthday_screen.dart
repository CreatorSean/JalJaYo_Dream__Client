import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jaljayo/constants/gaps.dart';
import 'package:jaljayo/constants/sizes.dart';
import 'package:jaljayo/feature/registration/view/gender_screen.dart';
import 'package:jaljayo/feature/registration/view_model/registration_view_model.dart';
import 'package:jaljayo/feature/registration/widgets/birthday_textField.dart';
import 'package:jaljayo/feature/registration/widgets/form_button.dart';

class BirthdayScreen extends ConsumerStatefulWidget {
  final String username;
  const BirthdayScreen({
    super.key,
    required this.username,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends ConsumerState<BirthdayScreen> {
  final TextEditingController _birthYearController = TextEditingController();
  final TextEditingController _birthMonthController = TextEditingController();
  final TextEditingController _birthDayController = TextEditingController();

  String _birthYear = "";
  String _birthMonth = "";
  String _birthDay = "";
  String _birth = "";

  void _onNextTap() {
    _birth = _birthYear + _birthMonth + _birthDay;
    if (_birthYear.isEmpty && _birthMonth.isEmpty && _birthDay.isEmpty) return;
    //registrationForm Provider를 사용하여 birthday를 생성하면 해당 정보를 저장한다.
    final state = ref.read(registrationForm.notifier).state;
    ref.read(registrationForm.notifier).state = {...state, "birthday": _birth};
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const GenderScreen(),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _birthYearController.addListener(
      () {
        setState(() {
          _birthYear = _birthYearController.text;
        });
      },
    );
    _birthMonthController.addListener(
      () {
        setState(() {
          _birthMonth = _birthMonthController.text;
        });
      },
    );
    _birthDayController.addListener(
      () {
        setState(() {
          _birthDay = _birthDayController.text;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        backgroundColor: const Color(0xff2b303a),
        appBar: null,
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Gaps.v60,
              Row(
                children: [
                  Text(
                    "안녕하세요 ${widget.username}님,",
                    style: const TextStyle(
                      color: Color(0xfff4eee0),
                      fontWeight: FontWeight.w400,
                      fontSize: Sizes.size16,
                    ),
                  ),
                ],
              ),
              Gaps.v5,
              const Row(
                children: [
                  Text(
                    "태어난 날을 알려주세요:)",
                    style: TextStyle(
                      color: Color(0xfff4eee0),
                      fontWeight: FontWeight.w600,
                      fontSize: Sizes.size24,
                    ),
                  ),
                ],
              ),
              Gaps.v36,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BirthdayTextField(
                    birthdayController: _birthYearController,
                    birthHintText: "YYYY",
                    boxWidth: 120,
                    maxLength: 4,
                  ),
                  Gaps.h6,
                  BirthdayTextField(
                    birthdayController: _birthMonthController,
                    birthHintText: "MM",
                    boxWidth: 70,
                    maxLength: 2,
                  ),
                  Gaps.h6,
                  BirthdayTextField(
                    birthdayController: _birthDayController,
                    birthHintText: "DD",
                    boxWidth: 70,
                    maxLength: 2,
                  ),
                ],
              ),
              Gaps.v36,
              GestureDetector(
                onTap: _onNextTap,
                child: FormButton(
                  isDisabled: _birthYear.isEmpty ||
                      _birthMonth.isEmpty ||
                      _birthDay.isEmpty,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: null,
      ),
    );
  }
}
