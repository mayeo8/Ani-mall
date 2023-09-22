import 'package:ani_mall/components/alert_box.dart';
import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/components/custom_text_field.dart';
import 'package:ani_mall/components/otp_dialog.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/provider_data.dart';
import 'package:ani_mall/screens/home_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../components/button_component.dart';

class PaymentScreen extends StatefulWidget {
  const PaymentScreen({Key? key, required this.cost}) : super(key: key);
  static String id = 'payment_screen';
  final double cost;

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  String inputValue = '';
  final player = AudioPlayer();

  void playSound(String sound) {
    player.play(AssetSource(sound));
  }

  String verificationText =
      'Either Your bank will send you an SMS with a one time code or you have to enter the code from your hardware token to verify the transactions';
  String alertHeading = 'Thank you for your patronage';
  String alertMessage =
      'When we receive the payment we will send your a delivery mail for you to be able to track your delivery.';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
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
                    'Payment',
                    style: kFontFamily.copyWith(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(child: Text('')),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 18.0, bottom: 15.0),
                child: Text(
                  'Please add in the details for your credit or debit card',
                  style: kSans.copyWith(
                      color: const Color(0xff7C7C7C),
                      fontWeight: FontWeight.w400,
                      fontSize: 16.0),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5.0, horizontal: 40.0),
                child: Column(
                  children: [
                    CustomTextField(
                      labelText: "Card holder's name*",
                      onChanged: (value) {},
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: TextFormField(
                        onChanged: (value) {
                          inputValue = value;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          suffixIcon: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(
                              'images/icons/icons8-mastercard.png',
                              width: 14.0,
                              height: 14.0,
                            ),
                          ),
                          // suffixIcon:
                          labelText: 'Debit/credit card number*',
                          labelStyle: kFontFamily.copyWith(
                            color: const Color(0xff5B5B5B),
                          ),
                          contentPadding:
                              const EdgeInsets.fromLTRB(32.0, 16.0, 32, 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.0),
                            borderSide: const BorderSide(
                                color: Color(0xff5B5B5B),
                                style: BorderStyle.solid),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(11.0),
                            borderSide: const BorderSide(
                              color: Color(0xff5B5B5B),
                              width: 2.0,
                            ),
                          ),
                        ),
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(19),
                          FilteringTextInputFormatter.digitsOnly,
                          CardNumberFormatter(),
                        ],
                        validator: (inputValue) {
                          if (inputValue == null || inputValue.isEmpty) {
                            return 'Please enter a card number';
                          }
                          // Add more validation logic as per your requirements
                          return null; // Return null to indicate no validation errors
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 105.0,
                          height: 43.0,
                          child: TextFormField(
                            onChanged: (value) {
                              inputValue = value;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "MM/YY",
                              labelText: 'Expiration*',
                              labelStyle: kFontFamily.copyWith(
                                color: const Color(0xff5B5B5B),
                              ),
                              contentPadding: const EdgeInsets.all(20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: const BorderSide(
                                    color: Color(0xff5B5B5B),
                                    style: BorderStyle.solid),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: const BorderSide(
                                  color: Color(0xff5B5B5B),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            // obscureText: true,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                              CardMonthInputFormatter(),
                            ],
                            validator: (inputValue) {
                              if (inputValue == null || inputValue.isEmpty) {
                                return 'Please enter a valid Expiration date';
                              }
                              // Add more validation logic as per your requirements
                              return null; // Return null to indicate no validation errors
                            },
                          ),
                        ),
                        SizedBox(
                          width: 105.0,
                          height: 43.0,
                          child: TextFormField(
                            onChanged: (value) {
                              inputValue = value;
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                              hintText: "123",
                              labelText: 'Cvc*',
                              labelStyle: kFontFamily.copyWith(
                                color: const Color(0xff5B5B5B),
                              ),
                              contentPadding: const EdgeInsets.all(20.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: const BorderSide(
                                    color: Color(0xff5B5B5B),
                                    style: BorderStyle.solid),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: const BorderSide(
                                  color: Color(0xff5B5B5B),
                                  width: 2.0,
                                ),
                              ),
                            ),
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(3),
                              FilteringTextInputFormatter.digitsOnly,
                              // CardNumberFormatter(),
                            ],
                            validator: (inputValue) {
                              if (inputValue == null || inputValue.isEmpty) {
                                return 'Please enter a valid Expiration date';
                              }
                              // Add more validation logic as per your requirements
                              return null; // Return null to indicate no validation errors
                            },
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: SizedBox(
                        width: 105.0,
                        height: 43.0,
                        child: TextFormField(
                          enabled: false,
                          initialValue: '\$${widget.cost.toStringAsFixed(2)}',
                          style: const TextStyle(color: Colors.black),
                          onChanged: (value) {},
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11.0),
                              borderSide: const BorderSide(
                                  color: Color(0xff5B5B5B),
                                  style: BorderStyle.solid),
                            ),
                            labelText: 'Amount*',
                            labelStyle: kFontFamily.copyWith(
                              color: const Color(0xff5B5B5B),
                            ),
                            // contentPadding:
                            // const EdgeInsets.fromLTRB(32.0, 16.0, 32, 8),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11.0),
                              borderSide: const BorderSide(
                                  color: Color(0xff5B5B5B),
                                  style: BorderStyle.solid),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(11.0),
                              borderSide: const BorderSide(
                                color: Color(0xff5B5B5B),
                                width: 2.0,
                              ),
                            ),
                          ),
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4),
                            FilteringTextInputFormatter.digitsOnly,
                            // CardNumberFormatter(),
                          ],
                          validator: (inputValue) {
                            if (inputValue == null || inputValue.isEmpty) {
                              return 'Please enter a valid Expiration date';
                            }
                            // Add more validation logic as per your requirements
                            return null; // Return null to indicate no validation errors
                          },
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 280.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: ButtonsWidget(
                        onPress: () {
                          showDialog<String>(
                            context: context,
                            builder: (context) {
                              return CustomAlertDialog(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 50.0, vertical: 30.0),
                                text: verificationText,
                                boxLogic: () {
                                  Provider.of<HomeScreenProvider>(context,
                                          listen: false)
                                      .rebuildHomeScreen();
                                  Navigator.pop(context);
                                  playSound('choir.mp3');
                                  showDialog<String>(
                                    context: context,
                                    builder: (context) {
                                      return AlertBox(
                                        heading: alertHeading,
                                        message: alertMessage,
                                        onPress: () {
                                          Provider.of<CartList>(context,
                                                  listen: false)
                                              .clearCart();
                                          Navigator.pushNamed(
                                              context, HomeScreen.id);
                                        },
                                        buttonText: 'Home',
                                      );
                                    },
                                  );
                                },
                                title: 'OTP',
                              );
                            },
                          );
                          // Navigator.pushNamed(context, PaymentScreen.id);
                        },
                        color: kBackgroundGreenColor,
                        text: 'Pay',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text;
    if (text.length < 5) {
      return newValue;
    }

    final formattedText = text.replaceAllMapped(
      RegExp(r'(.{4})(?!$)'),
      (match) => '${match.group(0)} ',
    );

    return newValue.copyWith(
      text: formattedText,
      selection: TextSelection.collapsed(
        offset: formattedText.length,
      ),
    );
  }
}

class CardMonthInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var newText = newValue.text;
    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }
    var buffer = StringBuffer();
    for (int i = 0; i < newText.length; i++) {
      buffer.write(newText[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 2 == 0 && nonZeroIndex != newText.length) {
        buffer.write('/');
      }
    }
    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: string.length));
  }
}
