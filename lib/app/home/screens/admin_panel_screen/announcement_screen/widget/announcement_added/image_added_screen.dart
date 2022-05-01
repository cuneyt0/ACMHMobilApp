import 'package:login_work/export_import.dart';

class ImageAddedScreen extends StatelessWidget {
  const ImageAddedScreen({
    Key? key,
    required AnnouncementViewModel? viewModel,
  })  : _viewModel = viewModel,
        super(key: key);

  final AnnouncementViewModel? _viewModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0, left: 5, right: 5),
      child: ElevatedButton(
        onPressed: () async =>
            _viewModel?.addedPhoto = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) => const PhotoAddedScreen()),
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
      ),
    );
  }
}
