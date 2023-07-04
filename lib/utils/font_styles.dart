import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../main.dart';
import 'app_colors.dart';
import 'app_constants.dart';

class St {
  static RegulareNoteText(size) => TextStyle(
      fontFamily: "Montserrat Regular",
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w800);

  static BoldNoteText(size) => TextStyle(
      fontFamily: "Montserrat Bold",
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w800);

  static TextBoxLableStyle(size) => TextStyle(
      fontFamily: "Montserrat Regular",
      color: Colors.black,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w400);

  static TextBoxLableStyleWhite(size) => TextStyle(
      fontFamily: "Montserrat Regular",
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w400);

  static gridText(size) => TextStyle(
      color: Colors.white,
      fontSize: size,
      fontFamily: "Montserrat Regular",
      fontWeight: FontWeight.w400);

  static TextBoxFlotingLableStyle(size) => TextStyle(
      fontFamily: "Montserrat Bold",
      color: CC.primaryColor,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w700);

  static TextBoxHintStyle(size) => TextStyle(
      fontFamily: "Montserrat Regular",
      color: Colors.grey,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w400);

  static ButtonTextStyle(size) => TextStyle(
      fontFamily: "Montserrat Bold",
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w400);

  static BorderButtonTextStyle(size) => TextStyle(
      fontFamily: "Montserrat Bold",
      color: CC.primaryColor,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w400);

  static ButtonLoadingTextStyle(size) => TextStyle(
      fontFamily: "Montserrat BoldItalic",
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w400);

  static BoarderButtonLoadingTextStyle(size) => TextStyle(
      fontFamily: "Montserrat BoldItalic",
      color: CC.primaryColor,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w400);

  static SignUpBottomButtonText(size) => TextStyle(
      fontFamily: "Montserrat Regular",
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w600);

  static SignUpBottomButtonBoldText(size) => TextStyle(
      fontFamily: "Montserrat Bold",
      color: Colors.white,
      fontStyle: FontStyle.normal,
      fontSize: size,
      fontWeight: FontWeight.w800);

  static TextStyle textFontRegular(
      {Color color = CC.darkGray, double? size, FontWeight? weight}) {
    return TextStyle(
        color: color,
        fontSize: size?.sp,
        fontFamily: "Montserrat Regular",
        fontWeight: weight);
  }

  static TextStyle textFontBold(
      {Color color = CC.darkGray, double? size, FontWeight? weight}) {
    return TextStyle(
        color: color,
        fontSize: size?.sp,
        fontFamily: "Montserrat Bold",
        fontWeight: weight);
  }

  static TextStyle textFontBoldItalic(
      {Color color = CC.darkGray, double? size, FontWeight? weight}) {
    return TextStyle(
        color: color,
        fontSize: size?.sp,
        fontFamily: "Montserrat BoldItalic",
        fontWeight: weight);
  }

  static brownBold({double value = 30}) => TextStyle(
      color: CC.black,
      fontSize: value,
      fontFamily: "Montserrat BoldItalic",
      fontWeight: FontWeight.normal);

  static primaryBold({double value = 30}) => TextStyle(
      color: CC.gradient_second,
      fontSize: value,
      fontFamily: "Montserrat BoldItalic",
      fontWeight: FontWeight.normal);

  static midContrassText({double value = 16}) => TextStyle(
      color: CC.black44,
      fontSize: value,
      fontFamily: "Montserrat Regular",
      fontWeight: FontWeight.normal);

  static highContrastReg({double value = 15}) => TextStyle(
      color: CC.black1617,
      fontSize: value,
      fontFamily: "Manrope",
      fontWeight: FontWeight.w400);
}
