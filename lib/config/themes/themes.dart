import 'package:clean_architecture/core/utils/app_colors.dart';
import 'package:clean_architecture/core/utils/app_strings.dart';
import 'package:flutter/material.dart';

ThemeData appTheme(){
  return ThemeData(
    primaryColor:  AppColors.primary,
    brightness: Brightness.light ,
    scaffoldBackgroundColor: Colors.white ,
    fontFamily: AppStrings.fontFamily,
    appBarTheme: const AppBarTheme(
        centerTitle: true,
        color: Colors.transparent,
        elevation: 0,
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.w500, color: Colors.black, fontSize: 20),
    ) ,

    dialogBackgroundColor: AppColors.primary,
    textTheme: const TextTheme(
    headlineLarge: TextStyle(
      height: 1.3,
        color: Colors.white ,
      fontWeight: FontWeight.bold ,
      fontSize: 22
    ) ,
    bodyMedium: TextStyle(
        height: 1.3,
        fontSize: 22,
        color: Colors.black,
        fontWeight: FontWeight.bold),
    ) ,
  );
}