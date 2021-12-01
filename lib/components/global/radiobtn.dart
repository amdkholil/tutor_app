part of './input.dart';

class RadioBtn extends StatelessWidget {
  const RadioBtn({
    required this.label,
    required this.onChange,
    this.value,
    this.groupValue,
    Key? key,
  }) : super(key: key);

  final String label;
  final Function onChange;
  final String? value;
  final String? groupValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Radio(
          value: value.toString(),
          groupValue: groupValue,
          onChanged: (v) => onChange(v),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}
