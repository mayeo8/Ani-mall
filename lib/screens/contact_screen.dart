import 'package:ani_mall/components/alert_box.dart';
import 'package:ani_mall/components/button_component.dart';
import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/components/custom_text_field.dart';
import 'package:ani_mall/constants.dart';
import 'package:flutter/material.dart';

final formKey = GlobalKey<FormState>();

class ContactScreen extends StatelessWidget {
  const ContactScreen({super.key});

  static String id = 'contact_screen';

  @override
  Widget build(BuildContext context) {
    FocusNode focusNode1 = FocusNode();
    FocusNode focusNode2 = FocusNode();
    FocusNode focusNode3 = FocusNode();
    TextEditingController controller1 = TextEditingController();
    TextEditingController controller2 = TextEditingController();
    TextEditingController controller3 = TextEditingController();
    String alertHeading = 'Thank You for Your feedback';
    String alertMessage =
        'We will get back to you shortly hopefully with the solution to your problem';
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
                  padding: const EdgeInsets.only(right: 70.0),
                  child: IconButton(
                    onPressed: () {
                      focusNode3.unfocus();
                      controller3.clear();
                      focusNode2.unfocus();
                      controller2.clear();
                      focusNode1.unfocus();
                      controller1.clear();
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.arrow_circle_left_rounded),
                  ),
                ),
                Text(
                  'Contact Us',
                  style: kFontFamily.copyWith(fontSize: 22.0),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 30.0),
          child: Form(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: controller1,
                        focusNode: focusNode1,
                        labelText: 'Full name',
                        onChanged: (value) {
                          // emailAddress = value;
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030,
                      ),
                      CustomTextField(
                        focusNode: focusNode2,
                        controller: controller2,
                        labelText: 'Email',
                        onChanged: (value) {},
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.030,
                      ),
                      CustomTextField(
                        focusNode: focusNode3,
                        controller: controller3,
                        align: true,
                        height: MediaQuery.of(context).viewInsets.bottom != 0
                            ? 1
                            : 8,
                        labelText: 'Message',
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
                          focusNode3.unfocus();
                          controller3.clear();
                          focusNode2.unfocus();
                          controller2.clear();
                          focusNode1.unfocus();
                          controller1.clear();
                          showDialog<String>(
                            context: context,
                            builder: (context) {
                              return AlertBox(
                                heading: alertHeading,
                                message: alertMessage,
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
                      text: 'Submit',
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
