import 'package:flutter/material.dart';

class ButtonsWidget extends StatelessWidget {
  const ButtonsWidget({
    Key? key,
    required this.onPress,
    required this.color,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPress;
  final Color color;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: TextButton(
        style: ButtonStyle(
          shape: MaterialStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(11.0),
            ),
          ),
          backgroundColor: MaterialStatePropertyAll(color),
          padding: const MaterialStatePropertyAll(
            EdgeInsets.all(14.0),
          ),
        ),
        onPressed: onPress,
        child: Text(
          text,
          style: const TextStyle(
              color: Colors.white,
              fontFamily: 'Mermaid',
              fontSize: 22.0,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
