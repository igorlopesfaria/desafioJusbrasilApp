import 'package:desafio_jusbrasil_app/model/ProductModel.dart';
import 'package:desafio_jusbrasil_app/pages/comon_view/custom_dialog.dart';
import 'package:desafio_jusbrasil_app/pages/product/detail/bloc/product_detail_bloc.dart';
import 'package:desafio_jusbrasil_app/pages/product/detail/bloc/product_detail_events.dart';
import 'package:desafio_jusbrasil_app/pages/product/detail/bloc/product_detail_states.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProductDetail extends StatefulWidget {
  ProductModel _productModel;

  ProductDetail(ProductModel productModel) {
    this._productModel = productModel;
  }

  @override
  _ProductDetailState createState() => _ProductDetailState(_productModel);
}

class _ProductDetailState extends State<ProductDetail> {
  ProductModel _productModel;

  ProductDetailBloc _productDetailBloc;

  @override
  void initState() {
    _productDetailBloc = BlocProvider.of<ProductDetailBloc>(context);
  }

  _ProductDetailState(ProductModel productModel) {
    this._productModel = productModel;
  }

  onPress() {}

  @override
  Widget build(BuildContext context) {
    _productDetailBloc = BlocProvider.of<ProductDetailBloc>(context);
    return MaterialApp(
        title: 'Desafio Jus',
        theme: ThemeData(
          primaryColor: PrimaryColor,
        ),
        home: Scaffold(
            appBar: AppBar(
                title: Text("Detalhes do produto"),
                leading: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () =>  Navigator.of(context).pop(),
                )),
            body: BlocBuilder<ProductDetailBloc, ProductDetailStates>(
                builder: (context, state) {
              if (state is ProductOrderCreateError) {
                WidgetsBinding.instance.addPostFrameCallback((_) =>
                    _showErrorMessage(context,
                        "Problema ao adicionar produto no carrinho. Tente novamente mais tarde"));
              }

              if (state is ProductOrderCreateLoaded) {
                WidgetsBinding.instance.addPostFrameCallback((_) => showDialog(
                      context: context,
                      builder: (BuildContext context) => CustomDialog(
                        title: "Successo",
                        description:
                            "Produto adicionado ao carrinho com sucesso. Conclua sua compra clicando no carrinho de compras",
                        buttonText: "Continuar",
                        image: SvgPicture.asset(
                          'assets/images/ic_ok.svg',
                          width: 70.0,
                          height: 70.0,
                          allowDrawingOutsideViewBox: true,
                        ),
                      ),
                    ));
              }
              return buildScreen(state);
            })));
  }

  addCart(ProductDetailStates states) {
    if (!(states is ProductOrderCreateLoading)) {
      _productDetailBloc.add(CreateProductOrder(idProduct: _productModel.id));
    }
  }

  void _showErrorMessage(BuildContext context, String message) {
    Scaffold.of(context).showSnackBar(
        SnackBar(content: Text(message), backgroundColor: Colors.red));
  }

  _showSnakBar(String msg) {
    Scaffold.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
      ),
    );
  }

  String getStateText(ProductDetailStates state) {
    String text = "ADICIONAR AO CARRINHO";
    if (state is ProductOrderCreateLoading) {
      text = "CARREGANDO...";
    }
    return text;
  }

  Widget buildScreen(ProductDetailStates state) {
    return Column(children: <Widget>[
      Expanded(
        child: SingleChildScrollView(
          child: Column(children: [
            Padding(padding: new EdgeInsets.only(top: 8.0)),
            Container(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: new Image.network(
                      _productModel.imagePath,
                      fit: BoxFit.contain,
                      height: 190,
                    ),
                  )
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.all(16.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        _productModel.name,
                        style: getBlackTitleStyle(),
                      ),
                      new Padding(padding: new EdgeInsets.only(top: 8.0)),
                      Row(
                        children: <Widget>[
                          Text(
                            "VALOR: ",
                            style: getBlackTextStyle(),
                          ),
                          Text(
                            _productModel.getPriceFormatMoney(),
                            style: getBlackTextStyle(),
                          )
                        ],
                      ),
                      new Padding(padding: new EdgeInsets.only(top: 8.0)),
                      Text(
                        _productModel.description,
                        style: getBlackTextStyle(),
                      )
                    ]))
          ]),
        ),
      ),
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
                    borderRadius: new BorderRadius.circular(18.0)
                ),
                onPressed: () => addCart(state),
                  child: Text(
                      getStateText(state),
                      style: TextStyle(
                          color: WhiteColor,
                          fontSize: 15)
                  )
              ),


            )
        ),
      ),
      new Padding(padding: new EdgeInsets.only(top: 8.0)),
    ]);
  }
}
