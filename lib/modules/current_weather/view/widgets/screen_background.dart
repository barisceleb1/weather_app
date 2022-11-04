import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meta/meta.dart';
import 'package:weather_app/constants/background_images.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/favorites/controller/favorites_controller.dart';

class ScreenBackGround extends StatelessWidget {
  ScreenBackGround({Key? key}) : super(key: key);

  final WeatherController weatherController = Get.find();
  final FavoritesController fController= Get.find();


  @override
  Widget build(BuildContext context) {

    final int? weather = weatherController.weather_list?.current?.weatherCode;
    final dateTime= DateTime.tryParse("${weatherController.weather_list?.location?.localtime}");



    if(dateTime != null){
      fController.favoriteImage.value=(dateTime.hour<=05 ||dateTime.hour>=18)?_backgroundimageNight(weather):_backgroundimage(weather);
      print("Image Data:${fController.favoriteImage}");

      if((dateTime.hour) <= 05 || (dateTime.hour )>=18){
        return Container(

          // child: _backgroundimageNight(),
          decoration: BoxDecoration(
            image:DecorationImage(image:AssetImage(_backgroundimageNight(weather)),
                fit: BoxFit.cover,colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.30), BlendMode.darken) ),
          ),
        );

      }
      else if((dateTime.hour) > 05 || (dateTime.hour ) <18)
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage(_backgroundimage(weather)),
                fit: BoxFit.cover, colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.30), BlendMode.darken)
            ),

          ),
        );

      else
        return Container(child: Image.asset(BackgroundImages.clear),);
    }
    else{
      return Container(child: Image.asset("assets/background2.png"),);
    }



  }



  _backgroundimage(int? weather) {

    if(weather == 113 ){
      print("$weather");
      return (BackgroundImages.sunny);
    }
    else if(weather == 116 || weather == 119 || weather == 122  ){
      print("$weather");
      return (BackgroundImages.cloudy);
    }
    else if(weather == 143 || weather ==248 || weather == 260 ){
      print("$weather");
      return (BackgroundImages.foggy);
    }
    else if(weather == 179 || weather==182 ||weather== 227 ||weather== 230 ||weather== 317 ||weather== 320
        ||weather== 323 ||weather==326 ||weather==329 ||weather== 332 || weather== 335
        ||weather== 338 ||weather== 350 || weather== 368|| weather == 371 ){
      print("$weather");
      return (BackgroundImages.snowy);
    }
    else{
      print("$weather");
      return (BackgroundImages.rainy);
    }

  }

  _backgroundimageNight(int? weather) {
    if(weather == 113 ){
      return (BackgroundImages.clear);
    }
    else if(weather! > 113 && weather < 143){
      print("Weather code: ${weatherController.weather_list?.current?.weatherCode}");
      return (BackgroundImages.cloudy_night);
    }
    else if(weather ==143 || weather ==248 || weather == 260 ){
      return (BackgroundImages.foggy);
    }
    else if(weather == 179 || weather==182 ||weather== 227 ||weather== 230 ||weather== 317 ||weather== 320
        ||weather== 323 ||weather==326 ||weather==329 ||weather== 332 || weather== 335
        ||weather== 338 ||weather== 350 || weather== 368|| weather == 371 ){
      return (BackgroundImages.snowy_night);
    }
    else{
      return (BackgroundImages.rainy_night);
    }




  }
}
