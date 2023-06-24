import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../core/constants/colors.dart';
import 'dim.dart';


class AppTheme {
  AppTheme._();

  static final ThemeData appTheme = ThemeData(
      brightness: Brightness.light,
      primaryColor: AppColor.mainAppColor,
      primaryColorDark: AppColor.mainAppColor3,
      hintColor: AppColor.mainAppColor4,
      splashColor: Colors.white,
      appBarTheme: AppBarTheme( backgroundColor: AppColor.bluecolor),
      bottomAppBarTheme: BottomAppBarTheme(color: AppColor.bluecolor),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(backgroundColor: AppColor.bluecolor),
      bottomSheetTheme: BottomSheetThemeData(backgroundColor:  AppColor.bluecolor, ),
          );
}