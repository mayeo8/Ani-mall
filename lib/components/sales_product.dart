import 'dart:async';

import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/cart_item.dart';
import 'package:ani_mall/data/provider_data.dart';
import 'package:ani_mall/screens/single_product_screen.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/product_data.dart';

class SalesProduct extends StatelessWidget {
  const SalesProduct({
    Key? key,
    required this.color,
    required this.image,
    required this.productName,
    required this.productSales,
  }) : super(key: key);
  final Color color;
  final String image;
  final String productName;
  final String productSales;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 122.0,
      width: 86.0,
      child: Card(
        color: const Color(0xffE8E8E8),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8.0),
                  ),
                  color: color),
              height: 76.0,
              width: double.infinity,
              child: Image.asset(image),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: Text(
                    productName,
                    style: const TextStyle(fontSize: 10.0),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.shopping_bag_outlined,
                      size: 15.0,
                      color: Color(0xff248E73),
                    ),
                    Text(
                      productSales,
                      style: const TextStyle(fontSize: 10.0),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class MostSearchProduct extends StatelessWidget {
  const MostSearchProduct({Key? key, required this.color, required this.image})
      : super(key: key);

  final Color color;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.0,
      width: 90.0,
      child: Card(
        elevation: 15.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(8.0),
                    bottom: Radius.circular(8.0),
                  ),
                  color: color),
              height: 110.0,
              width: double.infinity,
              child: Image.asset(image),
            ),
          ],
        ),
      ),
    );
  }
}

final player = AudioPlayer();

void playSound(String sound) {
  player.play(AssetSource(sound));
}

class ProductCard extends StatefulWidget {
  const ProductCard({
    Key? key,
    required this.color,
    required this.image,
    required this.productName,
    required this.productWeight,
    required this.productPrice,
    required this.stock,
    required this.productId,
  }) : super(key: key);
  final Color color;
  final String image;
  final String productName;
  final String productWeight;
  final double productPrice;
  final String stock;
  final Product productId;

  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool _isClicked = false;
  bool colorBool = false;
  Color originalColor = const Color(0xffE8E8E8);
  Color clickedColor = const Color(0xffE8E8E8);
  bool isColorChanged = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 100),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _changeColor() {
    setState(() {
      clickedColor = kBackgroundGreenColor;
      isColorChanged = true;
    });

    Timer(const Duration(seconds: 2), () {
      setState(() {
        clickedColor = originalColor;
        isColorChanged = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = Provider.of<ProductList>(context);
    final isFavorite = favoriteProvider.isFavorite(widget.productId.id);
    return GestureDetector(
      child: SizedBox(
        height: 281.0,
        width: 180.0,
        child: Card(
          color: const Color(0xffE8E8E8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(8.0),
                      ),
                      color: widget.color,
                    ),
                    height: 160.0,
                    width: double.infinity,
                    child: Image.asset(widget.image),
                  ),
                  Positioned(
                      bottom: 45,
                      right: 0,
                      child: Column(
                        children: [
                          IconButton(
                            onPressed: () {
                              playSound('new.mp3');
                              if (!isColorChanged) {
                                _changeColor();
                                Provider.of<CartList>(context, listen: false)
                                    .addToCart(
                                  CartItem(
                                    name: widget.productName,
                                    price: widget.productPrice,
                                    image: widget.image,
                                    color: widget.color,
                                  ),
                                  context,
                                );
                              }
                            },
                            icon: Image.asset(
                              'images/icons/icons8-paper-bag-64.png',
                              color: clickedColor,
                              width: 24.0,
                              height: 24.0,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              playSound('soft.mp3');
                              setState(() {
                                favoriteProvider
                                    .toggleFavorite(widget.productId.id);

                                Provider.of<ProductList>(context, listen: false)
                                    .toggle = !Provider.of<ProductList>(context,
                                        listen: false)
                                    .toggle;
                                Provider.of<CartList>(context, listen: false)
                                    .addToFavorite(
                                        Product(
                                            widget.image,
                                            widget.productName,
                                            widget.stock,
                                            widget.productWeight,
                                            widget.productPrice,
                                            widget.color,
                                            widget.productId.id,
                                            favourite: isFavorite),
                                        context);
                                _isClicked = !_isClicked;
                                if (_isClicked) {
                                  _animationController.repeat(reverse: true);
                                  Future.delayed(const Duration(seconds: 2),
                                      () {
                                    setState(() {
                                      _isClicked = false;
                                      _animationController.reset();
                                    });
                                  });
                                }
                              });
                            },
                            child: AnimatedBuilder(
                              animation: _animationController,
                              builder: (context, child) {
                                return Transform.translate(
                                  offset: Offset(
                                      (_animationController.value * 10 - 5) *
                                          (_isClicked ? 1 : 0),
                                      0.0),
                                  child: child,
                                );
                              },
                              child: Image.asset(
                                'images/icons/icons8-favourite-40.png',
                                color: isFavorite
                                    ? Colors.red
                                    : const Color(0xffE8E8E8),
                                width: 24.0,
                                height: 24.0,
                              ),
                            ),
                          ),
                        ],
                      ))
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 75.0,
                      child: Text(
                        widget.productName,
                        style: const TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'Inria Sans',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        widget.stock,
                        style: const TextStyle(
                          fontSize: 10.0,
                          color: Color(0xffCF993F),
                          fontFamily: 'Inria Sans',
                        ),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          widget.productWeight,
                          style: const TextStyle(
                            fontSize: 10.0,
                            color: Color(0xff1D1D1D),
                          ),
                        ),
                        Container(
                          width: 80.0,
                          height: 24.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.8),
                            color: Colors.white,
                          ),
                          child: Text(
                            '\$${widget.productPrice}',
                            style: kFontFamily.copyWith(
                              fontSize: 22.0,
                              letterSpacing: 2.0,
                              color: const Color(0xff248E73),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleProductScreen(
              name: widget.productName,
              color: widget.color,
              productWeight: widget.productWeight,
              image: widget.image,
              price: widget.productPrice,
            ),
          ),
        );
      },
    );
  }
}
