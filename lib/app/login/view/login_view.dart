import 'package:login_work/export_import.dart';

class LoginView extends StatelessWidget {
  final GlobalKey<FormState> formKey = GlobalKey();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final LoginService loginService = LoginService(
    Dio(
      BaseOptions(
        baseUrl: baseUrl,
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
                    builder: (context) => HomePage(
                      model: state.model,
                      cacheManager: state.cacheManager,
                      isClear: state.isClear,
                    ),
                  ),
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
            return buildScaffold(context, state, formKey, usernameController,
                passwordController);
          },
        ),
      ),
    );
  }
}
