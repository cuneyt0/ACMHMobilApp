import 'package:login_work/export_import.dart';

List<dynamic> menuItem = [
  "ANASAYFA",
  "YEMEKHANE",
  "SINAV BİLGİ SİSTEMİ",
  "DUYURU ",
  "DERS BİLGİLERİ",
  "ETKİNLİKLER",
  "ADMİN PANELİ",
  "MenuItem1",
  "MenuItem2",
];
Widget DrawerMenu(BuildContext context, LoginResponseModel? model,
    CacheManager? cacheManager, bool? isClear) {
  return Drawer(
      child: Container(
    child: Column(
      children: [
        Expanded(child: _buildMenuHeader(model)),
        Expanded(flex: 3, child: _buildMenuBody()),
        Expanded(child: _buildMenuExit(context, model, cacheManager, isClear)),
      ],
    ),
  ));
}

Widget _buildMenuBody() => ListView.builder(
      itemCount: menuItem.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(menuItem[index]),
        onTap: () {
          print("${menuItem[index]} Tıklanıldı");
        },
      ),
    );

Widget _buildMenuHeader(LoginResponseModel? model) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("${model?.user?.firstName ?? " "} "),
          Text(model?.user?.lastName ?? " "),
        ],
      ),
      Divider(color: Colors.white),
      Center(
        child: model?.user?.departmentId == 2
            ? const Text(departmentComputerText)
            : const Text(departmentMachineText),
      ),
    ],
  );
}

Widget _buildMenuExit(BuildContext context, LoginResponseModel? model,
    CacheManager? cacheManager, bool? isClear) {
  return ElevatedButton(
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
      child: const Text(btSignOut));
}
