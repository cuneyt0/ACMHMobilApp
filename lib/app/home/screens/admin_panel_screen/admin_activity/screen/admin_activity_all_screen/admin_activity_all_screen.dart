import 'package:login_work/app/home/screens/admin_panel_screen/admin_activity/viewmodel/admin_activity_all/admin_activity_all_view_model.dart';
import 'package:login_work/export_import.dart';

class AdminActivityAllScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const AdminActivityAllScreen({Key? key, this.model}) : super(key: key);

  @override
  State<AdminActivityAllScreen> createState() => _AdminActivityAllScreenState();
}

class _AdminActivityAllScreenState extends State<AdminActivityAllScreen> {
  final AdminActivityAllViewModel? viewModel = AdminActivityAllViewModel();
  @override
  void initState() {
    setState(() {
      viewModel?.setBuildContext(context);
      viewModel?.getAllActivity();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("ETKİNLİKLER")),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: viewModel?.getAllActivityResponse?.data?.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                /* onTap: (() => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: ((context) => DepartmentUpdateScreen(
                              model: viewModel
                                  ?.departmentGetAllResponse?.data?[index],
                            )),
                      ),
                    ))*/
                title: Text(
                    viewModel?.getAllActivityResponse?.data?[index].title ??
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
                              onPressed: () => viewModel?.deleteDepartment(
                                  viewModel?.getAllActivityResponse
                                          ?.data?[index].id ??
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
}
