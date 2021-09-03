import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomePageController extends GetxController {
  final count = 0.obs;
  final slideIndex=0.obs;
  final slideIndex2=0.obs;
  final headingColor=Colors.grey.shade600;
  void updateSlideIndex(int index){
    slideIndex.value=index;
    update();

  }
  void updateSlideIndex2(int index){
    slideIndex2.value=index;
    update();

  }
}