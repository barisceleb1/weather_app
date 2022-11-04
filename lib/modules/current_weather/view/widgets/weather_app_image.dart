import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';

class WeatherAppImage extends StatelessWidget {
  WeatherAppImage({Key? key}) : super(key: key);
  final WeatherController weatherController = Get.find();

  @override
  Widget build(BuildContext context) {


    if(weatherController.weather_list?.current?.weatherIcons !=null ){
      return Container(child: Image.network(weatherController.weather_list!.current!.weatherIcons![0],fit: BoxFit.fill, ));

    }
    else{
return Container(
child: Text("Lütfen Şehir Giriniz"),
);
    }
  }
}
