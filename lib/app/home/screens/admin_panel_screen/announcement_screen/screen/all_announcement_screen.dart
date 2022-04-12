import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/screen/announcement_detail_screen.dart';
import 'package:login_work/export_import.dart';

import '../../../../viewmodel/home_view_model.dart';

class AllAnnouncementScreen extends StatefulWidget {
  const AllAnnouncementScreen({Key? key}) : super(key: key);

  @override
  State<AllAnnouncementScreen> createState() => _AllAnnouncementScreenState();
}

class _AllAnnouncementScreenState extends State<AllAnnouncementScreen> {
  HomeViewModel _viewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.getAllNotice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DUYURULAR")),
      body: Observer(
        builder: ((context) => _viewModel.responseData?.data == null
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                itemCount: _viewModel.responseData?.data?.length,
                itemBuilder: (context, index) => ListTile(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => AnnouncementDetail(
                                  responseData:
                                      _viewModel.responseData?.data?[index],
                                ))));
                      },
                      title: Text(_viewModel.responseData?.data?[index].title ??
                          'Yükleniyor...'),
                      trailing: IconButton(
                          onPressed: () {
                            print("delete");
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title:
                                        Center(child: Text(noticeDeleteText)),
                                    content: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          ElevatedButton(
                                              onPressed: () {
                                                Navigator.pop(context);
                                              },
                                              child: Text("Vazgeç")),
                                          ElevatedButton(
                                              onPressed: () async {
                                                print(_viewModel.responseData
                                                    ?.data?[index].id);
                                                await _viewModel
                                                    .delete(_viewModel
                                                        .responseData
                                                        ?.data?[index]
                                                        .id)
                                                    .then((value) => Flushbar(
                                                          message:
                                                              noticeDeletedMessage,
                                                          flushbarPosition:
                                                              FlushbarPosition
                                                                  .TOP,
                                                          duration: Duration(
                                                              seconds: 1),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(2),
                                                          backgroundColor:
                                                              Colors.black
                                                                  .withOpacity(
                                                                      0.5),
                                                        )
                                                            .show(context)
                                                            .then((value) =>
                                                                Navigator.pop(
                                                                    context))
                                                            .then(
                                                                (value) async {
                                                          await _viewModel
                                                              .getAllNotice();
                                                        }));
                                              },
                                              child: Text(noticeDeleteBtnText)),
                                        ]),
                                  );
                                });
                          },
                          icon: Icon(Icons.delete)),
                    ))),
      ),
    );
  }
}

/*
ListView.builder(
            itemCount: _viewModel.responseData?.data?.length,
            itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => AnnouncementDetail(
                              responseData:
                                  _viewModel.responseData?.data?[index],
                            ))));
                  },
                  title: Text(_viewModel.responseData?.data?[index].title ??
                      'Yükleniyor...'),
                  trailing: IconButton(
                      onPressed: () {
                        print("delete");
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(child: Text("Silme İşlemi")),
                                content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("Vazgeç")),
                                      ElevatedButton(
                                          onPressed: () async {
                                            print(_viewModel
                                                .responseData?.data?[index].id);
                                            await _viewModel
                                                .delete(_viewModel.responseData
                                                    ?.data?[index].id)
                                                .then((value) => Flushbar(
                                                      message:
                                                          'Duyuru Başarılıyla silindi',
                                                      flushbarPosition:
                                                          FlushbarPosition.TOP,
                                                      duration:
                                                          Duration(seconds: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      backgroundColor: Colors
                                                          .black
                                                          .withOpacity(0.5),
                                                    )
                                                        .show(context)
                                                        .then((value) =>
                                                            Navigator.pop(
                                                                context))
                                                        .then((value) async {
                                                      await _viewModel
                                                          .getAllNotice();
                                                    }));
                                          },
                                          child: Text("Sil")),
                                    ]),
                              );
                            });
                      },
                      icon: Icon(Icons.delete)),
                ))

 */