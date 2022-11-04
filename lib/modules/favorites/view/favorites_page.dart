import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/current_weather/view/home_page.dart';
import 'package:weather_app/modules/favorites/controller/favorites_controller.dart';

class FavoritesPage extends StatelessWidget {
   FavoritesPage({Key? key}) : super(key: key);
  final FavoritesController fcontroller= Get.find();
  final WeatherController weatherController= Get.find();




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("FAVORITES"),
          centerTitle: true,
          backgroundColor: Colors.transparent
        ) ,
       // backgroundColor: Colors.grey.shade400,
        floatingActionButton: FloatingActionButton(onPressed: (){
          fcontroller.favcity.length!=0 ? Get.defaultDialog(title: "Do you want to delete all?",middleText: "",onConfirm:(){fcontroller.favcity.clear();Get.back();Get.snackbar("   All Cities Have Been Deleted", "",duration: Duration(seconds: 1));}
                ,onCancel:(){}, barrierDismissible: false ) : null;


   //     controller.city.clear();
        }, child: Icon(Icons.delete)),
        body:  _buildBody(),

      ),
    );
  }

  _buildBody() {
    return Obx(() => Center(
        child: ListView.builder(
            itemCount: fcontroller.favcity.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(key: ValueKey(fcontroller.favcity[index]),
                  onDismissed: (DismissDirection direction) {
                fcontroller.favcity.removeAt(index);
              //  controller.city.remove(index);
                print("İndex Sayısı:${fcontroller.favcity.length}");
                Get.snackbar("  ${fcontroller.favcity[index].text} City Deleted!", "",duration: Duration(seconds: 1));
                  },
                  child: Card(
                    clipBehavior: Clip.antiAlias,

                    child:Stack(
                      children: [
                        SizedBox(
                          height: 120,
                          child: Container(
                              decoration: BoxDecoration(
                                image:DecorationImage(image: AssetImage("${fcontroller.favcity[index].favoriteImage}"),fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.30), BlendMode.darken),)


   )
  ),
),
                        SizedBox(

                          //  child: Image.asset("${controller.city[index].favoriteImage}"),
                          child: ListTile(
                            title:
                                  Row(
                                children: [
                                  Expanded(child:Padding(
                                    padding: const EdgeInsets.only(top:25, left: 30),
                                    child: Text("${fcontroller.favcity[index].text}",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                                  ),) ,
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 28, left: 92),
                                      child: Text("${fcontroller.favcity[index].favoritetemp}°C",style: TextStyle(fontSize: 25,color:Colors.white ),),
                                    ),
                                  ),

                                ],
                              ),


                            subtitle:
                               Row(
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 30, top: 5),
                                      child: Text("Felt: ${fcontroller.favcity[index].favoritefeltTemp}°C",style: TextStyle(color: Colors.white),),
                                    ),
                                  ),
                                  Expanded(child:  Padding(
                                    padding: const EdgeInsets.only(left: 100, top: 5),
                                    child: Text("${fcontroller.favcity[index].favoriteWeather}",style: TextStyle(color: Colors.white),),),)

                                ],
                              ),


                            onTap: (){
                              click(index: index);

                              debugPrint(fcontroller.favcity.toString());
                            },
                            trailing: Padding(
                              padding: const EdgeInsets.only(top: 28, left: 15),
                              child: Icon(Icons.chevron_right,color: Colors.white,),
                            ),
                          ),


                        ),

                      ],
                    ),
                    color: Colors.cyan,

                    margin: EdgeInsets.all(5),
                    shape: RoundedRectangleBorder(
                  //      side: BorderSide(color: Theme.of(context).colorScheme.outline),
                        borderRadius: BorderRadius.all(Radius.circular(30))
                    ),

                    elevation: 13,

                  ));


            }),

    )
    );
  
  }
  
   click({required int index})
    {
      Get.back(result: fcontroller.favcity[index].text);
      HomePage();
      if (fcontroller.favcity.value != null)
        weatherController.cityName.value = fcontroller.favcity[index].text!;
      weatherController.fetchWeathers();
      debugPrint("Gönderilen veri: ${fcontroller.favcity[index].text}");
    
   }
  
}
