
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/favorites/model/favorites_model.dart';

class FavoritesController extends GetxController{
  final WeatherController weatherController= Get.put(WeatherController());

  var favcity = <Favorites>[].obs;
  var favoriteImage= "".obs;
  var deneme= "".obs;


  @override
  void onInit() async{
List? storedCity =  GetStorage().read<List>("city");
if(storedCity!= null){
  favcity= storedCity.map((e) => Favorites.fromJason(e)).toList().obs;
  }
  List? storedTemp = GetStorage().read<List>("favoritetemp");
  if(storedTemp!= null){
    favcity= storedTemp.map((e) => Favorites.fromJason(e)).toList().obs;
}
  List? storedfeltTemp =GetStorage().read<List>("favoritefeltTemp");
  if(storedfeltTemp!=null){
    favcity = storedfeltTemp.map((e) => Favorites.fromJason(e)).toList().obs;
  }
List? storedImage =GetStorage().read<List>("favoriteImage");
if(storedImage!=null){
  favcity = storedImage.map((e) => Favorites.fromJason(e)).toList().obs;
}


    ever(favcity, (_) {
      GetStorage().write("city", favcity.toList());
      GetStorage().write("favoritemp", favcity.toList());
      GetStorage().write("favoriteImage", favcity.toList());
    });
    super.onInit();
    weatherController.cityName.value= favcity.string;

  }


}