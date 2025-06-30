import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_money/config/theme.dart';

class TextFieldWidget extends StatelessWidget {
  final String pathIcon;
  final String hintText;
  final void Function(String)? onFieldSubmitted;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  const TextFieldWidget({
    super.key,
    required this.hintText,
    this.onFieldSubmitted,
    required this.pathIcon,
    this.controller,
    this.validator
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: AppColors.cardBackground,
          borderRadius: const BorderRadius.all(Radius.circular(12.0)),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: SvgPicture.asset(pathIcon,color: AppColors.primary,)
            ),
            Expanded(
              child: TextFormField(
                initialValue: null,
                controller: controller,
                decoration: InputDecoration.collapsed(
                  filled: true,
                  fillColor: AppColors.noColor,
                  hoverColor: AppColors.noColor,
                  hintText: hintText,
                  hintStyle: TextStyle(
                    color: AppColors.primary,
                    fontSize: 18.0
                  )
                ),
                onFieldSubmitted: onFieldSubmitted,
                validator: validator,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
