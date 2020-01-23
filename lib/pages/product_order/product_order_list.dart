import 'package:desafio_jusbrasil_app/model/ProductOrderItemModel.dart';
import 'package:desafio_jusbrasil_app/pages/product_order/product_order_list_item.dart';
import 'package:flutter/material.dart';

class ProductOrderList extends StatelessWidget {
  final List<ProductOrderItemModel> _productOrderList;
  final Function selectItem;

  ProductOrderList(this._productOrderList, this.selectItem);


  @override
  Widget build(BuildContext context) {

    return new ListView.builder(
              itemCount: _productOrderList.length,
              itemBuilder: (BuildContext context, int index) {
                return new ProductOrderListItem(
                    _productOrderList[index], selectItem);
              },
          );
  }
}
