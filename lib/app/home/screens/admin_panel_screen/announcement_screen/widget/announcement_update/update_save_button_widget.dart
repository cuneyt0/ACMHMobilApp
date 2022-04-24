import 'package:login_work/export_import.dart';

class UpdateSaveButtonWidget extends StatelessWidget {
  const UpdateSaveButtonWidget(
      {Key? key,
      required AnnouncementUpdateViewModel? viewModel,
      required this.widget,
   })
      : _viewModel = viewModel,
        super(key: key);

  final AnnouncementUpdateViewModel? _viewModel;
  final AnnouncementUpdateScreen widget;
 
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: ((context) => Padding(
            padding: const EdgeInsets.only(
                top: 40.0, bottom: 20.0, left: 5, right: 5),
            child: ElevatedButton(
                onPressed: (() async {
                  /* if (_viewModel?.addedPhoto == null) {
                    Flushbar(
                      message: 'Resim seçilmeden güncelleyemezsiniz',
                      flushbarPosition: FlushbarPosition.TOP,
                      duration: Duration(seconds: 1),
                      borderRadius: BorderRadius.circular(2),
                      backgroundColor: Colors.black.withOpacity(0.5),
                    ).show(context);
                  } else {*/
                  await _viewModel?.updateNotice().then(
                        (value) => Flushbar(
                          message: 'Duyuru Güncellendi',
                          flushbarPosition: FlushbarPosition.TOP,
                          duration: Duration(seconds: 1),
                          borderRadius: BorderRadius.circular(2),
                          backgroundColor: Colors.black.withOpacity(0.5),
                        ).show(context).then((value) {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => AdminPanelScreen(
                                model: widget.model,
                              ),
                            ),
                          );
                        }),
                      );
                } /*}*/),
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
/*
if (_viewModel?.title == null &&
                      _viewModel?.content == null) {
                    _viewModel?.photo = widget.data?.imagePath;
                    _viewModel?.title = widget.data?.title;
                    _viewModel?.content = widget.data?.content;

                    print("--------------------------");
                    print(_viewModel?.selectedDepartmentId);
                    if (_viewModel?.addedPhoto == null) {
                      Flushbar(
                        message: 'Resim seçilmeden güncelleyemezsiniz',
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 1),
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ).show(context);
                    } else {
                      await _viewModel?.updateNotice().then(
                            (value) => Flushbar(
                              message: 'Duyuru Güncellendi',
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: Duration(seconds: 1),
                              borderRadius: BorderRadius.circular(2),
                              backgroundColor: Colors.black.withOpacity(0.5),
                            ).show(context).then((value) {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AllAnnouncementScreen(
                                    model: widget.model,
                                  ),
                                ),
                              );
                            }),
                          );
                    }
                  } else if (_viewModel?.content == null) {
                    _viewModel?.content = widget.data?.content;
                    print("--------------------------");
                    print(_viewModel?.selectedDepartmentId);
                    if (_viewModel?.addedPhoto == null) {
                      Flushbar(
                        message: 'Resim seçilmeden güncelleyemezsiniz',
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 1),
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ).show(context);
                    } else {
                      await _viewModel?.updateNotice().then(
                            (value) => Flushbar(
                              message: 'Duyuru Güncellendi',
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: Duration(seconds: 1),
                              borderRadius: BorderRadius.circular(2),
                              backgroundColor: Colors.black.withOpacity(0.5),
                            ).show(context).then((value) {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AllAnnouncementScreen(
                                    model: widget.model,
                                  ),
                                ),
                              );
                            }),
                          );
                    }
                  } else if (_viewModel?.title == null) {
                    _viewModel?.title = widget.data?.title;

                    if (_viewModel?.addedPhoto == null) {
                      Flushbar(
                        message: 'Resim seçilmeden güncelleyemezsiniz',
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 1),
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ).show(context);
                    } else {
                      await _viewModel?.updateNotice().then(
                            (value) => Flushbar(
                              message: 'Duyuru Güncellendi',
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: Duration(seconds: 1),
                              borderRadius: BorderRadius.circular(2),
                              backgroundColor: Colors.black.withOpacity(0.5),
                            ).show(context).then((value) {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AllAnnouncementScreen(
                                    model: widget.model,
                                  ),
                                ),
                              );
                            }),
                          );
                    }
                  } else if (_viewModel?.selectedDepartmentId == null) {
                    _viewModel?.selectedDepartmentId =
                        widget.data?.departmentId;

                    if (_viewModel?.addedPhoto == null) {
                      Flushbar(
                        message: 'Resim seçilmeden güncelleyemezsiniz',
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 1),
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ).show(context);
                    } else {
                      await _viewModel?.updateNotice().then(
                            (value) => Flushbar(
                              message: 'Duyuru Güncellendi',
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: Duration(seconds: 1),
                              borderRadius: BorderRadius.circular(2),
                              backgroundColor: Colors.black.withOpacity(0.5),
                            ).show(context).then((value) {
                              Navigator.of(context).pop();
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => AllAnnouncementScreen(
                                    model: widget.model,
                                  ),
                                ),
                              );
                            }),
                          );
                    }
                  } else {
                    _viewModel?.updateNotice().then(
                          (value) => Flushbar(
                            message: 'Duyuru Güncellendi',
                            flushbarPosition: FlushbarPosition.TOP,
                            duration: Duration(seconds: 1),
                            borderRadius: BorderRadius.circular(2),
                            backgroundColor: Colors.black.withOpacity(0.5),
                          ).show(context).then((value) {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AllAnnouncementScreen(
                                  model: widget.model,
                                ),
                              ),
                            );
                          }),
                        );
                  }

 */