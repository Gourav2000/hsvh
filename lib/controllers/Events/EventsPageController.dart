import 'package:contacts_service/contacts_service.dart';
import 'package:get/get.dart';

class EventsPageController extends GetxController{
  List<Contact> contacts = <Contact>[].obs;
  final selectedShare = 0.obs;
  final permissionGranted = false.obs;

  getAllContacts() async{
    contacts = (await ContactsService.getContacts()).toList();
    update();
  }

  updatePermissionGranted(){
    permissionGranted.value = true;
    update();
  }

  updateSelectedShare(){

  }

}
