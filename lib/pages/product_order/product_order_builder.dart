import 'package:bloc/bloc.dart';
import 'package:desafio_jusbrasil_app/bloc/bloc.dart';
import 'package:desafio_jusbrasil_app/pages/order/bloc/order_bloc.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/bloc/product_list_bloc.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list_page.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/product_order_list_page.dart';
import 'package:desafio_jusbrasil_app/sdk/api/desafiojusbrasil_api_client.dart';
import 'package:desafio_jusbrasil_app/sdk/repository/product_order_repository.dart';
import 'package:desafio_jusbrasil_app/sdk/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'bloc/product_order_list_bloc.dart';

class ProductOrderListBuilder extends StatelessWidget {
  ProductOrderRepository productOrderRepository;

  ProductOrderListBuilder() {
    BlocSupervisor.delegate = DesafioJusbrasilBlocDelegate();
    productOrderRepository = ProductOrderRepository(
        client: DesafioJusbrasilApiClient(
          httpClient: http.Client(),
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<ProductOrderListBloc>(
            builder: (context) => ProductOrderListBloc(productOrderRepository: productOrderRepository),
            child: BlocProvider<OrderBloc>(
                builder: (context) => OrderBloc(productOrderRepository: productOrderRepository),
                child:ProductOrderListPage()
            )
        )
    );
  }
}
