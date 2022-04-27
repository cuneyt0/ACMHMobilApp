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
    _viewModel?.getAllDepartment();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BÖLÜMLER"),
        ),
        body: Observer(builder: (context) {
          return ListView.builder(
            itemCount: _viewModel?.departmentGetAllResponse?.data?.length,
            itemBuilder: (context, index) => ListTile(
              title: Text(
                  '${_viewModel?.departmentGetAllResponse?.data?[index].departmentName ?? mLoading}'),
            ),
          );
        }));
  }
}
