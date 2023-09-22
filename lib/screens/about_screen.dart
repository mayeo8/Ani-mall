import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/constants.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static String id = 'about_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        widget: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 60.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_circle_left_rounded),
                  ),
                ),
              ),
              Expanded(
                child: Text(
                  'About',
                  style: kFontFamily.copyWith(fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
              ),
              const Expanded(
                child: Text(''),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            kAbout,
            style: kSans.copyWith(fontSize: 16.0),
          ),
        ),
      ),
    ));
  }
}
