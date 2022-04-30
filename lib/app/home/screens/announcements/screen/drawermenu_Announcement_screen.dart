import 'package:login_work/export_import.dart';

class DrawerAnnouncementScreen extends StatefulWidget {
  const DrawerAnnouncementScreen({Key? key}) : super(key: key);

  @override
  State<DrawerAnnouncementScreen> createState() =>
      _DrawerAnnouncementScreenState();
}

class _DrawerAnnouncementScreenState extends State<DrawerAnnouncementScreen> {
  final PublicAnnouncementViewModel? _viewModel = PublicAnnouncementViewModel();
  @override
  void initState() {
    _viewModel?.Changed();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Observer(builder: (context) {
          return Text(_viewModel!.appbartitle.toString());
        }),
        actions: [
          PopupMenuButton(
              itemBuilder: (context) => [
                    PopupMenuItem(
                      child: Observer(builder: (context) {
                        return ListTile(
                          onTap: () => _viewModel?.Changed(),
                          title: Text('${_viewModel?.deparmentName}'),
                        );
                      }),
                    ),
                  ])
        ],
      ),
      body: Observer(builder: (context) {
        return ListView.builder(
          itemCount: _viewModel?.getByIdResponse.data?.length,
          itemBuilder: (context, index) => ListTile(
            onTap: () => Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => DrawerAnnouncementDetailScreen(
                      model: _viewModel?.getByIdResponse.data?[index],
                    )))),
            title: Text(
                _viewModel?.getByIdResponse.data?[index].title.toString() ??
                    "yükleniyor"),
          ),
        );
      }),
    );
  }
}
