import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/components/sales_product.dart';
import 'package:ani_mall/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../data/provider_data.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  static String id = 'favorite_screen';

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  Widget build(BuildContext context) {
    final provideFavoriteList =
        Provider.of<CartList>(context, listen: false).favoriteList;
    return SafeArea(
      child: Scaffold(
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
                    'Favorite',
                    style: kFontFamily.copyWith(fontSize: 22.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Expanded(child: Text('')),
              ],
            ),
          ),
        ),
        body: Consumer<CartList>(
          builder: (BuildContext context, value, Widget? child) {
            return CustomScrollView(
              slivers: [
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                    top: 30.0,
                    bottom: 10.0,
                  ),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                      childAspectRatio: 0.5,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return ProductCard(
                          productId: provideFavoriteList[index],
                          color: provideFavoriteList[index].color,
                          image: provideFavoriteList[index].image,
                          productName: provideFavoriteList[index].description,
                          productWeight: provideFavoriteList[index].weight,
                          productPrice: provideFavoriteList[index].price,
                          stock: provideFavoriteList[index].stock,
                        );
                      },
                      childCount: provideFavoriteList.length,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
