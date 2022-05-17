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
        // HomeScreenAnnouncementWidget(widget: widget),
        Padding(
          padding: EdgeInsets.only(top: 15.0),
          child: Center(
            child: Text(
              "ETKİNLİKLER",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Container(
          height: MediaQuery.of(context).size.height * 0.39,
          child: Observer(
            builder: (context) =>
                widget.viewModel?.getbyidrecentlyActivitiyresponse?.data == null
                    ? const Center(
                        child: CircularProgressIndicator(),
                      )
                    : GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(
                            left: 5, right: 5, top: 20, bottom: 20),
                        itemCount: widget.viewModel
                            ?.getbyidrecentlyActivitiyresponse?.data?.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 1,
                                crossAxisSpacing: 5),
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                height: 30,
                                child: Card(
                                  child: Center(
                                    child: Text(
                                      widget.viewModel!.dateFormat(DateTime.parse(
                                          '${widget.viewModel?.getbyidrecentlyActivitiyresponse?.data?[index].createdAt}')),
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
                                          model: widget
                                              .viewModel
                                              ?.getbyidrecentlyActivitiyresponse
                                              ?.data?[index],
                                        )),
                                  ),
                                ),
                                child: Container(
                                  height: 250,
                                  width: MediaQuery.of(context).size.width * 1,
                                  decoration: BoxDecoration(
                                      // color: Colors.red,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding: widget
                                                .viewModel
                                                ?.getbyidrecentlyActivitiyresponse
                                                ?.data?[index]
                                                .title
                                                ?.length
                                                .isOdd !=
                                            false
                                        ? const EdgeInsets.all(20)
                                        : const EdgeInsets.all(0),
                                    child: Center(
                                      child: Column(
                                        children: [
                                          CustomImage(
                                            viewModel: widget.viewModel!,
                                            index: index,
                                          ),
                                          /*Text(
                                            widget
                                                    .viewModel
                                                    ?.getbyidrecentlyActivitiyresponse
                                                    ?.data?[index]
                                                    .title ??
                                                "",
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold),
                                          ),*/
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          );
                        }),
          ),
        ),
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
            ? Expanded(
                flex: 2,
                child: Image.memory(
                  photo ?? Uint8List(0),
                  height: 300,
                  fit: BoxFit.contain,
                ),
              )
            : Expanded(
                child: Center(
                  child: Image.asset(assetNeuLogo),
                ),
              );
  }
}
