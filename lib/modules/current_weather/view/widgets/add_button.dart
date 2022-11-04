import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/favorites/controller/favorites_controller.dart';
import 'package:weather_app/modules/favorites/model/favorites_model.dart';

class AddButton extends StatelessWidget {

  final WeatherController weatherController = Get.find();
   final FavoritesController fController = Get.find();

     final int index;

   AddButton({super.key, required this.index});


  @override
  Widget build(BuildContext context) {
    return IconButton(onPressed:(){
    // favoritesController.city.removeWhere((element) => element==controller.cityName);
    /*  if(favoritesController.city.){
        return ;
      }else*/

/*for(Favorites favorites in favoritesController.city){
  if(fController.city.contains(controller.cityName))
    return null;*/

fController.favcity.toString();
print(fController.favcity);
      fController.favcity.add(Favorites(text: weatherController.cityName.toString()
      ,favoritetemp: weatherController.weather_list?.current?.temperature,
          favoritefeltTemp: weatherController.weather_list?.current?.feelslike,
      favoriteImage: fController.favoriteImage.toString(),
      favoriteWeather: weatherController.weather_list?.current?.weatherDescriptions?[0].toString())
      );



 //print(favoritesController.city.indexedMap(element,index).containsValue("ankara"));


   /*  if(this.index != null && favoritesController.city[index].text == controller.cityName.value){
        return null;
      }
     */

  //    print(favoritesController.city.where((element) => favoritesController.city.contains(controller.cityName)));

     // print(Favorites());

      Get.snackbar("Added To Favorites", "",duration: Duration(milliseconds: 750));
    }, icon: Icon(Icons.add_circle_outline_sharp),color: Colors.white ,);
  }
}
