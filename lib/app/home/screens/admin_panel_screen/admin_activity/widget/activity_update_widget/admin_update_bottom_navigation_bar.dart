import 'package:login_work/export_import.dart';
import 'package:login_work/core/extension/context_extension.dart';

class AdminUpdateBottomNavigationBar extends StatelessWidget {
  const AdminUpdateBottomNavigationBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ActivityUpdateScreen widget;

  @override
  Widget build(BuildContext context) {
    AdminPanelViewModel? adminPanelViewModel = AdminPanelViewModel();
    return ElevatedButton(
      onPressed: (() async {
        await widget.viewModel?.updateActivity();
        await Flushbar(
          message: 'Başarılı',
          flushbarPosition: FlushbarPosition.TOP,
          duration: const Duration(seconds: 1),
          borderRadius: BorderRadius.circular(2),
          backgroundColor: Colors.black.withOpacity(0.5),
        ).show(context).then((value) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AdminPanelScreen(
                model: GetToken.loginResponseModel,
                viewModel: adminPanelViewModel),
          ));
        });
      }),
      child: const Text(mSaveBttn),
      style: ButtonStyle(
        maximumSize: MaterialStateProperty.all<Size>(
          Size(context.width * 1, context.highValue),
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(context.width * 1, context.mediumValue),
        ),
      ),
    );
  }
}
