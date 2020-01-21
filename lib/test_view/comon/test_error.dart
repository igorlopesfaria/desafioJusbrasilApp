import 'package:desafio_jusbrasil_app/pages/comon_view/error_default.dart';
import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:flutter/material.dart';

void main() => runApp(TestErro());

class TestErro extends StatelessWidget {
  _tryAgainPressed(){

  }

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
          body: ErrorDefault("Ops! Ocorreu um problema.",
              "Não foi possível realizar a listagem dos produtos.  Tente novamente mais tarde.", _tryAgainPressed),
        ));
  }
}

