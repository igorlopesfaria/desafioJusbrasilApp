import 'dart:ffi';

import 'package:desafio_jusbrasil_app/sdk/data/response/product_response.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class ProductModel extends Equatable {
  int id;
  String name;
  String description;
  String imagePath;
  double price;

  ProductModel(ProductResponse response){
    this.id = response.id;
    this.name = response.name;
    this.description = response.description;
    this.price = response.price;
    this.imagePath = response.imagePath;
  }

  @override
  List<Object> get props => [id, name, description, imagePath, price];

  String getPriceFormatMoney() {
    final oCcy = new NumberFormat("#,##0.00", "pt_BR");
    String formatted = oCcy.format(price);
    return 'R\$ $formatted';
  }
}

