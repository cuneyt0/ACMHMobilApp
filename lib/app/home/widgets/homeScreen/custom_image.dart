import 'package:login_work/export_import.dart';

class CustomImage extends StatefulWidget {
  const CustomImage({
    Key? key,
    this.viewModel,
    this.index,
  }) : super(key: key);
  final int? index;
  final HomeViewModel? viewModel;

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel
        ?.getImage(widget.viewModel?.getbyidrecentlyActivitiyresponse
                ?.data?[widget.index!].imagePath ??
            "")
        .then((value) {
      //
      photo = value;
      setState(() {
        _isLoading = false;
      });
    });
  }

  Uint8List? photo;
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : photo != null
            ? Image.memory(
                photo ?? Uint8List(0),
                fit: BoxFit.fill,
              )
            : Center(
                child: Image.asset(assetNeuLogo),
              );
  }
}
