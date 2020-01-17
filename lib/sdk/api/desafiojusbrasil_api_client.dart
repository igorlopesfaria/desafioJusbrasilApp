import 'dart:convert';

import 'package:desafio_jusbrasil_app/sdk/data/response/product_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class DesafioJusbrasilApiClient {

  static const baseUrl = 'http://localhost:8080';

  final http.Client httpClient;

  DesafioJusbrasilApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  final fetchProductsUrl = '$baseUrl/products';

  Future<List<ProductResponse>> fetchProduct() async {
    final productResponse = await this.httpClient.get(fetchProductsUrl);

    if (productResponse.statusCode != 200) {
      throw Exception('error getting states');
    }

    final productResponseJson = jsonDecode(productResponse.body) as List;

    return productResponseJson.map((i) => ProductResponse.fromJSON(i)).toList();
  }

}
