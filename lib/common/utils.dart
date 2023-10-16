import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:nymble_test/common/n_theme.dart';

class Utils {
  static String? jsonData;

  static ThemeData getThemeValue() {
    if (jsonData == null) {
      return NTheme.lightTheme;
    } else {
      var data;
      try {
        data = jsonDecode(jsonData!)?["app"]?["theme"];
        return data == "dark" ? NTheme.darkTheme : NTheme.lightTheme;
      } on FormatException {
        return NTheme.lightTheme;
      }
    }
  }
}
