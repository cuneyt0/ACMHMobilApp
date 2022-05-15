import 'package:login_work/export_import.dart';
import 'package:login_work/core/extension/context_extension.dart';
class BuildActivityPdfWidget extends StatelessWidget {
  const BuildActivityPdfWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ActivityAddViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () => viewModel?.uploadPdf().then((value) => Flushbar(
              message: '${viewModel?.file?.name} Seçildi',
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
