import '../../../export_import.dart';

class HomePage extends StatefulWidget {
  final LoginResponseModel? model;
  final CacheManager? cacheManager;
  final bool? isClear;

  const HomePage({Key? key, this.model, this.cacheManager, this.isClear})
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
        body: ListView.builder(
          itemCount: widget.model?.userClaims?.length,
          itemBuilder: (context, index) => ListTile(
            title: Text(widget.model?.userClaims?[index].name ?? ""),
          ),
        ));
  }
}
