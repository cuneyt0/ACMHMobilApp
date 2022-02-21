import 'dart:ffi';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_work/login/service/login_service.dart';
import 'package:login_work/login/view/login_detail_view.dart';
import 'package:login_work/login/viewmodel/login_cubit.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final String baseUrl = "https://192.168.1.103:5001/api/auth";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(
              formKey,
              usernameController,
              passwordController,
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
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.black12, //Color(0xFF18FFFF),
        body: Column(
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      " Logo Gelecek",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(75.0),
                  ),
                ),
                child: Form(
                  key: formKey,
                  autovalidateMode: autovalidateMode(state),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: Text(
                          "Giriş Yap",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                        ),
                        child: buildTextFormFieldUsername(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 30.0,
                          right: 30.0,
                        ),
                        child: buildTextFormFieldPassword(),
                      ),
                      buildElevatedButton(context),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
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
                    print("Detay Sayfasına gidicek");
                  },
            child: Text('Giriş Yap'),
            style: ElevatedButton.styleFrom(
                primary: Colors.black,
                textStyle: const TextStyle(fontSize: 25)),
          ),
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
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.black),
      validator: (value) => (value ?? '').length > 2 ? null : '2 ten kucuk',
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }

  TextFormField buildTextFormFieldUsername() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: TextStyle(color: Colors.black),
      controller: usernameController,
      validator: (value) => (value ?? '').length > 5 ? null : '5 ten kucuk',
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        hintText: "Username",
        hintStyle: TextStyle(color: Colors.grey),
      ),
    );
  }
}
