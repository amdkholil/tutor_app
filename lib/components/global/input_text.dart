part of './input.dart';

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
