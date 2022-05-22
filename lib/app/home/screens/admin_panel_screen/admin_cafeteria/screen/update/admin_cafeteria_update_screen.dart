import 'package:login_work/core/extension/context_extension.dart';
import 'package:login_work/export_import.dart';

class CafeteriaUpdateScreen extends StatefulWidget {
  final NoticeData? data;
  final LoginResponseModel? model;
  const CafeteriaUpdateScreen({Key? key, this.data, this.model})
      : super(key: key);

  @override
  State<CafeteriaUpdateScreen> createState() => _CafeteriaUpdateScreenState();
}

class _CafeteriaUpdateScreenState extends State<CafeteriaUpdateScreen> {
  final UpdateCafeteriaViewModel? _viewModel = UpdateCafeteriaViewModel();

  @override
  void initState() {
    _viewModel?.setBuildContext(context);
    _viewModel?.titleController.text = widget.data?.title ?? ' Title boş';
    _viewModel?.id = widget.data?.id;
    _viewModel?.userId = widget.model?.user?.id;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(mUpdateCafeteriaTitle),
      ),
      bottomNavigationBar: ElevatedButton(
          onPressed: () async => await _viewModel?.updateActivity(),
          child: Text("Kaydet")),
      body: Observer(
        builder: (context) {
          return Form(
            key: _viewModel?.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
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
                    )),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 30.0, left: 10, right: 10),
                  child: ElevatedButton(
                    onPressed: () =>
                        _viewModel?.uploadPdf().then((value) => Flushbar(
                              message: '${_viewModel?.file?.name} seçildi',
                              flushbarPosition: FlushbarPosition.TOP,
                              duration: const Duration(seconds: 1),
                              borderRadius: BorderRadius.circular(2),
                              backgroundColor: Colors.black.withOpacity(0.5),
                            ).show(context)),
                    child: const Text(mUploadPDf),
                    style: ButtonStyle(
                      maximumSize: MaterialStateProperty.all<Size>(
                        Size(context.width * 1, context.highValue),
                      ),
                      minimumSize: MaterialStateProperty.all<Size>(
                        Size(context.width * 1, context.mediumValue),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
