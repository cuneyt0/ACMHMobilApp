import 'package:another_flushbar/flushbar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/viewmodel/announcement_view_model.dart';
import 'package:login_work/export_import.dart';

class NoticeAddedScreen extends StatelessWidget {
  const NoticeAddedScreen({
    Key? key,
    required AnnouncementViewModel? viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final AnnouncementViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: ((context) => Padding(
            padding: const EdgeInsets.only(
                top: 40.0, bottom: 20.0, left: 5, right: 5),
            child: ElevatedButton(
                onPressed: (() async {
                  if (_viewModel?.dropdownvalue?.id == null) {
                    Flushbar(
                      message: 'Bölüm boş geçilemez',
                      flushbarPosition: FlushbarPosition.TOP,
                      duration: Duration(seconds: 1),
                      borderRadius: BorderRadius.circular(2),
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ).show(context);
                  } else if (_viewModel?.dropdownvalue?.id != null &&
                      _viewModel?.formKey.currentState != null &&
                      _viewModel!.formKey.currentState!.validate()) {
                    await _viewModel?.postNotice().then((value) => Flushbar(
                          message: 'Duyuru Eklendi',
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: Duration(seconds: 1),
                          borderRadius: BorderRadius.circular(2),
                          backgroundColor: Colors.black.withOpacity(0.5),
                        )
                            .show(context)
                            .then((value) => Navigator.of(context).pop()));
                  }
                }),
                child: Text("Kaydet"),
                style: ButtonStyle(
                  maximumSize: MaterialStateProperty.all<Size>(
                    Size(context.width * 1, context.highValue),
                  ),
                  minimumSize: MaterialStateProperty.all<Size>(
                    Size(context.width * 1, context.mediumValue),
                  ),
                )),
          )),
    );
  }
}
