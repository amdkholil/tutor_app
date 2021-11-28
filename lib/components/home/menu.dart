import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import './iconmenu.dart';
import '../../pages/presensi.dart';

class Menu extends StatelessWidget {
  const Menu({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
              offset: Offset(0, 1),
            )
          ],
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          )),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconMenu(
            icon: SvgPicture.asset(
              "assets/img/teaching.svg",
              width: 35,
            ),
            text: 'Presensi',
            // onTap: () => print('aaa'),
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => const Presesnsi(),
              ),
            ),
          ),
          IconMenu(
            icon: const Image(
              image: AssetImage('assets/img/files.png'),
              width: 35,
            ),
            text: 'Daily Report',
            onTap: () => {},
          ),
          IconMenu(
            icon: SvgPicture.asset(
              "assets/img/gaji.svg",
              width: 35,
            ),
            text: 'Gaji',
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
