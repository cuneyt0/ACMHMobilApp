import 'package:login_work/export_import.dart';

class CourseInformationScreen extends StatefulWidget {
  final LoginResponseModel? model;
  const CourseInformationScreen({Key? key, this.model}) : super(key: key);

  @override
  State<CourseInformationScreen> createState() =>
      _CourseInformationScreenState();
}

class _CourseInformationScreenState extends State<CourseInformationScreen> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text(mShowCourseInformation),
        ),
        body: widget.model?.user?.departmentId == 2
            ? const WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl:
                    'https://www.erbakan.edu.tr/seydisehirbilgisayar/ders-programi',
              )
            : const WebView(
                javascriptMode: JavascriptMode.unrestricted,
                initialUrl:
                    'https://www.erbakan.edu.tr/seydisehirmakinemuhendisligi/ders-programi',
              ),
      );
}
