import 'package:another_flushbar/flushbar.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:image_picker/image_picker.dart';

import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/viewmodel/announcement_view_model.dart';

import '../../../../../../export_import.dart';

class PhotoAddedScreen extends StatelessWidget {
  const PhotoAddedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AnnouncementViewModel _viewModel = AnnouncementViewModel();
    return SafeArea(
      child: Observer(
          builder: (context) => Scaffold(
              appBar: AppBar(
                title: Text("Resim Yükle"),
              ),
              bottomNavigationBar: ConvexAppBar(
                initialActiveIndex: 1,
                backgroundColor: Colors.blue,
                items: [
                  TabItem(icon: Icons.photo),
                  TabItem(icon: Icons.camera),
                  TabItem(icon: Icons.save),
                  TabItem(icon: Icons.delete),
                ],
                onTap: (i) async {
                  if (i == 0) {
                    print("clicl index $i");
                    await _viewModel.getImage(ImageSource.gallery);
                  }
                  if (i == 1) {
                    print("clicl index $i");
                    await _viewModel.getImage(ImageSource.camera);
                  }
                  if (i == 2) {
                    print("clicl index $i");

                    if (_viewModel.cropImagePath != '') {
                      _viewModel.issave == true;
                      await _viewModel.GetPhoto();
                      Flushbar(
                        message: 'Resim Başarıyla eklendi',
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 1),
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ).show(context).then(
                          (value) => Navigator.pop(context, _viewModel.photo));
                    } else {
                      Flushbar(
                        message: "Resim Seçiniz",
                        flushbarPosition: FlushbarPosition.TOP,
                        duration: Duration(seconds: 1),
                        borderRadius: BorderRadius.circular(2),
                        backgroundColor: Colors.black.withOpacity(0.5),
                      ).show(context);
                    }
                  }
                  if (i == 3) {
                    print("clicl index $i");
                    _viewModel.deleteMemoryImage();
                  }
                },
              ),
              body: Observer(
                  builder: (context) => _viewModel.cropImagePath == ''
                      ? Container(
                          height: MediaQuery.of(context).size.height,
                          color: Colors.white,
                          child: Center(
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
                          ))))),
    );
  }
}
/*
  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        duration: Duration(seconds: 1),
                        backgroundColor: Colors.red,
                        content: Text(
                          _viewModel.photo ?? "photo boş",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    );

 */