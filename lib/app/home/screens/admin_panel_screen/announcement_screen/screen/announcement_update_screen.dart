import '../../../../../../export_import.dart';

class AnnouncementUpdateScreen extends StatefulWidget {
  final NoticeData? data;
  final LoginResponseModel? model;
  final AnnouncementUpdateViewModel? viewModel;
  final List<DropdownMenuItem<Data>>? items;

  const AnnouncementUpdateScreen(
      {Key? key, this.data, this.model, this.viewModel, this.items})
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
    _viewModel?.id = widget.data?.id;
    _viewModel?.setBuildContext(context);
    _viewModel?.userId = widget.model?.user?.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(mUpdateTitle),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
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
                          onPressed: () => _viewModel?.uploadPdf(),
                          child: const Text(mUploadPDf)),
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
