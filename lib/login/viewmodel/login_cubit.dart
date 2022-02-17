import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:login_work/login/model/login_request_model.dart';
import 'package:login_work/login/model/login_response.dart';
import 'package:login_work/login/service/ILoginService.dart';


class LoginCubit extends Cubit<LoginState>{

  TextEditingController usernameController;
  TextEditingController passwordController;
  final GlobalKey<FormState> formKey;


  bool isLoginFail = false;
  bool isLoading = false;
  final ILoginService service;

  LoginCubit(this.formKey,this.usernameController,this.passwordController,
      {required this.service}):super(LoginInitial ());

    Future<void> postUserModel()async{
    debugPrint("postUserModel Çalıştı");
    if(formKey.currentState != null && formKey.currentState!.validate()){
      debugPrint("postUserModel if blogu içine girdi");
      changeLoadingView();
     final data= await service.postUserLogin(LoginRequestModel(username: usernameController.text.trim(),password: passwordController.text.trim()));
     changeLoadingView();
     if(data is LoginResponseModel){
       emit(LoginComplete(data));
     }
      debugPrint("postUserModel if blogu içinde son");
    }else{
      debugPrint("else blogunun içinde");
      isLoginFail=true;
      emit(LoginValidateState(isLoginFail));
    }
  }

  void changeLoadingView() {
      print("changeLoadingView çalıştı");
    isLoading = !isLoading;
    emit(LoginLoadingState(isLoading));
  }

}

class LoginInitial extends LoginState {
}

abstract class LoginState {}

class  LoginValidateState extends LoginState{
  final bool isValidate;

  LoginValidateState(this.isValidate);


}
class  LoginLoadingState extends LoginState{
  final bool isLoading;

  LoginLoadingState(this.isLoading);


}
class LoginComplete extends LoginState {
  final LoginResponseModel model;

  LoginComplete(this.model);
}
