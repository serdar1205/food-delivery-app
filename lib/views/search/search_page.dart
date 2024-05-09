import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:vendor/common/custom_container.dart';
import 'package:vendor/common/custom_text_field.dart';
import 'package:vendor/common/shimmers/foodlist_shimmer.dart';
import 'package:vendor/constants/constants.dart';
import 'package:vendor/controller/search_controller.dart';

import 'loading_widget.dart';
import 'search_results.dart';

class SearchPage extends StatelessWidget {
  SearchPage({super.key});

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Obx(() => Scaffold(
          backgroundColor: kPrimary,
          appBar: AppBar(
            toolbarHeight: 74.h,
            elevation: 0,
            automaticallyImplyLeading: false,
            backgroundColor: Colors.white,
            title: Padding(
              padding: EdgeInsets.only(top: 12.h),
              child: CustomTextWidget(
                controller: _searchController,
                keyboardType: TextInputType.text,
                hintText: "Search For Foods",
                suffixIcon: GestureDetector(
                    onTap: () {
                      if (controller.searchResults.isEmpty) {
                        controller.searchFoods(_searchController.text);
                      } else {
                        controller.searchResults = [];
                        _searchController.clear();
                      }
                    },
                    child:
                    controller.searchResults.isEmpty
                        ? Icon(Ionicons.search_circle, size: 40.h, color: kGray)
                        : Icon(Ionicons.close_circle, size: 40.h, color: kRed)),
                // GestureDetector(
                //     onTap: () {
                //       controller.searchFoods(_searchController.text);
                //     },
                //     child:
                //     Icon(Ionicons.search_circle, size: 40.h, color: kGray)),
              ),
            ),
          ),
          body: SafeArea(
            child: CustomContainer(
                color: Colors.white,
                containerContent: controller.isLoading
                    ? const FoodsListShimmer()
                    : controller.searchResults.isEmpty
                        ? const LoadingWidget()
                        : const SearchResults()),
          ),
        ));
  }
}
