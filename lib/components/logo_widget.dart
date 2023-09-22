import 'package:flutter/material.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({
    Key? key,
    required this.width,
    required this.height,
    required this.textSize,
    required this.spacing,
  }) : super(key: key);
  final double width, height, textSize, spacing;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: const AssetImage('images/logo.png'),
            width: width,
            height: height,
          ),
          SizedBox(
            width: spacing,
          ),
          Text(
            'Ani-Mall',
            style: TextStyle(
                fontFamily: 'Mermaid',
                fontWeight: FontWeight.w700,
                fontSize: textSize),
          ),
        ],
      ),
    );
  }
}
