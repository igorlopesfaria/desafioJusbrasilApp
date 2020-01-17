import 'dart:ui';

import 'package:flutter/material.dart';

import 'color.dart';

TextStyle getErrorTitleTextStyle() {
  return new TextStyle(
      color: Gray60Color,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w300,
      fontSize: 32);
}

TextStyle getErrorSubTitleTextStyle() {
  return new TextStyle(
      color: Gray60Color,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w400,
      height: 1.5, //You can set your custom height here
      fontSize: 14);
}
TextStyle getEmptyTextStyle() {
  return new TextStyle(
      color: DarkColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14);
}

TextStyle getFilterItemTextStyle() {
  return new TextStyle(
      color: GreenSofitDarkColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      fontSize: 14);
}

TextStyle getDarkTextStyle() {
  return new TextStyle(
      color: DarkColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w500,
      fontSize: 16);
}

TextStyle getDeleteTextStyle() {
  return new TextStyle(
      color: Colors.red,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14);
}

TextStyle getGrayTextStyle() {
  return new TextStyle(
      color: Gray60Color,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14);
}

TextStyle getBlackTextStyle() {
  return new TextStyle(
      color: TextFieldDarkColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14);
}

TextStyle getBlackTitleStyle() {
  return new TextStyle(
      color: TextFieldDarkColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w600,
      fontSize: 16);
}


TextStyle getGrayTitleBottomSheetStyle() {
  return new TextStyle(
      color: DarkColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14);
}

TextStyle getToolbarTitleTextStyle() {
  return new TextStyle(
      color: WhiteColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w700,
      fontSize: 20);
}

TextStyle getSearchHintTextStyle() {
  return new TextStyle(
      color: getWhite80Color(),
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w400,
      fontSize: 14);
}

TextStyle getSearchTextStyle() {
  return new TextStyle(
      color: WhiteColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w500,
      fontSize: 16);
}

TextStyle getMainButtonTextStyle() {
  return new TextStyle(
      color: WhiteColor,
      fontStyle: FontStyle.normal,
      fontFamily: 'Monteserrat',
      fontWeight: FontWeight.w400,
      fontSize: 15);
}
