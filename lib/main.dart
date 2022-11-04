import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/current_weather/view/home_page.dart';
import 'package:weather_app/modules/favorites/controller/favorites_controller.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:weather_app/modules/location/controller/location_controller.dart';

void main() async{
  await GetStorage.init();
//  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();

  runApp( WeatherApp());
}
Future initialization(BuildContext? context)async{
  await Future.delayed(Duration(seconds: 3));
}

class WeatherApp extends StatelessWidget {
   WeatherApp({Key? key}) : super(key: key);

  final FavoritesController controller= Get.put(FavoritesController());
  final WeatherController weatherController= Get.put(WeatherController());
   final LocationController lontroller= Get.put(LocationController());


  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,

        ),
        home: HomePage()
    );
  }
}