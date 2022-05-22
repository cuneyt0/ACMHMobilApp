
import 'package:login_work/export_import.dart';

class CafeteriaUploadFileWidget extends StatelessWidget {
  const CafeteriaUploadFileWidget({
    Key? key,
    required AdminCafeteriaAddViewModel? viewModel,
  }) : _viewModel = viewModel, super(key: key);

  final AdminCafeteriaAddViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            child: const Text(mUploadPDf),
          );
        }),
      ),
    );
  }
}
