import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:desafio_jusbrasil_app/test_view/test_product/list/test_list_loading_product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:splashscreen/splashscreen.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        SplashScreen(
          seconds: 5,
          gradientBackground: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            colors: [Colors.white, Colors.white12],
          ),
          navigateAfterSeconds: TestProductListApp(),
          loaderColor: Colors.transparent,
        ),
        Container(
            height: double.infinity,
            width: double.infinity,
            child: Center(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                      height: 150,
                      child: Image.asset("assets/images/ic_jus.png")),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset("assets/images/ic_puzzle.svg",
                          width: 42.0, height: 42.0),
                      Padding(padding: new EdgeInsets.only(right: 10.0)),
                      Text("Desafio Jus", style: getBlackTitleBigStyle())
                    ],
                  )
                ],
              ), // Align however you like (i.e .centerRight, centerLeft)
            ))
      ],
    );
  }
}
