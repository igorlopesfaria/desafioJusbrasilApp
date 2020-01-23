import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class OrderEvents extends Equatable {
  const OrderEvents();

  @override
  List<Object> get props => [];
}


class FinishOrder extends OrderEvents {
  final int idOrder;

  const FinishOrder({
    @required this.idOrder
  });

  @override
  List<Object> get props => [idOrder];

  @override
  String toString() =>
      'idOrder { idOrder: $idOrder }';

}
