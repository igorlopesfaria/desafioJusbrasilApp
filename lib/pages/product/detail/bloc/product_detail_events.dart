import 'package:equatable/equatable.dart';

abstract class ProductDetailEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class createProductOrder extends ProductDetailEvents {}
