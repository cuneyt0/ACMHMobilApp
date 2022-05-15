
import 'package:login_work/export_import.dart';
import 'package:login_work/core/extension/context_extension.dart';
class AdminActivityUpdateImageButton extends StatelessWidget {
  const AdminActivityUpdateImageButton({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ActivityUpdateScreen widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => ActivityUpdateImageScreen(
            viewModel: widget.viewModel,
            data: widget.data,
            model: widget.model,
            getAllViewModel: widget.getAllViewModel,
          ),
        ),
      ),
      child: const Text(mUploadImage),
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all<Size>(
          Size(context.width * 1, context.highValue),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(context.width * 1, context.mediumValue),
        ),
      ),
    );
  }
}
