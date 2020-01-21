import 'package:desafio_jusbrasil_app/model/ProductModel.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/empty_list.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/error_default.dart';
import 'package:desafio_jusbrasil_app/pages/product/detail/product_detail_page.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/bloc/product_list_bloc.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list_placeholder.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/product_order_builder.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/product_list_events.dart';
import 'bloc/product_list_states.dart';

class ProductListPage extends StatefulWidget {
  @override
  _ProductListPage createState() => _ProductListPage();
}

class _ProductListPage extends State<ProductListPage> {
  ProductListBloc _productListBloc;

  @override
  void initState() {
    _productListBloc = BlocProvider.of<ProductListBloc>(context);
    _productListBloc.add(FetchProduct());
  }

  Widget build(BuildContext context) {
    BlocProvider.of<ProductListBloc>(context);
    return MaterialApp(
        title: 'Desafio Jus',
        theme: ThemeData(
          primaryColor: PrimaryColor,
        ),
        home: Scaffold(
          appBar: _buildToolbar(context),
          drawer: Drawer(
              child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: <Widget>[
              Padding(padding: new EdgeInsets.only(top: 20.0)),
              ListTile(
                leading: Icon(
                  Icons.monetization_on,
                ),
                title: Text('Histórico de compras'),
                onTap: () {
                  // Update the state of the app.
                  // ...
                },
              ),
            ],
          )),

          body: _buildMainContainer(context), //mainContainer,
        ));
  }

  Widget _buildToolbar(BuildContext context) {
    return new AppBar(
      title: Text('Desafio Jus'),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
            onPressed: _goOrderProduct)
      ],
    );
  }

  @override
  Widget _buildMainContainer(BuildContext context) {
    return BlocBuilder<ProductListBloc, ProductListStates>(
      builder: (context, state) {
        if (state is ProductListEmpty)
          return EmptyList(
              "Desculpa, mas não encontramos especialidades para o filtro informado.");

        if (state is ProductListLoading || state is ProductListStart)
          return ProductListPlaceholder();

        if (state is ProductListLoaded)
          return ProductList(state.listProduct, _productSelected);
        else
          return ErrorDefault(
              "Ops! Ocorreu um problema.",
              "Não foi possível realizar a listagem dos produtos.  Tente novamente mais tarde.",
              _tryAginPressed);
      },
    );
  }

  void _tryAginPressed() {
    _productListBloc?.add(FetchProduct());
  }

  void _productSelected(ProductModel productModel) {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductDetail(productModel)));
    print("Selecionado produto" + productModel.name);
  }

  void _goOrderProduct() {
    Navigator.push(context,
        MaterialPageRoute(builder: (context) => ProductOrderListBuilder()));

    print("Veja o carrinho de compras como está");
  }
}
