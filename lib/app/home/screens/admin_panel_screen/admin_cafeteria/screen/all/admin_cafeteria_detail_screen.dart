import 'package:login_work/app/home/screens/admin_panel_screen/admin_cafeteria/screen/update/admin_cafeteria_update_screen.dart';
import 'package:login_work/export_import.dart';

class AdminCafeteriaDetailScreen extends StatefulWidget {
  final NoticeData? responseData;
  final LoginResponseModel? model;
  const AdminCafeteriaDetailScreen({Key? key, this.responseData, this.model})
      : super(key: key);

  @override
  State<AdminCafeteriaDetailScreen> createState() =>
      _AdminCafeteriaDetailScreenState();
}

class _AdminCafeteriaDetailScreenState
    extends State<AdminCafeteriaDetailScreen> {
  final AdminCafeteriaGetAllViewModel? viewModel =
      AdminCafeteriaGetAllViewModel();

  @override
  void initState() {
    viewModel
        ?.getPdfShow(widget.responseData?.pdfPath ?? "Pdf yok")
        .then((value) {
      if (value != null) {
        setState(() {});
      }
    });
    viewModel?.getByIdUser(widget.responseData?.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.responseData?.title}',
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: SizedBox(
          width: MediaQuery.of(context).size.width * 0.98,
          child: ElevatedButton(
            onPressed: () {
              print("tıklanıldı");
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CafeteriaUpdateScreen(
                    data: widget.responseData,
                    model: widget.model,
                  ),
                ),
              );
            },
            child: const Text(updateButtonText),
          ),
        ),
      ),
      body: Observer(
        builder: (context) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.6,
                  width: MediaQuery.of(context).size.width * 0.98,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape:const CircleBorder(),
                      padding:const EdgeInsets.all(20),
                    ),
                    onPressed: () async {
                      if (viewModel?.file?.path == null) {
                        showDialog(
                          context: context,
                          builder: (context) => const AlertDialog(
                            title: Center(
                              child: Text(mNoPDf),
                            ),
                          ),
                        );
                      } else {
                        await OpenFile.open(
                            viewModel?.file?.path ?? 'file path null');
                      }
                    },
                    child: const Text(mShowPDf),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 5.0, left: 10.0, right: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        const Expanded(
                            child: Text(
                          noticeCreatedAt,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        )),
                        Text(
                          viewModel?.dateFormat(DateTime.parse(
                                  '${widget.responseData?.createdAt}')) ??
                              '',
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 5.0,
                      ),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            noticeUpdateAt,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Text(
                            viewModel?.dateFormat(
                                  DateTime.parse(
                                      '${widget.responseData?.updatedAt}'),
                                ) ??
                                '',
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Row(
                        children: [
                          const Expanded(
                              child: Text(
                            mCreatedUser,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          )),
                          Text(
                              '${viewModel?.userGetByIdModel?.data?.firstName} ${viewModel?.userGetByIdModel?.data?.lastName}'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
