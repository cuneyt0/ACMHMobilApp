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
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView(physics: const BouncingScrollPhysics(), children: [
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
              Container(
                height: MediaQuery.of(context).size.height * 0.32,
                child: Observer(
                  builder: (context) => widget.viewModel?.responseModel?.data ==
                          null
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.only(
                              left: 5, right: 5, top: 20, bottom: 20),
                          itemCount:
                              widget.viewModel?.responseModel?.data?.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  mainAxisSpacing: 5,
                                  crossAxisSpacing: 5),
                          itemBuilder: (context, index) => Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                height: 30,
                                child: Card(
                                  child: Center(
                                    child: Text(
                                      widget.viewModel!.dateFormat(DateTime.parse(
                                          '${widget.viewModel?.responseModel?.data?[index].updatedAt}')),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: ((context) =>
                                        DrawerAnnouncementDetailScreen(
                                          model: widget.viewModel?.responseModel
                                              ?.data?[index],
                                        )),
                                  ),
                                ),
                                child: Container(
                                  height: 100,
                                  width: MediaQuery.of(context).size.width * 1,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: widget
                                                .viewModel
                                                ?.responseModel
                                                ?.data?[index]
                                                .title
                                                ?.length
                                                .isOdd !=
                                            false
                                        ? const EdgeInsets.all(20)
                                        : const EdgeInsets.all(0),
                                    child: Center(
                                      child: Text(
                                        widget.viewModel?.responseModel
                                                ?.data?[index].title ??
                                            "",
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
              ),
            ]),
    );
  }
}

class CustomImage extends StatefulWidget {
  const CustomImage({
    Key? key,
    this.viewModel,
    this.index,
  }) : super(key: key);
  final int? index;
  final HomeViewModel? viewModel;

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel
        ?.getImage(widget.viewModel?.getbyidrecentlyActivitiyresponse
                ?.data?[widget.index!].imagePath ??
            "")
        .then((value) {
      //
      photo = value;
      setState(() {
        _isLoading = false;
      });
    });
  }

  Uint8List? photo;
  bool _isLoading = true;
  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : photo != null
            ? Image.memory(
                photo ?? Uint8List(0),
                fit: BoxFit.fill,
              )
            : Center(
                child: Image.asset(assetNeuLogo),
              );
  }
}
