import 'package:login_work/export_import.dart';

class AllAnnouncementScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const AllAnnouncementScreen({Key? key, this.model}) : super(key: key);

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
                        //  Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: ((context) => AnnouncementDetail(
                                  responseData:
                                      _viewModel.responseData?.data?[index],
                                  model: widget.model,
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
