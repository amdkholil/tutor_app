import 'package:flutter/material.dart';
import '../components/home/header.dart';
import '../components/home/swiperhome.dart';
import '../components/home/menu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
    );
  }
}
