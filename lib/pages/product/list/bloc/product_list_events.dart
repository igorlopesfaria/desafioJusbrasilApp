import 'package:equatable/equatable.dart';

abstract class ProductListEvents extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchProduct extends ProductListEvents {}
