import 'package:flutter/material.dart';
import 'package:notification_with_onesignal/utils/app_color.dart';

class Indicators {
  static List<Widget> buildIndicators() {
    List<Widget> list = [];
    for (int i = 0; i < 4; i++) {
      list.add(i == 1 ? indicator(true) : indicator(false));
    }

    return list;
  }

  static Widget indicator(bool isActive) {
    return AnimatedContainer(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      duration: const Duration(microseconds: 150),
      height: 8.0,
      width: isActive ? 30.0 : 8.0,
      decoration: BoxDecoration(
          color: isActive ? AppColor.orangeColor : Colors.grey,
          borderRadius: BorderRadius.circular(30)),
    );
  }
}
