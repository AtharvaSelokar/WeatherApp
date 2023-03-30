import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:weatherflutter/Controller/GlobalController.dart';
import 'package:weatherflutter/Models/weather/weatherDataHourly.dart';
class HoulryDataWidget extends StatelessWidget {
  final WeatherDataHourly weatherDataHourly;
   HoulryDataWidget({Key? key, required this.weatherDataHourly}) : super(key: key);

  RxInt cardIndex= GlobalController().getIndex() ;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 5,horizontal: 20 ),
          alignment: Alignment.topCenter,
          child: const Text("Today",style: TextStyle(fontSize: 18),),
        ),
        hourlyList(),
      ],
    );
  }
  Widget hourlyList(){
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10,bottom: 10),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount:weatherDataHourly.hourly.length>12 ? 12: weatherDataHourly.hourly.length,
          itemBuilder:(context, index){
          return  Obx((()=> GestureDetector(
              onTap:(){
                cardIndex.value=index;
              },

              child: Container(
                width: 90,
            margin:  EdgeInsets.only(left: 20,right: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0.5,9),
                    color:Colors.grey.withOpacity(0.2),
                    blurRadius: 2
                  ),
                ]

            ),
                child: HourlyDetails(
                  index:index,
                  cardIndex: cardIndex.toInt(),
              temp: weatherDataHourly.hourly[index].temp!,
              timeStamp: weatherDataHourly.hourly[index].dt!,
              weatherIcon:weatherDataHourly.hourly[index].weather![0].icon!,

            ),
              ))
    ));
    }
    ),
    );
  }
}
class HourlyDetails extends StatelessWidget {
  int temp;
  int timeStamp;
  String weatherIcon;
  int cardIndex;
  int index;

    dynamic getTime(final timeStamp){
    DateTime time = DateTime.fromMillisecondsSinceEpoch(timeStamp*1000);
    String x =DateFormat('jm').format(time);
    return x;
  }


   HourlyDetails(
      {Key? key,required this.temp,
        required this.timeStamp,
        required this.weatherIcon,required this.index,required this.cardIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
  mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          margin: const EdgeInsets.only(top:10),
          child: Text(getTime(timeStamp),style: TextStyle(color:  cardIndex==index ? Colors.blue:Colors.blueGrey),),
        ),
        Container(margin: const EdgeInsets.all(5),
          child: Image.asset("assets/weather/$weatherIcon.png",height: 40,width: 40,),
        ),
        Container(
          margin:  const EdgeInsets.only(bottom: 10),
            child: Text("$temp°",style: TextStyle(color:  cardIndex==index ? Colors.blue:Colors.blueGrey),),),
      ],
    );
  }
}

