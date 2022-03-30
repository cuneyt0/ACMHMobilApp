import 'package:login_work/export_import.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExamInformationSystemScreen extends StatelessWidget {
  const ExamInformationSystemScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: DrawerMenu(),
        body: WebView(
          initialUrl: 'http://sacmfsinav.tk',
        ));
  }
}
