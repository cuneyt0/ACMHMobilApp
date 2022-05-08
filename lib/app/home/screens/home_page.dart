import '../../../export_import.dart';

class HomePage extends StatefulWidget {
  final LoginResponseModel? model;
  final CacheManager? cacheManager;
  final bool? isClear;
  final HomeViewModel? viewModel;
  const HomePage(
      {Key? key, this.model, this.cacheManager, this.isClear, this.viewModel})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerMenu(
          context: context,
          cacheManager: widget.cacheManager,
          isClear: widget.isClear,
          model: widget.model),
      body: ListView(physics: const BouncingScrollPhysics(), children: [
        const Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Center(
            child: Text(
              mAnnouncement,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        HomeScreenAnnouncementWidget(widget: widget),
      ]),
    );
  }
}
