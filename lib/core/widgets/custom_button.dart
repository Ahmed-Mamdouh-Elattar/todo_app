import 'package:flutter/material.dart';
import 'package:todo_app/core/config/app_color.dart';
import 'package:todo_app/core/config/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text, this.onPressed, super.key});
  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColor.primary,
        minimumSize: const Size.fromHeight(60),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.bold18.copyWith(color: Colors.white),
      ),
    );
  }
}
