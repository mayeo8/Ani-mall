import 'package:ani_mall/data/product_data.dart';
import 'package:flutter/material.dart';

//simulates a database with all the products details
final List<String> imgList = [
  'images/onb1.jpg',
  'images/onb2.jpg',
  'images/onboard.jpg',
];
final List<String> messageList = [
  'Welcome to our Pet Food App, the ultimate solution for all your pet food needs. '
      'Say goodbye to the hassle of searching for the perfect food or any pet items   for your furry friend,',
  'No more waiting in long lines or driving around to different stores to find the food your pet loves. '
      'Our delivery system ensures that your pet item arrives quickly',
  'Discover a comprehensive pet product app that offers an extensive range of products '
      'from over 96 brands and 57 manufacturers, allowing you to easily locate any item for your beloved pet'
];
final List<String> titleList = [
  'Search no more',
  'Efficient delivery ',
  'Welcome to Ani-Mall'
];

List<DropdownMenuItem<String>> get petList {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: ' 🐶 Dog', child: Text(' 🐶 Dog')),
    DropdownMenuItem(value: ' 🐱  Cat', child: Text(' 🐱 Cat')),
    DropdownMenuItem(value: ' 🐤 Bird', child: Text(' 🐤 Bird')),
    DropdownMenuItem(value: ' 🐠 FIsh', child: Text(' 🐠 FIsh')),
    DropdownMenuItem(value: ' 🐰 Rabbit', child: Text(' 🐰 Rabbit')),
    DropdownMenuItem(value: ' 🐷 Pig', child: Text(' 🐷 Pig')),
    DropdownMenuItem(value: ' 🦎 Lizard', child: Text(' 🦎 Lizard')),
    DropdownMenuItem(value: ' 🐢 Tortoise', child: Text(' 🐢 Tortoise')),
    DropdownMenuItem(value: ' 🐹 Hamster', child: Text(' 🐹 Hamster')),
    DropdownMenuItem(value: ' 🐴 Horse', child: Text(' 🐴 Horse')),
    DropdownMenuItem(value: ' 🐵 Monkey', child: Text(' 🐵 Monkey')),
  ];
  return menuItems;
}

List<DropdownMenuItem<String>> get categoryList {
  List<DropdownMenuItem<String>> menuItems = const [
    DropdownMenuItem(value: ' 🍚 Food ', child: Text(' 🍚 Food ')),
    DropdownMenuItem(value: '💊 Health', child: Text(' 💊 Health')),
    DropdownMenuItem(value: '🍪 Treats', child: Text(' 🍪 Treats')),
    DropdownMenuItem(value: '🛀🏾 Grooming', child: Text(' 🛀🏾 Grooming')),
    DropdownMenuItem(value: '🥣 Bowls', child: Text(' 🥣 Bowls')),
    DropdownMenuItem(value: '🧸 Toys', child: Text(' 🧸 Toys')),
    DropdownMenuItem(value: '👕 Clothes', child: Text(' 👕 Clothes')),
    DropdownMenuItem(value: '🛏 Bed', child: Text(' 🛏 Bed')),
    DropdownMenuItem(value: '🐾 Collars', child: Text(' 🐾 Collars')),
    DropdownMenuItem(value: '🚽 Litter', child: Text(' 🚽 Litter')),
  ];
  return menuItems;
}

List<String> get salesListPhoto {
  List<String> salesListPhoto = const [
    'p1.png',
    'p2.png',
    'p3.png',
    'p4.png',
    'p5.png',
    'p6.png'
  ];
  return salesListPhoto;
}

List<String> get salesListName {
  List<String> salesListName = const [
    'Merrick',
    'Kibbles and Bits',
    'Wag',
    'I AM Minichuks',
    'Cesar',
    'Nulo'
  ];
  return salesListName;
}

List<Color> get salesListColor {
  List<Color> salesListColor = const [
    Color(0xff9C5C47),
    Color(0xff3172DC),
    Color(0xffB2BE72),
    Color(0xffED555A),
    Color(0xffF395FF),
    Color(0xff17C1C0),
  ];
  return salesListColor;
}

List<String> get salesListNumber {
  List<String> salesListNumber = const [
    '12k+ sales',
    '11k sales',
    '9k sales',
    '12k+ sales',
    '10.5k sales',
    '11k sales',
  ];
  return salesListNumber;
}

