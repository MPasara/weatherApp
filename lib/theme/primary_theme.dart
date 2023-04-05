import 'package:flutter/material.dart';

final primaryTheme = ThemeData(
  primarySwatch: Colors.cyan,
  colorScheme: ThemeData()
      .colorScheme
      .copyWith(secondary: Colors.cyan, background: Colors.grey),
  scaffoldBackgroundColor: Colors.white,
  bottomSheetTheme: BottomSheetThemeData(
    backgroundColor: ThemeData.dark().scaffoldBackgroundColor,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
    ),
  ),
);
