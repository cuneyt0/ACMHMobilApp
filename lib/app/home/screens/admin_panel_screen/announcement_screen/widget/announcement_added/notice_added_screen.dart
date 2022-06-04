import 'package:login_work/export_import.dart';
import 'package:login_work/core/extension/context_extension.dart';

class NoticeAddedScreen extends StatelessWidget {
  const NoticeAddedScreen({
    Key? key,
    required AnnouncementViewModel? viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final AnnouncementViewModel? _viewModel;

  @override
  Widget build(BuildContext context) => Observer(
        builder: ((context) => ElevatedButton(
              onPressed: (() async {
                if (_viewModel?.dropdownvalue?.id == null) {
                  Flushbar(
                    message: mDepartmentNotNullMessage,
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: const Duration(seconds: 1),
                    borderRadius: BorderRadius.circular(2),
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ).show(context);
                } else if (_viewModel?.dropdownvalue?.id != null &&
                    _viewModel?.formKey.currentState != null &&
                    _viewModel!.formKey.currentState!.validate()) {
                  await _viewModel?.postNotice().then(
                    (value) async {
                      if (_viewModel?.selectedDepartmentId ==
                          GetToken.deparmentId) {
                        await _viewModel?.sendNotificationMessage();

                        Flushbar(
                          message: mAdddedAAnnouncement,
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: const Duration(seconds: 1),
                          borderRadius: BorderRadius.circular(2),
                          backgroundColor: Colors.black.withOpacity(0.5),
                        ).show(context).then(
                              (value) => Navigator.of(context).pop(),
                            );
                      } else if (_viewModel?.selectedDepartmentId == 5) {
                        await _viewModel?.sendNotificationMessage();
                      }
                      Flushbar(
                        message: mAdddedAAnnouncement,
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: const Duration(seconds: 1),
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ).show(context).then(
                            (value) => Navigator.of(context).pop(),
                          );
                    },
                  );
                }
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
