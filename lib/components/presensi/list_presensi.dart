import 'package:flutter/material.dart';

class ListPresensi extends StatelessWidget {
  const ListPresensi({
    required this.index,
    Key? key,
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0xffffffff),
        boxShadow: const [
          BoxShadow(
            color: Color(0xdddddddd),
            spreadRadius: 1,
            blurRadius: 2,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 30,
            child: ClipRRect(
              borderRadius: const BorderRadius.horizontal(
                left: Radius.circular(15),
              ),
              child: Image.network(
                'https://via.placeholder.com/150',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Expanded(flex: 2, child: SizedBox()),
          Expanded(
            flex: 68,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "Ryan Renold",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "7 SMP - Individu - Nasional",
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Text(
                    "6 Sesi, 2 Cancel",
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  Text(
                    "Tgl. mengajar : 2021-11-01, 2021-11-02, 2021-11-03, 2021-11-04, 2021-11-05, 2021-11-06",
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
