import 'package:login_work/core/extension/context_extension.dart';
import '../../../../export_import.dart';

Widget buildElevatedButton(BuildContext context) {
  return BlocConsumer<LoginCubit, LoginState>(
    listener: (context, state) {},
    builder: (context, state) {
      if (state is LoginLoadingState) {
        return const CircularProgressIndicator();
      }
      return ElevatedButton(
          onPressed: () {
            context.read<LoginCubit>().postUserModel();
          },
          child: const Text(
            buttonText,
            style: TextStyle(
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
