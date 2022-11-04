import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/current_weather/model/weather.dart';

class FeltTemp extends StatelessWidget {
   FeltTemp({Key? key}) : super(key: key);

  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Text("Felt temperature: ${weatherController.weather_list?.current?.feelslike} C°",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),);
  }
}
