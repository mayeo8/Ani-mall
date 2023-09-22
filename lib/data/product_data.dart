import 'package:flutter/material.dart';

class Product {
  String image;
  String description;
  String stock;
  String weight;
  double price;
  Color color;
  bool favourite;
  String id;

  Product(this.image, this.description, this.stock, this.weight, this.price,
      this.color, this.id,
      {this.favourite = false});
}
