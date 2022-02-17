import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_work/login/service/login_service.dart';
import 'package:login_work/login/view/login_detail_view.dart';
import 'package:login_work/login/viewmodel/login_cubit.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final String baseUrl="https://localhost:44346/api/auth";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginCubit(
              formKey,
              usernameController,
              passwordController,
              service: LoginService(
                Dio(
                  BaseOptions(baseUrl: baseUrl),
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
                  context.read<LoginCubit>().postUserModel();
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
