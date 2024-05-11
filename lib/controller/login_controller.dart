// ignore_for_file: prefer_final_fields

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:vendor/constants/constants.dart';
import 'package:vendor/views/entrypoint.dart';

class LoginController extends GetxController {
  final box = GetStorage();
  RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  set setLoading(bool newState) {
    _isLoading.value = newState;
  }

  void loginFunction(String data) async {
    setLoading = true;


    Map<String, String> headers = {'Content-Type': 'application/json'};

    try {

      if (isLoading) {



        setLoading = false;

        Get.snackbar(
            "You are succefully logged in", "Enjoy your awesome experience",
            colorText: kLightWhite,
            backgroundColor: kPrimary,
            icon: const Icon(Ionicons.fast_food_outline));


        Get.offAll(() => MainScreen(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 900));
      } else {

        Get.snackbar("Failed to login", '',
            colorText: kLightWhite,
            backgroundColor: kRed,
            icon: const Icon(Icons.error_outline));
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void logout() {
    // box.erase();
    //  Get.offAll(() => MainScreen(),
    //         transition: Transition.fade,
    //         duration: const Duration(milliseconds: 900));
  }
}
