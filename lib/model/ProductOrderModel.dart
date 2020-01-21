import 'package:desafio_jusbrasil_app/sdk/data/response/product_order_response.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

import 'ProductOrderItemModel.dart';

class ProductOrderModel extends Equatable {
  double value;
  List<ProductOrderItemModel> listProductOrderItem;


  ProductOrderModel(ProductOrderResponse response) {
    this.value = response.value;
    this.listProductOrderItem = response.listProductOrderItem
        .map((i) => new ProductOrderItemModel(i))
        .toList();
  }

  @override
  List<Object> get props =>
      [value, listProductOrderItem];

  String getPriceFormatMoney() {
    final oCcy = new NumberFormat("#,##0.00", "pt_BR");
    String formatted = oCcy.format(value);
    return 'R\$ $formatted';
  }


}
