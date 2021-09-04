import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BusinessNetworkController extends GetxController {
  final check = true.obs;
  final count = 0.obs;
  // for change slide
  final slideIndex = 0.obs;
  //  change top nave bar
  final selectedFeild = 0.obs;
  // for change slide
  void updateSlideIndex(int index) {
    slideIndex.value = index;
    update();
  }

  //  change top nave bar
  void updateSelectedFeild(int index) {
    selectedFeild.value = index;
    update();
  }

  // change shareProfile
  void changePro() {
    if (check.value == true) {
      check.value = false;
      update();
      print("false");
    } else {
      check.value = true;
      print("true");
      update();
    }
    update();
  }
}

class BusinessProvider with ChangeNotifier {
  bool check = false;

  void changePros() {
    if (check == true) {
      check = false;
      notifyListeners();
      print("false");
    } else {
      check = true;
      print("true");
      notifyListeners();
    }
    notifyListeners();
  }

  //
}
