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
          child: const Text(dAddText)),
      appBar: AppBar(title: const Text(mCafeteriaAddedTitle)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Observer(builder: (context) {
            return Form(
              key: _viewModel?.formKey,
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40.0, left: 10, right: 10, bottom: 40),
                child: CafeteriaTitleFormWidget(viewModel: _viewModel),
              ),
            );
          }),
          CafeteriaUploadFileWidget(viewModel: _viewModel),
        ],
      ),
    );
  }
}
