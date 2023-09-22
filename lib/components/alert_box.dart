import 'package:ani_mall/components/button_component.dart';
import 'package:ani_mall/constants.dart';
import 'package:flutter/material.dart';

class AlertBox extends StatelessWidget {
  const AlertBox({
    Key? key,
    required this.heading,
    required this.message,
    required this.onPress,
    required this.buttonText,
  }) : super(key: key);
  final String heading;
  final String message;
  final String buttonText;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 5.0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      )),
      titlePadding:
          const EdgeInsets.symmetric(horizontal: 32.0, vertical: 22.0),
      contentPadding: const EdgeInsets.symmetric(horizontal: 30.0),
      backgroundColor: Colors.white,
      title: Text(
        heading,
        textAlign: TextAlign.center,
        style: kFontFamily.copyWith(
          color: kYellowButtonColor,
          fontSize: 32.0,
        ),
      ),
      content: SizedBox(
        height: 200.0,
        width: 50.0,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              message,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40.0,
            ),
            ButtonsWidget(
              color: kBackgroundGreenColor,
              onPress: onPress,
              text: buttonText,
            ),
          ],
        ),
      ),
      // actions: [
      //   TextButton(
      //     onPressed: () => Navigator.pop(context),
      //     child: Text('cancel'),
      //   ),
      //   TextButton(
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //     child: Text('cancel'),
      //   ),
      // ],
    );
  }
}
