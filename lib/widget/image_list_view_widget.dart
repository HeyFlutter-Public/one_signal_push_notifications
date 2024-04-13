import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:notification_with_onesignal/model/product.dart';

class ImageListViewWidget extends StatefulWidget {
  final int startIndex;
  const ImageListViewWidget({super.key, required this.startIndex});

  @override
  State<ImageListViewWidget> createState() => _ImageListViewWidgetState();
}

class _ImageListViewWidgetState extends State<ImageListViewWidget> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      autoScroll();
    });
    scrollController.addListener(() {
      if (!scrollController.position.atEdge) {
        autoScroll();
      }
    });
  }

  void autoScroll() {
    final currentScrollPosition = scrollController.offset;
    final scrollEndPosition = scrollController.position.maxScrollExtent;
    scheduleMicrotask(() {
      scrollController.animateTo(
          currentScrollPosition == scrollEndPosition ? 0 : scrollEndPosition,
          duration: const Duration(seconds: 10),
          curve: Curves.linear);
    });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Transform.rotate(
      angle: 1.96 * pi,
      child: SizedBox(
        width: width * 0.60,
        height: height * 0.60,
        child: ListView.builder(
          controller: scrollController,
          itemCount: 5,
          itemBuilder: (context, index) => Container(
            margin: const EdgeInsets.only(
              right: 8.0,
              left: 8.0,
              top: 10.0,
            ),
            height: height * 0.40,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(products[widget.startIndex + index].imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
