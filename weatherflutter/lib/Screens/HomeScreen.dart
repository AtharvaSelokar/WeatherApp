import 'package:flutter/material.dart';
import 'package:weatherflutter/Controller/GlobalController.dart' show GlobalController;
import 'package:get/get.dart';
import 'package:weatherflutter/Widgets/comfortLevel.dart';
import 'package:weatherflutter/Widgets/dailyDataForcast.dart';
import 'package:weatherflutter/Widgets/hourlyDataWidget.dart';

import '../Widgets/HeaderWidgets.dart';
import '../Widgets/currentWeatherWidget.dart';
// import '../Widgets/dailyDataForcast.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalController globalController = Get.put(GlobalController(),permanent: true);
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(
      child:Obx(() => globalController.checkLoading().isTrue
          ?
      const Center(
        child: CircularProgressIndicator(),
      )
       : Center(
         child: ListView(
            scrollDirection: Axis.vertical,
            children: [
               const SizedBox(height: 20,),
               HeaderWidget(),
              //for temp..
          CurrentWeatherWidget(
            weatherDataCurrent:
            globalController.getData().getCurrentWeather(),
          ),
               SizedBox(height: 20,),

              HoulryDataWidget(weatherDataHourly: globalController.getData().getHourlyWeather()),
              DailyDataForcast(
                weatherDataDaily:globalController.getData().getDailyWeather(),

              ),
              Container(
                height: 3,
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(child: ComfortLevel(weatherDataCurrent: globalController.getData().getCurrentWeather())),
            ],
          ),
       ),
      ),
    )

    );
  }
}
