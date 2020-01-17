import 'package:desafio_jusbrasil_app/style/text_style.dart';
import 'package:flutter/material.dart';

import 'color.dart';

TextField getTextFieldSearchToolbar(TextEditingController _controller) {
  return new TextField(
    cursorColor: WhiteColor,
    style: getSearchTextStyle(),
    controller: _controller,
    autofocus: true,
    decoration: new InputDecoration(
      border: InputBorder.none,
      hintText: 'Filtrar...',
        hintStyle: getSearchHintTextStyle(),
    ),
  );
}


TextField getSelectTextField(String label){
  new TextField(
    textAlign: TextAlign.left,
    enabled: false,
    decoration: new InputDecoration(
        labelText: label,
        labelStyle: getGrayTextStyle() ,
        contentPadding: const EdgeInsets.all(18.0),
        disabledBorder: new OutlineInputBorder(
          borderRadius: const BorderRadius.all(
            const Radius.circular(10.0),
          ),
          borderSide: new BorderSide(
            color: TextFieldGray60Color,
            width: 1.0,
          ),

        ),
        suffixIcon: const Icon(
          Icons.keyboard_arrow_down,
          color: Gray60Color,
        )
    ),
  );
}
