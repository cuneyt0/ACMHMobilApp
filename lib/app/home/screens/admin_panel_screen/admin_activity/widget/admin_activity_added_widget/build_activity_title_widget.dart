import 'package:login_work/export_import.dart';

class BuildActivityTitleWidget extends StatelessWidget {
  const BuildActivityTitleWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ActivityAddViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 40.0, left: 10, right: 10, bottom: 40),
      child: TextFormField(
        controller: viewModel?.titleController,
        validator: (value) => viewModel?.noticeStringValidation(value),
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
      ),
    );
  }
}
