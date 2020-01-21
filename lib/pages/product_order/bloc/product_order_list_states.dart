import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/model/ProductOrderModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductOrderListStates extends Equatable {
  const ProductOrderListStates();

  @override
  List<Object> get props => [];
}

class ProductOrderListStart extends ProductOrderListStates {}

class ProductOrderListLoading extends ProductOrderListStates {}

class ProductOrderListEmpty extends ProductOrderListStates {}

class ProductOrderListError extends ProductOrderListStates {}

class ProductOrderListLoaded extends ProductOrderListStates {
  final ProductOrderModel productOrderModel;

  const ProductOrderListLoaded({@required this.productOrderModel})
      : assert(productOrderModel != null);

  @override
  Object get prop => productOrderModel;

  @override
  String toString() => 'PostLoaded { posts: ${productOrderModel} }';
}
