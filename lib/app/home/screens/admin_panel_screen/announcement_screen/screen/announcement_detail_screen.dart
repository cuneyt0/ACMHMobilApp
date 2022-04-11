import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/model/notice_getall_response_model.dart';
import 'package:login_work/export_import.dart';

import '../../../../viewmodel/home_view_model.dart';

class AnnouncementDetail extends StatefulWidget {
  final NoticeData? responseData;

  const AnnouncementDetail({Key? key, this.responseData}) : super(key: key);

  @override
  State<AnnouncementDetail> createState() => _AnnouncementDetailState();
}

class _AnnouncementDetailState extends State<AnnouncementDetail> {
  HomeViewModel _viewModel = HomeViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel
        .getImage(widget.responseData?.imagePath ?? 'foto yok')
        .then((value) {
      if (value != null)
        setState(() {
          _viewModel.photo = value;
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
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.4,
                      child: _viewModel.photo != null
                          ? Image.memory(_viewModel.photo)
                          : Center(
                              child: Image.asset("assets/logo/neu_logo.jpg"))),
                ),
                Center(child: Text(widget.responseData?.title ?? 'title null')),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                      child:
                          Text(widget.responseData?.content ?? 'content null')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, left: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Oluştulma Tarihi:"),
                      Text(createdAt.toString())
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 13.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Güncelleme Tarihi:"),
                      Text(updatedAt.toString())
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
