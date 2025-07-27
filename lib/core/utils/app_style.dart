import 'package:flutter/material.dart';

abstract class AppStyle {
  static TextStyle styleRegular16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      color: Color(0xffAAAAAA),
    );
  }

  static TextStyle styleMediam16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
      // color: Color(0xff064061),
    );
  }

  static TextStyle styleSemiBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      // color: Color(0xff064061),
    );
  }

  static TextStyle styleSemiBold20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 16),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      // color: Color(0xff064061),
    );
  }

  static TextStyle styleRegular12(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 8),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
    );
  }

  static TextStyle styleSemiBold24(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 20),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w800,
    );
  }

  static TextStyle styleRegular14(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 10),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w400,
      color: Color(0xffAAAAAA),
    );
  }

  static TextStyle styleSemiBold18(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 14),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w600,
      color: Color(0xffAAAAAA),
    );
  }

  static TextStyle styleBold16(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w700,
    );
  }

  static TextStyle styleMediam20(BuildContext context) {
    return TextStyle(
      fontSize: getResponsiveFontSize(context, fontSize: 12),
      fontFamily: 'Montserrat',
      fontWeight: FontWeight.w500,
    );
  }
}

double getResponsiveFontSize(context, {required double fontSize}) {
  double scaleFactor = getFontScale(context);
  double responsiveFontSize = fontSize * scaleFactor;
  double lowerLimit = fontSize * 0.8;
  double upperLimit = fontSize * 1.2;
  return responsiveFontSize.clamp(lowerLimit, upperLimit);
}

double getFontScale(context) {
  // var dispatcher = PlatformDispatcher.instance;
  // var physicalWidth = dispatcher.views.first.physicalSize.width;
  // var devicePixelRatio = dispatcher.views.first.devicePixelRatio;
  // var width = physicalWidth / devicePixelRatio;
  double width = MediaQuery.sizeOf(context).width;
  if (width < 580) {
    return width / 400;
  } else if (width < 1100) {
    return width / 700;
  } else {
    return width / 1000;
  }
}
