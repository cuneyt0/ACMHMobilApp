import 'package:login_work/export_import.dart';

class HomeScreenActivityWidget extends StatelessWidget {
  const HomeScreenActivityWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.35,
        child: GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: widget
                .viewModel?.getbyidrecentlyActivitiyresponse?.data?.length,
            padding:
                const EdgeInsets.only(left: 5, right: 5, top: 20, bottom: 20),
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
                          viewModel: widget.viewModel,
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
    });
  }
}
