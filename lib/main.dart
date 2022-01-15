import 'package:chitchat/view/Auth/login_page.dart';
import 'package:chitchat/view/Home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

String initRoute = '/Login';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp().then((value) async {
    FirebaseAuth.instance.authStateChanges().listen((event)async {
      if (event != null) {
        String uid = event.uid;
        print('########### uid --> $uid #############'+initRoute);
        initRoute = '/Home';
        runApp(const MyApp());
      } else {
        runApp(const MyApp());
      }
    });
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: map,
      initialRoute: initRoute,
      home: LoginPage(),
    );
  }
}

final Map<String, WidgetBuilder> map = {
  '/Login': (BuildContext context) => LoginPage(),
  '/Home': (BuildContext context) => HomePage(),
};
