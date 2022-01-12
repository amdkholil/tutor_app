import 'package:flutter/material.dart';
import 'package:latis_tutor/pages/presensi_input.dart';
import '../global/input.dart';

class OTForm extends StatelessWidget {
  const OTForm({
    required this.onTap,
    required this.icon,
    required this.data,
    this.ot,
    this.color,
    this.tgl,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final Color? color;
  final List data;
  final String? tgl;
  final String? ot;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 40,
          child: SelectOption(
            onChanged: (v) {
              spresensi.updateTglOtSeleted(v);
            },
            value: tgl,
            label: 'Tanggal',
            items: [
              for (var i = 0; i < data.length; i++)
                DropdownMenuItem(
                  value: data[i].toString(),
                  child: Text(data[i]),
                ),
            ],
          ),
        ),
        Expanded(
          flex: 40,
          child: SelectOption(
            onChanged: (v) {},
            value: null,
            label: 'Menit',
            items: [
              for (var i = 0; i < spresensi.oTlatis.length; i++)
                DropdownMenuItem(
                  value: spresensi.oTlatis[i]['ot'],
                  child: Text(
                    spresensi.oTlatis[i]['text'],
                    style: const TextStyle(fontSize: 12),
                  ),
                ),
            ],
          ),
        ),
        IconButton(
          onPressed: onTap,
          icon: Icon(
            icon,
            color: color ?? Colors.blue,
          ),
        )
      ],
    );
  }
}
