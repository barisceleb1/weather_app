import 'dart:async';

import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController{

  var latitude = "Getting Latitude...".obs;  //this variable was removed from the application
  var longitude = "Getting Longitude...".obs; //this variable was removed from the application
  var area = "".obs;
  var country= "".obs;
  late  StreamSubscription<Position> streamSubscription;
  var locLoading= false.obs;

  @override
  void onInit()async{
    super.onInit();
//  getLocation();
  }
  @override
  void onReady(){
    super.onReady();
  }

  @override
  void onClose(){
    streamSubscription.cancel();
  }

  getLocation()async{
    try{
      locLoading(true);
      bool serviceEnabled;
      LocationPermission permission;

      // Test if location services are enabled.
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        // Location services are not enabled don't continue
        // accessing the position and request users of the
        // App to enable the location services.
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          // Permissions are denied, next time you could try
          // requesting permissions again (this is also where
          // Android's shouldShowRequestPermissionRationale
          // returned true. According to Android guidelines
          // your App should show an explanatory UI now.
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {
        // Permissions are denied forever, handle appropriately.
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }
      streamSubscription= Geolocator.getPositionStream().listen((Position position) {
        latitude.value = "Latitude: ${position.latitude}";
        longitude.value = "Longitude: ${position.longitude}";
        getAddressFromLatLang(position);
      });

    }catch(e){
      print("Error $e");
    }finally{
      locLoading(false);
      return null;
    }

  }

  Future<void> getAddressFromLatLang(Position position) async{
    List<Placemark>placemark = await placemarkFromCoordinates(position.latitude, position.longitude);
    Placemark place =placemark[0];
    area.value= "${place.locality}";
    country.value= "${place.country}";
    //"${place.country}";
  }





}