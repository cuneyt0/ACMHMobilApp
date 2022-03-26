import 'package:login_work/export_import.dart';

class LoginCubit extends Cubit<LoginState> with CacheManager {
  TextEditingController usernameController;
  TextEditingController passwordController;
  final GlobalKey<FormState> formKey;
  final BuildContext context;

  bool isLoginFail = false;
  bool isLoading = false;
  bool isClear = false;
  final ILoginService service;

  LoginCubit(
      {required this.formKey,
      required this.context,
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

        saveUserState(data);
      } else if (data is String) {
        emit(LoginFailState(data));

        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(data)));
        isClear = true;
        isLoginFail = true;
      } else {}
    } else {
      changeLoadingView();

      await Future.delayed(const Duration(milliseconds: 250));

      isClear = true;
      isLoginFail = true;
      emit(LoginValidateState(isLoginFail));
    }
  }

  void saveUserState(LoginResponseModel data) {
    saveLoginResponse(data);
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

class LoginFailState extends LoginState {
  final String errorText;
  LoginFailState(this.errorText);
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
