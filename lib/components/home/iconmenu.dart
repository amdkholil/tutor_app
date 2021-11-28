import 'package:flutter/material.dart';

class IconMenu extends StatelessWidget {
  const IconMenu({
    required this.icon,
    required this.text,
    required this.onTap,
    Key? key,
  }) : super(key: key);
  final String text;
  final Widget icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade300,
              ),
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[100],
            ),
            padding: const EdgeInsets.all(10),
            child: icon,
          ),
        ),
        Text(
          text,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
