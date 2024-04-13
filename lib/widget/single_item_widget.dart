import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:notification_with_onesignal/model/product.dart';

import 'package:notification_with_onesignal/utils/app_color.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

import '../provider/send_push_notification.dart';

class SingleItemWidget extends StatefulWidget {
  final bool index;
  final Product product;
  const SingleItemWidget(
      {super.key, required this.index, required this.product});

  @override
  State<SingleItemWidget> createState() => _SingleItemWidgetState();
}

class _SingleItemWidgetState extends State<SingleItemWidget> {
  @override
  Widget build(BuildContext context) {
    final pushNotification = SendPushNotification();
    return Column(
      children: [
        Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(28.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 5,
                    spreadRadius: 1,
                    offset: const Offset(1, 1),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(28.0),
                    child: Image(
                      image: AssetImage(widget.product.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 8.0, right: 8.0, top: 10.0),
                    child: Text(
                      widget.product.name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: Row(
                      children: [
                        Text('\$${widget.product.currentPrice}'),
                        const SizedBox(width: 5),
                        Text(
                          '\$${widget.product.oldPrice}',
                          style: const TextStyle(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                            decorationColor: AppColor.redColor,
                            decorationThickness: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              right: 5,
              top: 10,
              child: Container(
                height: 30,
                width: 30,
                decoration: const BoxDecoration(
                  color: AppColor.backgroundColor,
                  shape: BoxShape.circle,
                ),
                alignment: Alignment.center,
                child: IconButton(
                  onPressed: () async {
                    // setState(
                    //     () => widget.product.isLiked = !widget.product.isLiked);
                    // final String title = widget.product.isLiked
                    //     ? 'You like this Product'
                    //     : 'You unlike this Product';
                    // pushNotification.sendPushNotification(
                    //   title: title,
                    //   message: widget.product.name,
                    //   playerId: OneSignal.User.pushSubscription.id.toString(),
                    // );
                  },
                  icon: Icon(
                    widget.product.isLiked == true
                        ? FontAwesomeIcons.solidHeart
                        : FontAwesomeIcons.heart,
                    size: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
        SizedBox(
            height: widget.index == true
                ? MediaQuery.of(context).size.height * 0.4
                : 0),
      ],
    );
  }
}
