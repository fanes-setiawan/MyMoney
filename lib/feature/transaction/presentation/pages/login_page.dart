import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:my_money/config/theme.dart';
import 'package:my_money/core/router/app_router.dart';
import 'package:my_money/feature/transaction/presentation/widgets/button_field_widget.dart';
import 'package:my_money/feature/transaction/presentation/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 36.0,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Login to your account",
                        style: TextStyle(
                          fontSize: 16.0,
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            TextFieldWidget(
              hintText: "Email",
              pathIcon: "assets/icons/email-at.svg",
            ),
            TextFieldWidget(
              hintText: "Password",
              pathIcon: "assets/icons/password-str.svg",
            ),
            const SizedBox(height: 40.0),
            ButtonFieldWidget(text: "Login", onPressed: () {}),
            const SizedBox(height: 46.0),
            Text.rich(
              TextSpan(
                text: "Don't have an account?",
                style: TextStyle(color: AppColors.textPrimary, fontSize: 14.0),
                children: [
                  TextSpan(
                    text: "Sign-Up",
                    style: TextStyle(
                      color: AppColors.textPrimary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = () =>Navigator.pushNamed(context, AppRouter.register),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
