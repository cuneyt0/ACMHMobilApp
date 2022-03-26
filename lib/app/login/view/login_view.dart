import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_work/app/login/login_sources.dart';
import 'package:login_work/app/login/service/login_service.dart';
import 'package:login_work/app/login/view/login_detail_view.dart';
import 'package:login_work/app/login/viewmodel/login_cubit.dart';
import 'package:login_work/core/extension/context_extension.dart';

class LoginView extends StatelessWidget with LoginResources {
  final GlobalKey<FormState> formKey = GlobalKey();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final LoginService loginService = LoginService(
    Dio(
      BaseOptions(
        baseUrl: "https://192.168.1.102:5001/api/auth",
      ),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
          create: (context) => LoginCubit(
              context: context,
              formKey: formKey,
              usernameController: usernameController,
              passwordController: passwordController,
              service: loginService),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginComplete) {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => LoginDetailView(
                              model: state.model,
                              cacheManager: state.cacheManager,
                              isClear: state.isClear,
                            )),
                    (Route<dynamic> route) => false);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      welcome +
                          " " +
                          state.model.user!.firstName.toString() +
                          " " +
                          state.model.user!.lastName.toString(),
                    ),
                  ),
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

        ///  resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white, //Color(0xFF18FFFF),
        body: Column(
          children: [
            const Expanded(
              child: Center(
                child: CircleAvatar(
                  backgroundImage: AssetImage("assets/logo/neu_logo.jpg"),
                  maxRadius: 80,
                  minRadius: 50,
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
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
                      Expanded(
                        flex: 1,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 30, right: 20),
                            child: Text(
                              title,
                              style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0, bottom: 30),
                              child: buildTextFormFieldUsername(),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  left: 30.0, right: 30.0, bottom: 40),
                              child: buildTextFormFieldPassword(state),
                            ),
                            buildElevatedButton(context),
                          ],
                        ),
                      ),
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
        if (state is LoginLoadingState) {
          return const CircularProgressIndicator();
        }
        return ElevatedButton(
            onPressed: () => context.read<LoginCubit>().postUserModel(),
            child: Text(
              buttonText,
              style: const TextStyle(
                  color: Color(0xFF01579B),
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              maximumSize: MaterialStateProperty.all<Size>(
                Size(context.width * 0.9, context.highValue),
              ),
              minimumSize: MaterialStateProperty.all<Size>(
                Size(context.width * 0.45, context.mediumValue),
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  side: const BorderSide(color: Colors.white),
                ),
              ),
            ));
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
      style: const TextStyle(color: Colors.white),
      validator: (value) => (value ?? '').length > 2 ? null : '2 ten küçük',
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: passwordlhinttext,
        labelText: passwordlabeltext,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }

  TextFormField buildTextFormFieldUsername() {
    return TextFormField(
      keyboardType: TextInputType.number,
      style: const TextStyle(color: Colors.white),
      controller: usernameController,
      validator: (value) => (value ?? '').length > 10 ? null : '11 ten kucuk',
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        hintText: usernamelhinttext,
        labelText: usernamelabeltext,
        labelStyle: const TextStyle(color: Colors.white),
        hintStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
