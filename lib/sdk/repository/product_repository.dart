import 'package:desafio_jusbrasil_app/sdk/api/desafiojusbrasil_api_client.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/product_response.dart';
import 'package:flutter/cupertino.dart';

class ProductRepository {
  final DesafioJusbrasilApiClient client;

  ProductRepository({@required this.client})
      : assert(client != null);

  Future<List<ProductResponse>> fetchProductRepository() async {
    return await client.fetchProduct();
  }
}
