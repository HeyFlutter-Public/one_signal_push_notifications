import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notification_with_onesignal/screens/category_display_screen.dart';
import 'package:notification_with_onesignal/utils/app_color.dart';
import 'package:notification_with_onesignal/utils/tab_bar_icons.dart';

import 'product_display_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                ProductDisplayScreen(),
                CategoryDisplayScreen(),
              ],
            ),
            Positioned(
              bottom: 20.0,
              left: 20.0,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                  color: AppColor.backgroundColor,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ...TabBarIcons.tabBarIcons.map(
                      (icon) => IconButton(
                        onPressed: () {
                          icon == FontAwesomeIcons.house
                              ? pageController.jumpToPage(0)
                              : pageController.jumpToPage(1);
                        },
                        icon: Icon(
                          icon,
                          color: Colors.white60,
                          size: 22,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
