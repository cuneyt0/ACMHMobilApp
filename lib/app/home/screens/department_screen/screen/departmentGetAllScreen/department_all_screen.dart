import 'package:login_work/app/home/screens/department_screen/screen/departmentUpdateScreen/department_update_screen.dart';
import 'package:login_work/app/home/screens/department_screen/viewmodel/departmentGetAll/department_getall_viewmodel.dart';
import 'package:login_work/export_import.dart';

class DepartmentGetAllScreen extends StatefulWidget {
  const DepartmentGetAllScreen({Key? key}) : super(key: key);

  @override
  State<DepartmentGetAllScreen> createState() => _DepartmentGetAllScreenState();
}

class _DepartmentGetAllScreenState extends State<DepartmentGetAllScreen> {
  DepartmentGetAllViewModel? _viewModel = DepartmentGetAllViewModel();
  @override
  void initState() {
    setState(() {
      _viewModel?.getAllDepartment();
      _viewModel?.setBuildContext(context);
    });
    super.initState();
  }

  @override
  void dispose() {
    _viewModel?.getAllDepartment();
    _viewModel?.setBuildContext(context);

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BÖLÜMLER"),
      ),
      body: Observer(
        builder: (context) {
          return ListView.builder(
            itemCount: _viewModel?.departmentGetAllResponse?.data?.length,
            itemBuilder: (context, index) => ListTile(
              onTap: (() => Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: ((context) => DepartmentUpdateScreen(
                            model: _viewModel
                                ?.departmentGetAllResponse?.data?[index],
                          )),
                    ),
                  )),
              title: Text(
                  '${_viewModel?.departmentGetAllResponse?.data?[index].departmentName ?? mLoading}'),
              trailing: IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Center(
                        child: Text(noticeDeleteText),
                      ),
                      content: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ElevatedButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(btnCancel),
                          ),
                          ElevatedButton(
                            onPressed: () => _viewModel?.deleteDepartment(
                                _viewModel?.departmentGetAllResponse
                                        ?.data?[index].id ??
                                    0),
                            child: Text(noticeDeleteBtnText),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                icon: Icon(Icons.delete),
              ),
            ),
          );
        },
      ),
    );
  }
}
