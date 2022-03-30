import '../../../export_import.dart';

class HomePage extends StatelessWidget {
  final LoginResponseModel? model;
  final CacheManager? cacheManager;
  final bool? isClear;

  const HomePage(
      {Key? key, required this.model, this.cacheManager, this.isClear})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: DrawerMenu(
          context: context,
          cacheManager: cacheManager,
          isClear: isClear,
          model: model),
      body: ListView.builder(
        itemCount: model?.userClaims?.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(model?.userClaims?[index].name ?? "asd"),
        ),
      ),
    );
  }
}
