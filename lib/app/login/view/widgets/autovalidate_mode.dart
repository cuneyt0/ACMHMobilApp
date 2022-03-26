import '../../../../export_import.dart';

AutovalidateMode autovalidateMode(LoginState state) => state
        is LoginValidateState
    ? (state.isValidate ? AutovalidateMode.always : AutovalidateMode.disabled)
    : AutovalidateMode.disabled;
