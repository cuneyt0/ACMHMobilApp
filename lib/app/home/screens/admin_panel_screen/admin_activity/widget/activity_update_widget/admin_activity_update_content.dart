import 'package:login_work/export_import.dart';

class AdminActivityUpdateContent extends StatelessWidget {
  const AdminActivityUpdateContent({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ActivityUpdateScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: widget.viewModel?.contentController,
        maxLines: 10,
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
          labelText: aContent,
          labelStyle: TextStyle(color: Colors.black),
          hintStyle: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
