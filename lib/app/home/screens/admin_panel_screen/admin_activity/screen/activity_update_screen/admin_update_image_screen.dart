import 'package:login_work/export_import.dart';

class ActivityUpdateImageScreen extends StatefulWidget {
  final NoticeData? data;
  final LoginResponseModel? model;
  final ActivityAddViewModel? viewModel;
  final AdminActivityAllViewModel? getAllViewModel;

  const ActivityUpdateImageScreen({
    Key? key,
    this.data,
    this.model,
    this.viewModel,
    this.getAllViewModel,
  }) : super(key: key);

  @override
  State<ActivityUpdateImageScreen> createState() =>
      _ActivityUpdateImageScreenState();
}

class _ActivityUpdateImageScreenState extends State<ActivityUpdateImageScreen> {
  @override
  void initState() {
    widget.viewModel?.setBuildContext(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Observer(
        builder: (context) => Scaffold(
          appBar: AppBar(
            title: const Text(mUpdateImage),
          ),
          bottomNavigationBar: ConvexAppBar(
            initialActiveIndex: 1,
            backgroundColor: Colors.blue,
            items: const [
              TabItem(icon: Icons.photo),
              TabItem(icon: Icons.camera),
              TabItem(icon: Icons.save),
              //TabItem(icon: Icons.delete),
            ],
            onTap: (i) async {
              if (i == 0) {
                await widget.viewModel?.getImage(ImageSource.gallery);
              }
              if (i == 1) {
                await widget.viewModel?.getImage(ImageSource.camera);
              }
              if (i == 2) {
                if (widget.viewModel?.cropImagePath != '') {
                  widget.viewModel?.issave == true;
                  await widget.viewModel?.getPhoto();
                  Flushbar(
                    message: mSuccessfulImageMessage,
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: const Duration(seconds: 1),
                    borderRadius: BorderRadius.circular(2),
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ).show(context).then((value) =>
                      Navigator.pop(context, widget.viewModel?.photo));
                } else {
                  Flushbar(
                    message: mSelectImage,
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: const Duration(seconds: 1),
                    borderRadius: BorderRadius.circular(2),
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ).show(context);
                }
              }
              if (i == 3) {
                widget.viewModel?.deleteMemoryImage();
              }
            },
          ),
          body: Observer(
            builder: (context) => widget.viewModel?.cropImagePath == ''
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: Image.memory(
                      widget.getAllViewModel?.photo,
                      fit: BoxFit.contain,
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey,
                    child: Image.file(
                      File(
                        widget.viewModel?.cropImagePath ?? '',
                      ),
                      height: MediaQuery.of(context).size.height,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
