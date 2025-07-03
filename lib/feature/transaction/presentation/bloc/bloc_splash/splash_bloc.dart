

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_money/feature/transaction/data/datasources/local/user_local_datasource.dart';
import 'package:my_money/feature/transaction/presentation/bloc/bloc_splash/splash_state.dart';

part 'splash_event.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  final UserLocalDatasource localDatasource;
  SplashBloc(this.localDatasource) : super(SplashInitial()) {
    on<SplashStarted>((event, emit) async {
      await Future.delayed(Duration(seconds: 3));
      final loggedIn = await localDatasource.isLoggedIn();
      if(loggedIn){
        emit(SplashNavigateToHome());
      }else{
        emit(SplashNavigateToLogin());
      }
    });
  }
}
