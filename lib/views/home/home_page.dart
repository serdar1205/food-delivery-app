import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor/common/custom_apbar.dart';
import 'package:vendor/common/custom_container.dart';
import 'package:vendor/common/heading.dart';
import 'package:vendor/constants/constants.dart';
import 'package:vendor/views/home/widgets/category_list.dart';

import 'all_fastest_foods_page.dart';
import 'all_nearby_restaurants.dart';
import 'recommendations_page.dart';
import 'widgets/food_list.dart';
import 'widgets/nearby_restaurants_list.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimary,
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(130.h), child: const CustomAppBar()),
      body: SafeArea(
        child: CustomContainer(
            containerContent: Column(
          children: [
           const CategoryList(),
            Heading(
              text: "Nearby Restaurants",
              onTap: () {
                Get.to(() => const AllNearbyRestaurants(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900));
              },
            ),
            const NearbyRestaurants(),
            Heading(
              text: "Try Something New",
              onTap: () {
                Get.to(() => const RecommendationsPage(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900));
              },
            ),
            const FoodsList(),
            Heading(
              text: "Food closer to you",
              onTap: () {
                Get.to(() => const AllFastestFoods(),
                    transition: Transition.cupertino,
                    duration: const Duration(milliseconds: 900));
              },
            ),
            const FoodsList(),
          ],
        )),
      ),
    );
  }
}
