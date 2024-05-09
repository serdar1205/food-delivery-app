import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:vendor/controller/search_controller.dart';
import 'package:vendor/views/home/widgets/food_tile.dart';

class SearchResults extends StatelessWidget {
  const SearchResults({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SearchFoodController());
    return Container(
      padding:  EdgeInsets.fromLTRB(12.w, 10.h, 12.h, 0),
      child: ListView.builder(
        shrinkWrap: true,
          primary: false,
          itemCount:  controller.searchResults.length,
          itemBuilder:(context, i){
            final food = controller.searchResults[i];
            return FoodTile(food: food);
          }),

    );
  }
}