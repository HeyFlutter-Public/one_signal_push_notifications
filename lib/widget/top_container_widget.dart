import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notification_with_onesignal/utils/app_color.dart';

import '../utils/text_style.dart';

class TopContainerWidget extends StatelessWidget {
  final String title;
  final String searchBarTitle;

  const TopContainerWidget({
    super.key,
    required this.title,
    required this.searchBarTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              title,
              style: TextStyles.normalStyle.copyWith(
                fontSize: 22.0,
                fontWeight: FontWeight.w700,
              ),
            ),
            const Spacer(),
            Container(
              height: 40.0,
              width: 40.0,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColor.greyColor.withOpacity(0.8),
              ),
              child: Stack(
                children: [
                  const Icon(
                    FontAwesomeIcons.bell,
                    color: Colors.black87,
                    size: 20,
                  ),
                  Positioned(
                    right: 0,
                    child: Container(
                      height: 8.0,
                      width: 8.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColor.orangeColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 10.0),
            ClipRRect(
              borderRadius: BorderRadius.circular(30.0),
              child: Image.asset(
                'assets/user.png',
                height: 40.0,
                width: 40.0,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.symmetric(vertical: 30.0),
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            color: AppColor.greyColor.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Row(
            children: [
              const Icon(FontAwesomeIcons.magnifyingGlass, size: 20.0),
              const SizedBox(width: 10),
              Text(
                searchBarTitle,
                style: const TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
