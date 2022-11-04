import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';

class WeatherInformation extends StatelessWidget {
   WeatherInformation({Key? key}) : super(key: key);

  final WeatherController weatherController= Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${weatherController.weather_list?.current?.weatherDescriptions?[0]}",style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.white),),
      
    );
  }
}
