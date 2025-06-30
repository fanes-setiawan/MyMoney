import 'package:flutter/material.dart';
import 'package:my_money/config/theme.dart';
import 'package:my_money/core/router/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'money',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.background),
      ),
      initialRoute: AppRouter.splash,
      routes: AppRouter.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
