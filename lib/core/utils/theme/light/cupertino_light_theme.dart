import 'package:flutter/cupertino.dart';

CupertinoThemeData cupertinoLight = const CupertinoThemeData(
  brightness: Brightness.light,
  primaryColor: CupertinoColors.activeBlue,
  scaffoldBackgroundColor: CupertinoColors.systemGrey6,
  applyThemeToAll: true,
  textTheme: CupertinoTextThemeData(
    textStyle: TextStyle(
      fontFamily: 'Playfair Display',
      fontWeight: FontWeight.normal,
      color: CupertinoColors.black,
    ),
  ),
);
