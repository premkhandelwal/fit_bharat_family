import 'dart:convert';

import 'package:fit_bharat_family/data/models/categories.dart';

class Product {
  int id;
  String name;
  String price;
  List<Category> categories;
  List<String> images;
  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.categories,
    required this.images,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'categories': categories.map((x) => x.toMap()).toList(),
      'images': images,
    };
  }

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      price: map['price'] ?? '',
      categories: List<Category>.from(map['categories']?.map((x) => Category.fromMap(x))),
      images: List<String>.from(map['images']?.map((x) =>x["src"])),
    );
  }

  String toJson() => json.encode(toMap());

  static List<Product> fromJsonList(String source) =>
      (json.decode(source) as List)
          .map((i) => Product.fromMap(i))
          .toList();

  factory Product.fromJson(String source) => Product.fromMap(json.decode(source));
}
