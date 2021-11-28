import 'package:flutter/material.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        onChanged: (val) {},
        items: [
          for (var i = 0; i < 5; i++)
            DropdownMenuItem(
              value: i,
              child: Text('Siswa$i'),
            ),
        ],
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: 'Pilih Siswa',
          hintText: 'Pilih Siswa',
          contentPadding: EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            gapPadding: 1,
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
        ),
      ),
    );
  }
}

class InputText extends StatelessWidget {
  const InputText({
    required this.label,
    this.placeholder,
    this.controller,
    this.readOnly,
    Key? key,
  }) : super(key: key);

  final String label;
  final String? placeholder;
  final TextEditingController? controller;
  final bool? readOnly;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        readOnly: readOnly ?? false,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          hintText: placeholder,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 8,
            vertical: 0,
          ),
          border: const OutlineInputBorder(
            gapPadding: 1,
            borderSide: BorderSide(
              color: Colors.black38,
            ),
          ),
        ),
      ),
    );
  }
}
