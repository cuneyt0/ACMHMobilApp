import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:login_work/app/home/model/department_response_model.dart';
import 'package:login_work/app/home/viewmodel/announcement_view_model.dart';
import 'package:login_work/export_import.dart';

class AnnouncementScreen extends StatefulWidget {
  AnnouncementScreen();

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen> {
  AnnouncementViewModel? _viewModel = AnnouncementViewModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _viewModel?.getAllDepartment();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController controller1 = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: Text(mAddedAnnouncement)),
      body: Form(
          child: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
                //hintText: passwordlhinttext,
                labelText: aTitle,
                labelStyle: TextStyle(color: Colors.black),
                hintStyle: TextStyle(color: Colors.black),
              ),
            ),
          )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  maxLines: 10,
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    labelText: aContent,
                    hintText: "...",
                    labelStyle: TextStyle(color: Colors.black),
                    hintStyle: TextStyle(color: Colors.black),
                  ),
                ),
              )),
          Observer(
            builder: (context) => Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: Theme.of(context).primaryColor, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: DropdownButtonHideUnderline(
                child: DropdownButton(
                    value: _viewModel?.dropdownvalue,
                    hint: Text("Seçiniz"),
                    items: _viewModel?.responseData?.data?.map((e) {
                      return DropdownMenuItem<Data>(
                          value: e, child: Text(e.departmentName ?? "Null"));
                    }).toList(),
                    onChanged: (Data? selected) {
                      _viewModel?.dropdownvalue = selected;
                      print(
                          _viewModel?.dropdownvalue?.departmentName.toString());
                    }),
              ),
            ),
          ),
          Expanded(
              child: ElevatedButton(
            onPressed: () => print("Dosya yükleme butonuna tıklanıldı"),
            child: Text("DOSYA YÜKLE"),
          )),
        ],
      )),
    );
  }
}
