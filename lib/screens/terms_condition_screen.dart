import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/constants.dart';
import 'package:flutter/material.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  static String id = 'terms_condition_screen';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: CustomAppBar(
        widget: Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 60.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_circle_left_rounded),
                ),
              ),
              Text(
                'Terms and Policies',
                style: kFontFamily.copyWith(fontSize: 22.0),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Text(
            kTerms,
            style: kSans.copyWith(fontSize: 16.0),
          ),
        ),
      ),
    ));
  }
}
