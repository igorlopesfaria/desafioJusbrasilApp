import 'package:desafio_jusbrasil_app/model/ProductModel.dart';
import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/empty_list.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/error_default.dart';
import 'package:desafio_jusbrasil_app/pages/product/detail/product_detail_page.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list_placeholder.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/bloc/product_order_list_bloc.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/bloc/product_order_list_events.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/product_order_list.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/product_order_list_placeholder.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_order_list_states.dart';

class ProductOrderListPage extends StatefulWidget {
  @override
  _ProductOrderListPage createState() => _ProductOrderListPage();
}

class _ProductOrderListPage extends State<ProductOrderListPage> {
  ProductOrderListBloc _productOrderListBloc;

  @override
  void initState() {
    _productOrderListBloc = BlocProvider.of<ProductOrderListBloc>(context);
    _productOrderListBloc.add(FetchProductOrder());
  }

  Widget build(BuildContext context) {
    BlocProvider.of<ProductOrderListBloc>(context);
    return MaterialApp(
      theme: ThemeData(
        primaryColor: PrimaryColor,
      ),
      home: Scaffold(
          appBar: AppBar(
              title: Text("Carrinho de Compras"),
              leading: IconButton(icon:Icon(Icons.arrow_back),
                onPressed:() => Navigator.pop(context, false),
              )
          ),
          body: _buildMainContainer(context), //mainContainer,
        ));
  }

  Widget _buildToolbar(BuildContext context) {
    return new AppBar(
      title: Text('Desafio Jus'),
    );
  }

  @override
  Widget _buildMainContainer(BuildContext context) {
    return BlocBuilder<ProductOrderListBloc, ProductOrderListStates>(
      builder: (context, state) {
        if (state is ProductOrderListEmpty)
          return EmptyList("Nenhum item no carrinho no momento.");

        if (state is ProductOrderListLoading || state is ProductOrderListStart)
          return ProductOrderListPlaceholder();

        if (state is ProductOrderListLoaded)
          return ProductOrderList(state.productOrderModel, _removeProductSelected);
        else
          return ErrorDefault(
              "Ops! Ocorreu um problema.",
              "Não foi possível mostrar seu carrinho de compras.  Tente novamente mais tarde.",
              _tryAginPressed);
      },
    );
  }

  void _tryAginPressed() {
    _productOrderListBloc?.add(FetchProductOrder());
  }


  void _removeProductSelected(ProductOrderItemModel productOrderItemModel) {
    print("remover todos os items do "+productOrderItemModel.nameProduct);
  }
}
