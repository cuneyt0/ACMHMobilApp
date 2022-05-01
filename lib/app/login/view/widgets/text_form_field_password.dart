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
          onPressed: () => context.read<LoginCubit>().showObsecureToggle(),
          icon: state is showObsecureToggleState
              ? (state.showObsecure
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility))
              : const Icon(Icons.visibility)),
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white),
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
