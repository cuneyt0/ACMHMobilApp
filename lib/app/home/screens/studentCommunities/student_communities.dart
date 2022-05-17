import 'package:login_work/export_import.dart';

class StudentCommunities extends StatefulWidget {
  const StudentCommunities({
    Key? key,
  }) : super(key: key);
  @override
  State<StudentCommunities> createState() => _StudentCommunitiesState();
}

class _StudentCommunitiesState extends State<StudentCommunities> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'https://topluluk.erbakan.edu.tr',
        ),
      );
}
