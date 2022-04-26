import 'dart:typed_data';
import 'package:login_work/export_import.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../../../core/download/download_helper.dart';

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
  HomeViewModel _viewModel = HomeViewModel();
  AnnouncementUpdateViewModel? _updateViewModel = AnnouncementUpdateViewModel();
  List<DropdownMenuItem<Data>>? items;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
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
            print(file.path);
          });
        });
      }
      Future.delayed(Duration(milliseconds: 250)).then((value) {
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
            print(file.path);
          });
        });
      }
    });
    _viewModel.getByIdDepartment(widget.responseData?.departmentId);
    _viewModel.getByIdUser(widget.model?.user?.id);
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text(mAllAnnouncements)),
        body: Observer(
          builder: ((context) => Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                          height: MediaQuery.of(context).size.height * 0.4,
                          width: MediaQuery.of(context).size.width * 1,
                          child: isLoading
                              ? Center(child: CircularProgressIndicator())
                              : _viewModel.photo != null
                                  ? Image.memory(_viewModel.photo)
                                  : Center(child: Image.asset(assetNeuLogo))),
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Center(child: Text('${widget.responseData?.title}')),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Center(
                              child: Text('${widget.responseData?.content}')),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0, left: 0.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(noticeCreatedAt),
                              Text(
                                _updateViewModel!.dateFormat(DateTime.parse(
                                    '${widget.responseData?.createdAt}')),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, right: 13.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(noticeUpdateAt),
                              Text(
                                _updateViewModel!.dateFormat(DateTime.parse(
                                    '${widget.responseData?.updatedAt}')),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, right: 13.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(mDeparmentName),
                              Text(
                                  '${_viewModel.departmentGetByIdResponseModel?.data?.departmentName}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 10.0, right: 13.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(mCreatedUser),
                              Text(
                                  '${_viewModel.userGetByIdModel?.data?.firstName} ${_viewModel.userGetByIdModel?.data?.lastName}'),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 30.0),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.width * 0.1,
                            width: MediaQuery.of(context).size.width * 0.98,
                            child: ElevatedButton(
                                onPressed: () async {
                                  if (_viewModel.file?.path == null) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Center(child: Text(mNoPDf)),
                                          );
                                        });
                                  } else {
                                    await OpenFile.open(_viewModel.file?.path ??
                                        'file path null');
                                  }
                                },
                                child: isLoading
                                    ? Center(child: CircularProgressIndicator())
                                    : Text(mShowPDf)),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width * 0.98,
                            child: ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) =>
                                          AnnouncementUpdateScreen(
                                            viewModel: _updateViewModel,
                                            data: widget.responseData,
                                            items: items,
                                            model: widget.model,
                                          )));
                                },
                                child: Text(updateButtonText)),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
      );
}
