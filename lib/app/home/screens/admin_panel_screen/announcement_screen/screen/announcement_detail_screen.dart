import 'dart:typed_data';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/model/notice_getall_response_model.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/screen/announcement_update_screen.dart';
import 'package:login_work/export_import.dart';
import 'package:path_provider/path_provider.dart';

import '../../../../viewmodel/home_view_model.dart';

class AnnouncementDetail extends StatefulWidget {
  final NoticeData? responseData;
  final LoginResponseModel? model;
  const AnnouncementDetail({Key? key, this.responseData, this.model})
      : super(key: key);

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
        print("--Items__");

        print(items);
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
            File file = File(temp.path + '/temp.jpg');
            file.writeAsBytes(value as Uint8List);
            _updateViewModel?.addedPhoto = file.path;
            print(file.path);
          });

          //

          //   _updateViewModel.addedPhoto = value;
        });
      }
      Future.delayed(Duration(milliseconds: 250)).then((value) {
        setState(() {
          isLoading = false;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final createdAt = DateTime.parse('${widget.responseData?.createdAt}');
    final updatedAt = DateTime.parse('${widget.responseData?.updatedAt}');

    return Scaffold(
      appBar: AppBar(title: Text("DUYURU DETAY SAYFASI")),
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
                                : Center(child: Image.asset(defaultImage))),
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
                            Text(createdAt.toString())
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(noticeUpdateAt),
                            Text(updatedAt.toString())
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0, right: 13.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Department Name"),
                            Text(widget.responseData!.departmentId.toString())
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
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
                      )
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