List<Product> get allProductsOnSales {
  List<Product> allProductsOnSales = [];
  return allProductsOnSales;
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
    Product('pl12', 'NUTRO NATURAL CHOICE Small Breed Adult Dry Dog Food ....',
        '5 Left', '31 lb/Bag', 20.80, const Color(0xffFAFAFA), '12'),
  ];
  return allProducts;
}

List<String> get productListDescription {
  List<String> productListDescription = const [
    'Wag Dry Dog Puppy Food, Chicken and Brown',
    'Wag Dry Dog Puppy Food, Chicken and Brown ',
    'Wag Dry Dog Food Chicken & Sweet Potato, Grain Free ',
    'Precious Dog Food Chicken & Sweet Potato, Grain Free',
    'Hills Science Diet Dry, Adult, Sensitive skin & Stomach Chicken',
    'Purina Pro Plan High Protein Dog Food With Probiotics for Dogs',
    'IAMS Small & Toy Breed Adult Dry Dog Food for Small Dogs with',
    'Victor Super Premium Dog Food for High Energy and Active',
    'Purina ONE High Protein Wet Dog Food True Instinct Tend...... ',
    'Wellness Natural Pet Food Complete Health Natural Dry Small .......',
    'Hills Science Diet Dry Dog Food, Adult, Chicken & Barley .......',
    'NUTRO NATURAL CHOICE Small Breed Adult Dry Dog Food ....',
  ];
  return productListDescription;
}

List<String> get productListStock {
  List<String> productListStock = const [
    'In Stock',
    'In Stock',
    'In Stock',
    '7 Left',
    '2 Left',
    'In Stock',
    'In Stock',
    'In Stock',
    'In Stock',
    '10 Left',
    'In Stock',
    '5 Left',
  ];
  return productListStock;
}

List<String> get productListWeight {
  List<String> productListWeight = const [
    '4.5 lbs/Bag',
    '10 lb/Bag',
    '30 Lb/Bag',
    '6 lb/Bag',
    '15 lb/Bag',
    '6.9 lb/Bag',
    '12 lb/Bag',
    '19 lb/Bag',
    '29 lb/Bag',
    '12 lb/Bag',
    '22 lb/Bag',
    '31 lb/Bag',
  ];
  return productListWeight;
}

List<String> get productListPrice {
  List<String> productListPrice = const [
    '13.33',
    '25.87',
    '48.93',
    '25.87',
    '19.90',
    '19.00',
    '29.45',
    '11.99',
    '35.06',
    '35.06',
    '19.56',
    '20.00',
  ];
  return productListPrice;
}

List<Color> get productListColor {
  List<Color> productListColor = const [
    Color(0xffDFCBA9),
    Color(0xff695157),
    Color(0xffED555A),
    Color(0xff73B8E1),
    Color(0xffFFFFFF),
    Color(0xff4B4B4B),
    Color(0xff38BE6F),
    Color(0xff17A5AE),
    Color(0xffD23D42),
    Color(0xffB1547A),
    Color(0xffFFFFFF),
    Color(0xffFAFAFA),
  ];
  return productListColor;
}

List<String> get productListImage {
  List<String> productListImage = const [
    'pl1',
    'pl2',
    'pl3',
    'pl4',
    'pl5',
    'pl6',
    'pl7',
    'pl8',
    'pl9',
    'pl10',
    'pl11',
    'pl12',
  ];
  return productListImage;
}

List<String> get mostSearchProduct {
  List<String> mostSearchProduct = const [
    'pl4',
    'pl5',
    'pl6',
    'pl7',
    'pl8',
    'pl9',
    'pl10',
  ];
  return mostSearchProduct;
}

List<String> get brandProducts {
  List<String> brandProducts = const [
    'b1',
    'b2',
    'b3',
    'b4',
    'b5',
    'b6',
  ];
  return brandProducts;
}

List<Color> get mostSearchProductColor {
  List<Color> mostSearchProductColor = const [
    Color(0xff73B8E1),
    Color(0xffFFFFFF),
    Color(0xff4B4B4B),
    Color(0xff38BE6F),
    Color(0xff17A5AE),
    Color(0xffD23D42),
    Color(0xffB1547A),
  ];
  return mostSearchProductColor;
}

List<Color> get brandProductColor {
  List<Color> brandProductColor = const [
    Color(0xffFFFFFF),
    Color(0xff4DC0E8),
    Color(0xffFFFFFF),
    Color(0xff000000),
    Color(0xffffffff),
    Color(0xffffffff),
  ];
  return brandProductColor;
}
