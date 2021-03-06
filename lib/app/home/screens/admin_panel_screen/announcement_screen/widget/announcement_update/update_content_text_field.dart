import 'package:login_work/export_import.dart';

class UpdateContentTextField extends StatelessWidget {
  const UpdateContentTextField({
    Key? key,
    required this.widget,
    required AnnouncementUpdateViewModel? viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final AnnouncementUpdateScreen widget;
  final AnnouncementUpdateViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    _viewModel?.textEditingContentController.text =
        widget.data?.content ?? 'İçerik boş';
    return Padding(
      padding: const EdgeInsets.only(
        left: 10,
        right: 10,
      ),
      child: TextFormField(
        controller: _viewModel?.textEditingContentController,
        maxLines: 10,
        validator: (value) =>
            (value ?? '').length > 0 ? null : 'boş bırakılamaz',
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
