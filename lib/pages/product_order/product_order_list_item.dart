import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProductOrderListItem extends StatelessWidget {
  final ProductOrderItemModel _productOrderItemModel;
  final Function selectItem;

  ProductOrderListItem(this._productOrderItemModel, this.selectItem);

  get _goRomoveProductOrder => null;

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
                  _productOrderItemModel.imagePathProduct,
                  fit: BoxFit.fill,
                  height: 90,
                  width: 90,
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
                        _productOrderItemModel.nameProduct,
                        style: getBlackTitleStyle(),
                      ),
                      new Padding(padding: new EdgeInsets.only(top: 3.0)),
                      Text(
                        "Quantidade: "+_productOrderItemModel.quantity.toString(),
                        style: getBlackTextStyle(),
                      ),
                      new Padding(padding: new EdgeInsets.only(top: 3.0)),
                      Text(
                        "Valor Unitário: "+_productOrderItemModel.getPriceFormatMoney(),
                        style: getBlackTextStyle(),
                      )
                    ]),
              ),
            ],
          ),
          onTap: () => selectItem(_productOrderItemModel),
        ));
  }
}
