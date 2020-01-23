import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/custom_dialog.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/empty_list.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/error_default.dart';
import 'package:desafio_jusbrasil_app/pages/order/bloc/order_bloc.dart';
import 'package:desafio_jusbrasil_app/pages/order/bloc/order_events.dart';
import 'package:desafio_jusbrasil_app/pages/order/bloc/order_states.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/bloc/product_order_list_bloc.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/bloc/product_order_list_events.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/product_order_list.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/product_order_list_placeholder.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import 'bloc/product_order_list_states.dart';

class ProductOrderListPage extends StatefulWidget {
  @override
  _ProductOrderListPage createState() => _ProductOrderListPage();
}

class _ProductOrderListPage extends State<ProductOrderListPage> {
  ProductOrderListBloc _productOrderListBloc;
  OrderBloc _orderBloc;

  onPress() {}

  @override
  void initState() {
    _productOrderListBloc = BlocProvider.of<ProductOrderListBloc>(context);
    listOrderProduct();
    _orderBloc = BlocProvider.of<OrderBloc>(context);
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
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () => Navigator.pop(context, false),
              )),
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

        if (state is ProductOrderListLoading)
          return ProductOrderListPlaceholder();

        if (state is ProductOrderListLoaded) {
          return BlocBuilder<OrderBloc, OrderStates>(
              builder: (contextOrder, stateOrder) {
            if (stateOrder is OrderFinishError) {
              WidgetsBinding.instance.addPostFrameCallback((_) =>
                  _showErrorMessage(context,
                      "Problema ao Finalizar compra. Tente novamente mais tarde"));
            }

            if (stateOrder is OrderFinishLoaded) {
              WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) => CustomDialog(
                      title: "Successo",
                      description:
                          "Produto comprado com sucesso. Obrigado pela preferência",
                      buttonText: "Continuar",
                      onContinuePress: () => listOrderProduct(),
                      image: SvgPicture.asset(
                        'assets/images/ic_ok.svg',
                        width: 70.0,
                        height: 70.0,
                        allowDrawingOutsideViewBox: true,
                      ),
                    ),
                  ));
            }

            return getProductOrderContent(state, stateOrder);
          });
        } else
          return ErrorDefault(
              "Ops! Ocorreu um problema.",
              "Não foi possível mostrar seu carrinho de compras.  Tente novamente mais tarde.",
              _tryAginPressed);
      },
    );
  }

  void _tryAginPressed() {
    listOrderProduct();
  }

  void _removeProductSelected(ProductOrderItemModel productOrderItemModel) {
    print("remover todos os items do " + productOrderItemModel.nameProduct);
  }

  Widget getProductOrderContent(
      ProductOrderListStates state, OrderStates stateOrder) {
    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: new Text(
              "Valor Total: " +
                  (state as ProductOrderListLoaded)
                      .productOrderModel
                      .getPriceFormatMoney()
                      .toString(),
              style: getBlackTitleStyle()),
        ),
        new Expanded(
            child: ProductOrderList(
                (state as ProductOrderListLoaded)
                    .productOrderModel
                    .listProductOrderItem,
                _removeProductSelected)),
        new Padding(padding: new EdgeInsets.only(top: 8.0)),
        new Container(
          height: 50,
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: new Align(
            alignment: Alignment.center,
            child: ButtonTheme(
              minWidth: double.infinity,
              height: 45.0,
              child: RaisedButton(
                  color: MainButtonColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0)),
                  onPressed: () => finishCart(stateOrder, state),
                  child: Text(getStateText(stateOrder),
                      style: TextStyle(color: WhiteColor, fontSize: 15))),
            ),
          ),
        ),
        new Padding(padding: new EdgeInsets.only(top: 8.0)),
      ],
    );
  }

  finishCart(OrderStates statesOrder, ProductOrderListStates state) {
    if (!(statesOrder is OrderFinishLoading)) {
      _orderBloc.add(FinishOrder(
          idOrder: (state as ProductOrderListLoaded)
              .productOrderModel
              .listProductOrderItem[0]
              .idOrder));
    }
  }

  void _showErrorMessage(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red));
  }

//  _showSnakBar(String msg) {
//    Scaffold.of(context).showSnackBar(
//      SnackBar(
//        content: Text(msg),
//      ),
//    );
//  }

  String getStateText(OrderStates statesOrder) {
    String text = "FINALIZAR COMPRA";
    if (statesOrder is OrderFinishLoading) {
      text = "PAGANDO...";
    }
    return text;
  }

  listOrderProduct() {
    _productOrderListBloc?.add(FetchProductOrder());
  }
}
