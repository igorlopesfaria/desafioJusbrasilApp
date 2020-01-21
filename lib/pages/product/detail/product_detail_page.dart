import 'package:desafio_jusbrasil_app/model/ProductModel.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_progress_button/flutter_progress_button.dart';

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

  onPress() {}

  @override
  Widget build(BuildContext context) {
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
                  onPressed: () => Navigator.pop(context, false),
                )),
            body: Column(children: <Widget>[
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
                              new Padding(
                                  padding: new EdgeInsets.only(top: 8.0)),
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
                              new Padding(
                                  padding: new EdgeInsets.only(top: 8.0)),
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
                  child: new ProgressButton(
                    defaultWidget: const Text('ADICIONAR AO CARRINHO',
                        style: TextStyle(color: Colors.white)),
                    progressWidget: const CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(Colors.white)),
                    color: MainButtonColor,
                    height: 45.0,
                    borderRadius: 24,
                    animate: false,
                    onPressed: addCart(),
//                        () async {
//                      int score = await Future.delayed(
//                          const Duration(milliseconds: 4000), () => 42);
//                    },
                  ),
                ),
              ),
              new Padding(padding: new EdgeInsets.only(top: 8.0)),
            ])));
  }

  addCart() {

  }
}
