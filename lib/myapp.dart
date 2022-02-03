import 'package:flutter/material.dart';
import 'package:latis_tutor/pages/home.dart';
import 'package:latis_tutor/pages/login.dart';
import 'package:latis_tutor/store/shome.dart';


SHome $home = SHome();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Latis Tutor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: $home.isLogin?"/":"/login",
      routes: {
        "/": (context)=>const Home(),
        "/login":(context)=>const Login(),
      },

      // home: const Home(),
    );
  }
}
