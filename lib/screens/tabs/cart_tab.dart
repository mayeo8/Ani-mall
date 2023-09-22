import 'package:ani_mall/components/button_component.dart';
import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/cart_item.dart';
import 'package:ani_mall/data/provider_data.dart';
import 'package:ani_mall/screens/delivery_screen.dart';
import 'package:ani_mall/screens/review_purchase_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
                  const Expanded(
                    child: Text(''),
                  ),
                  Expanded(
                    child: Text(
                      'Cart',
                      style: kFontFamily.copyWith(fontSize: 22.0),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 60.0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, DeliveryScreen.id);
                        },
                        icon: const Icon(Icons.local_shipping_outlined),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: Provider.of<CartList>(context, listen: false).cart.isEmpty
              ? emptyCart()
              : activeCart()),
    );
  }
}

Widget activeCart() {
  return Builder(builder: (context) {
    double calculateTotalPrice() {
      double totalPrice = 0.0;
      List<CartItem> cart = Provider.of<CartList>(context, listen: true).cart;

      for (CartItem item in cart) {
        totalPrice += item.price;
      }
      // print(totalPrice);
      return totalPrice;
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            left: 20.0,
            right: 44.0,
            top: 15.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Items',
                style: kFontFamily.copyWith(
                  fontSize: 18.0,
                  color: const Color(0xff7C7C7C),
                ),
              ),
              Text(
                'Cost',
                style: kFontFamily.copyWith(
                  fontSize: 18.0,
                  color: const Color(0xff7C7C7C),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            shrinkWrap: true,
            itemCount:
                Provider.of<CartList>(context, listen: false).cart.length,
            itemBuilder: (BuildContext context, int index) {
              return CartListWidget(
                image: Provider.of<CartList>(context, listen: false)
                    .cart[index]
                    .image,
                name: Provider.of<CartList>(context, listen: false)
                    .cart[index]
                    .name,
                price: Provider.of<CartList>(context, listen: false)
                    .cart[index]
                    .price,
                color: Provider.of<CartList>(context, listen: false)
                    .cart[index]
                    .color,
                qty: Provider.of<CartList>(context, listen: false)
                    .cart[index]
                    .quantity,
                cartItem:
                    Provider.of<CartList>(context, listen: false).cart[index],
              );
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: const EdgeInsets.only(right: 40.0, bottom: 10.0),
            child: Text(
              'Total \$${double.parse(calculateTotalPrice().toStringAsFixed(2))}',
              textAlign: TextAlign.right,
              style: kFontFamily.copyWith(
                  color: const Color(0xff1D1D1D), fontSize: 16.0),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
          child: ButtonsWidget(
            onPress: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          ReviewScreen(total: calculateTotalPrice())));
            },
            color: kGreenButtonColor,
            text: 'Checkout',
          ),
        ),
      ],
    );
  });
}

//ignore: must_be_immutable
class CartListWidget extends StatefulWidget {
  CartListWidget({
    Key? key,
    required this.image,
    required this.name,
    required this.price,
    required this.color,
    required this.qty,
    required this.cartItem,
  }) : super(key: key);
  final String image;
  final String name;
  final double price;
  final Color color;
  final int qty;
  CartItem cartItem;

  @override
  State<CartListWidget> createState() => _CartListWidgetState();
}

class _CartListWidgetState extends State<CartListWidget> {
  bool subscribeValue = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
      child: SizedBox(
        width: double.infinity,
        height: 117.0,
        child: Card(
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(8.0),
                      bottom: Radius.circular(8.0),
                    ),
                    color: widget.color),
                height: 102.0,
                width: 95.0,
                child: Image.asset(widget.image),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 19.0, left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.423,
                          child: Text(
                            widget.name,
                            style: kFontFamily.copyWith(
                              fontSize: 14.0,
                              color: const Color(0xff272727),
                            ),
                          ),
                        ),
                        Text(
                          '\$${double.parse(widget.price.toStringAsFixed(2))}',
                          style: kFontFamily.copyWith(
                              fontSize: 14.0, letterSpacing: 2.0),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        SpecifyQuantityWidget(
                          symbol: '-',
                          onTap: () {
                            setState(() {
                              Provider.of<CartList>(context, listen: false)
                                  .decreasePrice(widget.cartItem);
                            });
                          },
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.only(left: 10.0, right: 10.0),
                          child: Text(
                            widget.qty.toString(),
                            style: const TextStyle(fontSize: 16.0),
                          ),
                        ),
                        SpecifyQuantityWidget(
                          symbol: '+',
                          onTap: () {
                            setState(() {
                              Provider.of<CartList>(context, listen: false)
                                  .increasePrice(widget.cartItem);
                            });
                          },
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.193,
                        ),
                        SizedBox(
                          width: 15,
                          child: Checkbox(
                            side: BorderSide(
                                color:
                                    const Color(0xff292D32).withOpacity(0.4)),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            fillColor: MaterialStatePropertyAll(
                              const Color(0xff36D5AD).withOpacity(0.4),
                            ),
                            checkColor: const Color(0xff36D5AD),
                            value: subscribeValue,
                            onChanged: (value) {
                              setState(() {
                                subscribeValue = value!;
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            subscribeValue ? 'Subscribed' : 'Subscribe',
                            style: kSans,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SpecifyQuantityWidget extends StatelessWidget {
  const SpecifyQuantityWidget({
    Key? key,
    required this.symbol,
    required this.onTap,
  }) : super(key: key);
  final String symbol;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 20.0,
        width: 20.0,
        decoration: BoxDecoration(
          color: const Color(0xff9C9C9C).withOpacity(0.4),
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(8.0),
            bottom: Radius.circular(8.0),
          ),
        ),
        child: Center(
          child: Text(
            symbol,
            style: const TextStyle(fontSize: 15.0),
          ),
        ),
      ),
    );
  }
}

Widget emptyCart() {
  return Padding(
    padding: const EdgeInsets.only(left: 30.0, right: 30.0, top: 20.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Please add location with the delivery icon above first before paying',
          style: kSans.copyWith(
            fontSize: 16.0,
            fontWeight: FontWeight.w400,
            color: const Color(0xff9C9C9C),
          ),
          textAlign: TextAlign.center,
        ),
        Text(
          'Your shopping cart is empty, go buy something now',
          style: kFontFamily.copyWith(fontSize: 22.0),
          textAlign: TextAlign.center,
        ),
        const Text(''),
      ],
    ),
  );
}
// MediaQuery.of(context).size.height * 0.193 of initial width
// const SizedBox(
// width: 62.0,
// ), space between subscribe and quantity
