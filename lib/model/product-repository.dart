import 'dart:convert';

import 'package:cart_sm/model/product.dart';
import 'package:flutter/services.dart';

class ProductRepository {
  Future<List<Product>> fetchProducts() async {
    String jsonString = await rootBundle.loadString('assets/products.json');
    final jsonProduct = jsonDecode(jsonString) as List<dynamic>;

    return jsonProduct.map((e) => Product.fromJson(e)).toList();
  }
}
