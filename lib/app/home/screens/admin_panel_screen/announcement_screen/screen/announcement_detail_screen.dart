import 'package:login_work/export_import.dart';

class AnnouncementDetail extends StatefulWidget {
  final NoticeData? responseData;
  final LoginResponseModel? model;

  const AnnouncementDetail({
    Key? key,
    this.responseData,
    this.model,
  }) : super(key: key);

  @override
  State<AnnouncementDetail> createState() => _AnnouncementDetailState();
}

class _AnnouncementDetailState extends State<AnnouncementDetail> {
  final HomeViewModel _viewModel = HomeViewModel();
  final AnnouncementUpdateViewModel? _updateViewModel =
      AnnouncementUpdateViewModel();
  List<DropdownMenuItem<Data>>? items;
  bool isLoading = true;

  @override
  void initState() {
    _updateViewModel?.getAllDepartment().then(
      (value) {
        setState(() {
          items = _updateViewModel?.responseData?.data?.map((e) {
            return DropdownMenuItem<Data>(
                value: e, child: Text(e.departmentName ?? "Null"));
          }).toList();
        });
      },
    );
    _updateViewModel?.dropdownvalue = Data(
        id: widget.responseData?.departmentId,
        departmentName: _updateViewModel?.responseData?.data
            ?.firstWhere(
                (element) => element.id == widget.responseData?.departmentId)
            .departmentName);
    _updateViewModel?.selectedDepartmentId =
        _updateViewModel?.dropdownvalue?.id;

    _viewModel
        .getImage(widget.responseData?.imagePath ?? 'foto yok')
        .then((value) async {
      if (value != null) {
        setState(() {
          _viewModel.photo = value;
          getTemporaryDirectory().then((temp) {
            File file = File(temp.path + '/.jpg');
            file.writeAsBytes(value as Uint8List);
            _updateViewModel?.addedPhoto = file.path;
          });
        });
      }
      Future.delayed(const Duration(milliseconds: 250)).then((value) {
        setState(() {
          isLoading = false;
        });
      });
    });

    _viewModel
        .getPdfShow(widget.responseData?.pdfPath ?? "Pdf yok")
        .then((value) {
      if (value != null) {
        setState(() {
          getApplicationDocumentsDirectory().then((dic) {
            File file = File(dic.path + '/.pdf');
            file.writeAsBytes(value as Uint8List);
            _updateViewModel?.newFilePath = file.path;
          });
        });
      }
    });
    _viewModel.getByIdDepartment(widget.responseData?.departmentId);
    _viewModel.getByIdUser(widget.model?.user?.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(mAllAnnouncements)),
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
                            : _viewModel.photo != null
                                ? Image.memory(
                                    _viewModel.photo,
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
                          '${widget.responseData?.title}',
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5.0, right: 5),
                        child: Expanded(
                          child: ReadMoreText(
                            '${widget.responseData?.content}',
                            trimLines: 2,
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
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 10.0, right: 10),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            noticeCreatedAt,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Text(
                            _updateViewModel!.dateFormat(DateTime.parse(
                                '${widget.responseData?.createdAt}')),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 10.0, right: 10),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            noticeUpdateAt,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Text(
                            _updateViewModel!.dateFormat(
                              DateTime.parse(
                                  '${widget.responseData?.updatedAt}'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 10.0, right: 10),
                      child: Row(
                        children: [
                          const Expanded(
                            child: Text(
                              mDeparmentName,
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Text(
                              '${_viewModel.departmentGetByIdResponseModel?.data?.departmentName}'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 5.0, left: 10.0, right: 10),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            mCreatedUser,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Text(
                              '${_viewModel.userGetByIdModel?.data?.firstName} ${_viewModel.userGetByIdModel?.data?.lastName}'),
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
                            if (_viewModel.file?.path == null) {
                              showDialog(
                                context: context,
                                builder: (context) => const AlertDialog(
                                  title: Center(child: Text(mNoPDf)),
                                ),
                              );
                            } else {
                              await OpenFile.open(
                                  _viewModel.file?.path ?? 'file path null');
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
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.98,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => AnnouncementUpdateScreen(
                                  viewModel: _updateViewModel,
                                  data: widget.responseData,
                                  items: items,
                                  model: widget.model,
                                ),
                              ),
                            );
                          },
                          child: const Text(updateButtonText),
                        ),
                      ),
                    )
                  ],
                ),
              )),
        ),
      );
}
