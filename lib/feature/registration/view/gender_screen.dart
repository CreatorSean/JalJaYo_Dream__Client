import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jaljayo/constants/gaps.dart';
import 'package:jaljayo/constants/sizes.dart';
import 'package:jaljayo/feature/home/view/home_screen.dart';
import 'package:jaljayo/feature/registration/view_model/registration_view_model.dart';
import 'package:jaljayo/feature/registration/widgets/form_button.dart';
import 'package:jaljayo/feature/registration/widgets/gender_button.dart';

class GenderScreen extends ConsumerStatefulWidget {
  const GenderScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GenderScreenState();
}

class _GenderScreenState extends ConsumerState<GenderScreen> {
  String _gender = "";
  final String _woman = "여자";
  final String _man = "남자";
  final String _other = "그외";
  bool _womanSelected = true;
  bool _manSelected = true;
  bool _otherSelected = true;

  void _onNextTap() {
    if (_gender.isEmpty) return;
    //registrationForm Provider를 사용하여 gender을 생성하면 해당 정보를 저장한다.
    final state = ref.read(registrationForm.notifier).state;
    ref.read(registrationForm.notifier).state = {...state, "gender": _gender};
    context.goNamed(HomeScreen.routeName);
  }

  void _onManSelectTap() {
    _gender = "남자";
    _manSelected = false;
    _womanSelected = true;
    _otherSelected = true;
    setState(() {});
  }

  void _onWomanSelectTap() {
    _gender = "여자";
    _manSelected = true;
    _womanSelected = false;
    _otherSelected = true;
    setState(() {});
  }

  void _onOhterSelectTap() {
    _gender = "그외";
    _manSelected = true;
    _womanSelected = true;
    _otherSelected = false;
    setState(() {});
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
                  "성별을 알려주세요 :)",
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
            GestureDetector(
              onTap: () {
                _onWomanSelectTap();
              },
              child: GenderButton(
                genderText: _woman,
                isDisabled: _womanSelected,
              ),
            ),
            Gaps.v24,
            GestureDetector(
              onTap: () => _onManSelectTap(),
              child: GenderButton(
                genderText: _man,
                isDisabled: _manSelected,
              ),
            ),
            Gaps.v24,
            GestureDetector(
              onTap: () => _onOhterSelectTap(),
              child: GenderButton(
                genderText: _other,
                isDisabled: _otherSelected,
              ),
            ),
            Gaps.v36,
            _gender.isEmpty
                ? const SizedBox(
                    width: 10,
                    height: 10,
                  )
                : GestureDetector(
                    onTap: _onNextTap,
                    child: FormButton(
                      isDisabled: _gender.isEmpty,
                    ),
                  ),
          ],
        ),
      ),
      bottomNavigationBar: null,
    );
  }
}
