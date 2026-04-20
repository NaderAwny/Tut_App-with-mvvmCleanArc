import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mvvmclean/presentation/home/pages/home_page/view/home_page_cubit.dart';
import 'package:mvvmclean/presentation/home/pages/notification_page/notifications_page.dart';
import 'package:mvvmclean/presentation/home/pages/search_page/search_page.dart';
import 'package:mvvmclean/presentation/home/pages/settings_page/settings_page.dart';
import 'package:mvvmclean/presentation/resources/color_manger.dart';
import 'package:mvvmclean/presentation/resources/strings_manger.dart';
import 'package:mvvmclean/presentation/resources/value_manger.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  List<Widget> pages = [
    HomePageCubit(),
    SearchPage(),
    NotificationsPage(),
    SettingsPage(),
  ];
  List<String> title = [
    AppStrings.home.tr(),
    AppStrings.search.tr(),
    AppStrings.notifications.tr(),
    AppStrings.settings.tr(),
  ];
  var currentIndex = 0;
  var titles = AppStrings.home.tr();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.white,
      appBar: AppBar(
        backgroundColor: ColorManger.primary,
        title: Text(titles, style: Theme.of(context).textTheme.titleSmall),
      ),
      body: pages[currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: ColorManger.lightGrey, spreadRadius: AppSize.s0),
          ],
        ),
        child: BottomNavigationBar(
          onTap: onTap,
          selectedItemColor: ColorManger.primary,
          unselectedItemColor: ColorManger.grey,
          currentIndex: currentIndex,

          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined),
              label: AppStrings.home.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: AppStrings.search.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications),
              label: AppStrings.notifications.tr(),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: AppStrings.settings.tr(),
            ),
          ],
        ),
      ),
    );
  }

  // ignore: strict_top_level_inference
  onTap(int index) {
    setState(() {
      currentIndex = index;
      titles = title[index];
    });
  }
}
