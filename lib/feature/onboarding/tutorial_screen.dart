import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:jaljayo/constants/sizes.dart';
import 'package:jaljayo/feature/home/view/home_screen.dart';

class TutorialScreen extends StatefulWidget {
  static String routeURL = '/tutorial';
  static String routeName = 'tutorial';
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _pageController = PageController();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  void goToNextPage() {
    if (currentPage < 2) {
      setState(() {
        currentPage++;
        _tabController.animateTo(currentPage);
        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    } else {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        ),
      );
    }
  }

  void goToPreviousPage() {
    if (currentPage > 0) {
      setState(() {
        currentPage--;
        _tabController.animateTo(currentPage);
        _pageController.animateToPage(
          currentPage,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  void skipToHomeScreen() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B303A),
      appBar: null,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 30, left: 300),
            child: TextButton(
              onPressed: skipToHomeScreen,
              child: Text(
                '건너뛰기',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TabPageSelector(
              controller: _tabController,
              indicatorSize: Sizes.size16,
              color: const Color(0xffF4EEE0),
              selectedColor: const Color(0xFF6B728E),
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              child: PageView.builder(
                controller: _pageController,
                physics: const ClampingScrollPhysics(),
                itemCount: 3,
                onPageChanged: onPageChanged,
                itemBuilder: (context, index) {
                  return TutorialPage(
                    index: index,
                    screenHeight: MediaQuery.of(context).size.height,
                    screenWidth: MediaQuery.of(context).size.width,
                  );
                },
              ),
            ),
          ),
          AnimatedOpacity(
            opacity: currentPage < 2 ? 0.0 : 1.0,
            duration: const Duration(milliseconds: 500),
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: ElevatedButton(
                onPressed: goToNextPage,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0x6B728E),
                  minimumSize: const Size(350, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                child: Text(
                  '시작하기',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void onPageChanged(int index) {
    setState(() {
      currentPage = index;
    });
    _tabController.animateTo(index);
  }
}

class TutorialPage extends StatelessWidget {
  final int index;
  final double screenHeight;
  final double screenWidth;

  const TutorialPage({
    Key? key,
    required this.index,
    required this.screenHeight,
    required this.screenWidth,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          children: [
            const SizedBox(height: Sizes.size2),
            Padding(
              padding: const EdgeInsets.only(
                bottom: Sizes.size2,
                right: Sizes.size32,
                left: Sizes.size32,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: screenHeight * 0.1),
                    child: Text(
                      getPageText(index),
                      style: TextStyle(
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff6B728E),
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: Sizes.size9),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          top: screenHeight * 0.4,
          left: screenWidth * 0.25,
          child: Container(
            width: screenWidth * 0.45,
            height: screenHeight * 0.3,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(getImagePath(index) ?? ""),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String getPageText(int index) {
    switch (index) {
      case 0:
        return "평소 수면 관리, 어떻게 하시나요?";
      case 1:
        return "수면에 어려움을 겪거나, 수면을 취해도 피곤했던적이 있으신가요?";
      case 2:
        return "이젠 잘자요로 관리해요";

      default:
        return "";
    }
  }

  String? getImagePath(int index) {
    switch (index) {
      case 0:
        return "assets/images/1.png";
      case 1:
        return "assets/images/2.png";
      case 2:
        return "assets/images/3.png";

      default:
        return "";
    }
  }
}
