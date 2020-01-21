import 'package:bloc/bloc.dart';
import 'package:desafio_jusbrasil_app/model/OrderOpenedModel.dart';
import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/model/ProductOrderModel.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/bloc/product_order_list_events.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/bloc/product_order_list_states.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/product_order_list_item.dart';
import 'package:desafio_jusbrasil_app/sdk/exception/order_not_opened_exception.dart';
import 'package:desafio_jusbrasil_app/sdk/repository/product_order_repository.dart';
import 'package:flutter/cupertino.dart';

class ProductOrderListBloc extends Bloc<ProductOrderListEvents, ProductOrderListStates> {
  final ProductOrderRepository productOrderRepository;

  ProductOrderListBloc({@required this.productOrderRepository})
      : assert(productOrderRepository != null);

  @override
  ProductOrderListStates get initialState => ProductOrderListStart();

  @override
  Stream<ProductOrderListStates> mapEventToState(ProductOrderListEvents event) async* {
    if (event is FetchProductOrder) {
      yield ProductOrderListLoading();
      try {

        final response = (await productOrderRepository.fetchOrderOpened());
        OrderOpenedModel orderOpened = new OrderOpenedModel(response);


        final productOrderResponse = (await productOrderRepository.fetchProductOrder(orderOpened.id));

        var productOrderItemList = productOrderResponse.listProductOrderItem
            .map((i) => new ProductOrderItemModel(i))
            .toList();


        if (productOrderItemList.isNotEmpty)
          yield ProductOrderListLoaded(productOrderModel: ProductOrderModel(productOrderResponse));
        else
          yield ProductOrderListEmpty();
      } catch (exception) {
        print(exception);
        if(exception is OrderNotOpenedException)
          yield ProductOrderListEmpty();
        else
          yield ProductOrderListError();
      }
    }
  }
}
