import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorDefault extends StatelessWidget {
  String _message;
  Function _tryAgainPressed;

  ErrorDefault(this._message, this._tryAgainPressed);

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Column(//Text(this._message),
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new SvgPicture.asset(
                'assets/images/ic_error.svg',
                width: 100.0,
                height: 100.0,
                allowDrawingOutsideViewBox: true,
              ),
              new Padding(padding: new EdgeInsets.all(20.0)),
              new Text(
                "Ocorreu um erro",
                style: getErrorTitleTextStyle(),
              ),
              new Padding(padding: new EdgeInsets.all(10.0)),
              new Text(
                _message,
                textAlign: TextAlign.center,
                style: getErrorSubTitleTextStyle(),
              ),
              new Padding(padding: new EdgeInsets.all(15.0)),
              new RaisedButton(
                elevation: 0,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 34.0),
                color: MainButtonColor,
                onPressed: _tryAgainPressed,
                child: Text(
                    'Tentar Novamente',
                    style:getMainButtonTextStyle()
                ),
                shape: new RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(30.0),
                ),

              ),

            ]

        )
    );
  }
}

