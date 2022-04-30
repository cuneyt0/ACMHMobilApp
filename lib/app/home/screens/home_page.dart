import 'package:login_work/app/home/screens/announcements/screen/drawerMenu_Announcement_detail_screen.dart';
import 'package:login_work/app/home/viewmodel/home_view_model.dart';

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
      body: ListView(children: [
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

class HomeScreenAnnouncementWidget extends StatelessWidget {
  const HomeScreenAnnouncementWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.32,
      child: Observer(
        builder: (context) => widget.viewModel?.getbyidrecentlyresponse?.data ==
                null
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : GridView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                padding:
                    EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 20),
                itemCount:
                    widget.viewModel?.getbyidrecentlyresponse?.data?.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1, mainAxisSpacing: 5, crossAxisSpacing: 5),
                itemBuilder: (context, index) => Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 1,
                      height: 30,
                      child: Card(
                        child: Center(
                          child: Text(
                            widget.viewModel!.dateFormat(DateTime.parse(
                                '${widget.viewModel?.getbyidrecentlyresponse?.data?[index].createdAt}')),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: ((context) => DrawerAnnouncementDetailScreen(
                                model: widget.viewModel?.getbyidrecentlyresponse
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
                          padding: widget.viewModel?.getbyidrecentlyresponse
                                      ?.data?[index].title?.length.isOdd !=
                                  false
                              ? EdgeInsets.all(20)
                              : EdgeInsets.all(0),
                          child: Center(
                            child: Text(
                              widget.viewModel?.getbyidrecentlyresponse
                                      ?.data?[index].title ??
                                  "",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}
