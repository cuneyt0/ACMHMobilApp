import '../../../../../../export_import.dart';

class AnnouncementUpdateScreen extends StatefulWidget {
  final NoticeData? data;
  final LoginResponseModel? model;
  const AnnouncementUpdateScreen({Key? key, this.data, this.model})
      : super(key: key);

  @override
  State<AnnouncementUpdateScreen> createState() =>
      _AnnouncementUpdateScreenState();
}

class _AnnouncementUpdateScreenState extends State<AnnouncementUpdateScreen> {
  AnnouncementUpdateViewModel? _viewModel = AnnouncementUpdateViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel?.getAllDepartment();
    _viewModel?.id = widget.data?.id;
    _viewModel?.setBuildContext(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Duyuru Güncelle'),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Observer(
            builder: ((context) => Form(
                  key: _viewModel?.formKey,
                  child: Column(
                    children: [
                      UpdateTitleTextField(
                          widget: widget, viewModel: _viewModel),
                      UpdateContentTextField(
                          widget: widget, viewModel: _viewModel),
                      UpdateDropdown(widget, _viewModel),
                      UpdateImageWidget(viewModel: _viewModel, widget: widget),
                      UpdateSaveButtonWidget(
                        viewModel: _viewModel,
                        widget: widget,
                      ),
                    ],
                  ),
                )),
          ),
        ));
  }
}
