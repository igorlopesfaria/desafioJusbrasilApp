import 'package:bloc/bloc.dart';
import 'package:desafio_jusbrasil_app/bloc/bloc.dart';
import 'package:desafio_jusbrasil_app/model/ProductModel.dart';
import 'package:desafio_jusbrasil_app/pages/product/detail/product_detail_page.dart';
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

import 'bloc/product_detail_bloc.dart';


class ProductDetailBuilder extends StatelessWidget {
  ProductOrderRepository productOrderRepository;
  ProductModel _productModel;

  ProductDetailBuilder(ProductModel productModel) {
    this._productModel = productModel;
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
        home: BlocProvider<ProductDetailBloc>(
            builder: (context) => ProductDetailBloc(productOrderRepository: productOrderRepository),
            child: ProductDetail(this._productModel)
        )
    );
  }
}
//        ) 8784-6184
