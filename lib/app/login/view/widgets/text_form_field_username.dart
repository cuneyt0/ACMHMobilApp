import '../../../../export_import.dart';

TextFormField buildTextFormFieldUsername(
    TextEditingController usernameController) {
  return TextFormField(
    keyboardType: TextInputType.number,
    style: const TextStyle(color: Colors.white),
    controller: usernameController,
    validator: (value) => (value ?? '').length > 2 ? null : '11 ten kucuk',
    decoration: const InputDecoration(
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
