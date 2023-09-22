import 'package:ani_mall/components/custom_text_field.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/screens/create_account_screen.dart';
import 'package:ani_mall/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/button_component.dart';
import '../components/logo_widget.dart';
import '../data/provider_data.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  static String id = 'login_screen';

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String? emailAddress;
  String? password;
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
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              const Text(
                'Welcome back',
                style: TextStyle(
                  fontFamily: 'Mermaid',
                  fontWeight: FontWeight.w700,
                  fontSize: 32.0,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: 'Email address',
                      onChanged: (value) {
                        emailAddress = value;
                      },
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    CustomTextField(
                      labelText: 'Password',
                      onChanged: (value) {},
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot password',
                          style: kFontFamily,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.04,
                    ),
                    ButtonsWidget(
                      onPress: () {
                        if (_formKey.currentState!.validate()) {
                          Provider.of<UserName>(context, listen: false).name =
                              emailAddress!.split('@')[0];
                          Provider.of<UserName>(context, listen: false).email =
                              emailAddress!;
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(
                                name: emailAddress!.split('@')[0],
                                token: 'login_screen',
                              ),
                            ),
                          );
                        }
                      },
                      color: kGreenButtonColor,
                      text: 'Log in',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.150,
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
                height: MediaQuery.of(context).size.height * 0.02,
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
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Icon(
                    Icons.apple,
                    color: Color(0xff545454),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Don't have an account: ",
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
                      Navigator.pushNamed(context, CreateAccountScreen.id);
                    },
                    child: Text(
                      'Create one',
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
