import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
class LastUpdate extends StatelessWidget {
   LastUpdate({Key? key}) : super(key: key);
  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {
    if(weatherController.weather_list?.current?.observationTime != null){
      return Text("Last update: ${weatherController.weather_list?.current?.observationTime}", style: TextStyle(fontSize: 17,
          fontWeight: FontWeight.w500,color: Colors.white
      ),);
    }
    else
      return Text("");

  }
}


//+ TimeOfDay(hour: 05, minute: 26).format(context)