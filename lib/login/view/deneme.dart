/*
* import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_work/login/service/login_service.dart';
import 'package:login_work/login/view/login_detail_view.dart';
import 'package:login_work/login/viewmodel/login_cubit.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String baseUrl="https://10.0.2.2:44346/api/auth";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(
              formKey,
              usernameController,
              passwordController,
              service: LoginService(
                Dio(
                  BaseOptions(baseUrl: baseUrl,contentType: Headers.jsonContentType, ),

                ),
              ),
            ),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginComplete) {
              print("${state.model.token}");
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LoginDetialView(
                    model: state.model,
                  ),
                ),
              );
            }
          },
          builder: (context, state) {
            return buildScaffold(context, state);
          },
        ));
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Login Page"),
        leading: Visibility(
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
          visible: context.watch<LoginCubit>().isLoading,
        ),
      ),
      body: Form(
        key: formKey,
        autovalidateMode: autovalidateMode(state),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTextFormFieldUsername(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: buildTextFormFieldPassword(),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            buildElevatedButton(context),
          ],
        ),
      ),
    );
  }

  Widget buildElevatedButton(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoginComplete) {
          return Card(
            child: Icon(Icons.check),
          );
        }
        return ElevatedButton(
          onPressed: context.watch<LoginCubit>().isLoading
              ? null
              : () {
                  //context.read<LoginCubit>().postUserModel();

                },
          child: Text('Save'),
        );
      },
    );
  }

  AutovalidateMode autovalidateMode(LoginState state) => state
          is LoginValidateState
      ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
      : AutovalidateMode.disabled;

  TextFormField buildTextFormFieldPassword() {
    return TextFormField(
      controller: passwordController,
      validator: (value) => (value ?? '').length > 2 ? null : '2 ten kucuk',
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: "Password"),
    );
  }

  TextFormField buildTextFormFieldUsername() {
    return TextFormField(
      controller: usernameController,
      validator: (value) => (value ?? '').length > 5 ? null : '5 ten kucuk',
      decoration: const InputDecoration(
          border: OutlineInputBorder(), labelText: "Username"),
    );
  }
}

*/

/*
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
  final ILoginService service;

  LoginCubit(this.formKey, this.usernameController, this.passwordController,
      {required this.service})
      : super(LoginInitial());

  Future<void> postUserModel() async {
    if (formKey.currentState != null && formKey.currentState!.validate()) {
      changeLoadingView();

      final data = await service.postUserLogin(LoginRequestModel(
          username: usernameController.text,
          password: passwordController.text));

      changeLoadingView();

      if (data is LoginResponseModel) {
        emit(LoginComplete(data));
        saveToken(data.token ?? "");
        saveExpiration(data.expiration!);
        saveUser(data.user!);
       
      }
    } else {
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

  LoginComplete(this.model);
}



 */