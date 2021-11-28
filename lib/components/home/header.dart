import 'package:flutter/material.dart';

class Hader extends StatelessWidget {
  const Hader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        // borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(40),
              child: const Image(
                image: AssetImage('assets/img/user.jpg'),
                width: 80,
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "John Doel",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Row(
                  children: [
                    for (var i = 0; i < 5; i++)
                      const Icon(
                        Icons.star_rate,
                        color: Colors.yellow,
                        size: 17,
                      )
                  ],
                ),
                const SizedBox(height: 3),
                Row(
                  children: const [
                    Icon(
                      Icons.place,
                      size: 15,
                      color: Colors.grey,
                    ),
                    Text(
                      'Depok - Jawabarat',
                      style: TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                )
              ],
            ),
            const Spacer(flex: 1),
            const Padding(
              padding: EdgeInsets.only(right: 12, bottom: 30),
              child: Image(
                image: AssetImage('assets/img/notif.png'),
                width: 25,
              ),
            )
          ],
        ),
      ),
    );
  }
}
