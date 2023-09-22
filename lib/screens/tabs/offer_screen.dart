import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/constants.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/sales_product.dart';
import '../../data/list_data.dart';
import '../../data/provider_data.dart';
import '../delivery_screen.dart';

class OfferScreen extends StatefulWidget {
  const OfferScreen({super.key});

  static String id = 'offer_screen';

  @override
  State<OfferScreen> createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  @override
  Widget build(BuildContext context) {
    final allOfferProducts =
        Provider.of<ProductList>(context, listen: false).allOfferProducts;
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
                  'Offers',
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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate([
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          right: 10.0, left: 10.0, top: 10.0, bottom: 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Sponsored by',
                            style: kFontFamily.copyWith(fontSize: 18.0),
                          ),
                          const SizedBox(
                            height: 6.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ]),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 122.0,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: salesListPhoto.length,
                  itemBuilder: (BuildContext context, int index) {
                    return MostSearchProduct(
                      color: brandProductColor[index],
                      image: 'images/products/${brandProducts[index]}.png',
                    );
                  },
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
              child: Text(
                'Products',
                style: kFontFamily.copyWith(fontSize: 22.0),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(
              left: 20.0,
              right: 20.0,
              top: 5.0,
              bottom: 10.0,
            ),
            sliver: SliverGrid(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.5,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return ProductCard(
                    productId: allOfferProducts[index],
                    color: allOfferProducts[index].color,
                    image:
                        'images/products/${allOfferProducts[index].image}.png',
                    productName: allOfferProducts[index].description,
                    productWeight: allOfferProducts[index].weight,
                    productPrice: allOfferProducts[index].price,
                    stock: allOfferProducts[index].stock,
                  );
                },
                childCount: allOfferProducts.length,
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

// Padding(
// padding: const EdgeInsets.all(18.0),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [

// SizedBox(
// height: 118.0,

// ),
// ],
// ),
// )
