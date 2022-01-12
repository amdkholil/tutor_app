import 'package:flutter/material.dart';
import 'package:latis_tutor/store/spresensi.dart';

SPresensi spresensi = SPresensi();

class AdditionalOT extends StatelessWidget {
  const AdditionalOT({
    Key? key,
    required this.data,
    required this.onClose,
  }) : super(key: key);

  final Map data;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: Colors.black26),
              ),
              child: Text(
                'Tanggal ' + data['tgl'] + ', ' + data['sesi'] + ' Sesi',
                style: const TextStyle(fontSize: 16),
              ),
            ),
            IconButton(
              onPressed: onClose,
              icon: const Icon(
                Icons.close,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
    );
  }
}
