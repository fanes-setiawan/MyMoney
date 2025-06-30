import 'package:flutter/material.dart';
import 'package:my_money/config/theme.dart';

class ButtonFieldWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonFieldWidget({super.key, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48.0,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
        onPressed: onPressed,
        child: Expanded(
          child: Center(
            child: Text(
              text,
              style: TextStyle(color: AppColors.inputFill, fontSize: 18.0),
            ),
          ),
        ),
      ),
    );
  }
}
