import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:vendor/common/app_style.dart';
import 'package:vendor/common/app_text.dart';
import 'package:vendor/common/back_ground_container.dart';
import 'package:vendor/constants/constants.dart';
import 'package:vendor/constants/uidata.dart';

import 'widgets/food_tile.dart';

class AllFastestFoods extends StatelessWidget {
  const AllFastestFoods({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondary,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: kSecondary,
        title: ReusableText(text: "Fastest Foods",
            style: appStyle(13, kLightWhite, FontWeight.w600)),
      ),
      body:  BackGroundContainer(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.all(12.h),
          child: ListView(
            children: List.generate(foods.length, (i) {
              var food = foods[i];
              return FoodTile(
                food: food,
              );
            }),
          ),
        ),
      ),
    );
  }
}