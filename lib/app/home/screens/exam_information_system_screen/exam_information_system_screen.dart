import 'package:login_work/export_import.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ExamInformationSystemScreen extends StatefulWidget {
  const ExamInformationSystemScreen({Key? key}) : super(key: key);

  @override
  State<ExamInformationSystemScreen> createState() =>
      _ExamInformationSystemScreenState();
}

class _ExamInformationSystemScreenState
    extends State<ExamInformationSystemScreen> {
  @override
  void initState() {
    super.initState();
    // Enable virtual display.
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(),
        body: const WebView(
          javascriptMode: JavascriptMode.unrestricted,
          initialUrl: 'http://sacmfsinav.tk',
        ),
      );
}
