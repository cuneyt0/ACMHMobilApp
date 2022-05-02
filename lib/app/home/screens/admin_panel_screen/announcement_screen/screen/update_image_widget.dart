import 'package:login_work/export_import.dart';

class UpdateImageWidget extends StatelessWidget {
  const UpdateImageWidget({
    Key? key,
    required AnnouncementUpdateViewModel? viewModel,
    required this.widget,
  })  : _viewModel = viewModel,
        super(key: key);

  final AnnouncementUpdateViewModel? _viewModel;
  final AnnouncementUpdateScreen widget;

  @override
  Widget build(BuildContext context) {
    _viewModel?.addedPhoto == widget.data?.imagePath;
    return Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 10, right: 10),
      child: ElevatedButton(
        onPressed: () async =>
            _viewModel?.addedPhoto = await Navigator.of(context).push(
          MaterialPageRoute(
            builder: ((context) =>
                UpdatePhotoScreen(data: widget.data, widget: widget)),
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
