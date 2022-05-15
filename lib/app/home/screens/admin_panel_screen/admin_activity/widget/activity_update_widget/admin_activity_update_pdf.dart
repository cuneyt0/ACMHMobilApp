import 'package:login_work/export_import.dart';
import 'package:login_work/core/extension/context_extension.dart';
class AdminActivityUpdatePdf extends StatelessWidget {
  const AdminActivityUpdatePdf({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ActivityUpdateScreen widget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () => widget.viewModel?.uploadPdf().then((value) => Flushbar(
              message: '${widget.viewModel?.file?.name} seçildi',
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
    );
  }
}
