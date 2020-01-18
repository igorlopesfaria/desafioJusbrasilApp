import 'package:desafio_jusbrasil_app/pages/splash/splash_page.dart';
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
          body: SplashPage(),
        ));
  }
}