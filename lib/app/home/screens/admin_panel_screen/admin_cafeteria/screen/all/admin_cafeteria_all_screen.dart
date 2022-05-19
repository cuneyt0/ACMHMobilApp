import 'package:login_work/app/home/screens/admin_panel_screen/admin_cafeteria/screen/all/admin_cafeteria_detail_screen.dart';
import 'package:login_work/export_import.dart';

class AdminCafeteriaAllScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const AdminCafeteriaAllScreen({Key? key, this.model}) : super(key: key);

  @override
  State<AdminCafeteriaAllScreen> createState() =>
      _AdminCafeteriaAllScreenState();
}

class _AdminCafeteriaAllScreenState extends State<AdminCafeteriaAllScreen> {
  final AdminCafeteriaGetAllViewModel? viewModel =
      AdminCafeteriaGetAllViewModel();
  @override
  void initState() {
    setState(() {
      viewModel?.setBuildContext(context);
      viewModel?.getAllCafeteria();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text("YEMEKHANE BİLGİLERİ"),
        ),
        body: Observer(
          builder: (context) {
            return ListView.builder(
              itemCount: viewModel?.getAllResponse?.data?.length,
              itemBuilder: (context, index) => Card(
                child: ListTile(
                  onTap: (() => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => AdminCafeteriaDetailScreen(
                                model: widget.model,
                                responseData:
                                    viewModel?.getAllResponse?.data?[index],
                              )),
                        ),
                      )),
                  title: Text(viewModel?.getAllResponse?.data?[index].title ??
                      mLoading),
                  trailing: IconButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Center(
                            child: Text(noticeDeleteText),
                          ),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              ElevatedButton(
                                onPressed: () => Navigator.pop(context),
                                child: const Text(btnCancel),
                              ),
                              ElevatedButton(
                                onPressed: () => viewModel?.deleteCafeteria(
                                    viewModel
                                            ?.getAllResponse?.data?[index].id ??
                                        0),
                                child: const Text(noticeDeleteBtnText),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
