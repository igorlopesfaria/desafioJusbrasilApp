import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

class EmptyListPage extends StatelessWidget {
  String _message;

  EmptyListPage(this._message);

  @override
  Widget build(BuildContext context) {
    return new Center(
        child: new Column(
            //Text(this._message),
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          new SvgPicture.asset(
            'assets/images/ic_empty_box.svg',
            width: 70.0,
            height: 70.0,
            allowDrawingOutsideViewBox: true,
          ),
          new Padding(padding: new EdgeInsets.all(10.0)),
          new Text(
            this._message,
            textAlign: TextAlign.center,
            style: getEmptyTextStyle(),
          ),
        ]));
  }
}
