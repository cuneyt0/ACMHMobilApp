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



/*
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_work/login/login_sources.dart';
import 'package:login_work/login/service/login_service.dart';
import 'package:login_work/login/view/login_detail_view.dart';
import 'package:login_work/login/viewmodel/login_cubit.dart';

class LoginView extends StatelessWidget with LoginResources {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final String baseUrl = "https://192.168.1.103:5001/api/auth";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
          create: (context) => LoginCubit(
                formKey: formKey,
                usernameController: usernameController,
                passwordController: passwordController,
                service: LoginService(
                  Dio(
                    BaseOptions(
                      baseUrl: baseUrl,
                    ),
                  ),
                ),
              ),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginComplete) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                      builder: (context) => LoginDetialView(
                            model: state.model,
                            cacheManager: state.cacheManager,
                            isClear: state.isClear,
                          )),
                );
              }
            },
            builder: (context, state) {
              return buildScaffold(context, state);
            },
          )),
    );
  }

  Scaffold buildScaffold(BuildContext context, LoginState state) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white, //Color(0xFF18FFFF),
      body: SingleChildScrollView(
        reverse: true,
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            CircleAvatar(
              backgroundImage: AssetImage("assets/logo/neu_logo.jpg"),
              maxRadius: 90,
              minRadius: 50,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFF01579B),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                  ),
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode(state),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Flexible(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 20),
                            child: Text(
                              title,
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                          ),
                          child: buildTextFormFieldUsername(),
                        ),
                      ),
                      Flexible(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(
                            left: 30.0,
                            right: 30.0,
                          ),
                          child: buildTextFormFieldPassword(state),
                        ),
                      ),
                      Flexible(child: buildElevatedButton(context)),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom)),
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
        return Padding(
          padding: const EdgeInsets.only(left: 100.0, right: 100.0),
          child: ElevatedButton(
            onPressed: context.watch<LoginCubit>().isLoading
                ? null
                : () {
                    context.read<LoginCubit>().postUserModel();
                  },
            child: Text(
              buttonText,
              style: TextStyle(
                  color: Color(0xFF01579B),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.white,
            ),
          ),
        );
      },
    );
  }

  AutovalidateMode autovalidateMode(LoginState state) => state
          is LoginValidateState
      ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
      : AutovalidateMode.disabled;

  TextFormField buildTextFormFieldPassword(LoginState state) {
    return TextFormField(
      controller: passwordController,
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      validator: (value) => (value ?? '').length > 2 ? null : '2 ten kucuk',
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: passwordlhinttext,
        labelText: passwordlabeltext,
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  TextFormField buildTextFormFieldUsername() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.white),
      controller: usernameController,
      validator: (value) => (value ?? '').length > 10 ? null : '11 ten kucuk',
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: usernamelhinttext,
        labelText: usernamelabeltext,
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }
}



 */