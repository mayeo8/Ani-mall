import 'package:ani_mall/components/button_component.dart';
import 'package:ani_mall/components/custom_text_field.dart';
import 'package:ani_mall/components/logo_widget.dart';
import 'package:ani_mall/components/otp_dialog.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/provider_data.dart';
import 'package:ani_mall/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_screen.dart';

String? name;
String? email;

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({Key? key}) : super(key: key);
  static String id = 'create_account_screen';

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.fromLTRB(30.0, 80.0, 30.0, 50.0),
          child: Column(
            children: [
              const LogoWidget(
                width: 40.0,
                height: 40.0,
                textSize: 33.0,
                spacing: 6.0,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              const Text(
                'Create account',
                style: TextStyle(
                  fontFamily: 'Mermaid',
                  fontWeight: FontWeight.w700,
                  fontSize: 32.0,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: 'Full name',
                      onChanged: (value) {
                        name = value;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomTextField(
                      labelText: 'Email address',
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomTextField(
                      labelText: 'Password',
                      onChanged: (value) {},
                    ),
                    // SizedBox(
                    //   height: MediaQuery.of(context).size.height * 0.01,
                    // ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    ButtonsWidget(
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          Provider.of<UserName>(context, listen: false).name =
                              name!;
                          Provider.of<UserName>(context, listen: false).email =
                              email!;
                          showDialog<String>(
                            context: context,
                            builder: (context) {
                              return CustomAlertDialog(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 100.0, vertical: 30.0),
                                text:
                                    'Please enter verification code sent to your email',
                                boxLogic: () {
                                  Navigator.pop(context);
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(
                                        name: name!.split(' ')[0],
                                        token: 'create_account',
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        }
                      },
                      color: kYellowButtonColor,
                      text: 'Create account',
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    ButtonsWidget(
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(
                              name: 'Guest',
                              token: 'login_screen',
                            ),
                          ),
                        );
                      },
                      color: const Color(0xff9C9C9C),
                      text: 'Log in as guest',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.06,
              ),
              Row(
                children: [
                  const Expanded(
                    child: Divider(
                      thickness: 2.0,
                      color: Color(0xff272727),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Text(
                      'Or continue with',
                      style: kFontFamily.copyWith(
                        fontSize: 22.0,
                        color: const Color(0xff272727),
                      ),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      thickness: 2.0,
                      color: Color(0xff272727),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.015,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage('images/glogo.png'),
                    height: 20.0,
                    width: 20.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.facebook,
                    color: Color(0xff1877F2),
                    size: 24.0,
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.apple,
                    color: Color(0xff545454),
                    size: 24.0,
                  ),
                  // Icon(Icons),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.025,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Have an account :',
                    style: kFontFamily,
                  ),
                  const SizedBox(
                    width: 4.0,
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(0.0),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                    onPressed: () {
                      Navigator.pushNamed(context, LoginScreen.id);
                    },
                    child: Text(
                      'Login',
                      style: kFontFamily.copyWith(
                        color: const Color(0xff66A9FF),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
