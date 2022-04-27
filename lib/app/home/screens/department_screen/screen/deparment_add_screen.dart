import 'package:login_work/app/home/screens/department_screen/viewmodel/deparment_add_viewmodel.dart';
import 'package:login_work/export_import.dart';

class DepartmentAddScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const DepartmentAddScreen({Key? key, this.model}) : super(key: key);

  @override
  State<DepartmentAddScreen> createState() => _DepartmentAddScreenState();
}

class _DepartmentAddScreenState extends State<DepartmentAddScreen> {
  DepartmentAddViewModel? _viewModel = DepartmentAddViewModel();
  @override
  void initState() {
    setState(() {
      _viewModel?.setBuildContext(context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Text(mDeparmtent)),
          bottomNavigationBar: ElevatedButton(
              onPressed: () async => await _viewModel?.postDepartment(),
              child: Text(dAddText)),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Form(
                  key: _viewModel?.formKey,
                  child: TextFormField(
                    decoration: const InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      hintText: mDeparmentName,
                      labelStyle: TextStyle(color: Colors.black),
                      hintStyle: TextStyle(color: Colors.black),
                    ),
                    controller: _viewModel?.departmentNameController,
                    validator: _viewModel?.noticeStringValidation,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
