import 'package:ani_mall/constants.dart';
import 'package:ani_mall/data/cart_item.dart';
import 'package:ani_mall/data/location_list.dart';
import 'package:ani_mall/data/product_data.dart';
import 'package:flutter/material.dart';

class CartList extends ChangeNotifier {
  List<CartItem> cart = [];
  List<Product> favoriteList = [];

  late double initialPrice;
  bool showBadge = false;
  bool like = false;

  void addToCart(CartItem cartItem, BuildContext context) {
    int existingIndex = cart.indexWhere((item) => item.name == cartItem.name);
    if (existingIndex != -1) {
      cart[existingIndex].quantity += 1;
      cart[existingIndex].price += cartItem.price;

      const snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: kGreenButtonColor,
        content: Text(
          'Product Is Already In Shopping Cart',
          style: kFontFamily,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      cart.add(cartItem);
      initialPrice = cartItem.price;
    }
    showBadge = true;
    notifyListeners();
  }

  void addToFavorite(Product productItem, BuildContext context) {
    int existingIndex = favoriteList
        .indexWhere((item) => item.description == productItem.description);
    if (existingIndex != -1) {
      const snackBar = SnackBar(
        behavior: SnackBarBehavior.floating,
        backgroundColor: kGreenButtonColor,
        content: Text(
          'Removed From Favorite',
          style: kFontFamily,
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      favoriteList.removeWhere(
          (element) => element.description == productItem.description);
    } else {
      favoriteList.add(productItem);
    }
    notifyListeners();
  }

  void increasePrice(CartItem cartItem) {
    cartItem.quantity++;
    double increment = calculatePriceIncrement(cartItem);
    cartItem.price += increment;
    notifyListeners();
  }

  void decreasePrice(CartItem cartItem) {
    if (cartItem.quantity > 0) {
      cartItem.quantity--;
      double decrement = calculatePriceDecrement(cartItem);
      cartItem.price -= decrement;
      notifyListeners();
    }
  }

  double calculatePriceDecrement(CartItem cartItem) {
    // initialPrice = cartItem.price;
    double decrementPercentage = 1.0;
    double decrement = initialPrice * decrementPercentage;
    return decrement;
  }

  double calculatePriceIncrement(CartItem cartItem) {
    // initialPrice = cartItem.price;
    double incrementPercentage = 1.0;
    double increment = initialPrice * incrementPercentage;
    return increment;
  }

  double shippingCost() {
    double cost = cart.length * 10;
    return cost;
  }

  void clearCart() {
    cart.clear();
    notifyListeners();
  }
}

class LocationList extends ChangeNotifier {
  List<Location> location = [
    Location(name: '234 Beach Rd Cleveland, New York(NY),'),
    Location(name: '234 Hillcrest AveLakewood, New York(NY)'),
  ];

  String getLocation() {
    for (Location loc in location) {
      if (loc.isChecked) {
        return loc.name;
      }
    }
    return 'Location Not Selected';
  }

  @override
  notifyListeners();
}

class UserName extends ChangeNotifier {
  String name = 'Guest';
  String email = 'Not Available';
}

class ThemeProvider with ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void toggleDarkMode(bool value) {
    _isDarkMode = value;
    notifyListeners();
  }
}

class ProductList extends ChangeNotifier {
  List<Product> get allOfferProducts {
    List<Product> allOfferProducts = [
      Product('pl2', 'Wag Dry Dog Puppy Food, Chicken and Brown ', 'In Stock',
          '10 lb/Bag', 10.42, const Color(0xff695157), '2'),
      Product(
          'pl5',
          'Hills Science Diet Dry, Adult, Sensitive skin & Stomach Chicken',
          '2 Left',
          '15 lb/Bag',
          6.31,
          const Color(0xffFAFAFA),
          '5'),
      Product(
          'pl6',
          'Purina Pro Plan High Protein Dog Food With Probiotics for Dogs',
          'In Stock',
          '6.9 lb/Bag',
          9.15,
          const Color(0xff4B4B4B),
          '6'),
      Product(
          'pl7',
          'IAMS Small & Toy Breed Adult Dry Dog Food for Small Dogs with',
          'In Stock',
          '12 lb/Bag',
          9.49,
          const Color(0xff38BE6F),
          '7'),
      Product('pl8', 'Victor Super Premium Dog Food for High Energy and Active',
          'In Stock', '19 lb/Bag', 5.96, const Color(0xff17A5AE), '8'),
      Product(
          'pl9',
          'Purina ONE High Protein Wet Dog Food True Instinct Tend...... ',
          'In Stock',
          '29 lb/Bag',
          5.76,
          const Color(0xffD23D42),
          '9'),
      Product(
          'pl10',
          'Wellness Natural Pet Food Complete Health Natural Dry Small .......',
          '10 Left',
          '12 lb/Bag',
          8.99,
          const Color(0xffB1547A),
          '10'),
      Product(
          'pl12',
          'NUTRO NATURAL CHOICE Small Breed Adult Dry Dog Food ....',
          '5 Left',
          '31 lb/Bag',
          10.93,
          const Color(0xffFAFAFA),
          '12'),
      Product('pl1', 'Wag Dry Dog Puppy Food, Chicken and Brown', 'In Stock',
          '4.5 lbs/Bag', 3.73, const Color(0xffDFCBA9), '1'),
      Product(
          'pl11',
          'Hills Science Diet Dry Dog Food, Adult, Chicken & Barley .......',
          'In Stock',
          '22 lb/Bag',
          9.92,
          const Color(0xffFAFAFA),
          '11'),
      Product('pl3', 'Wag Dry Dog Food Chicken & Sweet Potato, Grain Free ',
          'In Stock', '30 Lb/Bag', 38.13, const Color(0xffED555A), '3'),
      Product('pl4', 'Precious Dog Food Chicken & Sweet Potato, Grain Free',
          '7 Left', '6 lb/Bag', 6.93, const Color(0xff73B8E1), '4'),
    ];
    return allOfferProducts;
  }

  List<Product> get allProducts {
    List<Product> allProducts = [
      Product('pl1', 'Wag Dry Dog Puppy Food, Chicken and Brown', 'In Stock',
          '4.5 lbs/Bag', 13.33, const Color(0xffDFCBA9), '1'),
      Product('pl2', 'Wag Dry Dog Puppy Food, Chicken and Brown ', 'In Stock',
          '10 lb/Bag', 25.87, const Color(0xff695157), '2'),
      Product('pl3', 'Wag Dry Dog Food Chicken & Sweet Potato, Grain Free ',
          'In Stock', '30 Lb/Bag', 48.93, const Color(0xffED555A), '3'),
      Product('pl4', 'Precious Dog Food Chicken & Sweet Potato, Grain Free',
          '7 Left', '6 lb/Bag', 25.87, const Color(0xff73B8E1), '4'),
      Product(
          'pl5',
          'Hills Science Diet Dry, Adult, Sensitive skin & Stomach Chicken',
          '2 Left',
          '15 lb/Bag',
          19.90,
          const Color(0xffFAFAFA),
          '5'),
      Product(
          'pl6',
          'Purina Pro Plan High Protein Dog Food With Probiotics for Dogs',
          'In Stock',
          '6.9 lb/Bag',
          29.45,
          const Color(0xff4B4B4B),
          '6'),
      Product(
          'pl7',
          'IAMS Small & Toy Breed Adult Dry Dog Food for Small Dogs with',
          'In Stock',
          '12 lb/Bag',
          11.99,
          const Color(0xff38BE6F),
          '7'),
      Product('pl8', 'Victor Super Premium Dog Food for High Energy and Active',
          'In Stock', '19 lb/Bag', 35.06, const Color(0xff17A5AE), '8'),
      Product(
          'pl9',
          'Purina ONE High Protein Wet Dog Food True Instinct Tend...... ',
          'In Stock',
          '29 lb/Bag',
          19.06,
          const Color(0xffD23D42),
          '9'),
      Product(
          'pl10',
          'Wellness Natural Pet Food Complete Health Natural Dry Small .......',
          '10 Left',
          '12 lb/Bag',
          35.99,
          const Color(0xffB1547A),
          '10'),
      Product(
          'pl11',
          'Hills Science Diet Dry Dog Food, Adult, Chicken & Barley .......',
          'In Stock',
          '22 lb/Bag',
          19.56,
          const Color(0xffFAFAFA),
          '11'),
      Product(
          'pl12',
          'NUTRO NATURAL CHOICE Small Breed Adult Dry Dog Food ....',
          '5 Left',
          '31 lb/Bag',
          20.85,
          const Color(0xffFAFAFA),
          '12'),
    ];
    return allProducts;
  }

  bool toggle = false;

  bool toggleFavourite(Product product) {
    product.favourite = !product.favourite;
    notifyListeners();
    return product.favourite;
  }

  final Map<String, bool> _favorites =
      {}; // Map to store the favorite state by product ID

  bool isFavorite(String productId) {
    return _favorites[productId] ??
        false; // Return the favorite state or false if not found
  }

  void toggleFavorite(String productId) {
    if (_favorites.containsKey(productId)) {
      _favorites[productId] =
          !_favorites[productId]!; // Toggle the favorite state
    } else {
      _favorites[productId] =
          true; // Set the favorite state to true if not found
    }
    notifyListeners(); // Notify listeners about the change
  }
}

class HomeScreenProvider with ChangeNotifier {
  bool shouldRebuildHomeScreen = false;

  void rebuildHomeScreen() {
    shouldRebuildHomeScreen = true;
    notifyListeners();
  }

  void resetRebuildFlag() {
    shouldRebuildHomeScreen = false;
  }
}
