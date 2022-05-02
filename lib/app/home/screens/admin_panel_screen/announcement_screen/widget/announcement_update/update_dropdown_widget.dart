import 'package:login_work/export_import.dart';

Row UpdateDropdown(
    AnnouncementUpdateScreen widget,
    List<DropdownMenuItem<Data>>? items,
    final AnnouncementUpdateViewModel? _viewModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Padding(
        padding: EdgeInsets.only(
          left: 10.0,
          top: 20.0,
        ),
        child: Text(
          mSelectDepartment,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      Observer(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(top: 50.0, bottom: 30.0, right: 10),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(10))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Data>(
                value: items?[((_viewModel?.dropdownvalue?.id) ?? 1) - 1].value,
                hint: const Text("Seçiniz"),
                items: items,
                onChanged: (Data? selected) {
                  if (selected?.id == null) {
                    selected?.id = _viewModel?.dropdownvalue?.id;
                    print('seçmeden gelen yollanan deger');
                  }
                  _viewModel?.dropdownvalue = selected;
                  _viewModel?.selectedDepartmentId = selected?.id;
                  print(_viewModel?.dropdownvalue?.departmentName.toString());
                  print(_viewModel?.selectedDepartmentId.toString());
                },
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
