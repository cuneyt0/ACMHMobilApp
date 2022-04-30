import 'package:login_work/export_import.dart';

class UpdateTitleTextField extends StatelessWidget {
  const UpdateTitleTextField({
    Key? key,
    required this.widget,
    required AnnouncementUpdateViewModel? viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final AnnouncementUpdateScreen widget;
  final AnnouncementUpdateViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel?.textEditingTitleController.text =
        widget.data?.title ?? ' Title boş';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: _viewModel?.textEditingTitleController,
       
        validator: (value) =>
            (value ?? '').length > 0 ? null : 'boş bırakılamaz',
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
}
