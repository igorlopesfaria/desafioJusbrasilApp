import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class ProductOrderListEvents extends Equatable {
  const ProductOrderListEvents();

  @override
  List<Object> get props => [];
}

class FetchProductOrder extends ProductOrderListEvents {
  const FetchProductOrder();
}