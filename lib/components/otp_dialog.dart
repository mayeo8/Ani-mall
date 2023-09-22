import 'package:ani_mall/constants.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog(
      {super.key,
      required this.text,
      required this.boxLogic,
      this.title,
      required this.padding});

  final String text;
  final String? title;
  final VoidCallback boxLogic;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
        Radius.circular(20.0),
      )),
      titlePadding: padding,
      backgroundColor: Colors.white,
      title: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(title ?? ''),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 12.0),
          ),
        ],
      ),
      content: SizedBox(
        height: 300.0,
        width: 50.0,
        child: Row(
          // crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Box(logic: boxLogic),
          ],
        ),
      ),
    );
  }
}

class Box extends StatefulWidget {
  const Box({
    Key? key,
    required this.logic,
  }) : super(key: key);
  final VoidCallback logic;

  @override
  State<Box> createState() => _BoxState();
}

class _BoxState extends State<Box> {
  final _focusNodes = List.generate(4, (index) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(4, (index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 3),
          alignment: Alignment.center,
          height: 50,
          width: 50,
          child: TextFormField(
            focusNode: _focusNodes[index],
            autofocus: true,
            style: kFontFamily.copyWith(fontSize: 32.0),
            textAlign: TextAlign.center,
            keyboardType: TextInputType.number,
            maxLength: 1,
            decoration: const InputDecoration(
              counterText: '',
              border: UnderlineInputBorder(),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 2.0),
              ),
            ),
            onChanged: (text) {
              if (text.isEmpty) {
                if (index == 0) {
                  // Do nothing because there is no previous TextField to focus on
                } else {
                  _focusNodes[index].previousFocus();
                }
              } else {
                if (index == 3) {
                  widget.logic();
                } else {
                  _focusNodes[index].nextFocus();
                }
              }
            },
          ),
        );
      }),
    );
  }
}
