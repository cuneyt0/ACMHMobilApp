import 'package:login_work/export_import.dart';

Padding textFormFieldContent(
  AnnouncementViewModel? _viewModel,
) {
  return Padding(
    padding: const EdgeInsets.only(
      left: 10,
      right: 10,
    ),
    child: TextFormField(
      controller: _viewModel?.contentController,
      validator: (value) => _viewModel?.noticeStringValidation(value),
      maxLines: 10,
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
        labelText: aContent,
        hintText: "...",
        labelStyle: TextStyle(color: Colors.black),
        hintStyle: TextStyle(color: Colors.black),
      ),
    ),
  );
}
