import 'package:login_work/export_import.dart';

class AdminActivityUpdateTitle extends StatelessWidget {
  const AdminActivityUpdateTitle({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ActivityUpdateScreen widget;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.viewModel?.titleController,
      validator: (value) => widget.viewModel?.noticeStringValidation(value),
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
