import 'package:ani_mall/components/button_component.dart';
import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/provider_data.dart';
import 'package:ani_mall/screens/delivery_screen.dart';
import 'package:ani_mall/screens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({Key? key, required this.total}) : super(key: key);
  static String id = 'review_purchase_screen';
  final double total;

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  @override
  Widget build(BuildContext context) {
    double totalCost =
        Provider.of<CartList>(context).shippingCost() + widget.total;
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
                    'Review',
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
          padding: const EdgeInsets.only(
              top: 10.0, left: 20.0, right: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Text(
                  'Please reconfirm and submit your orders',
                  style: kSans.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xff9C9C9C),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              InfoCard(
                color: const Color(0xffFAD088),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20.0),
                  title: Text(
                    'Delivery Address',
                    textAlign: TextAlign.center,
                    style: kFontFamily.copyWith(fontSize: 18.0),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${Provider.of<UserName>(context).name}',
                          style: kSans.copyWith(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          'Location: ${Provider.of<LocationList>(context).getLocation()}',
                          style: kSans.copyWith(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 4.0,
                        ),
                        Align(
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, DeliveryScreen.id)
                                  .then((result) {
                                if (result != null && result == 'refresh') {
                                  setState(() {});
                                }
                              });
                            },
                            child: const Text('Edit'),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              InfoCard(
                color: const Color(0xff9AEAD6),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(20.0),
                  title: Text(
                    'Cost details',
                    textAlign: TextAlign.center,
                    style: kFontFamily.copyWith(fontSize: 18.0),
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total item cost: \$${widget.total.toStringAsFixed(2)}',
                          style: kSans.copyWith(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 12.0,
                        ),
                        Text(
                          'Total delivery cost: \$${Provider.of<CartList>(context).shippingCost().toStringAsFixed(2)}',
                          style: kSans.copyWith(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                        const SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Total cost: \$${totalCost.toStringAsFixed(2)}',
                          style: kSans.copyWith(
                              fontSize: 16.0, fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.180,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: ButtonsWidget(
                  onPress: () {
                    final location =
                        Provider.of<LocationList>(context, listen: false)
                            .getLocation();

                    if (location == 'Location Not Selected') {
                      const snackBar = SnackBar(
                        behavior: SnackBarBehavior.floating,
                        backgroundColor: kGreenButtonColor,
                        content: Text(
                          'Please specify a delivery address',
                          style: kFontFamily,
                        ),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    } else {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(cost: totalCost),
                        ),
                      );
                    }
                  },
                  color: kBackgroundGreenColor,
                  text: 'Payment',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  const InfoCard({
    Key? key,
    required this.color,
    required this.child,
  }) : super(key: key);
  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0),
      child: Container(
        height: 177.0,
        width: 376.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: child,
      ),
    );
  }
}
