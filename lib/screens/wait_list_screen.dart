import 'package:ani_mall/components/alert_box.dart';
import 'package:ani_mall/components/button_component.dart';
import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/components/custom_text_field.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/screens/home_screen.dart';
import 'package:flutter/material.dart';

class WaitListScreen extends StatefulWidget {
  const WaitListScreen({Key? key}) : super(key: key);
  static String id = 'waitList screen';

  @override
  State<WaitListScreen> createState() => _WaitListScreenState();
}

class _WaitListScreenState extends State<WaitListScreen> {
  final formKey = GlobalKey<FormState>();
  String waitListText =
      'Carefully type the correct name of the product or item you would want';
  String alertHeading = 'Thank you for using our wait list option';
  String alertMessage = 'we will notify you when we get your product';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          widget: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
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
                    'Wait list',
                    style: kFontFamily.copyWith(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(child: Text('')),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
          child: Column(
            children: [
              Text(
                waitListText,
                textAlign: TextAlign.center,
                style: kSans.copyWith(
                  fontWeight: FontWeight.w400,
                  fontSize: 16.0,
                  color: const Color(0xff9C9C9C),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Form(
                key: formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: 'Name Of Item',
                      onChanged: (value) {},
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                      labelText: 'More details',
                      onChanged: (value) {},
                      hint: 'Enter a description',
                      height: 6,
                      align: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.image,
                        size: 30.0,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.010,
                      ),
                      Text(
                        'Add picture',
                        style: kFontFamily.copyWith(fontSize: 22.0),
                      ),
                    ],
                  ),
                  Text(
                    'Optional',
                    style: kSans.copyWith(fontSize: 10.0),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.300,
              ),
              ButtonsWidget(
                onPress: () {
                  if (formKey.currentState!.validate()) {
                    showDialog<String>(
                      context: context,
                      builder: (context) {
                        return AlertBox(
                          heading: alertHeading,
                          message: alertMessage,
                          onPress: () {
                            Navigator.pushNamed(context, HomeScreen.id);
                          },
                          buttonText: 'Home',
                        );
                      },
                    );
                  }
                },
                color: kGreenButtonColor,
                text: 'Add To Wait List',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
