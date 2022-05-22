import 'package:login_work/export_import.dart';

class CafeteriaTitleFormWidget extends StatelessWidget {
  const CafeteriaTitleFormWidget({
    Key? key,
    required AdminCafeteriaAddViewModel? viewModel,
  }) : _viewModel = viewModel, super(key: key);

  final AdminCafeteriaAddViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: _viewModel?.titleController,
      validator: (value) =>
          _viewModel?.noticeStringValidation(value),
      decoration: const InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
        ),
        labelText: aTitle,
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black),
      ),
    );
  }
}
