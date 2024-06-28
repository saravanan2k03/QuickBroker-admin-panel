import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/firebase_options.dart';
import 'package:quik_broker_admin/pages/login/views/LoginPage.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'pages/Home/view/HomeScreen.dart';

Future<void> main() async {
  runZonedGuarded(() async {
    await SentryFlutter.init(
      (options) {
        options.dsn = 'https://example@sentry.io/add-your-dsn-here';
      },
    );

    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    WidgetsFlutterBinding.ensureInitialized();
    runApp(const MyApp());
  }, (exception, stackTrace) async {
    await Sentry.captureException(exception, stackTrace: stackTrace);
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quik broker admin',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: const Color.fromRGBO(4, 28, 50, 1)),
        useMaterial3: true,
        // scrollbarTheme: ScrollbarThemeData(
        //   thumbColor: WidgetStateProperty.all(Colors.transparent),
        // ),
      ),
      home: const LoginPage(),
    );
  }
}
