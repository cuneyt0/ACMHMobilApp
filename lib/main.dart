import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:login_work/core/firebase/cloud_message/cloud_message.dart';
import 'package:login_work/export_import.dart';
// Import the generated file
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // * Local Notification paketini init eder.
  await CloudMessages.instance.initializeLocalNotification();

  /// * Firebase Mesajları için izin ister.
  await CloudMessages.instance.permissionFirebaseNotification();
  await CloudMessages.instance.getNotificationToken();

  /// * Uygulama Ölü iken çalışan notification
  await CloudMessages.instance.terminatedNotification();
  // * Android Foreground bildirim için kanal ayarlar
  await CloudMessages.instance.createNotificationChannelAndroid();

  // * FİREBASE ARKA PLANDA BİLDİRİMLER DİNLER
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // * Foreground Messagaları dinler
  await CloudMessages.instance.listenToForegroundMessages();

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

// FİREBASE ARKA PLANDA BİLDİRİMLER DİNLER
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // ignore: avoid_print
  print('Handling a background message: ${message.messageId}');
}
