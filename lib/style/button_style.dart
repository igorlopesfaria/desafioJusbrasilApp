import 'package:flutter/material.dart';

import 'color.dart';

RaisedButton getMainButtonStyle(Function onPress, String text) {
  return new RaisedButton(
    color: MainButtonColor,
      shape: RoundedRectangleBorder(
      borderRadius: new BorderRadius.circular(18.0)),
    onPressed: onPress,
    child: Text(
        text,
        style: TextStyle(
            color: WhiteColor,
            fontSize: 15)
    ),
  );

}

