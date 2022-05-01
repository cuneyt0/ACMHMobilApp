import 'package:login_work/export_import.dart';

Row noticeDepartmentRow(
  AnnouncementViewModel? _viewModel,
) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      const Text(mSelectDepartment),
      Observer(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                  value: _viewModel?.dropdownvalue,
                  hint: const Text("Seçiniz"),
                  items: _viewModel?.responseData?.data?.map((e) {
                    return DropdownMenuItem<Data>(
                        value: e, child: Text(e.departmentName ?? "Null"));
                  }).toList(),
                  onChanged: (Data? selected) {
                    _viewModel?.dropdownvalue = selected;
                    _viewModel?.selectedDepartmentId = selected?.id;
                    print(_viewModel?.dropdownvalue?.departmentName.toString());
                    print(_viewModel?.selectedDepartmentId.toString());
                  }),
            ),
          ),
        ),
      ),
    ],
  );
}
