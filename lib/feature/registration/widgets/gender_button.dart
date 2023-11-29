import 'package:flutter/material.dart';
import 'package:jaljayo/constants/sizes.dart';

class GenderButton extends StatefulWidget {
  const GenderButton({
    super.key,
    required this.isDisabled,
    required this.genderText,
  });

  final bool isDisabled;
  final String genderText;

  @override
  State<GenderButton> createState() => _GenderButtonState();
}

class _GenderButtonState extends State<GenderButton> {
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: AnimatedContainer(
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size16,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Sizes.size5),
          color: widget.isDisabled
              ? Colors.grey.shade300
              : Theme.of(context).primaryColor,
        ),
        duration: const Duration(
          milliseconds: 300,
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: widget.isDisabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          duration: const Duration(
            milliseconds: 300,
          ),
          child: Text(
            widget.genderText,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
