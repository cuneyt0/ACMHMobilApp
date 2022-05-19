import 'package:login_work/app/home/screens/admin_panel_screen/viewmodel/admin_panel_view_model.dart';
import 'package:login_work/export_import.dart';
import 'package:pie_chart/pie_chart.dart';

class AdminPanelScreen extends StatefulWidget {
  const AdminPanelScreen({
    this.model,
    this.viewModel,
  });
  final LoginResponseModel? model;
  final AdminPanelViewModel? viewModel;

  @override
  State<AdminPanelScreen> createState() => _AdminPanelScreenState();
}

class _AdminPanelScreenState extends State<AdminPanelScreen> {
  final HomeViewModel? _homeViewModel = HomeViewModel();
  @override
  void initState() {
    super.initState();
    getData().then((value) {
      setState(() {
        _isLoading = false;
      });
    });
  }

  bool _isLoading = true;
  int index = 0;
  Future<void> getData() async {
    await widget.viewModel?.getAllUser();
  }

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      'Genel Ögrenci Sayısı': widget.viewModel?.allStudentValue??0,
      'Bilgisayar Mühendisligi': widget.viewModel?.computerStudentValue??0,
      'Makine Mühendisligi': widget.viewModel?.machineStudentValue??0,
    };
    return Scaffold(
      appBar: AppBar(
        title: const Text(mAdminPanel),
      ),
      drawer:
          AdminPanelDrawerMenu(model: widget.model, viewModel: _homeViewModel),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : body(context, dataMap),
    );
  }

  SingleChildScrollView body(
      BuildContext context, Map<String, double> dataMap) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Genel Ögrenci Sayısı",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.viewModel?.userGetAllResponse?.data?.length}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xff3EE094),
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Bilgisayar Mühendisligi",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Observer(builder: (context) {
                    return Text(
                      '${widget.viewModel?.computerStudentValue.toInt()}',
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    );
                  }),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0, top: 8, right: 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.height * 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Makine Mühendisligi",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${widget.viewModel?.machineStudentValue.toInt()}',
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          Observer(builder: (context) {
            return Padding(
              padding: const EdgeInsets.only(top: 10, right: 24, left: 40.0),
              child: PieChart(
                centerText: "Genel İstatistik",
                dataMap: dataMap,
                colorList: widget.viewModel!.colorList,
                chartRadius: MediaQuery.of(context).size.width * 0.63,
                chartType: ChartType.disc,
                chartLegendSpacing: 10,
                ringStrokeWidth: 14,
                animationDuration: Duration(seconds: 3),
                chartValuesOptions: const ChartValuesOptions(
                    showChartValues: true,
                    showChartValuesOutside: false,
                    showChartValuesInPercentage: true),
                legendOptions: const LegendOptions(
                    legendShape: BoxShape.circle,
                    showLegends: true,
                    showLegendsInRow: true,
                    legendPosition: LegendPosition.bottom),
              ),
            );
          }),
        ],
      ),
    );
  }
}
