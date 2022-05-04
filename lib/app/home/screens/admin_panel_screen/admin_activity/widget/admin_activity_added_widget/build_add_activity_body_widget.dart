import 'package:login_work/export_import.dart';

class BuildAddActivityBodyWidget extends StatelessWidget {
  const BuildAddActivityBodyWidget({
    Key? key,
    required this.viewModel,
  }) : super(key: key);

  final ActivityAddViewModel? viewModel;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: viewModel?.formKey,
        child: Column(
          children: [
            BuildActivityTitleWidget(viewModel: viewModel),
            BuildActivityContentWidget(viewModel: viewModel),
            BuildActivityRowWidget(viewModel: viewModel),
            BuildActivityPdfWidget(viewModel: viewModel),
            BuildActivityImageWidget(viewModel: viewModel),
          ],
        ),
      ),
    );
  }
}
