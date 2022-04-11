import 'package:login_work/export_import.dart';

Padding textFormFieldTitle(
  AnnouncementViewModel? _viewModel,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 40.0, left: 10, right: 10),
    child: TextFormField(
      controller: _viewModel?.titleController,
      validator: (value) => _viewModel?.noticeStringValidation(value),
      decoration: InputDecoration(
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
    ),
  );
}
