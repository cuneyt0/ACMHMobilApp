import '../../../../../export_import.dart';

class DrawerAnnouncementDetailScreen extends StatefulWidget {
  NoticeData? model;
  DrawerAnnouncementDetailScreen({Key? key, this.model}) : super(key: key);

  @override
  State<DrawerAnnouncementDetailScreen> createState() =>
      _DrawerAnnouncementDetailScreenState();
}

class _DrawerAnnouncementDetailScreenState
    extends State<DrawerAnnouncementDetailScreen> {
  final PublicAnnouncementViewModel? _viewModel = PublicAnnouncementViewModel();
  bool isLoading = true;
  @override
  void initState() {
    _viewModel?.getByIdDepartment(widget.model!.departmentId ?? 5);
    _viewModel?.getByIdUser(widget.model!.userId!);

    _viewModel
        ?.getImage(widget.model?.imagePath ?? 'foto yok')
        .then((value) async {
      if (value != null) {
        print(value);
        setState(() {
          _viewModel?.photo = value;
          print('photo degeri: ${_viewModel?.photo.toString()}');
        });
      }
      Future.delayed(const Duration(milliseconds: 250)).then((value) {
        setState(() {
          isLoading = false;
        });
      });
    });
    _viewModel?.getPdfShow(widget.model?.pdfPath ?? "Pdf yok").then((value) {
      if (value != null) {
        setState(() {});
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (context) {
          return Text(widget.model?.title.toString() ?? '-');
        }),
      ),
      body: Observer(
        builder: ((context) => SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.57,
                      width: MediaQuery.of(context).size.width * 1,
                      child: isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : _viewModel?.photo != null
                              ? Image.memory(
                                  _viewModel?.photo,
                                  fit: BoxFit.cover,
                                )
                              : Center(
                                  child: Image.asset(assetNeuLogo),
                                ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Center(
                      child: Text(
                        '${widget.model?.title}',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0, right: 5),
                      child: Expanded(
                        child: ReadMoreText(
                          '${widget.model?.content ?? ' '}',
                          trimLines: 4,
                          colorClickableText: Colors.pink,
                          trimMode: TrimMode.Line,
                          trimCollapsedText: '...Daha fazla',
                          trimExpandedText: ' ...Daha az',
                          style: const TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 10.0, right: 10),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          noticeCreatedAt,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Text(
                          _viewModel!.dateFormat(
                              DateTime.parse('${widget.model?.createdAt}')),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 10.0, right: 10),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          noticeUpdateAt,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Text(
                          _viewModel!.dateFormat(
                            DateTime.parse('${widget.model?.updatedAt}'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 10.0, right: 10),
                    child: Row(
                      children: [
                        const Expanded(
                          child: Text(
                            mDeparmentName,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                            '${_viewModel?.departmentIdResponse.data?.departmentName}'), //'${_viewModel?.departmentIdResponse.data?.departmentName
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 5.0, left: 10.0, right: 10),
                    child: Row(
                      children: [
                        const Expanded(
                            child: Text(
                          mCreatedUser,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Text(
                            '${_viewModel?.userGetByIdModel.data?.firstName} ${_viewModel?.userGetByIdModel.data?.lastName}'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: SizedBox(
                      height: MediaQuery.of(context).size.width * 0.1,
                      width: MediaQuery.of(context).size.width * 0.98,
                      child: ElevatedButton(
                        onPressed: () async {
                          if (_viewModel?.file?.path == null) {
                            showDialog(
                              context: context,
                              builder: (context) => const AlertDialog(
                                title: Center(child: Text(mNoPDf)),
                              ),
                            );
                          } else {
                            await OpenFile.open(
                                _viewModel?.file?.path ?? 'file path null');
                          }
                        },
                        child: isLoading
                            ? const Center(
                                child: CircularProgressIndicator(),
                              )
                            : const Text(mShowPDf),
                      ),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
