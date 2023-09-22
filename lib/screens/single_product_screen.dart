import 'package:ani_mall/components/button_component.dart';
import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/cart_item.dart';
import 'package:ani_mall/data/provider_data.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final player = AudioPlayer();

class SingleProductScreen extends StatelessWidget {
  const SingleProductScreen(
      {Key? key,
      required this.name,
      required this.color,
      required this.image,
      required this.productWeight,
      required this.price})
      : super(key: key);

  final String name;
  final Color color;
  final String image;
  final String productWeight;
  final double price;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: CustomAppBar(
          widget: Padding(
            padding: const EdgeInsets.only(top: 50.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(Icons.arrow_circle_left_rounded),
                ),
                Text(
                  'Products Details',
                  style: kFontFamily.copyWith(fontSize: 22.0),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.delivery_dining_outlined),
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            children: [
              Container(
                color: color,
                height: 378.0 - 56,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Image.asset(image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  children: [
                    Text(
                      '$name $productWeight',
                      style: kFontFamily.copyWith(fontSize: 18.0),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      kProductDetails,
                      style: kFontFamily.copyWith(fontSize: 14.0),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      kProductAbout,
                      style: const TextStyle(
                          fontFamily: 'Inria Sans', fontSize: 16.0),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ButtonsWidget(
                      onPress: () {
                        playSound();
                        Provider.of<CartList>(context, listen: false).addToCart(
                            CartItem(
                              name: name,
                              price: price,
                              image: image,
                              color: color,
                            ),
                            context);
                      },
                      color: kGreenButtonColor,
                      text: 'Add To Cart',
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

void playSound() {
  player.play(AssetSource('new.mp3'));
}
