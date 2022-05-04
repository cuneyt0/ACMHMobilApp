import 'package:login_work/export_import.dart';

class BuildPostActivityWidget extends StatelessWidget {
  const BuildPostActivityWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ActivityAddViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async => await viewModel?.postActivity(),
      child: const Text(dAddText),
    );
  }
}
