import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/model/ProductOrderModel.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class OrderStates extends Equatable {
  const OrderStates();

  @override
  List<Object> get props => [];
}

class OrderFinishStart extends OrderStates {}

class OrderFinishLoading extends OrderStates {}

class OrderFinishError extends OrderStates {}

class OrderFinishLoaded extends OrderStates {

}