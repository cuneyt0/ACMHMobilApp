import 'package:login_work/app/home/viewmodel/home_view_model.dart';

import '../../../export_import.dart';

class HomePage extends StatefulWidget {
  final LoginResponseModel? model;
  final CacheManager? cacheManager;
  final bool? isClear;
  final HomeViewModel? viewModel;
  const HomePage({Key? key, this.model, this.cacheManager, this.isClear,this.viewModel})
      : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // _viewModel?.getbyidrecently();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        drawer: DrawerMenu(
            context: context,
            cacheManager: widget.cacheManager,
            isClear: widget.isClear,
            model: widget.model),
        body: Observer(
            builder: (context) =>
                widget.viewModel?.getbyidrecentlyresponse?.data == null
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount:
                           widget.viewModel?.getbyidrecentlyresponse?.data?.length,
                        itemBuilder: (context, index) => ListTile(
                          title: Text(widget.viewModel?.getbyidrecentlyresponse
                                  ?.data?[index].title ??
                              ""),
                        ),
                      )));
  }
}
/*

ListView.builder(
          itemCount: widget.model?.userClaims?.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(widget.model?.userClaims?[index].name ?? ""),
          ),
        )

 */