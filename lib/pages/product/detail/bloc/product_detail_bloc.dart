import 'package:bloc/bloc.dart';
import 'package:desafio_jusbrasil_app/model/OrderOpenedModel.dart';
import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/pages/product/detail/bloc/product_detail_events.dart';
import 'package:desafio_jusbrasil_app/pages/product/detail/bloc/product_detail_states.dart';
import 'package:desafio_jusbrasil_app/sdk/data/request/product_order_request.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/product_order_item_response.dart';
import 'package:desafio_jusbrasil_app/sdk/exception/order_not_opened_exception.dart';
import 'package:desafio_jusbrasil_app/sdk/repository/product_order_repository.dart';
import 'package:flutter/cupertino.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvents, ProductDetailStates> {
  final ProductOrderRepository productOrderRepository;

  ProductDetailBloc({@required this.productOrderRepository})
      : assert(productOrderRepository != null);

  @override
  ProductDetailStates get initialState => ProductOrderCreateStart();

  @override
  Stream<ProductDetailStates> mapEventToState(
      ProductDetailEvents event) async* {
    if (event is CreateProductOrder) {
      yield ProductOrderCreateLoading();
      try {
        OrderOpenedModel orderOpened = new OrderOpenedModel(
            (await productOrderRepository.fetchOrderOpened()));

        await  productOrderRepository.createProductOrder(
            ProductOrderRequest(
            idProduct: event.idProduct, idOrder: orderOpened.id));

        yield ProductOrderCreateLoaded();
      } catch (exception) {
        print(exception);
        if (exception is OrderNotOpenedException) {

          try {
            OrderOpenedModel orderOpened = new OrderOpenedModel(
                (await productOrderRepository.createOrderOpened()));

            await productOrderRepository.createProductOrder(ProductOrderRequest(
                idProduct: event.idProduct, idOrder: orderOpened.id));

            yield ProductOrderCreateLoaded();

          }catch (exception) {
            yield ProductOrderCreateError();
          }
        } else
          yield ProductOrderCreateError();
      }
    }
  }

}
