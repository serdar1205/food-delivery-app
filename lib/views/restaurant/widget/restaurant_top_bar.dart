import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:vendor/common/app_style.dart';
import 'package:vendor/common/app_text.dart';
import 'package:vendor/constants/constants.dart';
import 'package:vendor/views/restaurant/directions_page.dart';

class RestaurantTopBar extends StatelessWidget {
  const RestaurantTopBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Ionicons.chevron_back_circle,
              size: 28,
              color: kLightWhite,
            ),
          ),
          ReusableText(
              text: 'restaurant!.title',
              style: appStyle(13, kDark, FontWeight.w600)),
          GestureDetector(
            onTap: () {
              Get.to(() => const DirectionsPage());
            },
            child: const Icon(
              Ionicons.location,
              size: 28,
              color: kLightWhite,
            ),
          )
        ],
      ),
    );
  }
}
