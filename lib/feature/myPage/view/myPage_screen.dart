import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaljayo/constants/sizes.dart';
import 'package:jaljayo/feature/myPage/view/information_screen.dart';
import 'package:jaljayo/feature/myPage/view/logout_screen.dart';
import 'package:jaljayo/feature/myPage/view/profile_screen.dart';
import 'package:jaljayo/feature/myPage/view/q&a_screen.dart';
import 'package:jaljayo/feature/myPage/view/question_screen.dart';

class MyPageScreen extends ConsumerStatefulWidget {
  const MyPageScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MyPageScreenState();
}

class _MyPageScreenState extends ConsumerState<MyPageScreen> {
  final String name = "노시헌";

  void _onprofileTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const ProfileScreen(),
      ),
    );
  }

  void _oninformationTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const InformationScreen(),
      ),
    );
  }

  void _onQATap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const QAScreen(),
      ),
    );
  }

  void _onQuestionTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const QuestionScreen(),
      ),
    );
  }

  void _onLogOutTap() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const LogOutScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                  width: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClipOval(
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            "https://q5n8c8q9.rocketcdn.me/wp-content/uploads/2018/08/The-20-Best-Royalty-Free-Music-Sites-in-2018.png",
                        height: 70.0,
                        width: 70.0,
                        placeholder: (context, url) =>
                            const CircularProgressIndicator(),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                  width: 0,
                ),
                Text(
                  name,
                  style: const TextStyle(
                      fontSize: Sizes.size20,
                      fontWeight: FontWeight.bold,
                      color: Color(0xffF4EEE0)),
                ),
                const SizedBox(
                  height: 30,
                  width: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      color: const Color(0xffF4EEE0),
                      width: MediaQuery.of(context).size.width - 30.0,
                      height: 1,
                      margin: const EdgeInsets.symmetric(horizontal: 15),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 550,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //마이페이지 리스트
              ListTile(
                onTap: _onprofileTap,
                title: const Text(
                  "프로필 편집",
                  style: TextStyle(
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF4EEE0)),
                ),
              ),
              Container(
                color: const Color(0xffF4EEE0),
                width: MediaQuery.of(context).size.width - 30.0,
                height: 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
              ListTile(
                onTap: _oninformationTap,
                title: const Text(
                  "이용 안내",
                  style: TextStyle(
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF4EEE0)),
                ),
              ),
              Container(
                color: const Color(0xffF4EEE0),
                width: MediaQuery.of(context).size.width - 30.0,
                height: 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
              ListTile(
                onTap: _onQATap,
                title: const Text(
                  "Q&A",
                  style: TextStyle(
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF4EEE0)),
                ),
              ),
              Container(
                color: const Color(0xffF4EEE0),
                width: MediaQuery.of(context).size.width - 30.0,
                height: 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
              ListTile(
                onTap: _onQuestionTap,
                title: const Text(
                  "자주묻는질문",
                  style: TextStyle(
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF4EEE0)),
                ),
              ),
              Container(
                color: const Color(0xffF4EEE0),
                width: MediaQuery.of(context).size.width - 30.0,
                height: 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
              ListTile(
                onTap: _onLogOutTap,
                title: const Text(
                  "로그아웃",
                  style: TextStyle(
                      fontSize: Sizes.size18,
                      fontWeight: FontWeight.w600,
                      color: Color(0xffF4EEE0)),
                ),
              ),
              Container(
                color: const Color(0xffF4EEE0),
                width: MediaQuery.of(context).size.width - 30.0,
                height: 0.5,
                margin: const EdgeInsets.symmetric(horizontal: 15),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
