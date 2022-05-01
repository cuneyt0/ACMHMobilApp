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
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: const Text(mAddedAnnouncement)),
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
                      ElevatedButton(
                          onPressed: () {
                            _viewModel?.uploadPdf();
                          },
                          child: const Text("PDF YÜKLE")),
                      ImageAddedScreen(viewModel: _viewModel),
                      NoticeAddedScreen(viewModel: _viewModel),
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
