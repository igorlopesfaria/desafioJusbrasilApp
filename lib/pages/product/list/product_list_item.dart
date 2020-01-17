import 'package:desafio_jusbrasil_app/model/ProductList.dart';
import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductListItem extends StatelessWidget {
  final ProductModel _productModel;
  final Function selectItem;

  ProductListItem(this._productModel, this.selectItem);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: InkWell(
          child: Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(10.0),
                child: new Image.network(
                  _productModel.urlImagePath,
                  fit: BoxFit.fill,
                  height: 90,
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 10.0),
                height: 90,
                child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _productModel.name,
                        style: getBlackTitleStyle(),
                      ),
                      new Padding(padding: new EdgeInsets.only(top: 3.0)),
                      Text(
                        _productModel.getPriceFormatMoney(),
                        style: getBlackTextStyle(),
                      ),
                    ]),
              ),
              Expanded(
                child: new Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      'assets/images/next.svg',
                      width: 12.0,
                      height: 12.0,
                      allowDrawingOutsideViewBox: true,
                    ),
                    new Padding(padding: new EdgeInsets.only(right: 10.0))
                  ],
                ),
              )
            ],
          ),
          onTap: selectItem(_productModel),
        ));
  }
}
