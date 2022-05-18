import 'package:login_work/app/home/screens/admin_panel_screen/admin_cafeteria/screen/cafeteriaAddedScreen.dart';
import 'package:login_work/export_import.dart';

class AdminPanelDrawerMenu extends StatelessWidget {
  AdminPanelDrawerMenu({Key? key, required this.model, required this.viewModel})
      : super(key: key);
  LoginResponseModel? model;
  HomeViewModel? viewModel;

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
                child: _buildAdminMenuBody(model, viewModel),
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
  HomeViewModel? viewModel,
) =>
    ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: AdminPanelMenu.length,
      itemBuilder: (context, index) => Card(
        child: ListTile(
          title: Text(AdminPanelMenu[index]),
          onTap: () async {
            if (AdminPanelMenu[index] == mHome) {
              await viewModel?.getbyidrecentlyActivities();
              await viewModel
                  ?.getbyidrecently()
                  .then((value) => Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => HomePage(
                          model: model,
                          viewModel: viewModel,
                        ),
                      ),
                      (Route<dynamic> route) => false));
            }
            if (AdminPanelMenu[index] == mAddedAnnouncement) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AnnouncementScreen(model: model),
                ),
              );
            }
            if (AdminPanelMenu[index] == mShowActivity) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdminActivityAllScreen(model: model),
                ),
              );
            }
            if (AdminPanelMenu[index] == mCafeteriaAdded) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CafeteriaAddedScreen(model: model),
                ),
              );
            }
            if (AdminPanelMenu[index] == mCafeteriaGetall) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CafeteriaAddedScreen(model: model),
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
            if (AdminPanelMenu[index] == mActivityAdd) {
              Navigator.of(context).pop();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => AdminActivityAddScreen(model: model),
                ),
              );
            }
          },
        ),
      ),
    );
