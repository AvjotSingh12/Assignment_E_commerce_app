import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/product.dart';

class ApiService {
  Future<List<Product>> fetchProducts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      List<dynamic> productsJson = jsonData['products']; // This should be a list of maps

      // Convert each map to a Product object
      List<Product> products = productsJson.map((item) {
        return Product.fromJson(item as Map<String, dynamic>);
      }).toList();

      return products;
    } else {
      throw Exception('Failed to load products');
    }
  }
}
