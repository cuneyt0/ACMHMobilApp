import 'package:login_work/export_import.dart';

class AnnouncementScreen extends StatefulWidget {
  final LoginResponseModel? model;
  AnnouncementScreen({this.model});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  AnnouncementViewModel? _viewModel = AnnouncementViewModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel?.getAllDepartment();
    _viewModel?.userId = widget.model?.user?.id;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(title: Text(mAddedAnnouncement)),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
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
                          child: Text("PDF YÜKLE")),
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
