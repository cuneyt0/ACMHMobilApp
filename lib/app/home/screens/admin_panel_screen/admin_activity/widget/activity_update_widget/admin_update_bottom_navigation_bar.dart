
import 'package:login_work/export_import.dart';

class AdminUpdateBottomNavigationBar extends StatelessWidget {
  const AdminUpdateBottomNavigationBar({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final ActivityUpdateScreen widget;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: (() async => await widget.viewModel?.updateActivity()),
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
