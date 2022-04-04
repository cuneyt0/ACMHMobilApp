import 'package:login_work/app/home/widgets/adminPanelMenu/admin_panel_drawer_menu.dart';
import 'package:login_work/export_import.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({this.model});
  final LoginResponseModel? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ADMİN PANELİ"),
      ),
      drawer: AdminPanelDrawerMenu(model: model),
      body: Container(
        child: Text(model?.user?.firstName ?? ' boş'),
      ),
    );
  }
}
