import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:notification_with_onesignal/model/product.dart';
import 'single_item_widget.dart';

class ProductDisplaysViewWidget extends StatefulWidget {
  const ProductDisplaysViewWidget({super.key});

  @override
  State<ProductDisplaysViewWidget> createState() =>
      _ProductDisplaysViewWidgetState();
}

class _ProductDisplaysViewWidgetState extends State<ProductDisplaysViewWidget> {
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      crossAxisCount: 2,
      crossAxisSpacing: 15,
      itemCount: products.length,
      mainAxisSpacing: 10,
      itemBuilder: (context, index) => SingleItemWidget(
        index: index == products.length - 1,
        product: products[index],
      ),
    );
  }
}
