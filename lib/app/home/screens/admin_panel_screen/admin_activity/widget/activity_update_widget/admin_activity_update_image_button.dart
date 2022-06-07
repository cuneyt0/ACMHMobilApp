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
    print("imagePath:${widget.data?.imagePath}");
    return ElevatedButton(
      onPressed: () async => widget.data?.imagePath != null
          ? widget.viewModel?.addedPhoto = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ActivityUpdateImageScreen(
                  viewModel: widget.viewModel,
                  data: widget.data,
                  model: widget.model,
                  getAllViewModel: widget.getAllViewModel,
                ),
              ),
            )
          : widget.viewModel?.addedPhoto = await Navigator.of(context).push(
              MaterialPageRoute(
                builder: ((context) => const AdminActivityPhotoScreen()),
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




 


/*

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

 */