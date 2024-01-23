import 'package:flutter/material.dart';
import 'package:advance_mobile/app/config/style.dart';
import 'package:advance_mobile/app/config/theme.dart';
import 'package:advance_mobile/app/config/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyBottomNavigationBar extends StatefulWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();
}

class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
        data: AppTheme.lightTheme.copyWith(
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: Container(
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(16), topLeft: Radius.circular(16)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black12, spreadRadius: 1, blurRadius: 0.5),
              ],
            ),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
              ),
              child: BottomNavigationBar(
                items: [
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/ic_home.svg"),
                      activeIcon:
                          SvgPicture.asset("assets/icons/ic_home_active.svg"),
                      label: "Home"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/ic_history.svg"),
                      activeIcon: SvgPicture.asset(
                          "assets/icons/ic_history_active.svg"),
                      label: "History"),
                  BottomNavigationBarItem(
                      icon: SvgPicture.asset("assets/icons/ic_account.svg"),
                      activeIcon: SvgPicture.asset(
                          "assets/icons/ic_account_active.svg"),
                      label: "Account")
                ],
                currentIndex: 0,
                iconSize: 24,
                selectedLabelStyle: AppStyle.smallTextStyle
                    .copyWith(color: AppColor.disableColor),
                unselectedLabelStyle: AppStyle.smallTextStyle
                    .copyWith(color: AppColor.disableColor),
                elevation: 5,
              ),
            )));
  }
}
