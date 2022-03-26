import 'package:login_work/export_import.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  CacheManager cacheManager = CacheManager();
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      cacheManager.getLoginResponse().then((loginRes) async {
        if (loginRes == null) {
          await Navigation.pushReplacementNamed(root: Routes.loginView);
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                model: LoginResponseModel.fromJson(jsonDecode(loginRes)),
                cacheManager: cacheManager,
              ),
            ),
          );
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Center(
        child: CircleAvatar(
          backgroundImage: AssetImage(assetNeuLogo),
          maxRadius: 120,
          minRadius: 50,
        ),
      ),
    );
  }
}
