import 'package:flutter/material.dart';

import '../../../constants/sizes.dart';

class FormButton extends StatelessWidget {
  const FormButton({
    super.key,
    required this.isDisabled,
  });

  final bool isDisabled;

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
          color: isDisabled ? Colors.grey.shade300 : const Color(0xff171A21),
        ),
        duration: const Duration(
          milliseconds: 300,
        ),
        child: AnimatedDefaultTextStyle(
          style: TextStyle(
            color: isDisabled ? Colors.grey.shade400 : Colors.white,
            fontWeight: FontWeight.w600,
          ),
          duration: const Duration(
            milliseconds: 300,
          ),
          child: Text(
            '다음',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isDisabled
                  ? const Color(0xff171a21)
                  : const Color(0xfff4eee0),
            ),
          ),
        ),
      ),
    );
  }
}
