import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor/common/app_style.dart';
import 'package:vendor/constants/constants.dart';

import 'widget/restaurant_bottom_bar.dart';
import 'widget/restaurant_menu.dart';
import 'widget/restaurant_top_bar.dart';
import 'widget/row_text.dart';
import 'widget/xplore_widget.dart';

class RestaurantPage extends StatefulWidget {
  const RestaurantPage({
    super.key,
  });

  @override
  State<RestaurantPage> createState() => _RestaurantPageState();
}

class _RestaurantPageState extends State<RestaurantPage> with TickerProviderStateMixin {

  late final TabController _tabController = TabController(
    length: 2,
    vsync: this,
  );

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: kLightWhite,
        body: ListView(
          padding: EdgeInsets.zero,
          children: [
            Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  width: width,
                  child: CachedNetworkImage(
                      fit: BoxFit.cover,
                      imageUrl:
                          "https://d326fntlu7tb1e.cloudfront.net/uploads/5c2a9ca8-eb07-400b-b8a6-2acfab2a9ee2-image001.webp"),
                ),
                const Positioned(bottom: 0, child: RestaurantBottomBar()),
                Positioned(
                    top: 40.h,
                    left: 0,
                    right: 0,
                    child: const RestaurantTopBar())
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: [
                  RowText(
                    first: "Distance to Restaurant",
                    second: "2.7 km",
                  ),
                  RowText(
                    first: "Estimated Price",
                    second: "\$2.7",
                  ),
                  RowText(
                    first: "Estimated Time",
                    second: "30 min",
                  ),
                  Divider(
                    thickness: 0.7,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:8.w),
              child: Container(
                height: 25.h,
                width: width,
                decoration: BoxDecoration(
                    color: kOffWhite,
                    borderRadius: BorderRadius.circular(25.r)
                ),
                child: TabBar(controller: _tabController,
                    indicator: BoxDecoration(
                        color: kPrimary,
                        borderRadius: BorderRadius.circular(25.r)
                    ),
                    labelPadding: EdgeInsets.zero,
                    labelColor: kLightWhite,
                    labelStyle: appStyle(12, kLightWhite, FontWeight.normal),
                    unselectedLabelColor: kGrayLight,
                    tabs: [
                      Tab(
                        child: SizedBox(
                          width: width/2,
                          height: 25,
                          child: const Center(child: Text("Menu"),),
                        ),
                      ),

                      Tab(
                        child: SizedBox(
                          width: width/2,
                          height: 25,
                          child: const Center(child: Text("Explore"),),
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: SizedBox(
                height: height,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    RestaurantMenuWidget(),
                    XploreWidget(code: 'widget.restaurant!.code',),
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
