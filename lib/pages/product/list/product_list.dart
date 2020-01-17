import 'package:desafio_jusbrasil_app/model/ProductList.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list_item.dart';
import 'package:flutter/material.dart';

class ProductList  extends StatelessWidget {
  final List<ProductModel> _lProductModel;
  final Function selectItem;

  ProductList(this._lProductModel, this.selectItem);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount:_lProductModel.length,
      itemBuilder: (BuildContext context, int index) {
        return new ProductListItem(_lProductModel[index],selectItem);
      },
    );

  }
}

