part of './input.dart';

class SelectOption extends StatelessWidget {
  const SelectOption({
    required this.items,
    required this.label,
    this.hint,
    required this.onChanged,
    this.value,
    Key? key,
  }) : super(key: key);
  final List<DropdownMenuItem<int>> items;
  final String label;
  final String? hint;
  final Function onChanged;
  final Object? value;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DropdownButtonFormField(
        onChanged: (val) => onChanged(val),
        value: value,
        items: items,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          labelText: label,
          hintText: hint ?? label,
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
