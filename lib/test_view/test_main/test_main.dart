import 'dart:convert';
import 'package:desafio_jusbrasil_app/model/ProductList.dart';
import 'package:desafio_jusbrasil_app/pages/main/main_page.dart';
import 'package:desafio_jusbrasil_app/pages/product/detail/product_detail_page.dart';
import 'package:desafio_jusbrasil_app/pages/product/list/product_list_item.dart';
import 'package:desafio_jusbrasil_app/sdk/data/response/product_response.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:flutter/material.dart';

void main() => runApp(TestMainApp());

class TestMainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

