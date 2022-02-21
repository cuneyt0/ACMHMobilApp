import 'package:flutter/material.dart';

import '../login/model/login_response.dart';
import 'cache_manager.dart';

class AuthenticationManager extends CacheManager {
  BuildContext context;
  AuthenticationManager({
    required this.context,
  }) {
    fetchUserLogin();
  }
  bool isLogin = false;
  User? model;

  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}

 

/*
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_work/core/cache_manager.dart';

import '../login/viewmodel/login_cubit.dart';

class AuthenticationManagerCubit extends Cubit<AuthState> with CacheManager {
  BuildContext context;

  AuthenticationManagerCubit(this.context,)
      : super(AuthInitial());


  bool isLogin = false;
  Future<void> fetchUserLogin() async {
    final token = await getToken();
    if (token != null) {
      isLogin = true;
    }
  }
}

class AuthInitial extends AuthState {
}

abstract class AuthState {}

 */