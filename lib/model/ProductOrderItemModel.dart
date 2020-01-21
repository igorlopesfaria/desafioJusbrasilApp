import 'package:desafio_jusbrasil_app/sdk/data/response/product_order_item_response.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class ProductOrderItemModel extends Equatable {
  int idProduct;
  int idOrder;
  double priceProduct;
  int quantity;
  String imagePathProduct;
  String nameProduct;

  ProductOrderItemModel(ProductOrderItemResponse response) {
    this.idProduct = response.idProduct;
    this.idOrder = response.idOrder;
    this.priceProduct = response.priceProduct;
    this.quantity = response.quantity;
    this.imagePathProduct = response.imagePathProduct;
    this.nameProduct = response.nameProduct;
  }

  @override
  List<Object> get props =>
      [idProduct, idOrder, priceProduct, quantity, imagePathProduct, nameProduct];

  String getPriceFormatMoney() {
    final oCcy = new NumberFormat("#,##0.00", "pt_BR");
    String formatted = oCcy.format(priceProduct);
    return 'R\$ $formatted';
  }
}
