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
              /* Navigator.of(context).pop();
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) => ActivityUpdateScreen(
                                  viewModel: addViewModel,
                                  data: widget.responseData,
                                  items: items,
                                  model: widget.model,
                                  getAllViewModel: viewModel,
                                ),
                              ),
                            );*/
            },
            child: const Text(updateButtonText),
          ),
        ),
      ),
      body: Observer(
        builder: (context) {
          return Padding(
            padding: const EdgeInsets.only(top: 20.0, left: 20, right: 20),
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.width * 0.5,
                width: MediaQuery.of(context).size.width * 0.98,
                child: ElevatedButton(
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
          );
        },
      ),
    );
  }
}
