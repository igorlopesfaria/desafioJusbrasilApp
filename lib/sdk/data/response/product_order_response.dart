import 'package:desafio_jusbrasil_app/sdk/data/response/product_order_item_response.dart';

class ProductOrderResponse {
  double value;
  List<ProductOrderItemResponse> listProductOrderItem;

  ProductOrderResponse({this.value, this.listProductOrderItem});

  factory ProductOrderResponse.fromJSON(Map<String, dynamic> productResponseJson) {
    return new ProductOrderResponse(
        value: productResponseJson['value'],
        listProductOrderItem: (productResponseJson['listProductOrder'] as List)
            .map((i) => ProductOrderItemResponse.fromJSON(i))
            .toList()
    );
  }
}
