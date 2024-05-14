import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/products.dart';

class ProductsProvider extends ChangeNotifier {
  bool isLoading = false;
  List<Products> _products = [];
  List<Products> get products => _products;

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();

    final response = await http.get(Uri.parse(
        'https://fakestoreapi.com/products?limit=20'));

    _products = productsFromJson(response.body);
    isLoading = false;
    notifyListeners();
  }
}
