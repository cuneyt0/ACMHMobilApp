import 'package:login_work/export_import.dart';

class ExamInformationSystemScreen extends StatefulWidget {
  ExamInformationSystemScreen({required this.model});

  final LoginResponseModel? model;
  @override
  State<ExamInformationSystemScreen> createState() =>
      _ExamInformationSystemScreenState();
}

class _ExamInformationSystemScreenState
    extends State<ExamInformationSystemScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: DrawerMenu(
          model: widget.model,
        ),
        body: Container(
          child: Text(widget.model?.user?.firstName ?? ' boş'),
        ));
  }
}
