import 'package:flutter/material.dart';

import 'color.dart';

RaisedButton getMainButtonStyle(Function onPress, String text) {
  return new RaisedButton(
    color: MainButtonColor,
    onPressed: onPress,
    child: Text(
        text,
        style: TextStyle(
            color: WhiteColor,
            fontSize: 15)
    ),
  );

}

