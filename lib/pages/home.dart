import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:latis_tutor/pages/login.dart';
import 'package:latis_tutor/store/shome.dart';
import '../components/home/header.dart';
import '../components/home/swiperhome.dart';
import '../components/home/menu.dart';

SHome $home = SHome();

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[200],
            child: Column(
              children: const [
                Hader(),
                SwiperHome(),
                Menu(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
