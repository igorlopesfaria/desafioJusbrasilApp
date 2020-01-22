import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductDetailEvents extends Equatable {
  const ProductDetailEvents();

  @override
  List<Object> get props => [];
}

class CreateProductOrder extends ProductDetailEvents {
  final int idProduct;

  const CreateProductOrder({
    @required this.idProduct
  });

  @override
  List<Object> get props => [idProduct];

  @override
  String toString() =>
      'ProductOrderCreatePressed { idProduct: $idProduct }';


}
