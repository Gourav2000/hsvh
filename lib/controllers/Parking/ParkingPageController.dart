import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ParkingPageController extends GetxController {
  GoogleMapController? googleMapController;
  updateMapController(controller) {
    googleMapController = controller;
    update();
  }

  recenterLocation(LatLng center) {
    googleMapController!.moveCamera(CameraUpdate.newCameraPosition(
      CameraPosition(
        target: center,
        zoom: 11.0,
      ),
    ));
    update();
  }
}
