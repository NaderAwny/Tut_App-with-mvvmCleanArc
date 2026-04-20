// ignore_for_file: deprecated_member_use

import 'dart:math' as math;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mvvmclean/app/app_prefs.dart';
import 'package:mvvmclean/app/di.dart';
import 'package:mvvmclean/data/data_source/local_data_source.dart';
import 'package:mvvmclean/presentation/resources/assets_manger.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/langauge_manager.dart';
import 'package:mvvmclean/presentation/resources/route_manger.dart';
import 'package:mvvmclean/presentation/resources/strings_manger.dart';
import 'package:mvvmclean/presentation/resources/value_manger.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final LocalDataSource _localDataSource = instance<LocalDataSource>();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        padding: const EdgeInsets.all(AppPadding.p8),
        children: [
          ListTile(
            leading: SvgPicture.asset(ImageAssets.changeLangIc),
            title: Text(
              AppStrings.ChangeLanguage,
              style: Theme.of(context).textTheme.bodyLarge,
            ).tr(),
            trailing: Transform(
              alignment: Alignment.center,
              transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            ),
            onTap: () {
              ChangeLanguage();
            },
          ),
          _getSeparator(),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.contactUsIc),
            title: Text(
              AppStrings.contactUs,
              style: Theme.of(context).textTheme.bodyLarge,
            ).tr(),
            trailing: Transform(
              alignment: Alignment.center,
              // rotate the arrow if the language is rtl
              //يعني لو اللغة عربي هيلف الصورة 180 درجة
              transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            ),
            onTap: () {
              ContactUs();
            },
          ),
          _getSeparator(),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.inviteFriendsIc),
            title: Text(
              AppStrings.inviteFriends,
              style: Theme.of(context).textTheme.bodyLarge,
            ).tr(),
            trailing: Transform(
              alignment: Alignment.center,
              // rotate the arrow if the language is rtl
              //يعني لو اللغة عربي هيلف الصورة 180 درجة
              transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            ),
            onTap: () {
              InviteFriends();
            },
          ),
          _getSeparator(),
          ListTile(
            leading: SvgPicture.asset(ImageAssets.logoutIc),
            title: Text(
              AppStrings.logout,
              style: Theme.of(context).textTheme.bodyLarge,
            ).tr(),
            trailing: Transform(
              alignment: Alignment.center,
              // rotate the arrow if the language is rtl
              //يعني لو اللغة عربي هيلف الصورة 180 درجة
              transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
              child: SvgPicture.asset(ImageAssets.rightArrowSettingsIc),
            ),
            onTap: () {
              Logout();
            },
          ),
        ],
      ),
    );
  }

  Widget _getSeparator() {
    return Container(
      height: AppSize.s1,
      color: ColorManger.seprator,
      width: double.infinity,
    );
  }

  bool isRtl() {
    return context.locale == ARABIC_LOCALE;
  }

  // ignore: non_constant_identifier_names, strict_top_level_inference
  ChangeLanguage() {
    _appPreferences.setLanguage();
    Phoenix.rebirth(context);
  }

  // ignore: non_constant_identifier_names, strict_top_level_inference
  ContactUs() async {
    final url = Uri.parse(AppStrings.URL);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  // ignore: non_constant_identifier_names, strict_top_level_inference
  InviteFriends() {
    Share.share(AppStrings.appName.tr());
  }

  // ignore: non_constant_identifier_names, strict_top_level_inference
  Logout() {
    _appPreferences.logout();
    _localDataSource.clearCache();

    Navigator.pushReplacementNamed(context, Routes.loginRoute);
  }
}
