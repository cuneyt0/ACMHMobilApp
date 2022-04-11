import 'package:login_work/app/home/screens/admin_panel_screen/announcement_screen/screen/announcement_detail_screen.dart';
import 'package:login_work/export_import.dart';

import '../../../../viewmodel/home_view_model.dart';

class AllAnnouncementScreen extends StatefulWidget {
  const AllAnnouncementScreen({Key? key}) : super(key: key);

  @override
  State<AllAnnouncementScreen> createState() => _AllAnnouncementScreenState();
}

class _AllAnnouncementScreenState extends State<AllAnnouncementScreen> {
  HomeViewModel _viewModel = HomeViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel.getAllNotice();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("DUYURULAR")),
      body: Observer(
        builder: ((context) => ListView.builder(
            itemCount: _viewModel.responseData?.data?.length,
            itemBuilder: (context, index) => ListTile(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: ((context) => AnnouncementDetail(
                              responseData:
                                  _viewModel.responseData?.data?[index],
                            ))));
                  },
                  title: Text(_viewModel.responseData?.data?[index].title ??
                      'Yükleniyor...'),
                  trailing: IconButton(
                      onPressed: () {
                        print("delete");
                        //showDialog(context: context, builder:(context)=> );
                      },
                      icon: Icon(Icons.delete)),
                ))),
      ),
    );
  }
}
/*
    return Scaffold(
        appBar: AppBar(title: Text("DUYURULAR")),
        body: Container(child: res != null ? Image.memory(res) : Text("test")),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            _viewModel.getImage("00").then((value) {
              //print(value);

              setState(() {
                res = value;
              });
            });
          }),
        )); */

/*


 Observer(
          builder: ((context) => ListView.builder(
              itemCount: _viewModel.responseData?.data?.length,
              itemBuilder: (context, index) => ListTile(
                    title: Text(
                        _viewModel.responseData?.data?[index].title ?? 'null'),
                    trailing: Icon(Icons.delete),
                  ))),
        )


 */