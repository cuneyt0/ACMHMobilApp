import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:login_work/core/cache_manager.dart';
import 'package:login_work/login/model/login_request_model.dart';
import 'package:login_work/login/model/login_response.dart';
import 'package:login_work/login/service/ILoginService.dart';

class LoginCubit extends Cubit<LoginState> with CacheManager {
  TextEditingController usernameController;
  TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  bool isLoginFail = false;
  bool isLoading = false;
  bool isClear = false;
  final ILoginService service;

  LoginCubit(
      {required this.formKey,
      required this.usernameController,
      required this.passwordController,
      required this.service})
      : super(LoginInitial());

  Future<void> postUserModel() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();

      final data = await service.postUserLogin(LoginRequestModel(
          username: usernameController.text,
          password: passwordController.text));

      changeLoadingView();

      if (data is LoginResponseModel) {
        emit(LoginComplete(data, CacheManager(), isClear));
        saveToken(data.token ?? "");
        saveExpiration(data.expiration!);
        saveUser(data.user!);
      }
    } else {
      isClear = true;
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail));
    }
  }

  void changeLoadingView() {
    isLoading = !isLoading;
    emit(LoginLoadingState(isLoading));
  }
}

class LoginInitial extends LoginState {}

abstract class LoginState {}

class LoginValidateState extends LoginState {
  final bool isValidate;

  LoginValidateState(this.isValidate);
}

class LoginLoadingState extends LoginState {
  final bool isLoading;

  LoginLoadingState(this.isLoading);
}

class LoginComplete extends LoginState {
  final LoginResponseModel model;
  final CacheManager cacheManager;
  final bool isClear;

  LoginComplete(this.model, this.cacheManager, this.isClear);
}

class RemoveCacheData extends LoginState {
  final bool isClear;

  RemoveCacheData(this.isClear);
}
