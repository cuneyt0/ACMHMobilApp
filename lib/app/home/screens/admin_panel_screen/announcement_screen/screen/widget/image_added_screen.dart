import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/screen/photo_added_screen.dart';
import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/viewmodel/announcement_view_model.dart';
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
          onPressed: () async {
            _viewModel?.addedPhoto = await Navigator.of(context).push(
                MaterialPageRoute(builder: ((context) => PhotoAddedScreen())));
          },
          child: Text("RESİM YÜKLE"),
          style: ButtonStyle(
            maximumSize: MaterialStateProperty.all<Size>(
              Size(context.width * 1, context.highValue),
            ),
            minimumSize: MaterialStateProperty.all<Size>(
              Size(context.width * 1, context.mediumValue),
            ),
          )),
    );
  }
}
