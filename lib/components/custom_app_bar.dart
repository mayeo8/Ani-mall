import 'package:flutter/material.dart';
import 'package:ani_mall/constants.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget widget;

  const CustomAppBar({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kBackgroundGreenColor,
      automaticallyImplyLeading: false,
      toolbarHeight: 117.0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25.0),
        ),
      ),
      title: widget,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(100.0);
}
