import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:logger/logger.dart';
import 'package:taskmaker/screens/dashboard/dashboard.dart';
import 'package:taskmaker/screens/intro_screens/intro_screens.dart';
import 'package:taskmaker/screens/login_page/login_page.dart';
import 'package:taskmaker/themes/themes.dart';
import 'package:taskmaker/widgets/show_notification.dart';
import 'firebase_options.dart';
import 'package:auth_state_manager/auth_state_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
 
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );
  print('User granted permission: ${settings.authorizationStatus}');
  await FirebaseMessaging.instance.getInitialMessage();
  FirebaseMessaging.instance.onTokenRefresh.listen((messaging) {
    Logger().i('REFRESH ' + messaging);
  }).onError((err) {});
  messaging.getToken().then(
    (value) {
      Logger().i('TOKEN ' + value!);
    },
  );

  // Lisitnening to the background messages
  Future<void> _firebaseMessagingBackgroundHandler(
      RemoteMessage message) async {
    await Firebase.initializeApp();
    print("Handling a background message: ${message.messageId}");
  }

  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
// Listneing to the foreground messages

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    RemoteNotification? notification = message.notification;
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    showNotification(
        title: notification?.title,
        body: notification?.body,
        image: message.data["image"],
        route: message.data["screen"]);
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });
   await AuthStateManager.initializeAuthState();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DoMeNow',
      theme: Themes.lightTheme,
      darkTheme: Themes.darkTheme,
      home: const Home(),
    );
  }
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const AuthStateListener(
      authenticated: IntroScreens(),
       unAuthenticated: LoginPage());
  }
}
