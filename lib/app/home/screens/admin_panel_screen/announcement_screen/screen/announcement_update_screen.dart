import '../../../../../../export_import.dart';

class AnnouncementUpdateScreen extends StatefulWidget {
  final NoticeData? data;
  final LoginResponseModel? model;
  final AnnouncementUpdateViewModel? viewModel;
  final List<DropdownMenuItem<Data>>? items;

  const AnnouncementUpdateScreen(
      {Key? key,
      this.data,
      this.model,
      this.viewModel,
      this.items})
      : super(key: key);

  @override
  State<AnnouncementUpdateScreen> createState() =>
      _AnnouncementUpdateScreenState();
}

class _AnnouncementUpdateScreenState extends State<AnnouncementUpdateScreen> {
  AnnouncementUpdateViewModel? _viewModel;

  @override
  void initState() {
    _viewModel = widget.viewModel;
    super.initState();
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
                      UpdateDropdown(widget, widget.items, _viewModel),
                      ElevatedButton(
                          onPressed: () {
                            print("tıkla");
                            _viewModel?.uploadPdf();
                          },
                          child: Text("Pdf yükle yükle")),
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
