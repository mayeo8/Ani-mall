import 'package:ani_mall/components/custom_app_bar.dart';
import 'package:ani_mall/components/sales_product.dart';
import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/list_data.dart';
import 'package:ani_mall/screens/wait_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/product_data.dart';
import '../../data/provider_data.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);
  static String id = 'search_screen';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //declaring the searchValue variable
  String searchValue = '';

  //returning different build widget if the value is empty or not
  @override
  Widget build(BuildContext context) {
    if (searchValue.isEmpty) {
      return _buildSearchBar();
    } else {
      return _buildProductList();
    }
  }

  Widget _buildSearchBar() {
    //this build widget returns a scaffold with some static objects but changes
    //when the searchValue is not empty
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.310,
                  height: 40.0,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        //set the state of the searchValue if it changes and notifies
                        //the tree to rebuild its widgets
                        searchValue = value;
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search product or brand here',
                      hintStyle: const TextStyle(
                          fontFamily: 'Inria Sans',
                          fontSize: 16.0,
                          color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      contentPadding:
                          const EdgeInsets.fromLTRB(32.0, 16.0, 32, 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, WaitListScreen.id);
                  },
                  icon: const Icon(Icons.watch_outlined),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'If you can’t find product here, hit the watchlist icon and add the product to our waitlist ',
                  textAlign: TextAlign.center,
                  style: kSans.copyWith(
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                    color: const Color(0xff9C9C9C),
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Text(
                  'Most search products',
                  style: kFontFamily.copyWith(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                SizedBox(
                  height: 118.0,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: salesListPhoto.length,
                    itemBuilder: (BuildContext context, int index) {
                      return MostSearchProduct(
                        color: salesListColor[index],
                        image: 'images/products/${salesListPhoto[index]}',
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Text(
                  'Most search Brands',
                  style: kFontFamily.copyWith(fontSize: 18.0),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                SizedBox(
                  height: 118.0,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductList() {
    final allProducts =
        Provider.of<ProductList>(context, listen: false).allProducts;
    List<String> filteredProducts = _filterDescriptions();
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          widget: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.height * 0.310,
                  height: 40.0,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchValue = value;
                        filteredProducts = _filterDescriptions();
                      });
                    },
                    decoration: InputDecoration(
                      hintText: 'Search product or brand here',
                      hintStyle: const TextStyle(
                          fontFamily: 'Inria Sans',
                          fontSize: 16.0,
                          color: Colors.white),
                      prefixIcon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      contentPadding:
                          const EdgeInsets.fromLTRB(32.0, 16.0, 32, 0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11.0),
                        borderSide: const BorderSide(
                          color: Colors.white,
                          width: 2.0,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(11.0),
                      ),
                    ),
                    style: const TextStyle(color: Colors.white),
                    cursorColor: Colors.white,
                    keyboardType: TextInputType.text,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.watch_outlined),
                )
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // build the view for the filtered products
              crossAxisCount: 2,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 10.0,
              childAspectRatio: 0.5,
            ),
            itemCount: filteredProducts.length,
            itemBuilder: (BuildContext context, int index) {
              final description = filteredProducts[index];
              final productIndex = productListDescription.indexOf(description);
              return ProductCard(
                productId: allProducts[productIndex],
                color: allProducts[productIndex].color,
                image: 'images/products/${allProducts[productIndex].image}.png',
                productName: allProducts[productIndex].description,
                productWeight: allProducts[productIndex].weight,
                productPrice: allProducts[productIndex].price,
                stock: allProducts[productIndex].stock,
              );
            },
          ),
        ),
      ),
    );
  }

  List<String> _filterDescriptions() {
    if (searchValue.isEmpty) {
      return [];
    }

    final List<String> filteredList = [];
    final allProducts =
        Provider.of<ProductList>(context, listen: false).allProducts;
//looping through the productListDescription list and returning each element in the list
    for (final Product product in allProducts) {
      final String lowerCaseDescription = product.description.toLowerCase();
      final String lowerCaseSearchValue = searchValue.toLowerCase();

      for (int i = 0;
          i <= product.description.length - searchValue.length;
          i++) {
        // looping through each character in individual productListDescription list
        //checking if it matches with the searchValue
        if (lowerCaseDescription.substring(i, i + searchValue.length) ==
            lowerCaseSearchValue) {
          // add the matching searchValue and description lowerCase to the filteredList
          filteredList.add(product.description);
          break;
        }
      }
    }

    return filteredList;
  }
}
