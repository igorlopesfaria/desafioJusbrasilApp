import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/model/ProductOrderModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductDetailStates extends Equatable {
  const ProductDetailStates();

  @override
  List<Object> get props => [];
}

class ProductOrderCreateStart extends ProductDetailStates {

}

class ProductOrderCreatePressed extends ProductDetailStates {

}


class ProductOrderCreateLoading extends ProductDetailStates {}

class ProductOrderCreateError extends ProductDetailStates {}

class ProductOrderCreateLoaded extends ProductDetailStates {}

