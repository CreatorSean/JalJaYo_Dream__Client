import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:jaljayo/common/widgets/nav_tab.dart';

class MainNavigator extends StatefulWidget {
  final int page;
  final Function changeFunc;

  const MainNavigator({
    super.key,
    this.page = 0,
    required this.changeFunc,
  });

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xff171A21),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          NavigationTab(
            name: 'today',
            icon: FontAwesomeIcons.house,
            page: widget.page,
            selected: widget.page == 0,
            onTap: () => widget.changeFunc(0),
          ),
          NavigationTab(
            name: 'sleep',
            icon: FontAwesomeIcons.bed,
            page: widget.page,
            selected: widget.page == 1,
            onTap: () => widget.changeFunc(1),
          ),
          NavigationTab(
            name: 'sensors',
            icon: FontAwesomeIcons.signal,
            page: widget.page,
            selected: widget.page == 2,
            onTap: () => widget.changeFunc(2),
          ),
        ],
      ),
    );
  }
}
