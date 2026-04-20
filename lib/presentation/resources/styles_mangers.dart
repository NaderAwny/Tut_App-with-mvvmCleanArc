import 'package:flutter/material.dart';
import 'package:mvvmclean/presentation/resources/font_manger.dart';

// ignore: unused_element
TextStyle _getTextStyle(double fontSize, FontWeight fontWeight, Color color) {
  return TextStyle(
    fontSize: fontSize,
    fontWeight: fontWeight,
    color: color,
    fontFamily: FontConstant.fontFamily,
  );
}

//regular style
TextStyle getRegularStyle({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeightManger.regular,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

// getBoldStyle
TextStyle getBoldStyle({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeightManger.bold,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

//getMediumStyl
TextStyle getMediumStyle({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeightManger.medium,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

// getLightStyle
TextStyle getLightStyle({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeightManger.light,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}

// getSemiboldStyle
TextStyle getSemiboldStyle({
  double fontSize = FontSize.s12,
  FontWeight fontWeight = FontWeightManger.semibold,
  required Color color,
}) {
  return _getTextStyle(fontSize, fontWeight, color);
}
