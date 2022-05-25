import 'package:login_work/app/home/screens/admin_panel_screen/admin_user_update_file_screen/viewmodel/admin_user_update_viewmodel.dart';
import 'package:login_work/export_import.dart';

class AdminUserUpdateScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const AdminUserUpdateScreen({Key? key, this.model}) : super(key: key);

  @override
  State<AdminUserUpdateScreen> createState() => _AdminUserUpdateScreenState();
}

class _AdminUserUpdateScreenState extends State<AdminUserUpdateScreen> {
  final AdminUserUpdateViewModel? _viewModel = AdminUserUpdateViewModel();
  @override
  void initState() {
    setState(() {
      _viewModel?.setBuildContext(context);
    
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(mUserUpdate)),
      bottomNavigationBar: ElevatedButton(
        child: Text("Kaydet"),
        onPressed: () async => _viewModel?.postExcel(),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            width: MediaQuery.of(context).size.height * 0.99,
            child: Observer(builder: (context) {
              return ElevatedButton(
                onPressed: () {
                  _viewModel?.uploadPdf().then((value) => Flushbar(
                        message: '${_viewModel?.file?.name} Secildi',
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: const Duration(seconds: 1),
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ).show(context));
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all(Colors.blue.shade400),
                ),
                child: const Text('DOSYA YÜKLE'),
              );
            }),
          ),
        ),
      ),
    );
  }
}
