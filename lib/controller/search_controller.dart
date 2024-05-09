// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';
import 'package:vendor/constants/uidata.dart';

class SearchFoodController extends GetxController {
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  List searchResults = [];

  set setLoading(bool value) {
    _isLoading.value = value;
  }

  void searchFoods(String key) async {
    setLoading = true;
    searchResults.clear();
    Future.delayed(const Duration(seconds: 3)).then(
        (value) => {searchResults.addAll(foods.toList()), setLoading = false});
  }
}
