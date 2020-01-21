import 'package:desafio_jusbrasil_app/sdk/api/desafiojusbrasil_api_client.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/order_opened_response.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/product_order_response.dart';
import 'package:flutter/cupertino.dart';

class ProductOrderRepository {
  final DesafioJusbrasilApiClient client;

  ProductOrderRepository({@required this.client})
      : assert(client != null);

  Future<ProductOrderResponse> fetchProductOrder(int idOrder) async {
    return await client.fetchProductOrder(idOrder);
  }
  Future<OrderOpenedResponse> fetchOrderOpened() async {
    return await client.fetchOrderOpened();
  }

}
