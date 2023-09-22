import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/provider_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class IconText extends StatelessWidget {
  const IconText({
    Key? key,
    required this.iconName,
  }) : super(key: key);
  final String iconName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3.0),
      child: Text(
        iconName,
        style: kFontFamily.copyWith(
          color: const Color(0xff248E73),
          fontSize: 12.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}

class IconWidget extends StatelessWidget {
  const IconWidget({
    Key? key,
    required int activeIndex,
    required this.url,
    required this.index,
  })  : _activeIndex = activeIndex,
        super(key: key);

  final int _activeIndex;
  final String url;
  final int index;

  Color getColor(BuildContext context) {
    if (_activeIndex == index) {
      if (_activeIndex == 2) {
        Provider.of<CartList>(context).showBadge = false;
      }
      return kBackgroundGreenColor;
    } else {
      return const Color(0xff9C9C9C);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      url,
      color: getColor(context),
      height: 25.0,
    );
  }
}
