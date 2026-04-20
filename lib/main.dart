import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:mvvmclean/app/app.dart';
import 'package:mvvmclean/app/di.dart';
import 'package:mvvmclean/presentation/resources/langauge_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Hive.initFlutter(); // ✅ أول حاجة
  final box = await Hive.openBox('appBox');
  await initAppModule(box);
  runApp(
    EasyLocalization(
      supportedLocales: const [ARABIC_LOCALE, ENGLISH_LOCALE],
      path: ASSET_PATH_LOCALIZATION,
      fallbackLocale: ENGLISH_LOCALE,
      startLocale: ENGLISH_LOCALE,
      child: Phoenix(child: MyApp()),
    ),
  );
}
