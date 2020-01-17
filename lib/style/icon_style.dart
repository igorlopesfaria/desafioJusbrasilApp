import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'color.dart';

Icon getIconCheckDarkStyle() {
  return new Icon(Icons.check, color: DarkColor);
}

Icon getIconBackLightStyle() {
  return new Icon(Icons.arrow_back, color: WhiteColor);
}

Icon getIconSearchLightStyle() {
  return new Icon(Icons.search, color: WhiteColor);
}

Icon getIconCloseLightStyle() {
  return new Icon(Icons.close, color: WhiteColor);
}

IconButton getIconButtonBackLightStyle(Function onPressedFunction) {
  return new IconButton(
    icon: getIconBackLightStyle(),
    tooltip: 'Voltar',
    onPressed: onPressedFunction,
  );
}

IconButton getIconButtonSearchLightStyle(Function onPressedFunction) {
  return new IconButton(
    icon: getIconSearchLightStyle(),
    tooltip: 'Buscar',
    onPressed: onPressedFunction,
  );
}

IconButton getIconButtonCloseLightStyle(Function onPressedFunction) {
  return new IconButton(
    icon: getIconCloseLightStyle(),
    tooltip: 'Fechar',
    onPressed: onPressedFunction,
  );
}

Svg getIconEmptySVG(){
  new SvgPicture.asset(
    'assets/images/ic_empty_box.svg',
    width: 70.0,
    height: 70.0,
    allowDrawingOutsideViewBox: true,
  );
}

Svg getIconNextSVG(){
  new SvgPicture.asset(
    'assets/images/next.svg',
    width: 30.0,
    height: 30.0,
    allowDrawingOutsideViewBox: true,
  );
}
