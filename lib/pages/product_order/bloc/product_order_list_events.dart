import 'package:equatable/equatable.dart';

abstract class ProductOrderListEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProductOrder extends ProductOrderListEvents {}
