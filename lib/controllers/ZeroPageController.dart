import 'package:get/get.dart';

class ZeroPageController extends GetxController {
  final selectedIndex=0.obs;
  final screenIndex=0.obs;
  final subMenuIndex=0.obs;
  void changeTabIndex(int index)
  {
    selectedIndex.value=index;
    if(index!=1){
      screenIndex.value=index;
      subMenuIndex.value=100;
    }
    update();
  }
  void changeSubMenuIndex(int index)
  {
    subMenuIndex.value=index;
    screenIndex.value=1;
    update();
  }
}