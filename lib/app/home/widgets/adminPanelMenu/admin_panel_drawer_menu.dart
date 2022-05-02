import 'package:login_work/export_import.dart';

class AdminPanelDrawerMenu extends StatelessWidget {
  AdminPanelDrawerMenu({Key? key, required this.model}) : super(key: key);
  LoginResponseModel? model;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: Container(
          color: Colors.blue,
          child: Column(
            children: [
              Expanded(child: _buildMenuHeader(model)),
              Expanded(
                flex: 4,
                child: _buildAdminMenuBody(model),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildMenuHeader(
  LoginResponseModel? model,
) {
  return Padding(
    padding: const EdgeInsets.only(top: 90),
    child: Column(
      children: [
        const Expanded(
            child: Text(
          welcome,
          style: TextStyle(fontWeight: FontWeight.bold),
        )),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            const Divider(color: Colors.white),
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
      ],
    ),
  );
}

Widget _buildAdminMenuBody(
  LoginResponseModel? model,
) =>
    ListView.builder(
      itemCount: AdminPanelMenu.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(AdminPanelMenu[index]),
          onTap: () async {
            if (AdminPanelMenu[index] == mHome) {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => HomePage(
                      model: model,
                    ),
                  ),
                  (Route<dynamic> route) => false);
            }
            if (AdminPanelMenu[index] == mAddedAnnouncement) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AnnouncementScreen(model: model),
                ),
              );
            }
            if (AdminPanelMenu[index] == mShowAnnouncement) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AllAnnouncementScreen(
                    model: model,
                  ),
                ),
              );
            }
            if (AdminPanelMenu[index] == mDeparmtent) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DepartmentAddScreen(
                    model: model,
                  ),
                ),
              );
            }
            if (AdminPanelMenu[index] == mShowDeparmtent) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => DepartmentGetAllScreen(),
                ),
              );
            }
          },
        ),
      ),
    );
