import 'dart:io';

import 'package:clotheses_shop/src/core/config/app_config.dart';
import 'package:clotheses_shop/src/data/model/product_model.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiService {
  Future<List<ProductModel>> getAllApiData() async {
    try {
      final uri = Uri.parse("${AppConfig.baseUrl}/${AppConfig.api}");
      Response response = await http.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (response.body as List)
            .map((e) => ProductModel.fromJson(e))
            .toList();
      } else {
        throw Exception("Error api status code");
      }
    } on HttpException {
      throw Exception("https error firebase exception");
    }
  }
}
