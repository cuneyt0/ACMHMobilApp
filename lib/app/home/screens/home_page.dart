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
        const Center(
          child: Text(
            "ETKİNLİKLER",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Observer(builder: (context) {
          return Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: GridView.builder(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: widget
                    .viewModel?.getbyidrecentlyActivitiyresponse?.data?.length,
                padding: const EdgeInsets.only(
                    left: 5, right: 5, top: 20, bottom: 20),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 5,
                ),
                itemBuilder: (context, index) => Container(
                      child: Stack(fit: StackFit.expand, children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 0, bottom: 30),
                          child: InkWell(
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: ((context) =>
                                    DrawerAnnouncementDetailScreen(
                                      model: widget
                                          .viewModel
                                          ?.getbyidrecentlyActivitiyresponse
                                          ?.data?[index],
                                    )),
                              ),
                            ),
                            child: CustomImage(
                              viewModel: widget.viewModel!,
                              index: index,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            SizedBox(
                              height: 30,
                              width: MediaQuery.of(context).size.width * 1,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue.shade100,
                                    borderRadius: BorderRadius.circular(0)),
                                child: Center(
                                  child: Text(
                                    widget
                                            .viewModel
                                            ?.getbyidrecentlyActivitiyresponse
                                            ?.data?[index]
                                            .title ??
                                        "",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    )),
          );
        })
      ]),
    );
  }
}

class CustomImage extends StatefulWidget {
  const CustomImage({
    Key? key,
    required this.viewModel,
    required this.index,
  }) : super(key: key);
  final int index;
  final HomeViewModel viewModel;

  @override
  State<CustomImage> createState() => _CustomImageState();
}

class _CustomImageState extends State<CustomImage> {
  @override
  void initState() {
    super.initState();
    widget.viewModel
        .getImage(widget.viewModel.getbyidrecentlyActivitiyresponse
                ?.data?[widget.index].imagePath ??
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
