import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:vendor/constants/constants.dart';
import 'package:vendor/constants/uidata.dart';
import 'package:vendor/views/home/widgets/food_tile.dart';

class RestaurantMenuWidget extends HookWidget {
  const RestaurantMenuWidget({super.key,});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightWhite,
      body: SizedBox(
              height: height * 0.7,
              child: ListView(
                padding: EdgeInsets.zero,
                children: List.generate(foods.length, (index) {
                  final  food = foods[index];
                  return FoodTile(food: food);
                }),
              ),
            ),
    );
  }
}
