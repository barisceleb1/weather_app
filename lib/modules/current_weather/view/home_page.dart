

import 'package:flutter/material.dart';
//import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:weather_app/constants/background_images.dart';
import 'package:weather_app/constants/constant.dart';
import 'package:weather_app/modules/current_weather/controller/weather_controller.dart';
import 'package:weather_app/modules/current_weather/view/widgets/add_button.dart';
import 'package:weather_app/modules/current_weather/view/widgets/detail_widget.dart';
import 'package:weather_app/modules/current_weather/view/widgets/screen_background.dart';
import 'package:weather_app/modules/current_weather/view/widgets/temperature_widget.dart';
import 'package:weather_app/modules/current_weather/view/widgets/weather_information.dart';
import 'package:weather_app/modules/favorites/controller/favorites_controller.dart';
import 'package:weather_app/modules/location/controller/location_controller.dart';
import 'package:weather_app/modules/search/view/search_page.dart';
import 'package:weather_app/modules/current_weather/view/widgets/last_update.dart';
import 'package:weather_app/modules/current_weather/view/widgets/location_widget.dart';
import 'package:weather_app/modules/current_weather/view/widgets/felt_temp.dart';
import 'package:weather_app/modules/drawer/navigation_drawer.dart';
import 'package:weather_app/modules/current_weather/view/widgets/weather_app_image.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final WeatherController weatherController= Get.find();
  final FavoritesController controller= Get.find();
  final LocationController lcontroller= Get.find();


  // final int index;




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor.grey,
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        drawer: NavigationDrawer(),
        appBar:AppBar(
          elevation: 0,
          // title: Text("WeatherApp"),
          backgroundColor: Colors.transparent,
          centerTitle: true,
          actions: [
            IconButton(onPressed: ()=> Navigator.of(context).push(PageTransition(child: SearchPage(), type: PageTransitionType.fade)),icon: Icon(Icons.search),),

          ],
        ),

        //  backgroundColor: Colors.grey.shade400,
        body:  _buildBody(),
      ),
    );
  }

  _buildBody() {

    //RefreshIndicator
    return RefreshIndicator(
        onRefresh:(){
          //  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Veriler Güncellendi"),duration: Duration(milliseconds:1200 ),padding: EdgeInsets.all(15), behavior: SnackBarBehavior.floating,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),);
          weatherController.fetchWeathers();
          weatherController.isLoading(false);
          return Future<void>.delayed(Duration(milliseconds: 1200));
        },

        child: Center(
          child: Obx(() {
            if (weatherController.isLoading.value ||lcontroller.locLoading.value  ) {
              return Center(child:SpinKitFadingCircle(
                color: Colors.black,
                size: 70,
              ));
            }
             if(weatherController.weather_list?.location?.name == null){
      return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Image.asset(BackgroundImages.warning,width: 200,height: 200,),
          Text("Please Select City!",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
          ],
      );



    }

            else {
              return  Stack(
                children: [
                  ScreenBackGround(),
                ListView(
                  children:[Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        //  color: Colors.black,
                        width: 320,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 150,bottom: 80),
                          child: Location(),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10,bottom: 20),
                        child: AddButton(index:0 ),
                      ),
                    ],
                  ),]
                ),




                  Padding(

                    padding: const EdgeInsets.only(left: 20, bottom: 430),
                    child: Center(child: LastUpdate()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 25, bottom: 300),
                    child: Center(child: Temperature(),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 14,bottom: 200),
                    child: Center(child: WeatherInformation()),
                  ),

                  /*Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: WeatherAppImage()),
          ),*/
                  Padding(
                    padding: const EdgeInsets.only(left:20,bottom: 130),
                    child: Center(child: FeltTemp()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only( top: 310),
                    child:Container(child: Detail()),
                  ),





                ],



              );
            }
          }
          ),
        )

    );





  }
}
