import 'package:login_work/export_import.dart';

import '../../viewmodel/departmentGetAll/department_getall_viewmodel.dart';

class DepartmentUpdateScreen extends StatefulWidget {
  Data? model;
  DepartmentUpdateScreen({Key? key, this.model}) : super(key: key);

  @override
  State<DepartmentUpdateScreen> createState() => _DepartmentUpdateScreenState();
}

class _DepartmentUpdateScreenState extends State<DepartmentUpdateScreen> {
  DepartmentGetAllViewModel? _viewModel = DepartmentGetAllViewModel();
  @override
  void initState() {
    setState(() {
      _viewModel?.setBuildContext(context);
      _viewModel?.id = widget.model?.id;
      _viewModel!.departmentNameController.text =
          widget.model!.departmentName.toString();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.model!.departmentName.toString())),
      bottomNavigationBar: ElevatedButton(
          onPressed: () async => await _viewModel?.updateDepartment(),
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
    );
  }
}
