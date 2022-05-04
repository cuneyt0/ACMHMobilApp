import 'package:login_work/export_import.dart';

class AdminActivityAddScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const AdminActivityAddScreen({Key? key, this.model}) : super(key: key);

  @override
  State<AdminActivityAddScreen> createState() => _AdminActivityAddScreenState();
}

class _AdminActivityAddScreenState extends State<AdminActivityAddScreen> {
  final ActivityAddViewModel? viewModel = ActivityAddViewModel();

  @override
  void initState() {
    setState(() {
      viewModel?.getAllDepartment();
      viewModel?.setBuildContext(context);
      viewModel?.userId = widget.model?.user?.id;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: const Text(mActivityAdd),
          ),
          bottomNavigationBar: BuildPostActivityWidget(viewModel: viewModel),
          body: Observer(
            builder: (context) {
              return BuildAddActivityBodyWidget(viewModel: viewModel);
            },
          ),
        ),
      );
}
