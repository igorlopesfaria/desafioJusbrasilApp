import 'package:desafio_jusbrasil_app/model/ProductOrderModel.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/product_order_list_item.dart';
import 'package:desafio_jusbrasil_app/style/button_style.dart';
import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/material.dart';

class ProductOrderList extends StatelessWidget {
  final ProductOrderModel _productOrderModel;
  final Function selectItem;

  ProductOrderList(this._productOrderModel, this.selectItem);

  onPress (){
    
  }

  @override
  Widget build(BuildContext context) {

    return new Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: <Widget>[
        new Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
            child: new Text("Valor Total: "+_productOrderModel.getPriceFormatMoney().toString(),
            style: getBlackTitleStyle()),
            ),
        new Expanded(
            child: ListView.builder(
              itemCount: _productOrderModel.listProductOrderItem.length,
              itemBuilder: (BuildContext context, int index) {
                return new ProductOrderListItem(
                    _productOrderModel.listProductOrderItem[index], selectItem);
              },
          )),
        new Padding(padding: new EdgeInsets.only(top: 8.0)),
        new Container(
          height: 50,
          padding: EdgeInsets.only(left: 20.0, right: 20.0),
          child: new Align(
            alignment: Alignment.center,
            child: ButtonTheme(
                minWidth: double.infinity,
                height: 45.0,
                child:
                getMainButtonStyle(onPress, "FINALIZAR COMPRA")),
          ),
        ),
        new Padding(padding: new EdgeInsets.only(top: 8.0)),

      ],
    );
  }
}
