import 'package:desafio_jusbrasil_app/pages/product/list/product_list_placeholder.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:flutter/material.dart';

void main() => runApp(TestProductListPlaceholderApp());

class TestProductListPlaceholderApp extends StatelessWidget {
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
          ),body: ProductListPlaceholder(),
        ));
  }
}
