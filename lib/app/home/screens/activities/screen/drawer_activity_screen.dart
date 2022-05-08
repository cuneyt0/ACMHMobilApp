import 'package:login_work/app/home/screens/activities/viewmodel/public_activities_view_model.dart';
import 'package:login_work/export_import.dart';

class DrawerActivityScreen extends StatefulWidget {
  const DrawerActivityScreen({Key? key}) : super(key: key);

  @override
  State<DrawerActivityScreen> createState() => _DrawerActivityScreenState();
}

class _DrawerActivityScreenState extends State<DrawerActivityScreen> {
  final PublicActivityViewModel? _viewModel = PublicActivityViewModel();
  @override
  void initState() {
    _viewModel?.changed();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
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
                            onTap: () => _viewModel?.changed(),
                            title: Text('${_viewModel?.activityName}'),
                          );
                        }),
                      ),
                    ])
          ],
        ),
        body: Observer(
          builder: (context) => ListView.builder(
            itemCount: _viewModel?.getByIdResponse?.data?.length,
            itemBuilder: (context, index) => Card(
              child: ListTile(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: ((context) => DrawerAnnouncementDetailScreen(
                          model: _viewModel?.getByIdResponse?.data?[index],
                        )),
                  ),
                ),
                title: Text(
                    '${_viewModel?.getByIdResponse?.data?[index].title ?? ""}'),
              ),
            ),
          ),
        ),
      );
}
