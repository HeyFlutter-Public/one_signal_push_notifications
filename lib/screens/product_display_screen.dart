import 'package:flutter/material.dart';
import 'package:notification_with_onesignal/utils/app_color.dart';
import '../widget/product_display_list_view_widget.dart';
import '../widget/top_container_widget.dart';

class ProductDisplayScreen extends StatefulWidget {
  const ProductDisplayScreen({super.key});

  @override
  State<ProductDisplayScreen> createState() => _ProductDisplayScreenState();
}

class _ProductDisplayScreenState extends State<ProductDisplayScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int selectedValue = 0;
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Column(
        children: [
          const TopContainerWidget(
            title: 'MNMLMANDI',
            searchBarTitle: 'Search Product',
          ),
          TabBar(
            overlayColor: const MaterialStatePropertyAll(Colors.transparent),
            controller: tabController,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorColor: Colors.transparent,
            labelColor: Colors.white,
            unselectedLabelColor: AppColor.backgroundColor,
            dividerColor: Colors.white,
            onTap: (value) {
              setState(() {
                selectedValue = value;
              });
              tabController.animateTo(value);
            },
            tabs: [
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: selectedValue == 0
                        ? AppColor.backgroundColor
                        : AppColor.greyColor.withOpacity(0.8),
                    boxShadow: selectedValue == 0
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : null),
                child: const Text(
                  'Trending',
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                width: double.infinity,
                height: 50,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: selectedValue == 1
                        ? AppColor.backgroundColor
                        : AppColor.greyColor.withOpacity(0.8),
                    boxShadow: selectedValue == 1
                        ? [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 5,
                              spreadRadius: 1,
                              offset: const Offset(0, 1),
                            ),
                          ]
                        : null),
                child: const Text(
                  'Clothing',
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
          SizedBox(
            height: height,
            child: TabBarView(
              physics: const NeverScrollableScrollPhysics(),
              controller: tabController,
              children: const [
                ProductDisplaysViewWidget(),
                ProductDisplaysViewWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
