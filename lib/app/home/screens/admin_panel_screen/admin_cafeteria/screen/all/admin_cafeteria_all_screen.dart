import 'package:login_work/app/home/screens/admin_panel_screen/admin_cafeteria/screen/all/admin_cafeteria_detail_screen.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/admin_cafeteria/widget/all/adminCafeteriaAllScreenBodyWidget.dart';
import 'package:login_work/export_import.dart';

class AdminCafeteriaAllScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const AdminCafeteriaAllScreen({Key? key, this.model}) : super(key: key);

  @override
  State<AdminCafeteriaAllScreen> createState() =>
      _AdminCafeteriaAllScreenState();
}

class _AdminCafeteriaAllScreenState extends State<AdminCafeteriaAllScreen> {
  final AdminCafeteriaGetAllViewModel? viewModel =
      AdminCafeteriaGetAllViewModel();
  @override
  void initState() {
    setState(() {
      viewModel?.setBuildContext(context);
      viewModel?.getAllCafeteria();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(mFood),
        ),
        body: Observer(
          builder: (context) {
            return AdminCafeteriaAllScreenBodyWidget(
                viewModel: viewModel, widget: widget);
          },
        ),
      );
}
