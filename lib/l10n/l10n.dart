import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('tr'),
  ];

  static String getLanguageName(String code) {
    switch (code) {
      case 'en':
        return 'English';
      case 'tr':
        return 'Türkçe';
      // Yeni dillerin isimlerini burada ekleyin
      default:
        return 'Unknown';
    }
  }
}
