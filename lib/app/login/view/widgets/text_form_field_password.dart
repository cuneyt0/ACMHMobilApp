import '../../../../export_import.dart';

TextFormField buildTextFormFieldPassword(BuildContext context, LoginState state,
    TextEditingController passwordController) {
  return TextFormField(
    controller: passwordController,
    obscureText: state is showObsecureToggleState
        ? (state.showObsecure ? true : false)
        : false,
    keyboardType: TextInputType.number,
    style: const TextStyle(color: Colors.white),
    validator: (value) => (value ?? '').length > 2 ? null : '2 ten küçük',
    decoration: InputDecoration(
      suffixIcon: IconButton(
          onPressed: () {
            context.read<LoginCubit>().showObsecureToggle();
            print("tıklanıldı");
          },
          icon: state is showObsecureToggleState
              ? (state.showObsecure
                  ? Icon(Icons.visibility_off)
                  : Icon(Icons.visibility))
              : Icon(Icons.visibility)),
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
