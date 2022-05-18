import 'package:login_work/app/home/screens/admin_panel_screen/admin_cafeteria/viewModel/admin_cafeteria_viewmodel.dart';
import 'package:login_work/core/extension/context_extension.dart';
import 'package:login_work/export_import.dart';

class CafeteriaAddedScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const CafeteriaAddedScreen({Key? key, this.model}) : super(key: key);

  @override
  State<CafeteriaAddedScreen> createState() => _CafeteriaAddedScreenState();
}

class _CafeteriaAddedScreenState extends State<CafeteriaAddedScreen> {
  final AdminCafeteriaAddViewModel? _viewModel = AdminCafeteriaAddViewModel();
  @override
  void initState() {
    setState(() {
      _viewModel?.setBuildContext(context);
      _viewModel?.userId = widget.model?.user?.id;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: ElevatedButton(
          onPressed: () async => _viewModel?.postActivity(),
          child: Text("Kaydet")),
      appBar: AppBar(title: Text("YEMEKHANE BİLGİSİ EKLE")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(builder: (context) {
            return Form(
              key: _viewModel?.formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40.0, left: 10, right: 10, bottom: 40),
                child: TextFormField(
                  controller: _viewModel?.titleController,
                  validator: (value) =>
                      _viewModel?.noticeStringValidation(value),
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: aTitle,
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
              width: MediaQuery.of(context).size.height * 0.99,
              child: Observer(builder: (context) {
                return ElevatedButton(
                  onPressed: () {
                    print("Tıklanıldı");
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
                  child: const Text(mUploadPDf),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
