import '../../export_import.dart';

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
      body: Column(
        children: [
          Center(
            child: Text(model?.token ?? ''),
          ),
          SizedBox(
            height: context.lowValue,
          ),
          Center(
            child: Text(model?.user!.firstName ?? ""),
          ),
          Center(
            child: model?.user!.departmentId == 2
                ? const Text(departmentComputerText)
                : const Text(departmentMachineText),
          ),
          ElevatedButton(
              onPressed: () {
                model?.user = null;
                isClear != isClear;
                model?.token = null;
                model?.expiration = 0;
                if (model!.user == null) {
                  cacheManager?.removeAllData();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (context) => LoginView()),
                      (Route<dynamic> route) => false);
                } else {
                  exit(0);
                }
              },
              child: const Text(btSignOut))
        ],
      ),
    );
  }
}
