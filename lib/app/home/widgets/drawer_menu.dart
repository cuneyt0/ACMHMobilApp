import 'package:login_work/app/home/screens/announcements/screen/drawermenu_Announcement_screen.dart';
import 'package:login_work/app/home/screens/courseInformation/course_information.dart';
import 'package:login_work/export_import.dart';

class DrawerMenu extends StatelessWidget {
  DrawerMenu(
      {Key? key, this.context, this.cacheManager, this.isClear, this.model})
      : super(key: key);
  BuildContext? context;
  LoginResponseModel? model;
  CacheManager? cacheManager;
  bool? isClear;
  int? index;
  @override
  Widget build(BuildContext context) {
    var adminYetkisi = model?.userClaims?[0].name == 'admin';
    return Container(
      child: Drawer(
          child: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Expanded(child: _buildMenuHeader(model)),
            Expanded(
                flex: 4,
                child: adminYetkisi
                    ? _buildAdminMenuBody(model, cacheManager)
                    : _buildNormalMenuBody(model, cacheManager)),
            _buildMenuExit(context, model, cacheManager, isClear),
          ],
        ),
      )),
    );
  }
}

//DrawerAnnouncementScreen
//exam information system
Widget _buildNormalMenuBody(
        LoginResponseModel? model, CacheManager? cacheManager) =>
    ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: NormalMenu.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(NormalMenu[index]),
          onTap: () async {
            if (NormalMenu[index] == mExam) {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => ExamInformationSystemScreen(
                        model: model,
                      )),
                ),
              );
            }
            if (NormalMenu[index] == mAnnouncement) {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const DrawerAnnouncementScreen()),
                ),
              );
            }
            if (NormalMenu[index] == mShowCourseInformation) {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => CourseInformationScreen(
                        model: model,
                      )),
                ),
              );
            }
          },
        ),
      ),
    );

Widget _buildAdminMenuBody(
        LoginResponseModel? model, CacheManager? cacheManager) =>
    ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: AdminMenu.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(AdminMenu[index]),
          onTap: () async {
            if (AdminMenu[index] == mExam) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => ExamInformationSystemScreen(
                        model: model,
                      )),
                ),
              );
            }
            if (AdminMenu[index] == mAdminPanel) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => AdminPanelScreen(
                        model: model,
                      )),
                ),
              );
            }
            if (AdminMenu[index] == mShowCourseInformation) {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => CourseInformationScreen(
                        model: model,
                      )),
                ),
              );
            }
            if (AdminMenu[index] == mAnnouncement) {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: ((context) => const DrawerAnnouncementScreen()),
                ),
              );
            }
          },
        ),
      ),
    );

Widget _buildMenuHeader(LoginResponseModel? model) {
  return Padding(
    padding: const EdgeInsets.only(top: 90),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "${model?.user?.firstName!} ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              model?.user?.lastName ?? " ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const Divider(
          color: Colors.blue,
          height: 10,
        ),
        Center(
          child: model?.user?.departmentId == 2
              ? const Text(
                  departmentComputerText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              : const Text(
                  departmentMachineText,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
        ),
      ],
    ),
  );
}

Widget _buildMenuExit(BuildContext context, LoginResponseModel? model,
    CacheManager? cacheManager, bool? isClear) {
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width * 1,
      child: ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
          ),
          onPressed: () async {
            model?.user = null;
            isClear != isClear;
            model?.token = null;
            model?.expiration = 0;
            if (model?.user == null) {
              await cacheManager?.removeAllData();
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (context) => LoginView()),
                  (Route<dynamic> route) => false);
            } else {
              exit(0);
            }
          },
          child: const Text(
            btSignOut,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          )),
    ),
  );
}
