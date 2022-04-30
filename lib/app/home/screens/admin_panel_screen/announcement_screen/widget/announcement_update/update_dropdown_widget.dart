import 'package:login_work/export_import.dart';

Row UpdateDropdown(
    AnnouncementUpdateScreen widget,
    List<DropdownMenuItem<Data>>? items,
    final AnnouncementUpdateViewModel? _viewModel) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceAround,
    children: [
      Text("Bölüm Seçiniz"),
      Observer(
        builder: (context) => Padding(
          padding: const EdgeInsets.only(top: 40.0, bottom: 40.0),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).primaryColor,
                ),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<Data>(
                  value:
                      items?[((_viewModel?.dropdownvalue?.id) ?? 1) - 1].value,
                  hint: Text("Seçiniz"),
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
                  }),
            ),
          ),
        ),
      ),
    ],
  );
}
