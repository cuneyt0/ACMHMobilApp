import 'package:login_work/export_import.dart';

class BuildActivityRowWidget extends StatelessWidget {
  const BuildActivityRowWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ActivityAddViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        const Padding(
          padding: EdgeInsets.only(
            left: 10.0,
            top: 50.0,
          ),
          child: Text(
            mSelectDepartment,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Observer(
          builder: (context) => Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                  value: viewModel?.dropdownvalue,
                  hint: const Text("Seçiniz"),
                  items: viewModel?.departmentGetAllResponse?.data?.map((e) {
                    return DropdownMenuItem<Data>(
                        value: e, child: Text(e.departmentName ?? "Null"));
                  }).toList(),
                  onChanged: (Data? selected) {
                    viewModel?.dropdownvalue = selected;
                    viewModel?.selectedDepartmentId = selected?.id;
                  },
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
