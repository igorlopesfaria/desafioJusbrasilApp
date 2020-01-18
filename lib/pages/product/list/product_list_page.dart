import 'package:desafio_jusbrasil_app/model/ProductList.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/empty_list.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/error_default.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/bloc/product_list_bloc.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list_placeholder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

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
    return Scaffold(
      appBar: _buildToolbar(context),
      body: _buildMainContainer(context), //mainContainer,
    );
  }

  Widget _buildToolbar(BuildContext context) {
    return new AppBar(
      title: Text('Desafio Jus'),
      leading: SvgPicture.asset("assets/images/ic_puzzle.svg",
          width: 12.0, height: 12.0),
      actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.shopping_cart,
              color: Colors.white,
            ),
            onPressed: () => _goOrderProduct)
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
    print("Selecionado produto" + productModel.name);
  }

  void _goOrderProduct() {
    print("Veja o carrinho de compras como está");
  }
}
