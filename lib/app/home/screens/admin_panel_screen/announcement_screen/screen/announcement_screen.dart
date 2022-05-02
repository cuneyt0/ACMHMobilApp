import 'package:login_work/export_import.dart';

class AnnouncementScreen extends StatefulWidget {
  final LoginResponseModel? model;
  // ignore: use_key_in_widget_constructors
  const AnnouncementScreen({this.model});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  final AnnouncementViewModel? _viewModel = AnnouncementViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel?.getAllDepartment();
    _viewModel?.userId = widget.model?.user?.id;
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(title: const Text(mAddedAnnouncement)),
          bottomNavigationBar: NoticeAddedScreen(viewModel: _viewModel),
          body: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              children: [
                Form(
                    key: _viewModel?.formKey,
                    child: Column(
                      children: [
                        textFormFieldTitle(_viewModel),
                        textFormFieldContent(_viewModel),
                        noticeDepartmentRow(_viewModel),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 50.0, left: 10, right: 10),
                          child: ElevatedButton(
                            onPressed: () => _viewModel
                                ?.uploadPdf()
                                .then((value) => Flushbar(
                                      message:
                                          '${_viewModel?.file?.name} Secildi',
                                      flushbarPosition: FlushbarPosition.TOP,
                                      duration: const Duration(seconds: 1),
                                      borderRadius: BorderRadius.circular(2),
                                      backgroundColor:
                                          Colors.black.withOpacity(0.5),
                                    ).show(context)),
                            child: const Text(mUploadPDf),
                            style: ButtonStyle(
                              maximumSize: MaterialStateProperty.all<Size>(
                                Size(context.width * 1, context.highValue),
                              ),
                              minimumSize: MaterialStateProperty.all<Size>(
                                Size(context.width * 1, context.mediumValue),
                              ),
                            ),
                          ),
                        ),
                        ImageAddedScreen(viewModel: _viewModel),
                      ],
                    ))
              ],
            ),
          ),
        ),
      );
}
