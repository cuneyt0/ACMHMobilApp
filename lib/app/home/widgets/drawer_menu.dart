import 'package:login_work/export_import.dart';

List<dynamic> AdminMenu = [
  "ANASAYFA",
  "YEMEK SAYFASI",
  "SINAV BİLGİ SİSTEMİ",
  "DUYURU ",
  "ETKİNLİK VE TAKVİMİ",
  "SINAV BİLGİ SİSTEMİ",
  "ADMİN PANELİ",
];
List<dynamic> NormalMenu = [
  "ANASAYFA",
  "YEMEK SAYFASI",
  "SINAV BİLGİ SİSTEMİ",
  "DUYURU ",
  "ETKİNLİK VE TAKVİMİ",
  "SINAV BİLGİ SİSTEMİ",
];
Widget DrawerMenu(BuildContext context, LoginResponseModel? model,
    CacheManager? cacheManager, bool? isClear) {
  return Drawer(
      child: Container(
    child: Column(
      children: [
        Expanded(child: _buildMenuHeader(model)),
        Expanded(
            flex: 4,
            child: model!.userClaims!.contains("admin")
                ? _buildAdminMenuBody()
                : _buildNormalMenuBody()),
        _buildMenuExit(context, model, cacheManager, isClear),
      ],
    ),
  ));
}

Widget _buildNormalMenuBody() => ListView.builder(
      itemCount: NormalMenu.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(NormalMenu[index]),
        onTap: () {
          print("${NormalMenu[index]} Tıklanıldı");
        },
      ),
    );
Widget _buildAdminMenuBody() => ListView.builder(
      itemCount: AdminMenu.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(AdminMenu[index]),
        onTap: () {
          print("${AdminMenu[index]} Tıklanıldı");
        },
      ),
    );

Widget _buildMenuHeader(
  LoginResponseModel? model,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 90),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("${model?.user?.firstName ?? " "} "),
            Text(model?.user?.lastName ?? " "),
          ],
        ),
        const Divider(color: Colors.white),
        Center(
          child: model?.user?.departmentId == 2
              ? const Text(departmentComputerText)
              : const Text(departmentMachineText),
        ),
      ],
    ),
  );
}

Widget _buildMenuExit(BuildContext context, LoginResponseModel? model,
    CacheManager? cacheManager, bool? isClear) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: ElevatedButton(
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
        child: const Text(btSignOut)),
  );
}
