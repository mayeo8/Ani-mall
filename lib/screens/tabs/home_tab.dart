import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/components/sales_product.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/list_data.dart';
import 'package:ani_mall/screens/delivery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../data/provider_data.dart';

class Home extends StatefulWidget {
  const Home({Key? key, required this.name}) : super(key: key);
  final String? name;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: kBackgroundGreenColor),
    );
  }

  String petValue = ' 🐶 Dog';
  String categoryValue = ' 🍚 Food ';

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeScreenProvider>(
        builder: (context, homeScreenProvider, _) {
      if (homeScreenProvider.shouldRebuildHomeScreen) {
        homeScreenProvider.resetRebuildFlag();
        Provider.of<CartList>(context).showBadge = true;
      }
      final allProducts =
          Provider.of<ProductList>(context, listen: false).allProducts;
      return SafeArea(
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            widget: Padding(
              padding: const EdgeInsets.only(top: 28.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  StatefulBuilder(builder: (context, setState) {
                    return Container(
                      height: 37.0,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                      ),
                      child: DropdownButton(
                        value: petValue,
                        items: petList,
                        icon: const Icon(Icons.keyboard_arrow_down_rounded),
                        style: kFontFamily.copyWith(
                          fontSize: 20.0,
                          color: Colors.black,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            petValue = value!;
                          });
                        },
                      ),
                    );
                  }),
                  Container(
                    height: 37.0,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                    ),
                    child: DropdownButton(
                      value: categoryValue,
                      items: categoryList,
                      onChanged: (value) {
                        setState(() {
                          categoryValue = value!;
                        });
                      },
                      icon: const Icon(Icons.keyboard_arrow_down_rounded),
                      style: kFontFamily.copyWith(
                          fontSize: 20.0, color: Colors.black),
                    ),
                  ),
                  IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, DeliveryScreen.id);
                      },
                      icon: const Icon(Icons.local_shipping_outlined))
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
                                widget.name != null
                                    ? 'Welcome ${widget.name}'
                                    : 'Welcome Guest',
                                style: kFontFamily.copyWith(
                                  fontSize: 22.0,
                                  color: const Color(0xff1D1D1D),
                                ),
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              const Text(
                                'Monthly most bought product',
                                style: TextStyle(
                                  fontFamily: 'Inria Sans',
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff1D1D1D),
                                ),
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
                        return SalesProduct(
                          color: salesListColor[index],
                          image: 'images/products/${salesListPhoto[index]}',
                          productName: salesListName[index],
                          productSales: salesListNumber[index],
                        );
                      },
                    ),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                  top: 30.0,
                  bottom: 10.0,
                ),
                sliver: SliverGrid(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 10.0,
                    crossAxisSpacing: 10.0,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 1.1),
                    //emulator is 1.2 mobile is 1.1 before it was 0.5 & 0.6
                  ),
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return ProductCard(
                        productId: allProducts[index],
                        color: allProducts[index].color,
                        image:
                            'images/products/${allProducts[index].image}.png',
                        productName: allProducts[index].description,
                        productWeight: allProducts[index].weight,
                        productPrice: allProducts[index].price,
                        stock: allProducts[index].stock,
                      );
                    },
                    childCount: allProducts.length,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
