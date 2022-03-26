import 'package:login_work/export_import.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        navigatorKey: Navigation.navigationKey,
        title: "Material App",
        onGenerateRoute: Routes.onGenerateRoutes,
        home: const SplashScreen());
  }
}
