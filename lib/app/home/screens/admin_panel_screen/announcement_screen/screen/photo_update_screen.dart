import '../../../../../../export_import.dart';

class UpdatePhotoScreen extends StatefulWidget {
  final NoticeData? data;
  final AnnouncementUpdateScreen? widget;

  const UpdatePhotoScreen({Key? key, this.data, this.widget}) : super(key: key);

  @override
  State<UpdatePhotoScreen> createState() => _UpdatePhotoScreenState();
}

class _UpdatePhotoScreenState extends State<UpdatePhotoScreen> {
  final AnnouncementUpdateViewModel _viewModel = AnnouncementUpdateViewModel();

  @override
  void initState() {
    super.initState();
    _viewModel.setBuildContext(context);
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
              TabItem(icon: Icons.delete),
            ],
            onTap: (i) async {
              if (i == 0) {
                await _viewModel.getImage(ImageSource.gallery);
              }
              if (i == 1) {
                await _viewModel.getImage(ImageSource.camera);
              }
              if (i == 2) {
                if (_viewModel.cropImagePath != '') {
                  _viewModel.issave == true;
                  await _viewModel.GetPhoto();
                  Flushbar(
                    message: mSuccessfulImageMessage,
                    flushbarPosition: FlushbarPosition.TOP,
                    duration: const Duration(seconds: 1),
                    borderRadius: BorderRadius.circular(2),
                    backgroundColor: Colors.black.withOpacity(0.5),
                  ).show(context).then(
                      (value) => Navigator.pop(context, _viewModel.photo));
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
                _viewModel.deleteMemoryImage();
              }
            },
          ),
          body: Observer(
            builder: (context) => _viewModel.cropImagePath == ''
                ? Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: const Center(
                      child: Text(
                        "Select image from camera/gallery",
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                  )
                : Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.grey,
                    child: Image.file(
                      File(
                        _viewModel.cropImagePath,
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
