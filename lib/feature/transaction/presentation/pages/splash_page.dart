import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_money/config/theme.dart';
import 'package:my_money/core/router/app_router.dart';
import 'package:my_money/feature/transaction/data/datasources/local/user_local_datasource.dart';
import 'package:my_money/feature/transaction/presentation/bloc/bloc_splash/splash_bloc.dart';
import 'package:my_money/feature/transaction/presentation/bloc/bloc_splash/splash_state.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => SplashBloc(UserLocalDatasource())..add(SplashStarted()),

      child: BlocListener<SplashBloc, SplashState>(
        listener: (context, state) {
          if (state is SplashNavigateToHome) {
            Navigator.pushReplacementNamed(context, AppRouter.tabbar);
          } else if (state is SplashNavigateToLogin) {
            Navigator.pushReplacementNamed(context, AppRouter.login);
          }
        },
        child: Scaffold(
          backgroundColor: AppColors.background,
          body: Column(
            children: [
              Spacer(),
              SizedBox(
                height: 150,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 46.0,
                      backgroundColor: AppColors.border,
                    ),
                    Positioned(
                      left: 46,
                      child: Text(
                        "Easy\nExpense",
                        style: TextStyle(
                          fontSize: 46.0,
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              SvgPicture.asset(
                "assets/illustration/undraw-money.svg",
                width: 200,
                height: 200,
              ),
              Text(
                "Manage Your Expense Easily",
                style: TextStyle(fontSize: 18.0),
              ),
              const SizedBox(height: 64.0),
            ],
          ),
        ),
      ),
    );
  }
}
