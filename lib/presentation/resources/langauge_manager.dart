// ignore_for_file: constant_identifier_names

import 'package:flutter/widgets.dart';

enum LanguageType { ENGLISH, ARABIC }

const String ENGLISH = "en";
const String ARABIC = "ar";
const Locale ENGLISH_LOCALE = Locale("en", "US");
const Locale ARABIC_LOCALE = Locale("ar", "SA");
const String ASSET_PATH_LOCALIZATION = "assets/translations";

extension LanguageTypeExtension on LanguageType {
  String getValue() {
    switch (this) {
      case LanguageType.ENGLISH:
        return ENGLISH;
      case LanguageType.ARABIC:
        return ARABIC;
    }
  }
}
