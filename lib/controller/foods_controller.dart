// ignore_for_file: prefer_final_fields

import 'package:get/get.dart';

class FoodController extends GetxController {
  RxInt currrentPage = 0.obs;
  bool initialCheckValue = false;
  var additivesList = [].obs;

  void changePage(int index) {
    currrentPage.value = index;
  }

  RxInt count = 1.obs;

  void increment() {
    count.value++;
  }

  void decrement() {
    if (count.value > 1) {
      count.value--;
    }
  }

  void loadAdditives(List additives) {
    additivesList.clear();
    additivesList.addAll(additiveData);

    for (var additiveInfo in additives) {
      var additive = AdditiveObs(
        id: additiveInfo.id,
        title: additiveInfo.title,
        price: additiveInfo.price,
        checked: initialCheckValue,
      );
      if (additives.length == additivesList.length) {
      } else {
        additivesList.add(additive);
      }
    }
  }

  RxDouble _totalPrice = 0.0.obs;

  double get additivePrice => _totalPrice.value;

  set setTotalPrice(double newPrice) {
    _totalPrice.value = newPrice;
  }

  double getTotalPrice() {
    double totalPrice = 0.0;

    for (var additive in additivesList) {
      if (additive.isChecked.value) {
        totalPrice += double.tryParse(additive.price) ?? 0.0;
      }
    }

    setTotalPrice = totalPrice;
    return totalPrice;
  }
}
var additiveData = [
  AdditiveObs(id: 1, title: 'title1', price: '12', checked: true),
  AdditiveObs(id: 1, title: 'title1', price: '12', checked: true),
  AdditiveObs(id: 1, title: 'title1', price: '12', checked: true),
];
class AdditiveObs {
  int id;
  String title;
  String price;
  bool checked;

  AdditiveObs(
      {required this.id,
      required this.title,
      required this.price,
      required this.checked,
      });
}
