import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/feature/transaction/data/datasources/local/user_local_datasource.dart';
import 'package:my_money/feature/transaction/presentation/bloc/bloc_register/register_bloc.dart';
import 'package:my_money/feature/transaction/presentation/pages/home_page.dart';
import 'package:my_money/feature/transaction/presentation/pages/login_page.dart';
import 'package:my_money/feature/transaction/presentation/pages/main_bar_page.dart';
import 'package:my_money/feature/transaction/presentation/pages/register_page.dart';
import 'package:my_money/feature/transaction/presentation/pages/splash_page.dart';

class AppRouter {
  static const splash = '/splash';
  static const login = '/login';
  static const register = '/register';
  static const home = '/home';
  static const tabbar = '/tabbar';
  static final routes = <String, WidgetBuilder>{
    splash: (_) => const SplashPage(),
    tabbar: (_) => const MainBarPage(),
    login: (_) => const LoginPage(),
    register:
        (_) => BlocProvider(
          create: (_) => RegisterBloc(UserLocalDatasource()),
          child: RegisterPage(),
        ),
    home: (_) => HomePage(),
  };
}
