import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor/common/custom_button.dart';
import 'package:vendor/constants/constants.dart';
import 'package:vendor/views/restaurant/rating_page.dart';

class RestaurantBottomBar extends StatelessWidget {
  const RestaurantBottomBar({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      width: width,
      height: 40.h,
      decoration: BoxDecoration(
          color: kPrimary.withOpacity(0.4),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(8.r),
            topLeft: Radius.circular(8.r),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RatingBarIndicator(
              itemCount: 5,
              itemSize: 25,
              rating: 4.toDouble(),
              itemBuilder: (context, i) => const Icon(
                    Icons.star,
                    color: Colors.yellow,
                  )),
          CustomButton(
            onTap: () {
              Get.to(() => const RatingPage());
            },
            btnColor: kSecondary,
            btnWidth: width / 3,
            text: "Rate Restaurant",
          )
        ],
      ),
    );
  }
}
