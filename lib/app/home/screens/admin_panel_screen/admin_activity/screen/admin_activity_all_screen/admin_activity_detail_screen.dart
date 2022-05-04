import 'package:login_work/export_import.dart';

class AdminActivityDetailScreen extends StatefulWidget {
  final NoticeData? responseData;
  final LoginResponseModel? model;
  const AdminActivityDetailScreen({Key? key, this.responseData, this.model})
      : super(key: key);

  @override
  State<AdminActivityDetailScreen> createState() =>
      _AdminActivityDetailScreenState();
}

class _AdminActivityDetailScreenState extends State<AdminActivityDetailScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(title: Text('${widget.responseData?.title}')),
      );
}
