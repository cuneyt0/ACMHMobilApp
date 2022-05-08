import 'package:login_work/export_import.dart';

class StudentCommunities extends StatefulWidget {
  final LoginResponseModel? model;

   StudentCommunities({Key? key, this.model}) : super(key: key);
  @override
  State<StudentCommunities> createState() => _StudentCommunitiesState();
}

class _StudentCommunitiesState extends State<StudentCommunities> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        drawer: DrawerMenu(
          model: widget.model,
        ),
        body: const WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://topluluk.erbakan.edu.tr',
        ),
      );
}
