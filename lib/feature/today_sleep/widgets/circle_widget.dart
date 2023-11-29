import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CirCleWidget extends ConsumerStatefulWidget {
  final String mainText;
  final Color mainTextColor;
  final double mainTextSize;
  final Color mainCircleColor;
  final double mainCircleSize;

  const CirCleWidget({
    super.key,
    required this.mainText,
    required this.mainCircleColor,
    required this.mainTextColor,
    required this.mainCircleSize,
    required this.mainTextSize,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CirCleWidgetState();
}

class _CirCleWidgetState extends ConsumerState<CirCleWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CircleAvatar(
          radius: widget.mainCircleSize,
          backgroundColor: widget.mainCircleColor,
        ),
        Column(
          children: [
            Text(
              widget.mainText,
              style: TextStyle(
                color: widget.mainTextColor,
                fontSize: widget.mainTextSize,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        )
      ],
    );
  }
}
