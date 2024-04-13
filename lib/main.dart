import 'package:flutter/material.dart';
import 'screens/intro_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  // OneSignal.initialize('9cf57007-1de5-4735-a20b-d73f3b97d1ea');
  // OneSignal.Notifications.requestPermission(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ECommerceApp',
      home: IntroScreen(),
    );
  }
}
