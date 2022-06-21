import 'package:login_work/export_import.dart';

class HomeScreenAnnouncementWidget extends StatelessWidget {
  const HomeScreenAnnouncementWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.22,
      child: Observer(
        builder: (context) => widget.viewModel?.getbyidrecentlyresponse?.data ==
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
                              ? const EdgeInsets.all(20)
                              : const EdgeInsets.all(0),
                          child: Center(
                            child: Text(
                              widget.viewModel?.getbyidrecentlyresponse
                                      ?.data?[index].title ??
                                  "",
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  overflow: TextOverflow.ellipsis),
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
