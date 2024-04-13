import 'package:flutter/material.dart';
import 'package:notification_with_onesignal/screens/home_screen.dart';
import 'package:notification_with_onesignal/utils/app_color.dart';
import 'package:notification_with_onesignal/utils/indicators.dart';
import 'package:notification_with_onesignal/widget/image_list_view_widget.dart';

import '../utils/text_style.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Stack(
        alignment: Alignment.center,
        children: [
          const Positioned(
            top: -10,
            left: -150,
            child: Row(
              children: [
                ImageListViewWidget(startIndex: 0),
                ImageListViewWidget(startIndex: 1),
                ImageListViewWidget(startIndex: 2),
              ],
            ),
          ),
          Positioned(
            top: height * 0.08,
            child: const Text(
              'MNMLMANDI',
              textAlign: TextAlign.center,
              style: TextStyles.titleStyle,
            ),
          ),
          Positioned(
            bottom: 0,
            child: Container(
              width: width,
              height: height * 0.60,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.transparent,
                    Colors.white60,
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.center,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Your Appearance \n Shows Your Quality',
                    style: TextStyles.normalStyle
                        .copyWith(fontSize: 30, height: 1.3),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Change The Quality of Your\n Appearance with MNMLMANDI',
                    style: TextStyles.normalStyle.copyWith(
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: Indicators.buildIndicators(),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 30,
            left: 20,
            right: 20,
            child: SizedBox(
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: AppColor.backgroundColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0))),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    )),
                child: Text(
                  'Sign Up With Email',
                  style: TextStyles.normalStyle.copyWith(color: Colors.grey),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
