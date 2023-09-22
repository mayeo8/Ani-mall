import 'package:ani_mall/constants.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.labelText,
    required this.onChanged,
    this.hint,
    this.height,
    this.align,
    this.focusNode,
    this.controller,
  }) : super(key: key);
  final String labelText;
  final ValueChanged onChanged;
  final String? hint;
  final int? height;
  final bool? align;
  final FocusNode? focusNode;
  final TextEditingController? controller;

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool toggleBool = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      focusNode: widget.focusNode,
      style: const TextStyle(color: Colors.black),
      obscuringCharacter: '*',
      obscureText: widget.labelText == 'Password' ? toggleBool : false,
      decoration: InputDecoration(
          suffixIcon:
              widget.labelText == 'Password' ? buildGestureDetector() : null,
          labelText: widget.labelText,
          labelStyle: kFontFamily.copyWith(
            color: const Color(0xff5B5B5B),
          ),
          hintText: widget.hint,
          alignLabelWithHint: widget.align,
          contentPadding: const EdgeInsets.fromLTRB(32.0, 16.0, 32, 8),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
            borderSide: const BorderSide(
                color: Color(0xff5B5B5B), style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
            borderSide: const BorderSide(
              color: Color(0xff5B5B5B),
              width: 2.0,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(11.0),
            borderSide: const BorderSide(
              color: Color(0xff5B5B5B),
              width: 2.0,
            ),
          )),
      maxLines: _getMaxLines(),
      keyboardType: widget.labelText == 'Password'
          ? TextInputType.visiblePassword
          : TextInputType.emailAddress,
      onChanged: widget.onChanged,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some input';
        }
        return null;
      },
    );
  }

  int? _getMaxLines() {
    if (widget.height != null && widget.height! > 1) {
      return widget.height!;
    } else {
      return widget.labelText == 'Password' ? 1 : null;
    }
  }

  GestureDetector buildGestureDetector() {
    return GestureDetector(
      onTap: () {
        setState(() {
          toggleBool = !toggleBool;
        });
      },
      child: toggleBool == false
          ? const Icon(
              Icons.visibility,
              color: Color(0xff5B5B5B),
            )
          : const Icon(
              Icons.visibility_off,
              color: Color(0xff5B5B5B),
            ),
    );
  }
}
