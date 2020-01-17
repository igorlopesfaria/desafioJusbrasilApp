import 'dart:convert';
import 'package:desafio_jusbrasil_app/model/ProductList.dart';
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
    "description": "Descrição do produto número 1",
    "price":10.0,
    "urlImagePath":"https://01.avoncdn.com/shop/media/4478787/m-aspot-2.jpg"
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
