import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';

class ContactPageController extends GetxController{
  final searching = 0.obs;
  List<String> contactName = <String>["ABC", "ACB", "AAB", "XYZ", "ANF", "END", "START", "George", "ANF", "END", "START", "George"].obs;
  List<String> filteredContact = <String>[].obs;

  getParticularContact(String name){
    filteredContact.clear();
    searching.value = 1;
    for(int i = 0; i < contactName.length; i++){
      if(contactName.elementAt(i).toLowerCase().startsWith(name.toLowerCase())){
        filteredContact.add(contactName.elementAt(i));
      }
    }
    update();
  }

  setSearchingValue(){
    searching.value = 0;
    update();
  }



}