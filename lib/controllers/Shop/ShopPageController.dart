import 'package:get/get.dart';

class ShopPageController extends GetxController {
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
}
