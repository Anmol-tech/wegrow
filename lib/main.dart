import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:wegrow/Pages/Structure.dart';

import 'Pages/Contact.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/ContactUs": (context) => Contact(),
        '/': (context) => Strucutre(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Wegrow',
      theme: ThemeData(
        fontFamily: 'Montserrat',
        primaryColor: Color(0xFFFF0065),
        accentColor: Color(0xFF00A651),
      ),
      initialRoute: '/',
    );
  }
}
