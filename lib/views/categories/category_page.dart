import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor/common/app_style.dart';
import 'package:vendor/common/app_text.dart';
import 'package:vendor/common/back_ground_container.dart';
import 'package:vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:vendor/constants/constants.dart';
import 'package:vendor/constants/uidata.dart';
import 'package:vendor/controller/category_controller.dart';
import 'package:vendor/views/home/widgets/food_tile.dart';


class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kOffWhite,
        leading: IconButton(
          onPressed: () {
            controller.updateCategory = '';
            controller.updateTitle = '';
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: kDark,
          ),
          color: kGray,
        ),
        title: ReusableText(
            text: "${controller.titleValue} Category",
            style: appStyle(13, kGray, FontWeight.w600)),
      ),
      body: BackGroundContainer(
        color: Colors.white,
        child: SizedBox(
          height: height,
          child: controller.isLoading
              ? const FoodsListShimmer()
              : Padding(
            padding: EdgeInsets.all(12.h),
            child: ListView(
              children: List.generate(foods.length, (i) {
                final food = foods[i];
                return FoodTile(
                  food: food,
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}