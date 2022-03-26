import 'package:login_work/export_import.dart';

class Routes {
  Routes._();
  static const splash = '/splash_screen';
  static const loginView = '/login_view';

  static Route<dynamic> onGenerateRoutes(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return _materialPageRoute(const SplashScreen());
      case loginView:
        return _materialPageRoute(LoginView());
      default:
        return _materialPageRoute(const Text('PremiumPager'));
    }
  }

  static MaterialPageRoute<dynamic> _materialPageRoute(Widget page) =>
      MaterialPageRoute(builder: (_) => page);
}
