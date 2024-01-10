import 'dart:convert';

import 'package:clotheses_shop/src/core/config/app_config.dart';
import 'package:clotheses_shop/src/data/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  Future<List<Product>> getAllProductData() async {
    final uri = Uri.parse(AppConfig.baseUrl + AppConfig.api);
    Response response = await http.get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      List<dynamic> data = json.decode(response.body);
      return data.map((e) => Product.fromJson(e)).toList();
    } else {
      throw Exception("Error https status code ${response.statusCode}");
    }
  }
}
