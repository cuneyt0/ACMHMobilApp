import '../../../../export_import.dart';

TextFormField buildTextFormFieldPassword(
    LoginState state, TextEditingController passwordController) {
  return TextFormField(
    controller: passwordController,
    keyboardType: TextInputType.number,
    style: const TextStyle(color: Colors.white),
    validator: (value) => (value ?? '').length > 2 ? null : '2 ten küçük',
    decoration: const InputDecoration(
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
