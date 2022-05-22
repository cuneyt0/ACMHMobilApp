import 'package:login_work/export_import.dart';

class CafeteriaScreen extends StatefulWidget {
  const CafeteriaScreen({Key? key}) : super(key: key);

  @override
  State<CafeteriaScreen> createState() => _CafeteriaScreenState();
}

class _CafeteriaScreenState extends State<CafeteriaScreen> {
  final CafeteriaViewModel? _viewModel = CafeteriaViewModel();
  @override
  void initState() {
    _viewModel?.getCafeteriRecently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(mCafeteriaTitle),
      ),
      body: Observer(
        builder: (context) => ListView.builder(
          itemCount: _viewModel?.responseModel?.data?.length,
          itemBuilder: (context, index) => Card(
            child: ListTile(
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => DrawerAnnouncementDetailScreen(
                        model: _viewModel?.responseModel?.data?[index],
                      )),
                ),
              ),
              title: Text('${_viewModel?.responseModel?.data?[index].title}'),
            ),
          ),
        ),
      ),
    );
  }
}
