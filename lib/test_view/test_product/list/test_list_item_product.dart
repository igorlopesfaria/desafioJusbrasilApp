import 'dart:convert';

import 'package:desafio_jusbrasil_app/model/ProductModel.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list_item.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/product_response.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:flutter/material.dart';

void main() => runApp(TestProductItemApp());

class TestProductItemApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Desafio JusBrasil',
        theme: ThemeData(
          primaryColor: PrimaryColor,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: Text('Desafio JusBrasil'),
          ),
          body: ProductItemTest(),
        ));
  }
}

class ProductItemTest extends StatelessWidget {
  String jsonObjectResponse = '''{
    "id":1,
    "name":"Nome produto 1",
    "description": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nis",
    "price":10.0,
    "urlImagePath":"https://www.shoptv.com.ph/media/catalog/product/cache/1/small_image/300x/6dcdb3bec3b7d3d8fa2d31ce95a0090e/6/0/60219801_-1.jpg"
  }''';

  @override
  Widget build(BuildContext context) {
    return ProductListItem(getProductModel(), selectItem);
  }

  void selectItem(ProductModel filterModel) {
    print("clicou no item " + filterModel.name);
  }

  ProductModel getProductModel() {
    return new ProductModel(
        ProductResponse.fromJSON((json.decode(jsonObjectResponse))));
  }
}
