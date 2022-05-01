import 'package:login_work/export_import.dart';

class AdminPanelScreen extends StatelessWidget {
  const AdminPanelScreen({this.model});
  final LoginResponseModel? model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(mAdminPanel),
      ),
      drawer: AdminPanelDrawerMenu(model: model),
      body: Container(
        child: Text(model?.user?.firstName ?? ' boş'),
      ),
    );
  }
}
