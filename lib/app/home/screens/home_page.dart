import '../../../export_import.dart';

class HomePage extends StatefulWidget {
  final LoginResponseModel? model;
  final CacheManager? cacheManager;
  final bool? isClear;
  final HomeViewModel? viewModel;
  final isLoading = false;
  const HomePage(
      {Key? key, this.model, this.cacheManager, this.isClear, this.viewModel})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    getAllData().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
    super.initState();
    widget.viewModel?.setBuildContext(context);
  }

  Future<void> getAllData() async {
    await widget.viewModel?.getbyidrecentlyActivities();
    await widget.viewModel?.getbyidrecently();
    await widget.viewModel?.getCafeteriRecently();
  }

  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerMenu(
        context: context,
        cacheManager: widget.cacheManager,
        isClear: widget.isClear,
        model: widget.model,
      ),
      body: widget.isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              physics: const BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: Center(
                    child: Text(
                      mAnnouncement,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                HomeScreenAnnouncementWidget(widget: widget),
                const Center(
                  child: Text(
                    "ETKİNLİKLER",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                HomeScreenActivityWidget(widget: widget),
                const Center(
                  child: Text(
                    "YEMEKHANE",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                HomeScreenCafeteriaWidget(
                  widget: widget,
                ),
              ],
            ),
    );
  }
}
