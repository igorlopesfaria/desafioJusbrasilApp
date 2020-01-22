import 'dart:convert';
import 'dart:ffi';

import 'package:desafio_jusbrasil_app/sdk/data/request/product_order_request.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/order_opened_response.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/product_order_item_response.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/product_order_response.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/product_response.dart';
import 'package:desafio_jusbrasil_app/sdk/exception/order_not_opened_exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

class DesafioJusbrasilApiClient {

  static const baseUrl = 'http://10.0.2.2:8080';

  final http.Client httpClient;

  DesafioJusbrasilApiClient({
    @required this.httpClient,
  }) : assert(httpClient != null);

  final fetchProductsUrl = '$baseUrl/products';

  Future<List<ProductResponse>> fetchProduct() async {
    final productResponse = await this.httpClient.get(fetchProductsUrl);

    if (productResponse.statusCode != 200) {
      throw Exception('error getting products');
    }

    final productResponseJson = jsonDecode(productResponse.body) as List;

    return productResponseJson.map((i) => ProductResponse.fromJSON(i)).toList();
  }

  final fetchOrderOpenedUrl = '$baseUrl/orders/opened';

  Future<OrderOpenedResponse> fetchOrderOpened() async {
    final orderOpenedResponse = await this.httpClient.get(fetchOrderOpenedUrl);

    if (orderOpenedResponse.statusCode == 404) {
      throw OrderNotOpenedException('there is no order opened at moment');
    }else if(orderOpenedResponse.statusCode != 200) {
      throw Exception('error getting orders');
    }

    final orderOpenedResponseJson = jsonDecode(orderOpenedResponse.body);

    return new OrderOpenedResponse.fromJSON(orderOpenedResponseJson);
  }

  String fetchProductOrderUrl = '$baseUrl/productOrders/order/';

  Future<ProductOrderResponse> fetchProductOrder(int idOrder) async {
    final productOrderResponse = await this.httpClient.get(fetchProductOrderUrl+idOrder.toString());

    if (productOrderResponse.statusCode != 200) {
      throw Exception('error getting product orders');
    }

    final productResponseJson = jsonDecode(productOrderResponse.body);

    return new ProductOrderResponse.fromJSON(productResponseJson);
  }

  String createOrderOpenedUrl = '$baseUrl/orders';
  Future<OrderOpenedResponse> createOrderOpened() async {
    final orderOpenedResponse = await this.httpClient.post(createOrderOpenedUrl);

    if (orderOpenedResponse.statusCode != 200) {
      throw Exception('error getting product orders');
    }

    final orderOpenedResponseJson = jsonDecode(orderOpenedResponse.body);

    return new OrderOpenedResponse.fromJSON(orderOpenedResponseJson);
  }

  String createProductOrderUrl = '$baseUrl/productOrders';

  Future<Void> createProductOrder(ProductOrderRequest productOrderRequest) async {
    final productOrderResponse = await this.httpClient.post(
        createProductOrderUrl,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(productOrderRequest)
    );

    if (productOrderResponse.statusCode != 200) {
      throw Exception('error getting product orders');
    }
  }


}
