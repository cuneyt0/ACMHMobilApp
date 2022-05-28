import 'package:login_work/export_import.dart';

class AllAnnouncementScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const AllAnnouncementScreen({Key? key, this.model}) : super(key: key);

  @override
  State<AllAnnouncementScreen> createState() => _AllAnnouncementScreenState();
}

class _AllAnnouncementScreenState extends State<AllAnnouncementScreen> {
  final HomeViewModel _viewModel = HomeViewModel();

  @override
  void initState() {
    _viewModel.getAllNotice();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: const Text(mAnnouncements)),
        body: Observer(
          builder: ((context) => _viewModel.responseData?.data == null
              ? const Center(child: CircularProgressIndicator())
              : ListView.builder(
                  itemCount: _viewModel.responseData?.data?.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => AnnouncementDetail(
                                responseData:
                                    _viewModel.responseData?.data?[index],
                                model: widget.model,
                              )),
                        ),
                      ),
                      title: Text(_viewModel.responseData?.data?[index].title ??
                          mLoading),
                      trailing: IconButton(
                          color: Colors.red,
                          onPressed: () => showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Center(
                                    child: Text(noticeDeleteText),
                                  ),
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ElevatedButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text(btnCancel),
                                      ),
                                      ElevatedButton(
                                          onPressed: () async =>
                                              await _viewModel
                                                  .delete(_viewModel
                                                      .responseData
                                                      ?.data?[index]
                                                      .id)
                                                  .then(
                                                    (value) => Flushbar(
                                                      message:
                                                          noticeDeletedMessage,
                                                      flushbarPosition:
                                                          FlushbarPosition.TOP,
                                                      duration: const Duration(
                                                          seconds: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              2),
                                                      backgroundColor: Colors
                                                          .black
                                                          .withOpacity(0.5),
                                                    )
                                                        .show(context)
                                                        .then(
                                                          (value) =>
                                                              Navigator.pop(
                                                                  context),
                                                        )
                                                        .then(
                                                          (value) async =>
                                                              await _viewModel
                                                                  .getAllNotice(),
                                                        ),
                                                  ),
                                          child:
                                              const Text(noticeDeleteBtnText)),
                                    ],
                                  ),
                                ),
                              ),
                          icon: const Icon(Icons.delete)),
                    ),
                  ),
                )),
        ),
      );
}
