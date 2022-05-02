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
        bottomNavigationBar: UpdateSaveButtonWidget(
          viewModel: _viewModel,
          widget: widget,
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Observer(
            builder: ((context) => Expanded(
                  child: Form(
                    key: _viewModel?.formKey,
                    child: Column(
                      children: [
                        UpdateTitleTextField(
                            widget: widget, viewModel: _viewModel),
                        UpdateContentTextField(
                            widget: widget, viewModel: _viewModel),
                        UpdateDropdown(widget, widget.items, _viewModel),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 30.0, left: 10, right: 10),
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
                        UpdateImageWidget(
                            viewModel: _viewModel, widget: widget),
                      ],
                    ),
                  ),
                )),
          ),
        ));
  }
}

/*



: SingleChildScrollView(
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
                      Padding(
                        padding:
                            const EdgeInsets.only(top: 20.0, left: 5, right: 5),
                        child: ElevatedButton(
                          onPressed: () =>
                              _viewModel?.uploadPdf().then((value) => Flushbar(
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
                      UpdateImageWidget(viewModel: _viewModel, widget: widget),
                      UpdateSaveButtonWidget(
                        viewModel: _viewModel,
                        widget: widget,
                      ),
                    ],
                  ),
                )),
          ),
        )















 */