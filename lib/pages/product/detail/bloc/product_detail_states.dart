import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/model/ProductOrderModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductDetailStates extends Equatable {
  const ProductDetailStates();

  @override
  List<Object> get props => [];
}

class ProductOrderCreateStart extends ProductDetailStates {}

class ProductOrderCreateLoading extends ProductDetailStates {}

class ProductOrderCreateError extends ProductDetailStates {}

class ProductOrderCreateLoaded extends ProductDetailStates {
  final ProductOrderItemModel productOrderItemModel;

  const ProductOrderCreateLoaded({@required this.productOrderItemModel})
      : assert(productOrderItemModel != null);

  @override
  Object get prop => productOrderItemModel;

  @override
  String toString() => 'PostLoaded { posts: ${productOrderItemModel} }';
}
