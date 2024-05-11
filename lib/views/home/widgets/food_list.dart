import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor/constants/uidata.dart';
import 'package:vendor/views/food/food_page.dart';

import 'food_widget.dart';


class FoodsList extends StatelessWidget {
  const FoodsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      padding: EdgeInsets.only(left: 12.w, top: 10.h),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(foods.length, (i) {
          var food = foods[i];
          return FoodWidget(
              onTap: () {
                Get.to(()=>const FoodPage());
              },
              image: food['imageUrl'], 
              title: food['title'], 
              time: food['time'], 
              price: food['price'].toStringAsFixed(2));
        }),
      ),
    );
  }
}
