import 'package:login_work/export_import.dart';

class ActivityUpdateScreen extends StatefulWidget {
  final NoticeData? data;
  final LoginResponseModel? model;
  final ActivityAddViewModel? viewModel;
  final AdminActivityAllViewModel? getAllViewModel;
  final List<DropdownMenuItem<Data>>? items;

  const ActivityUpdateScreen(
      {Key? key,
      this.data,
      this.model,
      this.viewModel,
      this.items,
      this.getAllViewModel})
      : super(key: key);

  @override
  State<ActivityUpdateScreen> createState() => _ActivityUpdateScreenState();
}

class _ActivityUpdateScreenState extends State<ActivityUpdateScreen> {
  @override
  void initState() {
    widget.viewModel?.setBuildContext(context);
    super.initState();
    widget.viewModel?.titleController.text = widget.data?.title ?? ' Title boş';
    widget.viewModel?.contentController.text =
        widget.data?.content ?? ' Contentboş';
    widget.viewModel?.id = widget.data?.id;

    widget.viewModel?.userId = widget.model?.user?.id;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(mUpdateActivityTitle),
      ),
      bottomNavigationBar: AdminUpdateBottomNavigationBar(widget: widget),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Observer(
          builder: ((context) => Form(
                key: widget.viewModel?.formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 40.0, left: 10, right: 10, bottom: 40),
                      child: AdminActivityUpdateTitle(widget: widget),
                    ),
                    AdminActivityUpdateContent(
                      widget: widget,
                    ),
                    _adminActivityUpdateRow(),
                    AdminActivityUpdatePdf(widget: widget),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 30.0, left: 10, right: 10),
                      child: AdminActivityUpdateImageButton(
                        widget: widget,
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Row _adminActivityUpdateRow() {
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
                  value: widget
                      .items?[((widget.viewModel?.dropdownvalue?.id) ?? 1) - 1]
                      .value,
                  hint: const Text("Seçiniz"),
                  items: widget.items,
                  onChanged: (Data? selected) {
                    if (selected?.id == null) {
                      selected?.id = widget.viewModel?.dropdownvalue?.id;
                    }
                    widget.viewModel?.dropdownvalue = selected;
                    widget.viewModel?.selectedDepartmentId = selected?.id;
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
