import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:vendor/common/app_style.dart';
import 'package:vendor/common/app_text.dart';
import 'package:vendor/common/custom_button.dart';
import 'package:vendor/common/custom_text_field.dart';
import 'package:vendor/common/verification_modal.dart';
import 'package:vendor/constants/constants.dart';
import 'package:vendor/controller/foods_controller.dart';
import 'package:vendor/views/restaurant/restaurant_page.dart';


class FoodPage extends StatefulWidget {
  const FoodPage({super.key});


  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  final TextEditingController _preferences = TextEditingController();
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FoodController());
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.only(bottomRight: Radius.circular(30.r)),
            child: Stack(
              children: [
                SizedBox(
                  height: 230.h,
                  child: PageView.builder(
                      controller: _pageController,
                      onPageChanged: (i) {
                        controller.changePage(i);
                      },
                      itemCount:3,
                      itemBuilder: (context, i) {
                        return Container(
                          width: width,
                          height: 230.h,
                          color: kLightWhite,
                          child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl: "https://d326fntlu7tb1e.cloudfront.net/uploads/5c2a9ca8-eb07-400b-b8a6-2acfab2a9ee2-image001.webp",),
                        );
                      }),
                ),
                Positioned(
                  bottom: 10,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Obx(
                          () => Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                        List.generate(3, (index) {
                          return Container(
                            margin: EdgeInsets.all(4.h),
                            width: 10.w,
                            height: 10.h,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: controller.currrentPage == index
                                    ? kSecondary
                                    : kGrayLight),
                          );
                        }),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 40.h,
                  left: 12.w,
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: const Icon(
                      Ionicons.chevron_back_circle,
                      color: kPrimary,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  right: 12.w,
                  child: CustomButton(
                    onTap: () {
                      Get.to(() => RestaurantPage(
                      ));
                    },
                    btnWidth: 120.w,
                    text: "Open Restaurant",
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                        text: 'widget.food.title',
                        style: appStyle(18, kDark, FontWeight.w600)),
                    Obx(
                          () => ReusableText(
                          text:
                          "\$ ${(15* controller.count.value)}",
                          style: appStyle(18, kPrimary, FontWeight.w600)),
                    )
                  ],
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'widget.food.description',
                  textAlign: TextAlign.justify,
                  maxLines: 8,
                  style: appStyle(11, kGray, FontWeight.w400),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 18.h,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children:
                    List.generate(7, (index) {
                      return Container(
                        margin: EdgeInsets.only(right: 5.w),
                        decoration: BoxDecoration(
                            color: kPrimary,
                            borderRadius:
                            BorderRadius.all(Radius.circular(15.r))),
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 6.w),
                          child: ReusableText(
                            text: 'tag',
                            style: appStyle(11, kWhite, FontWeight.w400),
                          ),
                        ),
                      );
                    }),
                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                ReusableText(
                    text: "Additives and Toppings",
                    style: appStyle(18, kDark, FontWeight.w600)),
                SizedBox(
                  height: 10.h,
                ),
                Obx(
                      () => Column(
                    children:
                    List.generate(controller.additivesList.length, (index) {
                      final additive = controller.additivesList[index];
                      return CheckboxListTile(
                          contentPadding: EdgeInsets.zero,
                          visualDensity: VisualDensity.compact,
                          dense: true,
                          activeColor: kSecondary,
                          value: additive.isChecked.value,
                          tristate: false,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ReusableText(
                                  text: additive.title,
                                  style: appStyle(11, kDark, FontWeight.w400)),
                              SizedBox(
                                width: 5.w,
                              ),
                              ReusableText(
                                  text: "\$ ${additive.price}",
                                  style:
                                  appStyle(11, kPrimary, FontWeight.w600)),
                            ],
                          ),
                          onChanged: (bool? value) {
                            additive.toggleChecked();
                            controller.getTotalPrice();
                          });
                    }),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ReusableText(
                        text: "Qauntity",
                        style: appStyle(18, kDark, FontWeight.bold)),
                    SizedBox(
                      width: 5.w,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.increment();
                          },
                          child: const Icon(AntDesign.pluscircleo),
                        ),
                        Padding(
                            padding:
                            const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Obx(
                                  () => ReusableText(
                                  text: "${controller.count.value}",
                                  style: appStyle(14, kDark, FontWeight.w600)),
                            )),
                        GestureDetector(
                          onTap: () {
                            controller.decrement();
                          },
                          child: const Icon(AntDesign.minuscircleo),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                ReusableText(
                  text: "Preferences",
                  style: appStyle(18, kDark, FontWeight.w600),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  height: 65.h,
                  child: CustomTextWidget(
                    controller: _preferences,
                    hintText: "Add a note with your preferences",
                    maxLines: 3,

                  ),
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 40.h,
                  decoration: BoxDecoration(
                      color: kPrimary,
                      borderRadius: BorderRadius.circular(30.r)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          showVerificationSheet(context);
                        },
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w),
                          child: ReusableText(
                              text: "Place Order",
                              style:
                              appStyle(18, kLightWhite, FontWeight.w600)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          showVerificationSheet(context);
                        },
                        child: CircleAvatar(
                          backgroundColor: kSecondary,
                          radius: 20.r,
                          child: const Icon(
                            Ionicons.cart,
                            color: kLightWhite,
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
