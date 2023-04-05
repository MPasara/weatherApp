import 'package:flutter/material.dart';

final secondaryTheme = ThemeData(
  primarySwatch: Colors.cyan,
  colorScheme: ThemeData()
      .colorScheme
      .copyWith(secondary: Colors.cyan, background: Colors.grey),
  scaffoldBackgroundColor: Colors.white,
);
