import 'package:get/get.dart';
import 'package:flutter/material.dart';

class ProfilePageController extends GetxController {
  final count = 0.obs;
  final AllNotifications=false.obs;
  void changeAllNotifications()
  {
    AllNotifications.value=!AllNotifications.value;
    update();
  }

}