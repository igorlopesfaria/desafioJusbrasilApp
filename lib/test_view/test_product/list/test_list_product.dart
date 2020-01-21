import 'dart:convert';

import 'package:desafio_jusbrasil_app/model/ProductModel.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/product_response.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:flutter/material.dart';

void main() => runApp(TestProductListApp());

class TestProductListApp extends StatelessWidget {
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
  String jsonArrayResponse = '''[
  {
    "id":1,
    "name":"Nome produto 1",
    "description": "Descrição do produto número 1",
    "price":10.0,
    "urlImagePath":"https://images-americanas.b2w.io/produtos/01/00/img/134232/5/134232595G1.jpg"
  },
  {
    "id":2,
    "name":"Nome produto 2",
    "description": "Descrição do produto número 2",
    "price":20.0,
    "urlImagePath":"https://cdn.awsli.com.br/600x450/203/203077/produto/33821905/c405705e4b.jpg"
  },
  {
    "id":3,
    "name":"Nome produto 3",
    "description": "Descrição do produto número 3",
    "price":30.0,
    "urlImagePath":"https://images-na.ssl-images-amazon.com/images/I/71SzDBdKVxL._SX425_.jpg"
  },
  {
    "id":4,
    "name":"Nome produto 4",
    "description": "Descrição do produto número 4",
    "price":40.0,
    "urlImagePath":"https://www.shoptv.com.ph/media/catalog/product/cache/1/small_image/300x/6dcdb3bec3b7d3d8fa2d31ce95a0090e/6/0/60219801_-1.jpg"
  },
  {
    "id":5,
    "name":"Nome produto 5",
    "description": "Descrição do produto número 5",
    "price":10.0,
    "urlImagePath":"https://images-americanas.b2w.io/produtos/01/00/img/134232/5/134232595G1.jpg"
  },
  {
    "id":6,
    "name":"Nome produto 6",
    "description": "Descrição do produto número 6",
    "price":20.0,
    "urlImagePath":"https://cdn.awsli.com.br/600x450/203/203077/produto/33821905/c405705e4b.jpg"
  },
  {
    "id":7,
    "name":"Nome produto 7",
    "description": "Descrição do produto número 7",
    "price":30.0,
    "urlImagePath":"https://images-na.ssl-images-amazon.com/images/I/71SzDBdKVxL._SX425_.jpg"
  },
  {
    "id":8,
    "name":"Nome produto 8",
    "description": "Descrição do produto número 8",
    "price":40.0,
    "urlImagePath":"https://www.shoptv.com.ph/media/catalog/product/cache/1/small_image/300x/6dcdb3bec3b7d3d8fa2d31ce95a0090e/6/0/60219801_-1.jpg"
  }
]''';

  @override
  Widget build(BuildContext context) {
    return ProductList(getProductModelList(), selectItem);
  }

  void selectItem(ProductModel filterModel) {
    print("clicou no item " + filterModel.name);
  }

  List<ProductModel> getProductModelList() {
    return (jsonDecode(jsonArrayResponse) as List)
        .map((i) => ProductResponse.fromJSON(i))
        .toList()
        .map(((value) => ProductModel(value)))
        .toList();
  }
}
