part of './input.dart';

class BtnInputText extends StatelessWidget {
  const BtnInputText({
    required this.value,
    this.onTap,
    Key? key,
  }) : super(key: key);
  final VoidCallback? onTap;
  final String value;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.black54),
          borderRadius: BorderRadius.circular(4),
        ),
        width: double.maxFinite,
        margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Text(
          value,
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
