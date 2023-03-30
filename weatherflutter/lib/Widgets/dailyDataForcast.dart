import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weatherflutter/Models/weather/weatherDataDaily.dart';
class DailyDataForcast extends StatelessWidget {
  final WeatherDataDaily weatherDataDaily;

  const DailyDataForcast({Key? key,  required this.weatherDataDaily}) : super(key: key);
String getDay(final day){
  DateTime time=DateTime.fromMillisecondsSinceEpoch(day *1000 );
  final x =DateFormat('EEE').format(time);
  return x;
}
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      margin: const EdgeInsets.all(15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            margin: const EdgeInsets.only(bottom: 10),
            child: const Text('Next days',style: TextStyle(color: Colors.black,fontSize: 17),),
          ),
          dailyList()
        ],
      ),
    );
  }
  Widget dailyList(){
    return SizedBox(height: 300,
    child: ListView.builder(
      scrollDirection: Axis.vertical,
    itemCount:weatherDataDaily.daily.length > 7 ? 7: weatherDataDaily.daily.length,
        itemBuilder:(context,index){
      return Column(
        children: [
          Container(
            height: 60,
            padding: const EdgeInsets.only(right: 10,left: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 80,
                  child: Text(getDay(weatherDataDaily.daily[index].dt),
                    style:const TextStyle(fontSize: 13,color: Colors.black),),
                ),
                SizedBox(
                  height: 30,
                  width: 30,
                  child: Image.asset(
                      "assets/weather/04d.png"
                      // "/assets/weather/${weatherDataDaily.daily[index].weather![0].icon}.png"
                     ),
                ),
                Text('${weatherDataDaily.daily[index].temp!.max}°/${weatherDataDaily.daily[index].temp!.min}°'),
                Container(
                  height: 1,

                )
              ],
            )
          )
        ],
      );
    },
    ),
    );
  }
}
