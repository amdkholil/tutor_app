import 'package:flutter/material.dart';
import '../global/input.dart';

class OTForm extends StatelessWidget {
  const OTForm({
    required this.onTap,
    required this.icon,
    this.color,
    Key? key,
  }) : super(key: key);

  final VoidCallback onTap;
  final IconData icon;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 40,
          child: SelectOption(
            onChanged: (v) {},
            value: null,
            label: 'Tanggal',
            items: [
              for (var i = 0; i < 5; i++)
                DropdownMenuItem(
                  value: i,
                  child: Text('2021-11-$i'),
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
              for (var i = 0; i < 5; i++)
                DropdownMenuItem(
                  value: i,
                  child: Text('Menit $i'),
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
