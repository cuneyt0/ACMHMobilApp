import 'package:login_work/app/home/screens/admin_panel_screen/viewmodel/admin_panel_view_model.dart';
import 'package:login_work/export_import.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({this.model, this.viewModel});
  final LoginResponseModel? model;
  final AdminPanelViewModel? viewModel;

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(mAdminPanel),
        ),
        drawer: AdminPanelDrawerMenu(model: widget.model),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Genel Ögrenci Sayısı"),
                      Text(
                          '${widget.viewModel?.userGetAllResponse?.data?.length}'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Bilgisayar Mühendisligi"),
                      Text(
                          '${widget.viewModel?.userComputerResponse?.data?.length}'),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.height * 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Makine Mühendisligi"),
                      Text(
                          '${widget.viewModel?.userMachineResponse?.data?.length}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
