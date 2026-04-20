import 'dart:ui';

import 'package:mvvmclean/presentation/resources/langauge_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: constant_identifier_names
const String PREFS_KEY_LANG = "PREFS_KEY_LANG";
const String PREFS_KEY_ONBOARDING_SCREEN_VIEWED =
    "PREFS_KEY_ONBOARDING_SCREEN_VIEWED";
const String PREFS_KEY_IS_USER_LOGGED_IN = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);
  Future<String> getLanguage() async {
    String? language = _sharedPreferences.getString(PREFS_KEY_LANG);
    if (language != null && language.isNotEmpty) {
      return language;
    } else {
      // return default lang
      return LanguageType.ENGLISH.getValue();
    }
  }

  Future<void> setLanguage() async {
    // ignore: unused_local_variable, await_only_futures
    String language = await getLanguage();
    //is English ro Arabic
    if (language == LanguageType.ARABIC.getValue()) {
      await _sharedPreferences.setString(
        PREFS_KEY_LANG,
        LanguageType.ENGLISH.getValue(),
      );
    } else {
      await _sharedPreferences.setString(
        PREFS_KEY_LANG,
        LanguageType.ARABIC.getValue(),
      );
    }
  }

  Future<Locale> getAppLanguage() async {
    // ignore: unused_local_variable, await_only_futures
    String language = await getLanguage();
    //is English ro Arabic
    if (language == LanguageType.ARABIC.getValue()) {
      return ARABIC_LOCALE;
    } else {
      return ENGLISH_LOCALE;
    }
  }

  Future<void> setLoggedInStatus() async {
    await _sharedPreferences.setBool(PREFS_KEY_IS_USER_LOGGED_IN, true);
  }

  Future<bool> getLoggedInStatus() async {
    return _sharedPreferences.getBool(PREFS_KEY_IS_USER_LOGGED_IN) ?? false;
  }

  Future<void> setOnBoardingScreenViewed() async {
    await _sharedPreferences.setBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED, true);
  }

  Future<bool> getOnBoardingScreenViewed() async {
    return _sharedPreferences.getBool(PREFS_KEY_ONBOARDING_SCREEN_VIEWED) ??
        false;
  }

  Future<void> logout() async {
    await _sharedPreferences.remove(PREFS_KEY_IS_USER_LOGGED_IN);
  }
}
