import 'package:ani_mall/components/alert_box.dart';
import 'package:ani_mall/components/button_component.dart';
import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/components/custom_text_field.dart';
import 'package:ani_mall/constants.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  static String id = 'change_password';

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  late FocusNode focusNode1, focusNode2;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    super.initState();
  }

  @override
  void dispose() {
    focusNode1.dispose();
    focusNode2 = FocusNode();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          widget: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 50.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_circle_left_rounded),
                  ),
                ),
                Text(
                  'Change password',
                  style: kFontFamily.copyWith(fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 58.0, horizontal: 30.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        focusNode: focusNode1,
                        labelText: 'Old password',
                        onChanged: (value) {
                          // emailAddress = value;
                        },
                      ),
                      const SizedBox(
                        height: 30.0,
                      ),
                      CustomTextField(
                        focusNode: focusNode2,
                        labelText: 'Password',
                        onChanged: (value) {},
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    ButtonsWidget(
                      onPress: () {
                        if (formKey.currentState!.validate()) {
                          focusNode1.unfocus();
                          focusNode2.unfocus();
                          showDialog<String>(
                            context: context,
                            builder: (context) {
                              return AlertBox(
                                heading:
                                    'Your password has been updated successfully',
                                message: '',
                                onPress: () {
                                  Navigator.pop(context);
                                  Navigator.pop(context);
                                },
                                buttonText: 'Back',
                              );
                            },
                          );
                        }
                      },
                      color: kGreenButtonColor,
                      text: 'Change Password',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
