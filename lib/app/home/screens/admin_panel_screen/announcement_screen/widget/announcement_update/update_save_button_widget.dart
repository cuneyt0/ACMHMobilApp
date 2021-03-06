import 'package:login_work/export_import.dart';
import 'package:login_work/core/extension/context_extension.dart';

class UpdateSaveButtonWidget extends StatelessWidget {
  const UpdateSaveButtonWidget({
    Key? key,
    required AnnouncementUpdateViewModel? viewModel,
    required this.widget,
  })  : _viewModel = viewModel,
        super(key: key);

  final AnnouncementUpdateViewModel? _viewModel;
  final AnnouncementUpdateScreen widget;

  @override
  Widget build(BuildContext context) {
    final AdminPanelViewModel? adminPanelViewModel = AdminPanelViewModel();
    return Observer(
      builder: ((context) => ElevatedButton(
            onPressed: (() async {
              await _viewModel?.updateNotice().then(
                    (value) => Flushbar(
                      message: mUpdatedAAnnouncement,
                      flushbarPosition: FlushbarPosition.TOP,
                      duration: const Duration(seconds: 1),
                      borderRadius: BorderRadius.circular(2),
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ).show(context).then((value) {
                      Navigator.of(context).pop();
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => AdminPanelScreen(
                            model: widget.model,
                            viewModel: adminPanelViewModel,
                          ),
                        ),
                      );
                    }),
                  );
            }),
            child: const Text(mSaveBttn),
            style: ButtonStyle(
              maximumSize: MaterialStateProperty.all<Size>(
                Size(context.width * 1, context.highValue),
              ),
              minimumSize: MaterialStateProperty.all<Size>(
                Size(context.width * 1, context.mediumValue),
              ),
            ),
          )),
    );
  }
}
