import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BirthdayTextField extends StatefulWidget {
  TextEditingController birthdayController;
  String birthHintText;
  double boxWidth;
  int maxLength;
  BirthdayTextField({
    super.key,
    required this.birthdayController,
    required this.birthHintText,
    required this.boxWidth,
    required this.maxLength,
  });

  @override
  State<BirthdayTextField> createState() => _BirthdayTextFieldState();
}

class _BirthdayTextFieldState extends State<BirthdayTextField> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.boxWidth,
      height: 50,
      child: TextField(
        maxLength: widget.maxLength,
        keyboardType: TextInputType.number,
        controller: widget.birthdayController,
        decoration: InputDecoration(
          counterText: '',
          hintText: widget.birthHintText,
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0), // 모서리 둥글게 설정
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(
              color: Theme.of(context).primaryColor,
            ),
          ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 12.0,
            horizontal: 16.0,
          ), // 내부 여백 설정
        ),
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9]'))],
        cursorColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
