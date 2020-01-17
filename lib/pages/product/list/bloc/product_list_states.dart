import 'package:desafio_jusbrasil_app/model/ProductList.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductListStates extends Equatable {
  const ProductListStates();

  @override
  List<Object> get props => [];
}

class ProductListStart extends ProductListStates {}

class ProductListLoading extends ProductListStates {}

class ProductListEmpty extends ProductListStates {}

class ProductListError extends ProductListStates {}

class ProductListLoaded extends ProductListStates {
  final List<ProductModel> listProduct;

  const ProductListLoaded({@required this.listProduct})
      : assert(listProduct != null);

  @override
  List<Object> get props => [listProduct];

  @override
  String toString() => 'PostLoaded { posts: ${listProduct.length} }';
}
