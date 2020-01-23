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

import 'order_events.dart';
import 'order_states.dart';

class OrderBloc extends Bloc<OrderEvents, OrderStates> {
  final ProductOrderRepository productOrderRepository;

  OrderBloc({@required this.productOrderRepository})
      : assert(productOrderRepository != null);

  @override
  OrderStates get initialState => OrderFinishStart();

  @override
  Stream<OrderStates> mapEventToState(OrderEvents event) async* {
    if(event is FinishOrder) {
      yield OrderFinishLoading();

      try {
        await productOrderRepository.finishOrder(event.idOrder);

        yield OrderFinishLoaded();
      } catch (exception) {
        print(exception);
        yield OrderFinishError();
      }
    }
  }
}
