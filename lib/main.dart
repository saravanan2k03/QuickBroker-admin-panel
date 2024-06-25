import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quik_broker_admin/firebase_options.dart';
import 'pages/Home/view/HomeScreen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
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
      home: const HomeScreen(),
    );
  }
}
