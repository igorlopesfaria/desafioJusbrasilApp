import 'package:desafio_jusbrasil_app/style/color.dart';
import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorDefault extends StatelessWidget {
  String _message;
  String _title;
  Function _tryAgainPressed;

  ErrorDefault(this._title, this._message, this._tryAgainPressed);

  @override
  Widget build(BuildContext context) {
    return new //Expanded(child:
        Container(
            color: Colors.white,
            child: Center(
                child: new Column(
                    //Text(this._message),
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  new SvgPicture.asset(
                    'assets/images/ic_error.svg',
                    width: 80.0,
                    height: 80.0,
                    allowDrawingOutsideViewBox: true,
                  ),
                  new Padding(padding: new EdgeInsets.all(10.0)),
                  new Text(
                    _title,
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
                    padding:
                        EdgeInsets.symmetric(vertical: 12.0, horizontal: 34.0),
                    color: MainButtonColor,
                    onPressed: _tryAgainPressed,
                    child: Text('Tentar Novamente',
                        style: getMainButtonTextStyle()),
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(25.0),
                    ),
                  ),
                ])));
    //);
  }
}
