import 'package:desafio_jusbrasil_app/model/ProductList.dart';
import 'package:desafio_jusbrasil_app/style/button_style.dart';
import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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

  _ProductDetailState(ProductModel productModel) {
    this._productModel = productModel;
  }

  onPress (){

  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      Expanded(
        child: SingleChildScrollView(
          child: Column(children: [
            Container(
              color: Colors.white,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: new Image.network(
                      _productModel.urlImagePath,
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
              child:getMainButtonStyle(onPress, "ADICIONAR AO CARRINHO")),

        ),
      ),
      new Padding(padding: new EdgeInsets.only(top: 8.0)),

    ]);
  }
}
