import 'package:desafio_jusbrasil_app/pages/product/list/bloc/product_list_bloc.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list_page.dart';
import 'package:desafio_jusbrasil_app/sdk/api/desafiojusbrasil_api_client.dart';
import 'package:desafio_jusbrasil_app/sdk/repository/product_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';
import 'package:desafio_jusbrasil_app/bloc/bloc.dart';

class MyApp extends StatelessWidget {
  ProductRepository productRepository;

  MyApp() {
    BlocSupervisor.delegate = DesafioJusbrasilBlocDelegate();
    productRepository = ProductRepository(
        client: DesafioJusbrasilApiClient(
          httpClient: http.Client(),
        )
    );

  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: BlocProvider<ProductListBloc>(
            builder: (context) => ProductListBloc(productRepository: productRepository),
            child: ProductListPage()
        )
    );
  }
}
